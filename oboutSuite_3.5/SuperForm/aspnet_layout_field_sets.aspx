﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_layout_field_sets.aspx.cs" Inherits="SuperForm_aspnet_layout_field_sets" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .field-set
        {
            padding: 10px;
        }        
     </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Fields Grouped in Field Sets</b></span>
    
    <br /><br />

    <obout:SuperForm ID="SuperForm1" 
        DataSourceID="SqlDataSource1"
        Width="600px"
        AutoGenerateRows="false"
        AutoGenerateInsertButton ="true"
        AutoGenerateEditButton="true"
        AutoGenerateDeletebutton="true"
        DataKeyNames="OrderID"
        RunAt="server"
        AllowPaging="true"
        DefaultMode="Edit"
        >
        <Fields>
            <obout:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="true" InsertVisible="false" FieldSetID="FieldSet2" />
            <obout:BoundField DataField="ShipName" HeaderText="Ship Name" FieldSetID="FieldSet2" />
            <obout:BoundField DataField="ShipCity" HeaderText="Ship City" FieldSetID="FieldSet2" />
            <obout:DateField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" FieldSetID="FieldSet3" />            
            <obout:DateField DataField="ShippedDate" HeaderText=" Shipped Date" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" FieldSetID="FieldSet3" />            
            <obout:DateField DataField="RequiredDate" HeaderText="Required Date" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" FieldSetID="FieldSet3" />
        </Fields>
        <FieldSets>
            <obout:FieldSetRow>
                <obout:FieldSet ID="FieldSet2" Title="Shipping Information" />
                <obout:FieldSet ID="FieldSet3" Title="Timeline Information" />
            </obout:FieldSetRow>
        </FieldSets>
    </obout:SuperForm>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, OrderDate, ShippedDate, RequiredDate FROM [Orders]"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate
                         WHERE OrderID=@OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
        <UpdateParameters>
            <asp:Parameter Name="ShipName" DbType="String" />
            <asp:Parameter Name="ShipCity" DbType="String" />
            <asp:Parameter Name="OrderDate" DbType="DateTime" />            
            <asp:Parameter Name="ShippedDate" DbType="DateTime" />
            <asp:Parameter Name="RequiredDate" DbType="DateTime" />
            <asp:Parameter Name="OrderID" DbType="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The fields of the Super Form can be grouped in field sets. Use the <b>FieldSets</b> collection to define field sets for the form.<br />
        The field sets are grouped in field set rows, which allow developers to organize the field sets in a tabular structure.<br />
        To designate a field as member of a field set, use the <b>FieldSetID</b> property of the field.
    </span>
</asp:Content>

