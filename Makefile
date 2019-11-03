.PHONY: build
build:
	bin/build production

.PHONY: build-staging
build-staging:
	bin/build staging

.PHONY: serve
serve:
	bundle exec middleman serve

.PHONY: deploy
deploy: build
	bin/deploy dannahforcitycouncil-com

.PHONY: stage
stage: build
	bin/deploy staging-dannahforcitycouncil-com

.PHONY: clean
clean:
	rm -Rf build/
