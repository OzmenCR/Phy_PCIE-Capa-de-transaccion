all: ss
ss:
	git pull
	git add -A
	git commit -m "Parte2"
	git push origin master
