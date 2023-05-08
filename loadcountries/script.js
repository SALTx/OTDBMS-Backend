const fs = require("fs");
const request = require("request");

if (!fs.existsSync("./countries.json")) {
  fs.writeFileSync("./countries.json", "");
}

let countries = [];

for (var i = 1; i <= 6; i++) {
  request(
    "https://api.worldbank.org/v2/country/all?format=json&page=" + i,
    (error, response, body) => {
      if (error) {
        console.log("error:", error);
      }
      if (response.statusCode === 200) {
        JSON.parse(body)[1].forEach((country) => {
          countries.push(country);
        });
        console.log(body.length);
      }
    }
  );
}

//wait for all requests to go through
setTimeout(() => {
  fs.writeFileSync("./countries.json", JSON.stringify(countries));
  console.log("done");
}, 10000);
