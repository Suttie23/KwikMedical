<%@ Page Title="KwikMedical HQ Operator" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HQ_Operator._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="styles.css" rel ="stylesheet" />

    <div class="wrapper rounded bg-white">
        <div class="h3">Patient Information Form</div>
            <div class="form">
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>First Name</label>
                        <asp:TextBox class="form-control" ID="FirstName" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Last Name</label>
                        <asp:TextBox class="form-control" ID="LastName" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>NHS Registration Number</label>
                        <asp:TextBox class="form-control" ID="NHSReg" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Address</label>
                        <asp:TextBox class="form-control" ID="Address" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Current Location</label>
                        <asp:DropDownList class="form-control" ID="InciLocation" runat="server">
                            <asp:ListItem Enabled="true" Text= "Select Location" Value= "-1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text= "City of Edinburgh" Value= "1"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text= "East Lothian" Value= "2"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text= "West Lothian" Value= "3"></asp:ListItem>
                            <asp:ListItem Enabled="true" Text= "Midlothian" Value= "4"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Date Of Birth</label>
                        <asp:TextBox class="form-control" ID="DateOfBirth" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row"> 
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Medical Condition</label>
                        <textarea id="MedicalCondition" style="resize: none; width:500px; height: 100px;" cols="20" rows="2"></textarea>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="SubmitPatientInformation" runat="server" Text="Submit Patient Information" />
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="ClearForm" runat="server" Text="Clear Form" />
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="SubmitAmbulanceRequest" runat="server" Text="Request Ambulance" />
                    </div>
                </div>
             </div>
        </div>

</asp:Content>

