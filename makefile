all: ss
ss:
	git pull
	git add -A
	git commit -m "PHY"
	git push
