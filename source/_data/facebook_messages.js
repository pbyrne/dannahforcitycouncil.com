const axios = require("axios")
const Cache = require("@11ty/eleventy-cache-assets")

fetchPosts = async function() {
  const apiToken = process.env.FACEBOOK_API_TOKEN
  const results = []
  const perPage = 50
  let iteration = 0
  let nextPage = `https://graph.facebook.com/v7.0/dannahforcitycouncil/posts?fields=message,created_time,attachments\{type,url,description,media,media_type\},status_type,story,is_published,permalink_url&limit=${perPage}&access_token=${apiToken}`

  while (true) {
    let data
    iteration += 1
    console.log("Downloading", {iteration})

    try {
      data = await Cache(nextPage, {
        duration: "1 day",
        type: "json",
      })
    } catch(error) {
      console.log("Cache error!", {error})
      const response = await axios.get(nextPage)
      data = response.data
    }
    // console.log("Result fetched", Object.keys(data))
    // console.log("  -> meta", {iteration, paging: data.paging, count: data.data.length})
    nextPage = data.paging.next
    // console.log("  ->", nextPage)
    results.push(...data.data.filter(post => post.message))

    if (typeof nextPage === "undefined") { break }
  }

  console.log("Results length", {iteration, totalCount: results.length})

  return results
}

module.exports = fetchPosts
