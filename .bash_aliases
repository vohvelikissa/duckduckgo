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

downloadyoutube() {
	perkele=$(pwd)
	cd ~/Music
	youtube-dl -x --audio-format "mp3" $(duckduckgo "$1" | grep "www.youtube.com" | fzf)
	cd $perkele
}

findsongbylyrics() {
	duckduckgo "$1" | grep "YouTube" | fzf
}

downloadsongbylyrics() {
	downloadyoutube $(findsongbylyrics "$1")
}

findemailsbyprofession() {
	w3m google.com/search?q="\"@gmail.com\" AND $1" | grep "@gmail.com"	
	w3m google.com/search?q="\"@icloud.com\" AND $1" | grep "@icloud.com"
	w3m google.com/search?q="\"@yahoo.com\" AND $1" | grep "@yahoo.com"
	w3m google.com/search?q="\"@outlook.com\" AND $1" | grep "@outlook.com"
#	w3m duckduckgo.com/?q="\"@gmail.com\" AND $1" | grep "@gmail.com"	
#	w3m duckduckgo.com/?q="\"@icloud.com\" AND $1" | grep "@icloud.com"
#	w3m duckduckgo.com/?q="\"@yahoo.com\" AND $1" | grep "@yahoo.com"
#	w3m duckduckgo.com/?q="\"@outlook.com\" AND $1" | grep "@outlook.com"
}
