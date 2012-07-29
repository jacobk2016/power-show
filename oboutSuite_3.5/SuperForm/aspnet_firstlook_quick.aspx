﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_firstlook_quick.aspx.cs" Inherits="SuperForm_aspnet_firstlook_quick" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Quick Setup</b></span>
    
    <br /><br />
    
    <obout:SuperForm ID="SuperForm1" 
        Title="Order Details"
        DataSourceID="SqlDataSource1"
        AutoGenerateInsertButton ="True"
        AutoGenerateEditButton="True"
        AutoGenerateDeleteButton="True"
        DataKeyNames="Order ID"
        RunAt="server"
        DefaultMode="Edit"
        AllowPaging="True" AllowDataKeysInsert="False">
    </obout:SuperForm>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID AS [Order ID], ShipName AS [Ship Name], ShipCity AS [Ship City], ShipCountry AS [Ship Country],
                        OrderDate AS [Order Date], Sent FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipCountry=@ShipCountry, 
                       OrderDate=@OrderDate, Sent=@Sent
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipCountry, OrderDate, Sent)
                        VALUES(@ShipName, @ShipCity, @ShipCountry, @OrderDate, @Sent)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        It is very easy to set up a basic form using the Super Form control. Most of the features are available by default.<br />
        The easiest way to configure the form is to let the control automatically generate the fields and the command buttons.<br />
        For this to happen, you need to set these properties to <span class="option2">true</span>:<br />
        <b>AutoGenerateRows, AutoGenerateInsertButton, AutoGenerateEditButton, AutoGenerateDeleteButton</b>
    </span>
</asp:Content>

