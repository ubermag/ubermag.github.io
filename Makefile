index.html:	index.md
	pandoc -s index.md -o index.html -c pandoc.css

# get the sample css file
pandoc.css:
	wget https://gist.githubusercontent.com/killercup/5917178/raw/40840de5352083adb2693dc742e9f75dbb18650f/pandoc.css
