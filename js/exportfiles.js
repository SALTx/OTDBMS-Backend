// TODO: Finalize rows and columns that need to be exported
// TODO: Convert functions to take table object as parameter so that it can be used for any table

/*
INCOMPLETE
- removed trailing commas
- still need to fix export rows (actions row should not be exported for student table)
*/
function exportTableToCSV(filename) {
  var csv = [];
  var rows = $("table tr");
  for (var i = 0; i < rows.length - 1; i++) {
    var row = [];
    var cols = $(rows[i]).find("td, th");
    for (var j = 0; j < cols.length; j++) {
      row.push(cols[j].innerText);
    }
    csv.push(row.join(",").slice(0, -1));
  }
  downloadFile(csv.join("\n"), filename, "text/csv");
}

/*
REPLACE
use SheetsJS for exporting to XLS
*/
function exportTableToXLS(filename) {
  var excelTemplate =
    "<html> " +
    "<head> " +
    '<meta http-equiv="content-type" content="text/plain; charset=UTF-8"/> ' +
    "</head> " +
    "<body> " +
    document.getElementById("table-conatainer").innerHTML +
    "</body> " +
    "</html>";
  downloadFile(excelTemplate, filename, "application/vnd.ms-excel");
}

/*
INCOMPLETE
removed unused row and column but still need to finalize rows and columns that need to be exported
*/
function exportTableToJSON(filename) {
  let headers = [];
  let rows = [];
  let table = $("#students");
  let headerRow = table.find("tr:first-child th");
  headerRow.each(function () {
    headers.push($(this).text().toLowerCase());
  });
  let rowLength = table.find("tr").length - 1;
  let colLength = headerRow.length - 1;
  for (let i = 1; i < rowLength; i++) {
    let row = {};
    for (let j = 0; j < colLength; j++) {
      row[headers[j]] = table.find("tr:eq(" + i + ") td:eq(" + j + ")").text();
    }
    rows.push(row);
  }

  let data = JSON.stringify(rows, null, 2);
  downloadFile(data, filename, "application/json");
}

function exportTableToXML(filename) {
  // Get the table headers and data
  let headers = [];
  let rows = [];
  let table = document.getElementById("students");
  let headerRow = table.rows[0];
  for (let i = 0; i < headerRow.cells.length; i++) {
    headers.push(headerRow.cells[i].textContent.toLowerCase());
  }
  for (let i = 1; i < table.rows.length; i++) {
    let row = {};
    for (let j = 0; j < headers.length; j++) {
      row[headers[j]] = table.rows[i].cells[j].textContent;
    }
    rows.push(row);
  }

  // Build XML string
  let xml = '<?xml version="1.0" encoding="UTF-8"?>\n';
  xml += "<students>\n";
  for (let i = 0; i < rows.length; i++) {
    xml += "  <student>\n";
    for (let j = 0; j < headers.length; j++) {
      let value = rows[i][headers[j]];
      value = value
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;");
      xml += `    <${headers[j]}>${value}</${headers[j]}>\n`;
    }

    xml += "  </student>\n";
  }
  xml += "</students>";

  // Download XML file
  downloadFile(xml, filename, "application/xml");
}

function downloadFile(data, filename, type) {
  var file = new Blob([data], { type: type });
  var downloadLink = document.createElement("a");
  downloadLink.download = filename;
  downloadLink.href = URL.createObjectURL(file);
  downloadLink.style.display = "none";
  document.body.appendChild(downloadLink);
  downloadLink.click();
  document.body.removeChild(downloadLink);
}

$(document).ready(function () {
  $("#exportToCSV").on("click", function () {
    exportTableToCSV("students.csv");
  });
  $("#exportToXLS").on("click", function () {
    exportTableToXLS("students.xls");
  });
  $("#exportToJSON").on("click", function () {
    exportTableToJSON("students.json");
  });
  $("#exportToXML").on("click", function () {
    exportTableToXML("students.xml");
  });
});
