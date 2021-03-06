///Sets the min value of the endDate input to the picked date in startDate.
function EditMinDateOnEndDate() {
    //Gets the date that is picked in the starDate input.
    var startDate = document.getElementById("MainContent_startDate").value;
    //Sets the min date to the picked date in startDate.
    document.getElementById("MainContent_endDate").setAttribute("min", startDate);

    
}

//Sets the min date value to the current day.
function setMinDateOnStartDate() {
    var todaysDate = ConvertDateFormat(new Date());
    //Sets the min date on the start date input to the current date.
    document.getElementById("MainContent_startDate").setAttribute("min", todaysDate);
}

//Converts date format to yyyy-mm-dd.
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

//Add a certain amount of days to a date.
function AddDays(date, days) {
    
    var result = new Date(date);
    result.setDate(result.getDate() + days);
    
    return result;
}

//Displays the verticalNavbar.
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

//Shows attributes determent by what type of spot is picked.
function EditShownAttributes() {
    //Gets the spottype that is checked.
    switch (GetCheckedRadioButtonFromName('typeSelector').value) {
        
        case "Campingvognplads":
            TypeChoosingChanged();
            document.getElementById("bigSpotOptions").style.display = "block";
            break;
        case "Teltplads":
            TypeChoosingChanged();
            break;
        case "Standard Hytte":
            TypeChoosingChanged()
            document.getElementById("cabinOptions").style.display = "block";
            break;
        case "Luksus Hytte":
            TypeChoosingChanged();
            document.getElementById("cabinOptions").style.display = "block";
            break;
        case "Sæsonplads":
            TypeChoosingChanged();
            document.getElementById("seasonOptions").style.display = "block";
            document.getElementById('viewDiv').style.display = 'none';
            //Removes the option to change the date and time as the seasons are predetermined.
            document.getElementById("MainContent_startDate").disabled = true;
            document.getElementById("MainContent_endDate").disabled = true;
            
            break;
    }
       
}

//Zeroes choosing, to spare on repetetive code and unchecks every checkbox.
function TypeChoosingChanged() {
    document.getElementById('viewDiv').style.display = 'block';
    document.getElementById("cabinOptions").style.display = "none";
    document.getElementById("bigSpotOptions").style.display = "none";
    document.getElementById("seasonOptions").style.display = "none";

    //Sets the checboxes to unchecked.
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

//Uncheck all checkboxes with a certain name.
function UnCheckAllFromNam(name) {
    //Gets all of the buttons.
    var buttons = document.getElementsByName("ctl00$MainContent$" + name);
    //Loops through all of the buttons.
    for (var button of buttons) {
        //Unchecks all buttons
        button.checked = false;
    }
}

//Returns the radioButton that is checked.
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

//Used when the the spot card div is pressed, then the radiobutton in that card will be checked.
function RadioButtonClick(radioButton) {
    //Sets the specific element/radiobutton to be checked.
    document.getElementById("MainContent_" + radioButton).checked = true;
    EditShownAttributes();
}

//The main function that is used to calculate the total price.
function CalculateTotalPrice() {
    
    var totalSpotFee = 0;
    var totalPersonalFee = 0;
    var totalAddOnFee = 0;
    var totalDiscount = 0;

    //The daysOnCamping is used to check if the four day discount is achieved.
    var daysOnCamping = 1;

    //Gets the dates to be looped through.
    var startDate = new Date(document.getElementById("MainContent_startDate").value);
    var endDate = new Date(document.getElementById("MainContent_endDate").value);
    
    
    //Gets the sopt type to chcek if it is selected and if its a season spot as a season spot pay a flat rate.
    var spotType = GetCheckedRadioButtonFromName('typeSelector');

    //Calculate the total add on fees.
    totalAddOnFee += CalculateAddOnFee();

    

     //This loop is used for evrey thing that are paid on a daily basis.
    while (startDate < endDate) {

        //Chceks if a spotType has been selected or not and runs the function if a spotType has been selected.
        if (spotType != null && !FourDayDiscountIsAchieved(daysOnCamping)) {
            totalSpotFee += CalculateSpotFee(HighOrLowSeason(startDate))
        }
        //Gets the totalSpotFee per day.
        else if (spotType !=null) {
            totalDiscount += CalculateSpotFee(HighOrLowSeason(startDate));
        }
        //Calculates the total personal fee.
        totalPersonalFee += CalculatePersonalFee();
        daysOnCamping++;
        startDate.setDate(startDate.getDate() + 1);
    }

    //If the spotType has been selected and seasonSpot has been selected.
    if (spotType != null && spotType.value == "Sæsonplads") {

        //Calculates the spot fee for a seaonspot.
        totalSpotFee += CalculateSeasonSpotFee();

        //Sets the price of personal to 0 because personal is free when seasonspot is chosen.
        totalPersonalFee = 0;
    }
    //sets the price labels
    SetPriceLabels(totalSpotFee, totalPersonalFee, totalAddOnFee, totalDiscount, totalDiscount);
}

//Calculates the add on fees.
function CalculateAddOnFee() {
    var totalAddOnFee = 0;

    //Gets all of the values from the add ons.
    var sengelinnedAmount = document.getElementById("MainContent_Sengelinned").value;
    var morgenkompletVoksenAmount = document.getElementById("MainContent_VoksenMorgenkomplet").value;
    var morgenkompletBarnAmount = document.getElementById("MainContent_BarnMorgenkomplet").value;
    var cykellejeAmount = document.getElementById("MainContent_Cykelleje").value;
    var badelandVoksenAmount = document.getElementById("MainContent_VoksenBadeland").value;
    var badelandBarnAmount = document.getElementById("MainContent_BadelandBarn").value;
    var slutrengøringBool = document.getElementById("MainContent_cleaning").checked;

    //Adds the amount and the price for each add on.
    totalAddOnFee += sengelinnedAmount * sengelinned;
    totalAddOnFee += morgenkompletVoksenAmount * morgenkompletVoksen;
    totalAddOnFee += morgenkompletBarnAmount * morgenkompletBarn;
    totalAddOnFee += cykellejeAmount * cykelleje;
    totalAddOnFee += badelandVoksenAmount * badelandVoksen;
    totalAddOnFee += badelandBarnAmount * badelandBarn;
    if (slutrengøringBool) {
        totalAddOnFee += slutrengøring;
    }
    //Returns the totalAddOnFee.
    return totalAddOnFee;
}

//Calculate the personale fee.
function CalculatePersonalFee(highOrLowSeason) {
    //Gets the number of the personal inputs.
    var adultAmount = document.getElementById("MainContent_Voksne").value;
    var childAmount = document.getElementById("MainContent_Børn").value;
    var dogAmount = document.getElementById("MainContent_Hund").value;

    var totalPersonalFee = 0;
    //Checks if its high or low season.
    if (highOrLowSeason) {
        //Adds to the TotalPersonalFee.
        totalPersonalFee += (adultHigh * adultAmount);
        totalPersonalFee += (childHigh * childAmount);
    }
    else {
        //Adds to the TotalPersonalFee.
        totalPersonalFee += (adultLow * adultAmount);
        totalPersonalFee += (childLow * childAmount);
    }
    //The dog price is the same in the low and high season, so we dont need to determen if its low or high season for it.
    totalPersonalFee += (dog * dogAmount);
    return totalPersonalFee;
}

//Calculate the spot fee.
function CalculateSpotFee(highOrLowSeason) {
    //Gets the spot type that is selected in the radiobutton group.
    var spotType = GetCheckedRadioButtonFromName('typeSelector');

    var totalSpotFee = 0;

    //Checks if the specific date is in the highseason or not.
    if (highOrLowSeason) {

        //Adds total cost depeding on what type of spot is selected.
        switch (spotType.value) {
            case "Campingvognplads":
                //Campingvognplads is the only spot that has the option for a big spot.
                if (document.getElementById('MainContent_BigSpot').checked) {
                    totalSpotFee += campingpladsStorHøj;
                }
                else {
                    totalSpotFee = campingpladsLilleHøj;
                }
                break;
            case "Teltplads":
                totalSpotFee += teltPladsHøj;
                break;
            case "Standard Hytte":
                totalSpotFee += hytteHøj;
                break;
            case "Luksus Hytte":
                totalSpotFee += luksusHytteHøj;
                break;
        }
    }
    else {

        
        //Adds total cost depeding on what type of spot is selected.
        switch (spotType.value) {
            case "Campingplads":
                //Campingvognplads is the only spot that has the option for a big spot.
                if (document.getElementById('MainContent_BigSpot').checked) {
                    totalSpotFee += campingpladsStorlav;
                }
                else {
                    totalSpotFee += campingpladsLillelav;
                }
                break;
            case "Teltplads":
                totalSpotFee += teltPladsLav;
                break;
            case "Standard Hytte":
                totalSpotFee += hytteLav;
                break;
            case "Luksus Hytte":
                totalSpotFee += luksusHytteLav;
                break;
        }
    }
    //The view is the only spot fee that is not changed when its high or low season, so we dont need to determen if its low or high season for it.
    if (document.getElementById("MainContent_Udsigt").checked) {
        totalSpotFee += view;
    }
    return totalSpotFee;
}

//Calculate the price if a season spot is picked.
function CalculateSeasonSpotFee() {
    var totalSpotFee = 0;

    var selecetRadioButton = GetCheckedRadioButtonFromName('SeasonSpot');
    //If a button is not selected then the switch statement will not run .
    if (selecetRadioButton != null) {
        switch (selecetRadioButton.value) {
            case 'Forår':
                totalSpotFee += sæsonpladsForår;
                break;
            case 'Sommer':
                totalSpotFee += sæsonpladsSommer;
                break;
            case 'Efterår':
                totalSpotFee += sæsonpladsEfterår;
                break;
            case 'Vinter':
                totalSpotFee += sæsonpladsVinter;
                break;
        }
        
    }
    return totalSpotFee;
}

//Return true if the four day discount is achieved.
function FourDayDiscountIsAchieved(daysOnCamping) {
    if (daysOnCamping % 4 == 0) {
        return true;
    }
    return false;
}

//Calculates the discount campaign
function DiscountCampaign() {
    
    //If the special campaign is selected then the enddate will always be one week in the future.
    if (document.getElementById('MainContent_discountCampaigne').checked) {
        //Locks the end date so the enddate always will be one week in the future.
        document.getElementById('MainContent_endDate').disabled = true;
        var startDate = document.getElementById('MainContent_startDate').value;
        var newDate = new Date(startDate)
        newDate = AddDays(newDate, 7);
        document.getElementById('MainContent_endDate').value = ConvertDateFormat(newDate);

        //Sets the max persons to 4.
        var adults = document.getElementById('MainContent_Voksne');
        var childen = document.getElementById('MainContent_Børn');
        adults.max = (4- childen.value).toString();
        childen.max = (4 - adults.value).toString();

        //Sets access to the waterpark determent on the persons.
        document.getElementById('MainContent_VoksenBadeland').value = adults.value * 7;
        document.getElementById('MainContent_BadelandBarn').value = childen.value * 7;

        document.getElementById('MainContent_VoksenMorgenkomplet').value = adults.value * 6;
        document.getElementById('MainContent_BarnMorgenkomplet').value = childen.value * 6;

        SetPriceLabels(1099, 0, 0, 0, 0);
    }
    
}

//Sets the the price labels.
function SetPriceLabels(totalSpotFee, totalPersonalFee, totalAddOnFee, totalDiscount, totalDiscount) {
    //Displays all of the diferent prices on the page.
    totalPrice = totalSpotFee + totalPersonalFee + totalAddOnFee - totalDiscount;
    document.getElementById('MainContent_TotalSpotFee').innerHTML = totalSpotFee;
    document.getElementById('MainContent_TotalPersonalFee').innerHTML = totalPersonalFee;
    document.getElementById('MainContent_TotalAddOnFee').innerHTML = totalAddOnFee;
    document.getElementById('MainContent_TotalDiscount').innerHTML = totalDiscount;
    document.getElementById('MainContent_TotalPrice').innerHTML = totalPrice;

    //Displays the prices in hidden fields to be used in the c# code.
    document.getElementById('MainContent_TotalSpotFeeHidden').value = totalSpotFee;
    document.getElementById('MainContent_TotalPersonalFeeHidden').value = totalPersonalFee;
    document.getElementById('MainContent_TotalAddOnFeeHidden').value = totalAddOnFee;
    document.getElementById('MainContent_TotalDiscountHidden').value = totalDiscount;
    document.getElementById('MainContent_TotalPriceHidden').value = totalPrice;
}

//Checks if a date is in the high - or low season, returns true if its high season.
function HighOrLowSeason(date) {

    var newDate = new Date(date);
    
    newDate.setFullYear(2000);
    //Checks if the new date is inside the highSeason.
    if (newDate > højsæsonStart && newDate < højsæsonSlut) {
        return true;
    }
    else {
        return false;
    }
}

//Sets the start- and endDate if the seasonspot has been chosen.
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