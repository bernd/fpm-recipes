clean:
	@find . -name tmp-build -or -name tmp-dest -type d | xargs -rt rm -rf
	@find . -name cache -type d | fgrep -v -e .vendor | xargs -rt rm -rf
