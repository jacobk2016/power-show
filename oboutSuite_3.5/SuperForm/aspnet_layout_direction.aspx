﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_layout_direction.aspx.cs" Inherits="SuperForm_aspnet_layout_direction" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Vertical / Horizontal Direction</b></span>
    
    <br /><br />

    <obout:OboutRadioButton runat="server" ID="VerticalDirection" Text="Vertical Direction" 
        OnCheckedChanged="SetDirection" GroupName="Group1" AutoPostBack="true" />
    
    <br />
    
    <obout:OboutRadioButton runat="server" ID="HorizontalDirection" Text="Horizontal Direction" 
        OnCheckedChanged="SetDirection" GroupName="Group1" Checked="true" AutoPostBack="true" />

    <br /><br />

    <obout:SuperForm ID="SuperForm1" 
        DataSourceID="SqlDataSource1"
        AutoGenerateRows="false"
        AutoGenerateInsertButton ="true"
        AutoGenerateEditButton="true"
        AutoGenerateDeletebutton="true"
        DataKeyNames="OrderID"
        FolderStyle="styles/black_glass"
        RunAt="server"
        AllowPaging="true"
        Direction="Horizontal"
        DefaultMode="Edit"
        Width="630px">
        <Fields>
            <obout:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="true" InsertVisible="false" Visible="false" />
            <obout:BoundField DataField="ShipName" HeaderText="Ship Name" />
            <obout:DropDownListField DataField="ShipCountry" DisplayField="ShipCountry" HeaderText="Ship Country" DataSourceID="SqlDataSource2" />
            <obout:DateField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" />
        </Fields>
        <FieldHeaderStyle Width="110" />
    </obout:SuperForm>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCountry, OrderDate FROM [Orders]"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCountry=@ShipCountry, OrderDate=@OrderDate
                         WHERE OrderID=@OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID" />

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
                SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />

    <br /><br />
    
    <span class="tdText">
        The fields of the Super Form can be arranged one underneath the other (vertical direction) or one near the other (horizontal direction).<br />
        Use the <b>Direction</b> property of the Super Form to change the way the fields are arranged.<br />
        Possible values: <b>Direction.Vertical</b> and <b>Direction.Horizontal</b>
    </span>
</asp:Content>

