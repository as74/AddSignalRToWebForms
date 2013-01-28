<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    
    <h3>Log Items</h3>
    <asp:ListView ID="logListView" runat="server" ItemPlaceholderID="itemPlaceHolder" ClientIDMode="Static" EnableViewState="false" >
        <LayoutTemplate>
            <ul id="logUl">
                <li runat="server" id="itemPlaceHolder"></li>
            </ul>
        </LayoutTemplate>
        <ItemTemplate>
            <li><span class="logItem"><%#Container.DataItem.ToString() %></span></li>
        </ItemTemplate>
    </asp:ListView>


    <%-- SignalR  --%>
    <script src="Scripts/jquery.signalR-1.0.0-rc1.min.js"></script>
    <script src="/signalr/hubs" type="text/javascript"></script>
    <script type="text/javascript"><!--
    
        $(function() {

            var logger = $.connection.logHub;

            logger.client.logMessage = function(msg) {

                $("#logUl").append("<li><span class='logItem'>" + msg + "</span></li>");

            };

            $.connection.hub.start();

        });

    //--></script>

</asp:Content>
