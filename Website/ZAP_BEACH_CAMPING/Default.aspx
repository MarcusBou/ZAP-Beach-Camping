<%@ Page Title="ZAP Beach Camping" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZAP_BEACH_CAMPING._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
    <main>
        <section class="row mainPic">
            <img src="\Pictures\CampingPladsForside.jpg" alt="Alternate Text" class=""/>
        </section>
        <section class="row">

            <h1 class="col-sm-12">Om ZAP Beach Camping</h1>
            
            <div class="col-6  ">
                <p>Etiam iaculis vulputate consequat. Integer velit justo, sodales lobortis neque eget, placerat convallis leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent sed arcu nec diam congue pretium. Aenean tortor nulla, pharetra mattis sem quis, egestas semper massa. Vivamus fringilla est nibh. Mauris vel vestibulum ex. Maecenas vel nisi at massa placerat elementum ut ut nulla. Vestibulum finibus, metus ut maximus hendrerit, velit orci rutrum est, in fringilla tellus turpis et lectus. Quisque maximus, metus eu porttitor consectetur, ex leo mollis dui, vitae congue libero nunc eget odio.</p>                
                <a href="/About.aspx" class="right bottom">Se mere om os.</a>
            </div>

            <div class="col-6 picture ">
                <img src="\Pictures\CampingPladsForside.jpg" alt="Alternate Text" class="imgg landscape" />
            </div>
            
        </section>
        <section class="row">
            <h1 class="col-md-12">Bestil Plads</h1>
            <div class="col-6 picture">
                <img src="/Pictures/Camping2.jpg" alt="Vores CampingPlads" />
            </div>
            <div class="col-6 ">
                <p>Etiam iaculis vulputate consequat. Integer velit justo, sodales lobortis neque eget, placerat convallis leo. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent sed arcu nec diam congue pretium. Aenean tortor nulla, pharetra mattis sem quis, egestas semper massa. Vivamus fringilla est nibh. Mauris vel vestibulum ex. Maecenas vel nisi at massa placerat elementum ut ut nulla. Vestibulum finibus, metus ut maximus hendrerit, velit orci rutrum est, in fringilla tellus turpis et lectus. Quisque maximus, metus eu porttitor consectetur, ex leo mollis dui, vitae congue libero nunc eget odio.</p>
                <asp:Button Text="Bestil Plads" runat="server" class="green button right" onclick="redirectOrder"/>
            </div>
        </section>
    </main>

</asp:Content>
