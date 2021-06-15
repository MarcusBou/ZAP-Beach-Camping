<%@ Page Title="Bestil plads" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Order.aspx.cs" Inherits="ZAP_BEACH_CAMPING.Order" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="row ayy">
        
        <h1 class="col-sm-12 col-xs-12"> Bestil Plads</h1>
        <div class="col-sm-6 col-xs-12">
            <asp:Label Text="Navn" runat="server" for="Navn"/><br />
            <input type="text" name="Navn"  /><br /><br />
        
            <asp:Label Text="Email" runat="server" for="Email"/><br />
            <input type="text" name="Email"  /><br /><br />

            <asp:Label Text="Telefonnummer" runat="server" for="Telefonnummer"/><br />
            <input type="number" name="Telefonnummer" /><br /><br />

            <asp:Label Text="Adresse" runat="server" for="Adresse"/><br />
            <input type="text" name="Adresse" /><br /><br />
        
            <asp:Label Text="Ankomst Dato" runat="server" for="Ankomst"/><br />
            <input type="date" name="Ankomst" min="1970-1-1" max="2070-1-1-"  /><br /><br />

            <asp:Label Text="Afgangs Dato" runat="server" for="Afgang"/><br />
            <input type="date" name="Afgang" min="1970-1-1" max="2070-1-1-"/><br /><br />
        </div>

        <div class="col-sm-6 col-xs-12">
            <asp:Label Text="Type" runat="server" for="Type"/><br />
            <select name="Type" >
                <option>--</option>
                <option value="Campingplads">Campingplads</option>
                <option value="Teltplads">Teltplads</option>
                <option value="Hytte">Hytte</option>
                <option value="Sæsonplads">Sæsonplads</option>
            </select><br /><br />

            <asp:CheckBox Text="Med Udsigt" runat="server" /><br />

            <asp:CheckBox Text="Stor Plads" runat="server" /><br />

            <asp:CheckBox Text="Luksus Plads" runat="server" /><br /><br />

            <asp:Label Text="Antal Voksne" runat="server" for="Voksne"/><br />
            <input type="number" name="Voksne" value="0"/><br /> <br />

            <asp:Label Text="Antal Børn" runat="server" for="Børn"/><br />
            <input type="number" name="Børn" value="0"/><br /> <br />

            <asp:Label Text="Antal Hunde" runat="server" for="Hunde"/><br />
            <input type="number" name="Hunde" value="0" /> <br /> <br />    
        </div>
        
        <h1 class="col-sm-12 col-xs-12">Tillæg</h1>
        <div class="col-sm-6 col-xs-12">
            <asp:Label Text="Sengelinned" runat="server" for="Sengelinned"/><br />
            <input type="number" name="Sengelinned" value="0" /> <br /> <br /> 

            <asp:Label Text="Morgenkomplet (Voksen)" runat="server" for="MorgenkompletVoksen"/><br />
            <input type="number" name="VoksenMorgenkomplet" value="0" /> <br /> <br /> 

            <asp:Label Text="Morgenkomplet (Barn)" runat="server" for="MorgenkompletBarn"/><br />
            <input type="number" name="BarnMorgenkomplet" value="0" /> <br /> <br /> 

            <asp:Label Text="Slutrengøring" runat="server" for="Slutrengøring"/><br />
            <input type="number" name="Slutrengøring" value="0" /> <br /> <br /> 
        </div>
        <div class="col-sm-6 col-xs-12">
            <asp:Label Text="Cykelleje (pr. dag)" runat="server" for="Cykelleje"/><br />
            <input type="number" name="Cykelleje" value="0" /> <br /> <br /> 

            <asp:Label Text="Adgang til badeland (Voksen)" runat="server" for="BadelandVoksen"/><br />
            <input type="number" name="VoksenBadeland" value="0" /> <br /> <br /> 

            <asp:Label Text="Adgang til badeland (Barn)" runat="server" for="BadelandBarn"/><br />
            <input type="number" name="BadelandBarn" value="0" /> <br /> <br /> 
        </div>

        
    </section>
    <section class="row">
        <div class="col-md-6">
            <h4>Pladsgebyr i alt: <asp:Label Text="0.0" runat="server" id="TotalSpotFee"/> DKK</h4>
            <h4>Peronsgebyr i alt: <asp:Label Text="0.0" runat="server" id="TotalPersonalFee"/> DKK</h4>
            <h4>Tilbud i alt: <asp:Label Text="0.0" runat="server" id="TotalDiscount"/> DKK</h4>
            <h1>Pris i alt: <asp:Label Text="0.0" runat="server" id="TotalPrice"/> DKK</h1>
        </div>
        <div class="col-md-6">
            <asp:Button Text="Bestil Plads" runat="server" OnClick="OrderSpot" CssClass="orderButton green hover"/>
        </div>
    </section>
</asp:Content>