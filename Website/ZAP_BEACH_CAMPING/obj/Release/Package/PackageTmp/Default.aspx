<%@ Page Title="ZAP Beach Camping" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZAP_BEACH_CAMPING._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    
    <main>
        <section class="row mainPic">
            <h1>ZAP Beach Camping</h1>
            <img src="\Pictures\CampingPladsForside.jpg" alt="Alternate Text" class=""/>
        </section>
        <section class="row">

            <h1 class="col-sm-12">Om ZAP Beach Camping</h1>
            
            <div class="col-md-5 col-12">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida dictum augue, et hendrerit nulla ultricies et. Aenean gravida magna sit amet nulla suscipit, sed dictum orci dictum. Nam molestie varius lectus sed rhoncus. Maecenas dapibus elementum nibh, sit amet pharetra leo pulvinar at. Vivamus accumsan sapien turpis. Praesent molestie purus eu sapien malesuada, in commodo nulla commodo. Mauris lacinia dignissim elit ac maximus. Nulla consequat pellentesque lobortis. Suspendisse suscipit nisl quis mauris convallis tincidunt vitae euismod ligula. Ut gravida ante eu faucibus lobortis. Maecenas mollis efficitur turpis, eu facilisis nisi vehicula quis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus et elit pulvinar, luctus risus at, porta neque. Nullam eu elit sit amet ligula cursus aliquam. Duis eu vestibulum eros.

                <a href="/About.aspx" class="right bottom">Se mere om os.</a>
            </div>

            <div class="col-md-5 col-12 picture ">
                <img src="\Pictures\Camping2.jpg" alt="Alternate Text" class=" landscape" />
            </div>
            
        </section>
        <section class="row">
            <h1 class="col-sm-12">Bestil Plads</h1>
            <div class="col-md-5 col-11 picture">
                <img src="/Pictures/Camping3.jpg" alt="Vores CampingPlads" />
            </div>
            <div class="col-md-5 col-11">
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget lorem nulla. Duis in nibh non lorem pellentesque auctor eu sit amet mi. Aliquam interdum at nisl vel dignissim. Nullam mi mi, blandit ut lectus ac, tempor luctus urna. Vestibulum ultricies, erat at faucibus sodales, enim ex vehicula sapien, in scelerisque neque leo eu metus. Suspendisse accumsan sed metus a sagittis. Cras commodo nulla at dui aliquam, vitae luctus quam blandit. Vestibulum posuere arcu eros, ut ultrices ex bibendum at. Nullam justo turpis, tincidunt sit amet ipsum non, mollis egestas quam. Aenean turpis ex, mollis eu nunc sed, gravida placerat risus. Cras vitae massa iaculis, consequat metus quis, ornare felis.</p>
                 <asp:Button Text="Bestil Plads" runat="server" class="green button right hover" onclick="redirectOrder"/>
            </div>
        </section>
    </main>

</asp:Content>
