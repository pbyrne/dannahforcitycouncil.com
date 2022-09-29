module.exports = function(eleventyConfig) {
  eleventyConfig.addPassthroughCopy("./source/images/")
  eleventyConfig.addPassthroughCopy("./source/javascripts/")

  eleventyConfig.addWatchTarget("./config/")
  eleventyConfig.addWatchTarget("./source/stylesheets/")

  eleventyConfig.addFilter("autoLinkedMarkdown", function(value) {
    if ( typeof value === "undefined" ) return
    const md = require("markdown-it")({
      html: true,
      linkify: true,
    })

    return md.render(value)
  })

  eleventyConfig.addCollection("issues", (collectionApi) => {
    return collectionApi.getFilteredByGlob("source/issues/*.liquid").
      filter(item => item.data.order).
      sort((a, b) => a.data.order - b.data.order) // a - b: ascending, b - a: descending
  })

  return {
    dir: { input: "source", output: "_site" }
  };
};
