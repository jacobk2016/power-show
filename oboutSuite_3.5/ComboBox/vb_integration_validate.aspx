﻿<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_integration_validate.aspx.vb" Inherits="ComboBox_vb_integration_validate" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Validate with ASP.NET Validators</b></span>	
    
    <br /><br />
    
    <table>
        <tr>
            <td>   
                <asp:PlaceHolder runat="server" ID="ComboBox1Container" />   
            </td >
            <td valign="bottom">  
                <obout:OboutButton ID="OboutButton1" runat="server" Text="Validate" />
            </td >
            <td valign="bottom">    
                <asp:PlaceHolder runat="server" ID="ValidatorContainer" />   
            </td >
        </tr>    
    </table>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <br /><br />
        
    <span class="tdText">
        The ComboBox control can be validated using ASP.NET validator controls. This sample showcases the use of a <br />
        <b>RequiredFieldValidator</b> and a <b>RangeValidator</b> to validate the items selected from the ComboBox.
    </span>
    
</asp:Content>
