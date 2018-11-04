all: reset assets html

reset:
	rm -fr build/*

assets:
	(cd build; wget https://raw.githubusercontent.com/DashboardHub/Assets/master/favicon.ico)

html:
	asciidoctor src/index.adoc -D build/
