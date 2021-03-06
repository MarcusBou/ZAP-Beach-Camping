<%@ Page Title="Bestil plads" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Order.aspx.cs" Inherits="ZAP_BEACH_CAMPING.Order" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="row">
        
        <h1 class="col-sm-12 col-xs-12"> Bestil Plads</h1>
        <div class="col-sm-6 col-xs-12">
            <asp:Label Text="Fornavn" runat="server" for="Fornavn"/><br />
            <asp:TextBox runat="server" type="text" name="Fornavn"  id="Fornavn"/><br /><br />
            
            <asp:Label Text="Efternavn" runat="server" for="Efternavn"/><br />
            <asp:TextBox runat="server" type="text" name="Efternavn"  id="Efternavn"/><br /><br />

            <asp:Label Text="Email" runat="server" for="Email"/><br />
            <asp:TextBox runat="server" type="text" name="Email" id="Email"/><br /><br />
        </div>
        <div class="col-sm-6 col-xs-12">
            <asp:Label Text="Telefonnummer" runat="server" for="Telefonnummer"/><br />
            <asp:TextBox runat="server" type="number" name="Telefonnummer" id="Telefonnummer" /><br /><br />

            <asp:Label Text="Adresse" runat="server" for="Adresse"/><br />
            <asp:TextBox runat="server" type="text" name="Adresse" id="Adresse"/><br /><br />
        
            
        </div>
    </section>
    <section class="row orderSpotCardSection">
        <h1 class="col-sm-12 col-xs-12"> Plads Type </h1>
        
        <div class="card orderSpotCard col-sm-3" onclick="RadioButtonClick('Campingplads'); CalculateTotalPrice();">
            <img src="/Pictures/Camping2.jpg" alt="Alternate Text" class="card-img-top" />
            <div class="card-body">

                <h3 class="card-text">Campingplads</h3>
                <h5 class="card-text"> m/ strøm</h5>
                <h6 class="card-text">Højsæson pris: 60,-</h6>
                <h6 class="card-text">Lavsæson pris: 50,-</h6>
                <asp:RadioButton runat="server" id="Campingplads" type="radio" name="typeSelector" GroupName="typeSelector" value="Campingvognplads" onclick="EditShownAttributes()"/>

            </div>
        </div>
        <div class="card orderSpotCard col-sm-3" onclick="RadioButtonClick('Teltplads'); CalculateTotalPrice();">
            <img src="/Pictures/Camping2.jpg" alt="Alternate Text" class="card-img-top"/>
            <div class="card-body">

                <h3 class="card-text">Teltplads</h3>
                <h5 class="card-text"> m/ strøm</h5>
                <h6 class="card-text">Højsæson pris: 35,-</h6>
                <h6 class="card-text">Lavsæson pris: 45,-</h6>
                <asp:RadioButton runat="server" id="Teltplads" type="radio" name="typeSelector1" GroupName="typeSelector" Value="Teltplads" onclick="EditShownAttributes()"/>
                
            </div>
        </div>
        <div class="card orderSpotCard col-sm-3" onclick="RadioButtonClick('StandardHytte'); CalculateTotalPrice();">
            <img src="/Pictures/Camping2.jpg" alt="Alternate Text" class="card-img-top"/>
            <div class="card-body">

                <h3 class="card-text">Standard Hytte</h3>
                <h5 class="card-text">4 pers. m/ strøm</h5>
                <h6 class="card-text">Højsæson pris: 500,-</h6>
                <h6 class="card-text">Lavsæson pris: 350,-</h6>
                <asp:RadioButton runat="server" type="radio" ID="StandardHytte" name="typeSelector" GroupName="typeSelector" value="Standard Hytte" onclick="EditShownAttributes()"/>
            </div>
        </div>
        <div class="card orderSpotCard col-sm-3" onclick="RadioButtonClick('LuksusHytte'); CalculateTotalPrice();">
            <img src="/Pictures/Camping2.jpg" alt="Alternate Text" class="card-img-top"/>
            <div class="card-body">

                <h3 class="card-text">Luksus Hytte</h3>
                <h5 class="card-text">4-6 pers. m/ strøm</h5>
                <h6 class="card-text">Højsæson pris: 850,-</h6>
                <h6 class="card-text">Lavsæson pris: 600,-</h6>
                <asp:RadioButton runat="server" type="radio" id="LuksusHytte" name="typeSelector" GroupName="typeSelector" value="Luksus Hytte" onclick="EditShownAttributes()"/>
            </div>
        </div>
        <div class="card orderSpotCard col-sm-3" onclick="RadioButtonClick('Sæsonplads'); CalculateTotalPrice();">
            <img src="/Pictures/Camping2.jpg" alt="Alternate Text" class="card-img-top"/>
            <div class="card-body">

                <h3 class="card-text">Sæsonplads</h3>
                    <h6 class="lightGray">* For all sæsonpladser er gebyr pr. person inkluderet, ligeledes afregnes strøm separat med 3,75,- DKK/KWh</h6>
                <asp:RadioButton runat="server" type="radio" id="Sæsonplads" name="typeSelector" GroupName="typeSelector" value="Sæsonplads" onclick="EditShownAttributes()"/>
            </div>
        </div>
    </section>
     <section class="row">
        
        <div class="col-sm-6 col-xs-12">
            

          
            <div id="dateInputs">
                <asp:Label Text="Ankomst Dato" runat="server" for="Ankomst"/><br />
                <asp:TextBox runat="server" ID="startDate" type="date" name="Ankomst" min="2020-06-16" max="2070-1-1"  onfocus="setMinDateOnStartDate()" onInput="CalculateTotalPrice(); EditMinDateOnEndDate(); DiscountCampaign();" /><br /><br />

                <asp:Label Text="Afgangs Dato" runat="server" for="Afgang"/><br />
                <asp:TextBox runat="server" type="date" name="Afgang" min="1970-1-1" max="2070-1-1" id="endDate" onInput="CalculateTotalPrice()"/><br /><br />
            </div>
            <div id="viewDiv">
                <asp:CheckBox Text="Med Udsigt" runat="server" id="Udsigt" onInput="CalculateTotalPrice()"/><br />
            </div>
                <div ID="bigSpotOptions" class="none">
                    <asp:CheckBox id="BigSpot" name="BigSpot" Text="Stor Plads" runat="server" onInput="CalculateTotalPrice()" /><br />
                </div>
                <div id="cabinOptions" class="none">
                    <asp:CheckBox ID="cleaning" Text="Slutrengøring" runat="server" onInput="CalculateTotalPrice()"/><br /><br />
                </div>
                <div id="seasonOptions" class="none">
                    <asp:RadioButton Text="Forår (1. april - 30. juni)" GroupName="SeasonSpot" name="SeasonSpot" runat="server" value="Forår" onclick="SetDateInputOnSeasons('Forår')" onInput="CalculateTotalPrice()" /><br />
                    <asp:RadioButton Text="Sommer (1. april - 30. september)" GroupName="SeasonSpot" name="SeasonSpot" runat="server" value="Sommer" onclick="SetDateInputOnSeasons('Sommer')" onInput="CalculateTotalPrice()"/><br />
                    <asp:RadioButton Text="Efterår (15. August - 31. Oktober)" GroupName="SeasonSpot" name="SeasonSpot" runat="server" value="Efterår" onclick="SetDateInputOnSeasons('Efterår')" onInput="CalculateTotalPrice()"/><br />
                    <asp:RadioButton Text="Vinter (1. Oktober - 31. Marts)" GroupName="SeasonSpot" name="SeasonSpot" runat="server" value="Vinter" onclick="SetDateInputOnSeasons('Vinter')"  onInput="CalculateTotalPrice()"/><br />
                </div>
        </div>
        <div class="col-sm-6 col-xs-12">
            <asp:Label Text="Antal Voksne" runat="server" for="Voksne"/><br />
            <asp:TextBox runat="server" type="number" name="Voksne" value="0" ID="Voksne" onBlue="CalculatePrice()" min="0" onInput="CalculateTotalPrice(); DiscountCampaign();"/><br /> <br />

            <asp:Label Text="Antal Børn" runat="server" for="Børn"/><br />
            <asp:TextBox runat="server" type="number" name="Børn" value="0" id="Børn" min="0" onInput="CalculateTotalPrice(); DiscountCampaign();"/><br /> <br />

            <asp:Label Text="Antal Hunde" runat="server" for="Hunde"/><br />
            <asp:TextBox runat="server" type="number" name="Hunde" value="0" ID="Hund" min="0" onInput="CalculateTotalPrice()"/> <br /> <br />    
        </div>
        
        <h1 class="col-sm-12 col-xs-12">Tillæg</h1>
        <div class="col-sm-6 col-xs-12">
            <asp:Label Text="Sengelinned" runat="server" for="Sengelinned"/><br />
            <asp:TextBox runat="server" type="number" name="Sengelinned" value="0" id="Sengelinned" min="0" onInput="CalculateTotalPrice()"/> <br /> <br /> 
            
            <asp:Label Text="Morgenkomplet (Voksen)" runat="server" for="MorgenkompletVoksen"/><br />
            <asp:TextBox runat="server" type="number" name="VoksenMorgenkomplet" value="0" id="VoksenMorgenkomplet" min="0" onInput="CalculateTotalPrice()"/> <br /> <br /> 

            <asp:Label Text="Morgenkomplet (Barn)" runat="server" for="MorgenkompletBarn"/><br />
            <asp:TextBox runat="server" type="number" name="BarnMorgenkomplet" value="0" id ="BarnMorgenkomplet" min="0" onInput="CalculateTotalPrice()"/> <br /> <br /> 
            
        </div>
        <div class="col-sm-6 col-xs-12">
            <asp:Label Text="Cykelleje (pr. dag)" runat="server" for="Cykelleje"/><br />
            <asp:TextBox runat="server" type="number" name="Cykelleje" value="0" id="Cykelleje" min="0" onInput="CalculateTotalPrice()"/> <br /> <br /> 

            <asp:Label Text="Adgang til badeland (Voksen)" runat="server" for="BadelandVoksen"/><br />
            <asp:TextBox runat="server" type="number" name="VoksenBadeland" value="0" id="VoksenBadeland" min="0" onInput="CalculateTotalPrice()"/> <br /> <br /> 

            <asp:Label Text="Adgang til badeland (Barn)" runat="server" for="BadelandBarn"/><br />
            <asp:TextBox runat="server" type="number" name="BadelandBarn" value="0" ID="BadelandBarn" min="0" onInput="CalculateTotalPrice()"/> <br /> <br /> 
        </div>
         
        
    </section>
    <section class="row DiscountCampaigne">
        <asp:CheckBox Text="1 uges teltpladsinkl. 4 personer, 6x morgenmad og billetter til badeland hele ugen" runat="server" onclick="DiscountCampaign()" id="discountCampaigne" class="col-sm-12"/>
    </section>
    <section class="row" onload="CalculateTotalPrice()">
        <div class="col-md-6">
            <h4>Pladsgebyr i alt: <asp:Label Text="0" runat="server" ID="TotalSpotFee"/>,00 DKK</h4>
            <h4>Peronsgebyr i alt: <asp:Label Text="0" runat="server" id="TotalPersonalFee"/>,00 DKK</h4>
            <h4>Tillæg i alt: <asp:Label Text="0" runat="server" id="TotalAddOnFee"/>,00 DKK</h4>
            <h4>Tilbud i alt: <asp:Label Text="0" runat="server" id="TotalDiscount"/>,00 DKK</h4>
            <h1>Pris i alt: <asp:Label Text="0" runat="server" id="TotalPrice"/>,00 DKK</h1>
        </div>
        <asp:HiddenField runat="server" id="TotalSpotFeeHidden"/>
        <asp:HiddenField runat="server" id="TotalPersonalFeeHidden"/>
        <asp:HiddenField runat="server" id="TotalAddOnFeeHidden"/>
        <asp:HiddenField runat="server" id="TotalDiscountHidden"/>
        <asp:HiddenField runat="server" id="TotalPriceHidden" Value="2"/>
        <div class="col-md-6">
            <asp:Button  type="submit" Text="Bestil Plads" runat="server" CssClass="orderButton green hover" OnClick="OrderSpot"/>
        </div>
    </section>
</asp:Content>