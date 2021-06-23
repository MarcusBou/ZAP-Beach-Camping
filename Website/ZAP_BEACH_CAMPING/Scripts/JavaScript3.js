///Sets the min value of the endDate input to the picked date in startDate.
function EditMinDateOnEndDate() {
    //Gets the date that is picked in the starDate input.
    var startDate = document.getElementById("MainContent_startDate").value;
    //Sets the min date to the picked date in startDate.
    document.getElementById("MainContent_endDate").setAttribute("min", startDate);
}
function setMinDateOnStartDate() {
    var todaysDate = ConvertDateFormat(new Date());
    //Sets the min date on the start date input to the current date.
    document.getElementById("MainContent_startDate").setAttribute("min", todaysDate);
}
function ConvertDateFormat(today) {
    var day = today.getDate();
    var month = today.getMonth() + 1;
    var year = today.getFullYear();
    //If the month or/and day is in the wrong format then it is changed to the right format i.e. 2021-6-2 changes to 2021-06-02.
    if (month < 10) {
        month = '0' + month
    }
    if (day < 10) {
        day = '0' + day;
    }
    var todaysDate = year + '-' + month + '-' + day;
    return todaysDate;
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
    //Gets the spottype that is checked.
    switch (GetCheckedRadioButtonFromName('typeSelector').value) {
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
            //Removes the option to change the date and time as the seasons are predetermined.
            document.getElementById("MainContent_startDate").disabled = true;
            document.getElementById("MainContent_endDate").disabled = true;
            
            break;
    }
       
}

//Zeroes choosing, to spare on repetetive code
function typeChoosingChanged() {
    document.getElementById("cabinOptions").style.display = "none";
    document.getElementById("bigSpotOptions").style.display = "none";
    document.getElementById("seasonOptions").style.display = "none";

    document.getElementById("MainContent_cleaning").checked = false;
    document.getElementById("MainContent_BigSpot").checked = false;
    UnCheckAllFromNam('SeasonSpot');
    //If the data inputs were used in the season type then they are set to null, this is done so the user dosen't need to scroll all the way back.
    if (document.getElementById("MainContent_startDate").disabled == true && document.getElementById("MainContent_endDate").disabled == true) {
        //Adds the option to change the date inputs.
        document.getElementById("MainContent_startDate").disabled = false;
        document.getElementById("MainContent_endDate").disabled = false;
        //Removes the date set by the seasons, so the user dosen't need to scroll all the way back.
        document.getElementById("MainContent_startDate").value = null;
        document.getElementById("MainContent_endDate").value = null;
    }
}
//Used when the the spot card div is pressed, then the radiobutton in that card will be checked.
function RadioButtonClick(radioButton) {
    //Sets the specific element/radiobutton to be checked.
    document.getElementById("MainContent_" + radioButton).checked = true;
    EditShownAttributes();
}
//All of the prices for the diffrent options
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


function CalculateTotalPrice() {
    
    var TotalSpotFee = 0;
    var TotalPersonalFee = 0;
    var TotalAddOnFee = 0;
    var TotalDiscount = 0;
    var TotalPrice = 0;
    //Gets all of the inputs and saves them as a variable.
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
    var view = document.getElementById("MainContent_Udsigt").checked;
    var slutrengøring = document.getElementById("MainContent_cleaning").checked;

    var spotType = GetCheckedRadioButtonFromName('typeSelector');

    //Calculates all of the add ons.
    TotalAddOnFee += sengelinnedAmount * sengelinned;
    TotalAddOnFee += morgenkompletVoksenAmount * morgenkompletVoksen;
    TotalAddOnFee += morgenkompletBarnAmount * morgenkompletBarn;
    TotalAddOnFee += cykellejeAmount * cykelleje;
    TotalAddOnFee += badelandVoksenAmount * badelandVoksen;
    TotalAddOnFee += badelandBarnAmount * badelandBarn;
    if (slutrengøring) {
        TotalAddOnFee += 150;
    }

    //This loop is used for evrey thing that are paid on a daily basis.
    while (startDate < endDate) {        
        //Checks if the specific date is in the highseason or not.
        if (HighOrLowSeason(startDate)) {
            //Adds to the TotalPersonalFee.
            TotalPersonalFee += (adultHigh * adultAmount);
            TotalPersonalFee += (childHigh * childAmount);
            //If the spotType has not been defined then it will skip the switch statement.
            if (spotType.value == null)
                break;
            //Adds total cost depeding on what type of spot is selected.
            switch (spotType.value) {
                case "Campingplads":
                    //If its a big spot then it costs 80 dkk daily else if its a normal spot then it costs 60 dkk daily.
                    if (document.getElementById('MainContent_BigSpot').checked) {
                        TotalSpotFee += 80;
                    }
                    else {
                        TotalSpotFee += 60;
                    }
                    break;
                case "Teltplads":
                    TotalSpotFee += 35;
                    break;
                case "Standard Hytte":
                    TotalSpotFee += 500;
                    break;
                case "Luksus Hytte":
                    TotalSpotFee += 850;
                    break;
            }
        }
        else {
            //Adds to the TotalPersonalFee.
            TotalPersonalFee += (adultLow * adultAmount);
            TotalPersonalFee += (childLow * childAmount);
            //If the spotType has not been defined then it will skip the switch statement.
            if (spotType.value == null)
                break;
            //Adds total cost depeding on what type of spot is selected.
            switch (spotType.value) {
                case "Campingplads":
                    if (document.getElementById('MainContent_BigSpot').checked) {
                        TotalSpotFee += 65;
                    }
                    else {
                        TotalSpotFee += 50;
                    }
                    break;
                case "Teltplads":
                    TotalSpotFee += 45;
                    break;
                case "Standard Hytte":
                    TotalSpotFee += 350;
                    break;
                case "Luksus Hytte":
                    TotalSpotFee += 600;
                    break;
            }
        }
        //The dog price and view is the same in the low and high season, so we dont need to determen if its low or high season for it.
        TotalPersonalFee += (dog * dogAmount);
        if (view) {
            TotalSpotFee += 75;
        }
        
        startDate.setDate(startDate.getDate() + 1);
    }
    //If the spotType has not been defined then it will skip the statement.
    if (spotType != null) {
        if (spotType.value == "Sæsonplads") {
        //Seasons spot do not need to pay a personal fee thus its set to 0.
        TotalPersonalFee = 0;
        var selecetRadioButton = GetCheckedRadioButtonFromName('SeasonSpot');
        //If a button is not selected then the switch statement will not run .
        if (selecetRadioButton != null) {
            switch (selecetRadioButton.value) {
                case 'Forår':
                    TotalSpotFee += 4100;
                    break;
                case 'Sommer':
                    TotalSpotFee += 9300;
                    break;
                case 'Efterår':
                    TotalSpotFee += 2900;
                    break;
                case 'Vinter':
                    TotalSpotFee += 3500;
                    break;
            }
        }
        
    }
    }
    
    

    //Displays all of the diferent prices on the page.
    TotalPrice = TotalSpotFee + TotalPersonalFee + TotalAddOnFee - TotalDiscount;
    document.getElementById('MainContent_TotalSpotFee').innerHTML = TotalSpotFee;
    document.getElementById('MainContent_TotalPersonalFee').innerHTML = TotalPersonalFee;
    document.getElementById('MainContent_TotalAddOnFee').innerHTML = TotalAddOnFee;
    document.getElementById('MainContent_TotalDiscount').innerHTML = TotalDiscount;
    document.getElementById('MainContent_TotalPrice').innerHTML = TotalPrice;

}
//Checks if a date is in the high - or low season, returns true if its high season.
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
function GetCheckedRadioButtonFromName(name) {
    //Gets all of the radiobuttons.
    var radioButtons = document.getElementsByName("ctl00$MainContent$" + name);
    //Loops through all of the radiobuttons.
    for (var radioButton of radioButtons) {
        //Finds out which radioButton is checked.
        if (radioButton.checked) {
            //Return the value of the radio button that is checked.
            return radioButton;
        }
    }
    
}
function UnCheckAllFromNam(name) {
    //Gets all of the buttons.
    var radioButtons = document.getElementsByName("ctl00$MainContent$" + name);
    //Loops through all of the buttons.
    for (var radioButton of radioButtons) {
        //Unchecks all buttons
        radioButton.checked = false;
    }
}
function SetDateInputOnSeasons(season) {
    //Gets todays date.
    var todaysDate = new Date();
    var startDate;
    var endDate;
    //Determens the start- and endDate determent by what season is chosen.
    switch (season) {
        case 'Forår':
            startDate = new Date(2021, 3, 1);
            endDate = new Date(2021, 5, 30);
            break;
        case 'Sommer':
            startDate = new Date(2021, 3, 1);
            endDate = new Date(2021, 8, 30);
            break;
        case 'Efterår':
            startDate = new Date(2021, 7, 15);
            endDate = new Date(2021, 9, 31);
            break;
        case 'Vinter':
            startDate = new Date(2021, 9, 1);
            endDate = new Date(2021, 2, 31);
            break;
    }
    //Is that start date of the season has already passed then the date will pass to the next year.
    while (startDate < todaysDate) {
        startDate.setFullYear(startDate.getFullYear() + 1);
        endDate.setFullYear(endDate.getFullYear() + 1);
    }
    //Sets the inputs to the date determined by what season is chosen.
    document.getElementById('MainContent_startDate').value = ConvertDateFormat(startDate);
    document.getElementById('MainContent_endDate').value = ConvertDateFormat(endDate);
}