duckduckgo() {
	w3m "https://www.duckduckgo.com/?q=$1"
}

duckduckgo2() {
	~/projects/linkhandlergatherer/a.out $1
}

duckduckgo3() {
	mkdir $1
	cd $1
	duckduckgo2 $1
	brave-browser ./*
}

startgenericstudybrowsing() {
	w3m "https://www.duckduckgo.com/?q=$1" "https://google.com/search/?q=$1" "https://www.djangoproject.com" "https://stackoverflow.com"
}

resultinglinks() {
	duckduckgo $1 | grep "www." | vim
}

ao3() {
	w3m https://archiveofourown.org/works/search?work_search%5Bquery%5D=$1
}

youtube() {
	/bin/brave-browser $(duckduckgo "$1" | grep "www.youtube.com" | fzf)
}
