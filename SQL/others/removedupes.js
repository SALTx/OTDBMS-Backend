// load newcountries.json into an array
const fs = require("fs");
const path = require("path");

let countries = JSON.parse(
  fs.readFileSync(path.join(__dirname, "newcountries.json"), "utf8")
);

console.log(countries);

// remove duplicates giving priority to countries with codes that are 3 characters long
let newCountries = countries.filter(
  (country, index, self) =>
    index ===
    self.findIndex((t) => t.name === country.name && t.code.length === 3)
);

console.log(newCountries);
console.log(newCountries.length);
