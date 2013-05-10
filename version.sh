lib.version() {
	cd $(lib path);
	git tag | tail -n 1;
}