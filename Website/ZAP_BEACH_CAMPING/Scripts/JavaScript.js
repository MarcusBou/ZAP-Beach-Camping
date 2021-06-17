
function EditMinDateOnEndDate() {
    var startDate = document.getElementById("startDate").value;
    document.getElementById("endDate").setAttribute("min", startDate);
}
function setMinDateOnStartDate() {
    //Gets the current date
    var today = new Date();
    var day = today.getDate();
    var month = today.getMonth() + 1;
    var year = today.getFullYear();
    
    if (month < 10) {
        month= '0' + month
    }
    if (day < 10) {
        day = '0' + day;
    }
    var todaysDate = year + '-' + month + '-' + day;

    document.getElementById("startDate").setAttribute("min", todaysDate);
}



function showVerticalNavbar() {
    var x = document.getElementById("verticalNavbarOption")
    if (x.style.display === "none") {
        x.style.display = "block";
    }
    else {
        x.style.display = "none";
    }
}
