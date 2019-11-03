.PHONY: build
build:
	bundle exec middleman build -e production

.PHONY: build-staging
build-staging:
	bundle exec middleman build -e staging

.PHONY: serve
serve:
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
