function exportTableToCSV(filename) {
  var csv = [];
  var rows = document.querySelectorAll("table tr");
  for (var i = 0; i < rows.length - 1; i++) {
    var row = [];
    var cols = rows[i].querySelectorAll("td, th");
    for (var j = 0; j < cols.length; j++) {
      row.push(cols[j].innerText);
    }
    csv.push(row.join(","));
  }
  downloadFile(csv.join("\n"), filename, "text/csv");
}

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

function exportTableToJSON(filename) {
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

  // Convert data to JSON and download the file
  let data = JSON.stringify(rows, null, 2);
  downloadFile(data, filename, "application/json");
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
});
