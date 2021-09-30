module.exports = {
  pageTitle: data => {
    let elements = [
      data.title,
      data.category,
      data.settings.siteName,
    ].filter(n => n)

    return elements.join(" | ")
  },
  pageDescription: data => {
    return data.description || data.excerpt || `Campaign website for ${data.settings.siteName}`
  },
  bodyClasses: data => {
    const classes = []

    classes.push(`page-${data.page.fileSlug || "home" }`)
    classes.push(`layout-${data.layout || "unknown" }`)

    return classes
  }
}
