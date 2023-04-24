function exportTableToCSV(filename) {
    var csv = [];
    var rows = document.querySelectorAll('table tr');
    for (var i = 0; i < rows.length - 1; i++) {
        var row = [];
        var cols = rows[i].querySelectorAll('td, th');
        for (var j = 0; j < cols.length; j++) row.push(cols[j].innerText);
        csv.push(row.join(','));
    }
    downloadCSV(csv.join('\n'), filename);
}

function downloadCSV(csv, filename) {
    var csvFile;
    var downloadLink;
    csvFile = new Blob([csv], {
        type: 'text/csv'
    });
    downloadLink = document.createElement('a');
    downloadLink.download = filename;
    downloadLink.href = window.URL.createObjectURL(csvFile);
    downloadLink.style.display = 'none';
    document.body.appendChild(downloadLink);
    downloadLink.click();
}


function exportTableToXLS(filename) {
    var location = 'data:application/vnd.ms-excel;base64,';
    var excelTemplate = '<html> ' +
        '<head> ' +
        '<meta http-equiv="content-type" content="text/plain; charset=UTF-8"/> ' +
        '</head> ' +
        '<body> ' +
        document.getElementById("table-conatainer").innerHTML +
        '</body> ' +
        '</html>'
    var link = document.createElement("a");
    link.href = location + window.btoa(excelTemplate);
    link.download = filename;
    link.click();
}


$(document).ready(function() {
    $('#exportToCSV').click(function() {
        exportTableToCSV('students.csv');
    });
    $('#exportToXLS').click(function() {
        exportTableToXLS('students.xls');
    });
});
