// use the local stylesheet (vs the online one)
// local is faster but requires setup
const localData = {"www.examcompass.com":{"body":{"background":"black"},"#sidebar":{"display":"none"},"#gk-content":{"width":"100%"},"#adminForm":{"min-height":"750px"},"#gk-breadcrumb":{"display":"none"}},"calendar.google.com":{".GENA3c, header, div[role=grid]":{"background":"black"}},"leonkuhne.com":{"body":{"background":"black","color":"magenta"},"img":{"box-shadow":"magenta 0 0 10px"},"#headshot":{"border":"cyan solid 10px"}}}

function decorate(styles) {
  Object.keys(styles).forEach(selector => {
    let attr = styles[selector]
    Object.keys(attr).forEach(style => {

      // apply attributes
      console.log("applying styles...")
      document.querySelectorAll(selector).forEach(node => {
        node.style[style] = attr[style]
      })
      console.log("...done")
    })
  })
}

function styleHost(hosts) {
  let host = window.location.host
  if (host in hosts) {
    let styles = hosts[host]
    decorate(styles)
  }
}

window.onload = () => {
  if (Object.keys(localData).length) {
    console.log("using local")
    styleHost(localData)
  } else {
    console.log("using public")
    // fetch the styles
    fetch("https://lxk1170.github.io/reStyles/styles.json").then(res => res.json()).then(data => {
      styleHost(data)
    })
  }
}
