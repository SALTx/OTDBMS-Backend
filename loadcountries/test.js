const fs = require("fs");

var countries = JSON.parse(fs.readFileSync("./countries.json", "utf8"));

if (countries.length === 0) {
  console.log("no countries");
} else if ((countries.length = 299)) {
  console.log("All countries loaded");
}
