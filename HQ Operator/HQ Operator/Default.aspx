<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HQ_Operator._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="styles.css" rel ="stylesheet" />

    <div class="wrapper rounded bg-white">

        <div class="h3">Patient Information Form</div>

        <div class="form">
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>First Name</label>
                    <asp:TextBox class="form-control" ID="TextBox1" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Last Name</label>
                    <asp:TextBox class="form-control" ID="TextBox2" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>NHS Registration Number</label>
                    <asp:TextBox class="form-control" ID="TextBox3" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Address</label>
                    <asp:TextBox class="form-control" ID="TextBox4" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mt-md-0 mt-3">
                    <label>Current Location</label>
                    <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                        <asp:ListItem Enabled="true" Text= "Select Location" Value= "-1"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text= "City of Edinburgh" Value= "1"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text= "East Lothian" Value= "2"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text= "West Lothian" Value= "3"></asp:ListItem>
                        <asp:ListItem Enabled="true" Text= "Midlothian" Value= "4"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-6 mt-md-0 mt-3" style="margin-bottom: 10px;">
                    <label>Medical Condition</label>
                    <asp:TextBox class="form-control" ID="TextBox5" runat="server"></asp:TextBox>
                </div>
            </div>
            <asp:Button class="btn btn-danger mt-3" ID="Button1" runat="server" Text="Submit" />
        </div>

    </div>

</asp:Content>

