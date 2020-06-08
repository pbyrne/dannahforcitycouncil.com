.PHONY: build
build: fetch-facebook
	bundle exec middleman build -e production

.PHONY: build-staging
build-staging: fetch-facebook
	bundle exec middleman build -e staging

.PHONY: serve
serve: fetch-facebook
	bundle exec middleman serve

.PHONY: deploy
deploy: build
	bin/deploy dannahforcitycouncil-com

.PHONY: stage
stage: build-staging
	bin/deploy staging-dannahforcitycouncil-com

.PHONY: clean
clean:
	rm -Rf build/

.PHONY: fetch-facebook
fetch-facebook:
	bin/fetch-facebook-posts
