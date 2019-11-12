Dannah for City Council
=======================

This is the source for [Dannah for City Council](https://dannahforcitycouncil.com).

Setup
-----

This uses [Middleman](https://middlemanapp.com/) to build static HTML, so you'll need Ruby 2.6 or higher (along with Bundler) to get started. Then `bundle install` should get you going. It optionally uses Make to perform commands and the offiall `aws` CLI to communicate with S3 to push files out.

Usage
-----

It has a Makefile with wrappers around Middleman commands, like `make` to build the markup; `make serve` to run a server; `make stage` or `make deploy` to push to staging and production S3 buckets.
