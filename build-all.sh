#!/bin/bash

set -eo pipefail

root=$PWD

mkdir -p logs

# Requires:
# apt-get install -y curl ruby-dev build-essential git pkg-config python-pip
# gem install bundler
# pip install virtualenv-tools

skiplist="couchdb freemind jruby kafka kestrel xdotool"

build_package() {
	local recipe="$1"
	local deps=$(bundle exec fpm-cook show-deps $recipe)

	if [ -n "$deps" ]; then
		apt-get -y install $deps
	fi

	bundle exec fpm-cook clean "$recipe"
	bundle exec fpm-cook package "$recipe"
}

bundle exec fpm-cook --version

#for recipe in $(find * -name recipe.rb | sort); do
for recipe in $(find * -maxdepth 2 -name "*.rb" | sort); do
	cd $root
	recipe_name=$(dirname $recipe)
	echo "### [$recipe_name] ###"
	for skip in $skiplist; do
		if [ "$skip" = "$recipe_name" ]; then
			echo "SKIP"
			continue 2
		fi
		for file in *.rb; do
			if [ "$skip" = "${recipe_name}/${file}" ]; then
				echo "SKIP"
				continue 2
			fi
		done
	done
	cd "$recipe_name"
	if [ -d "tmp-build" -a -e "tmp-build/.all-done" ]; then
		echo "DONE"
		continue
	fi
	{
		if [ -e "recipe.rb" ]; then
			build_package "recipe.rb"
		else
			for file in *.rb; do
				echo "===> $file"
				build_package "$file"
			done
		fi
		mkdir -p tmp-build
		touch tmp-build/.all-done
	} 2>&1 | tee "$root/logs/${recipe_name}.log"
done
