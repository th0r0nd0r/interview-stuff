var url = "http://www.algolia.com/search?sort=products&query=iphone&hitsPerPage=24&page=0";

function parseParams(url){
  const pairs = {};
  const questionMarkIdx = url.indexOf("?")
  const params = url.slice(questionMarkIdx + 1).split("&");
  for (let i = 0; i < params.length; i++) {
    let pair = params[i].split("=");
    pairs[pair[0]] = pair[1];
  }
  return pairs
}

var params = parseParams(url);
console.log("params: ", params);
/*
    {
        sort: 'products',
        query:'iphone',
        hitsPerPage:'24',
        page: '0'
    }

*/
