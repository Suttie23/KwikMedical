<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ambulance_Rescue._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<link href="styles.css" rel ="stylesheet" />

    <div class="wrapper rounded bg-white">

        <div class="h3">Ambulance Patient Lookup</div>
        <div class="form">
                <div class="row">
                    <div class="row">
                        <div class="col-md-12 mt-md-0 mt-3">
                            <label>Lookup Incident (Incident Number)</label>
                        </div>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <asp:TextBox class="form-control" ID="Lookup" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="InciLookupIncident" runat="server" Text="Lookup Incident" />
                   </div>
                </div>
            <hr/>
            <div class="h4">Information From Hospital</div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>First Name</label>
                        <asp:TextBox class="form-control" ID="InciFirstName" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Last Name</label>
                        <asp:TextBox class="form-control" ID="InciLastName" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>NHS Registration Number</label>
                        <asp:TextBox class="form-control" ID="InciNHSReg" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Address</label>
                        <asp:TextBox class="form-control" ID="InciAddress" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Current Location</label>
                        <asp:TextBox class="form-control" ID="InciLocation" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Date Of Birth</label>
                        <asp:TextBox class="form-control" ID="InciDateOfBirth" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row"> 
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Medical Condition</label>
                        <textarea id="InciMedicalCondition" style="resize: none; width:500px; height: 100px;" cols="20" rows="2"></textarea>
                    </div>
                </div>
                <hr/>
                <div class="h4">Ambulance Updates</div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Ambulance Diagnosis</label>
                        <textarea id="AmbDiagnosis" style="resize: none; width:500px; height: 100px;" cols="20" rows="2"></textarea>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Action Taken</label>
                        <textarea id="AmbActionTaken" style="resize: none; width:500px; height: 100px;" cols="20" rows="2"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Call-Out Length</label>
                        <asp:TextBox class="form-control" ID="AmbCalloutLength" runat="server"></asp:TextBox>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3 text-center" style="margin-bottom: 10px;">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="AmbUpdateHospital" runat="server" Text="Update Hospital" />
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="AmbClearForm" runat="server" Text="Clear Full Form" />
                    </div>
                </div>
        </div>
    </div>

</asp:Content>
