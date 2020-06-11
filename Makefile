.PHONY: build
build: fetch-facebook
	bundle exec middleman build -e production

.PHONY: build-staging
build-staging: fetch-facebook
	bundle exec middleman build -e staging

.PHONY: serve
serve: fetch-facebook
	bundle exec middleman serve

.PHONY: clean
clean:
	rm -Rf build/

.PHONY: fetch-facebook
fetch-facebook:
	bin/fetch-facebook-posts
