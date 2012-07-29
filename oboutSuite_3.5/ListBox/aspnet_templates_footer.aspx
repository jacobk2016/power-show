﻿<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Footer Templates</b></span>	
    
    <br /><br />
    
    <obout:ListBox runat="server" ID="ListBox1" Width="250"
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID">
        <FooterTemplate>
            Displaying <%# Container.ItemsCount %> items.
        </FooterTemplate>
    </obout:ListBox>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 CustomerID, CompanyName, Country FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox provides a way to customize the footer of the drop down menu, by using the <b>FooterTemplate</b> property. <br />
        You can embed any content inside the header template, including HTML markup and ASP.NET server controls <br />
        (any control from the Obout suite may be added to the header template).<br /><br />
        
        You can retrieve the total number of items loaded in the footer template using the <b>Container.ItemsCount</b> property.
    </span>
    
</asp:Content>