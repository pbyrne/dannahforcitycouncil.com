Dannah for City Council
=======================

This is the source for [Dannah for City Council](https://dannahforcitycouncil.com).

Setup
-----

This uses [Eleventy](https://www.11ty.dev) to build static HTML, so you'll need Node and Yarn to get started. Then `yarn install` should get you going. It optionally uses Make to perform the various common commands.

Usage
-----

It has a Makefile with wrappers around Eleventy commands:

* `make` to fetch Facebook posts and build the site
* `make serve` to fetch Facebook posts and run a local live server
* `make clean` to delete the built files
* `make fetch-facebook` just fetches the Facebook posts

Facebook Token
--------------

You'll need a long-lived Facebook API access token to fetch posts. See [these instructions](https://developers.facebook.com/docs/facebook-login/access-tokens/refreshing) for how to get a long-lived access token from a freshly created default short-lived token (which you can get from [the Graph explorer](https://developers.facebook.com/tools/explorer/)).
