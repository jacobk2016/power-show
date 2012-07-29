﻿<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_commands_sp.aspx.cs" Inherits="SuperForm_aspnet_commands_sp" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Save using Stored Procedures</b></span>
    
    <br /><br />
       
    <obout:SuperForm ID="SuperForm1" 
        Title="Customer Details"
        DataSourceID="sds1"
        AutoGenerateRows="false"
        AutoGenerateInsertButton ="true"
        AutoGenerateEditButton="true"
        AutoGenerateDeletebutton="true"
        DataKeyNames="CustomerID"
        AllowDataKeysInsert="true" 
        RunAt="server"
        AllowPaging="True"
        DefaultMode="Edit">
        <Fields>
            <obout:BoundField DataField="CustomerID" HeaderText="Customer ID"  ReadOnly="true"/>
            <obout:BoundField DataField="CompanyName" HeaderText="Company Name" />
            <obout:BoundField DataField="ContactName" HeaderText="Contact Name" />
            <obout:BoundField DataField="Country" HeaderText="Country" />
        </Fields>
    </obout:SuperForm>

   <asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		    SelectCommand="spGetCustomers" SelectCommandType="StoredProcedure"
            InsertCommand="spInsertCustomer" InsertCommandType="StoredProcedure"
            UpdateCommand="spUpdateCustomer" UpdateCommandType="StoredProcedure"
            DeleteCommand="spDeleteCustomer" DeleteCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="CustomerID" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </DeleteParameters>
		 </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        This example showcases the ability to insert/update/delete records in the Super Form using stored procedures. <br />
        The stored procedures used to insert/update/delete records need to have the same parameters as the ones  <br />
        specified using the "InsertParameters", "UpdateParameters" and "DeleteParameters" collections of the DataSourceControl.<br />
    </span>
</asp:Content>

