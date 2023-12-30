const EleventyVitePlugin = require("@11ty/eleventy-plugin-vite")

module.exports = function(eleventyConfig) {
  eleventyConfig.addWatchTarget("./source/javascripts/")
  eleventyConfig.addWatchTarget("./source/stylesheets/")

  eleventyConfig.addPassthroughCopy("./source/images/")
  eleventyConfig.addPassthroughCopy("./source/javascripts/")
  eleventyConfig.addPassthroughCopy("./source/stylesheets")

  eleventyConfig.addPairedShortcode("navitem", async function(content, href) {
    return `<li><a href="${href}" aria-current="${href === this.page.url ? "page" : "false"}">${content}</a></li>`
  })

  eleventyConfig.addCollection("issues", (collectionApi) => {
    return collectionApi.getFilteredByGlob("source/issues/*.liquid").
      filter(item => item.data.order).
      sort((a, b) => a.data.order - b.data.order) // a - b: ascending, b - a: descending
  })

  eleventyConfig.addPlugin(EleventyVitePlugin, {
    viteOptions: {
      build: {
        assetsInlineLimit: 0, // Don't inline assets, since we want to keep the markup small
        manifest: true,
      },
    },
  })

  return {
    dir: { input: "source", output: "_site" }
  };
};
