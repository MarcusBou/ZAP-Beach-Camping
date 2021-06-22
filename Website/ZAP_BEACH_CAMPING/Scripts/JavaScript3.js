var staticPrices;
var periodPrices;



///Sets the min value of the endDate input to the picked date in startDate.
function EditMinDateOnEndDate() {
    //Gets the date that is picked in the starDate input.
    var startDate = document.getElementById("MainContent_startDate").value;
    //Sets the min date to the picked date in startDate.
    document.getElementById("MainContent_endDate").setAttribute("min", startDate);
}
function setMinDateOnStartDate() {
    //Gets the current date
    var today = new Date();
    var day = today.getDate();
    var month = today.getMonth() + 1;
    var year = today.getFullYear();
    //If the month or/and day is in the wrong format then it is changed to the right format i.e. 2021-6-2 changes to 2021-06-02.
    if (month < 10) {
        month= '0' + month
    }
    if (day < 10) {
        day = '0' + day;
    }
    var todaysDate = year + '-' + month + '-' + day;
    //Sets the min date on the start date input to the current date.
    document.getElementById("MainContent_startDate").setAttribute("min", todaysDate);
}



function ShowVerticalNavbar() {
    //Gets the Element with the id "verticalNavbarOption".
    var x = document.getElementById("verticalNavbarOption")
    //If the css display = none then it will change to block.
    if (x.style.display === "none") {
        x.style.display = "block";
    }
    else {
        x.style.display = "none";
    }
}

function EditShownAttributes() {
    //Gets all of the radiobutton in an array.
    var radioButtons = document.getElementsByName("ctl00$MainContent$typeSelector"); 
    //Loops through all of the radiobuttons.
    for (var radioButton of radioButtons) {
        //Finds out which radioButton is checked.
        if (radioButton.checked) {
            switch (radioButton.value) {
                case "Campingplads":
                    typeChoosingChanged();
                    document.getElementById("bigSpotOptions").style.display = "block";
                    break;
                case "Teltplads":
                    typeChoosingChanged();
                    break;
                case "Standard Hytte":
                    typeChoosingChanged()
                    document.getElementById("cabinOptions").style.display = "block";
                    break;
                case "Luksus Hytte":
                    typeChoosingChanged();
                    document.getElementById("cabinOptions").style.display = "block";
                    break;
                case "Sæsonplads":
                    typeChoosingChanged();
                    document.getElementById("bigSpotOptions").style.display = "block";
                    document.getElementById("seasonOptions").style.display = "block";
                    break;
            }
        }
    }
}

//Zeroes choosing, to spare on repetetive code
function typeChoosingChanged() {
    document.getElementById("cabinOptions").style.display = "none";
    document.getElementById("bigSpotOptions").style.display = "none";
    document.getElementById("seasonOptions").style.display = "none";
}
//Used when the the spot card div is pressed, then the radiobutton in that card will be checked.
function RadioButtonClick(vvalue) {
    //Sets the specific element/radiobutton to be checked.
    document.getElementById("MainContent_" + vvalue).checked = true;
    EditShownAttributes();
}
