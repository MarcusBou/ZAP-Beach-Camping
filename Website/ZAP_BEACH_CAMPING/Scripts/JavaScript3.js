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
function RadioButtonClick(radioButton) {
    //Sets the specific element/radiobutton to be checked.
    document.getElementById("MainContent_" + radioButton).checked = true;
    EditShownAttributes();
}

var adultHigh = 82;
var adultLow = 87;
var childHigh = 42;
var childLow = 49;
var dog = 30;
var campingpladsLilleHøj = 60;
var campingpladsLillelav = 50;
var campingpladsStorHøj = 80;
var campingpladsStorlav = 65;
var hytteLav = 350;
var hytteHøj = 500;
var luksusHytteLav = 600;
var luksusHytteHøj = 850;
var sæsonpladsForår = 4100;
var sæsonpladsSommer = 9300;
var sæsonpladsEfterår = 2900;
var sæsonpladsVinter = 3500;
var sengelinned = 30;
var morgenkompletVoksen = 75;
var morgenkompletBarn = 50;
var slutrengøring = 150;
var cykelleje = 200;
var udsigt = 75;
var badelandVoksen = 30;
var badelandBarn = 15;
var højsæsonStart = new Date(2000, 5, 14);
var højsæsonSlut = new Date(2000, 7, 15);


function CalculatePrice() {
    console.log("au");
    var TotalSpotFee = 0;
    var TotalPersonalFee = 0;
    var TotalAddOnFee = 0;
    var TotalDiscount = 0;
    var TotalPrice = 0;
    
    var startDate = new Date(document.getElementById("MainContent_startDate").value);
    var endDate = new Date(document.getElementById("MainContent_endDate").value);
    var adultAmount = document.getElementById("MainContent_Voksne").value;
    var childAmount = document.getElementById("MainContent_Børn").value;
    var dogAmount = document.getElementById("MainContent_Hund").value;
    var sengelinnedAmount = document.getElementById("MainContent_Sengelinned").value;
    var morgenkompletVoksenAmount = document.getElementById("MainContent_VoksenMorgenkomplet").value;
    var morgenkompletBarnAmount = document.getElementById("MainContent_BarnMorgenkomplet").value;
    var cykellejeAmount = document.getElementById("MainContent_Cykelleje").value;
    var badelandVoksenAmount = document.getElementById("MainContent_VoksenBadeland").value;
    var badelandBarnAmount = document.getElementById("MainContent_BadelandBarn").value;
    var medUdsigt = document.getElementById("MainContent_Udsigt").checked;
    var slutrengøring = document.getElementById("MainContent_cleaning").checked;


    console.log("au");
    while (startDate < endDate) {
        console.log(endDate);
        console.log(startDate);
        if (HighOrLowSeason(startDate)) {
            //Adds to the TotalPersonalFee.
            TotalPersonalFee += (adultHigh * adultAmount);
            TotalPersonalFee += (childHigh * childAmount);

        }
        else {
            //Adds to the TotalPersonalFee.
            TotalPersonalFee += (adultLow * adultAmount);
            TotalPersonalFee += (childLow * childAmount);
        }
        //The dog price is the same in the low and high season, so we dont need to determen if its low or high season for it.
        TotalPersonalFee += (dog * dogAmount);
        if (medUdsigt) {
            TotalSpotFee += 75;
        }
        if (slutrengøring) {
            TotalSpotFee += 150;
        }
        startDate.setDate(startDate.getDate() + 1);
    }
    TotalAddOnFee += sengelinnedAmount * sengelinned;
    TotalAddOnFee += morgenkompletVoksenAmount * morgenkompletVoksen;
    TotalAddOnFee += morgenkompletBarnAmount * morgenkompletBarn;
    TotalAddOnFee += morgenkompletVoksenAmount * morgenkompletVoksen;
    TotalAddOnFee += morgenkompletVoksenAmount * morgenkompletVoksen;
    TotalAddOnFee += cykellejeAmount * cykelleje;
    TotalAddOnFee += badelandVoksenAmount * badelandVoksen;
    TotalAddOnFee += badelandBarnAmount * badelandBarn;

    TotalPrice = TotalSpotFee + TotalPersonalFee + TotalAddOnFee - TotalDiscount;
    document.getElementById('MainContent_TotalSpotFee').innerHTML = TotalSpotFee;
    document.getElementById('MainContent_TotalPersonalFee').innerHTML = TotalPersonalFee;
    document.getElementById('MainContent_TotalAddOnFee').innerHTML = TotalAddOnFee;
    document.getElementById('MainContent_TotalDiscount').innerHTML = TotalDiscount;
    document.getElementById('MainContent_TotalPrice').innerHTML = TotalPrice;

}
function HighOrLowSeason(date) {
    var newDate = new Date(date);
    newDate.setFullYear(2000);
    if (newDate > højsæsonStart && newDate < højsæsonSlut) {
        return true;
    }
    else {
        return false;
    }
}
