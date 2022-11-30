<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ambulance_Rescue._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<link href="styles.css" rel ="stylesheet" />

    <div class="wrapper rounded bg-white">

        <div class="h3">Ambulance Patient Lookup (Incident Number)</div>
        <div class="form">
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <asp:TextBox class="form-control" ID="Lookup" runat="server"></asp:TextBox>
                        <asp:Label ID="FindStatus" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="InciLookupIncident" runat="server" Text="Lookup Incident" OnClick="InciLookupIncident_Click" />
                   </div>
                </div>
            <hr/>
            <div class="h3">Information From Hospital</div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>First Name</label>
                        <asp:TextBox class="form-control" ID="InciFirstName" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Last Name</label>
                        <asp:TextBox class="form-control" ID="InciLastName" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>NHS Registration Number</label>
                        <asp:TextBox class="form-control" ID="InciNHSReg" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Incident Number</label>
                        <asp:TextBox class="form-control" ID="InciNumber" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Current Location</label>
                        <asp:TextBox class="form-control" ID="InciLocation" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Assigned Hospital</label>
                        <asp:TextBox class="form-control" ID="InciAssignedHospital" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row"> 
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Medical Condition</label>
                        <textarea id="InciMedicalCondition" runat="server" style="resize: none; width:500px; height: 100px;" cols="20" rows="2"></textarea>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Address</label>
                        <asp:TextBox class="form-control" ID="InciAddress" ReadOnly="true" runat="server"></asp:TextBox>
                    </div>
                </div>
                <hr/>
                <div class="h4">Ambulance Updates</div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Ambulance Diagnosis</label>
                        <textarea id="AmbDiagnosis" runat="server" style="resize: none; width:500px; height: 100px;" cols="20" rows="2"></textarea>
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Action Taken</label>
                        <textarea id="AmbAction" runat="server" style="resize: none; width:500px; height: 100px;" cols="20" rows="2"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3">
                        <label>Callout Time</label>
                        <asp:TextBox class="form-control" ID="AmbCalloutLength" runat="server"></asp:TextBox>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-6 mt-md-0 mt-3 text-center" style="margin-bottom: 10px;">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="AmbUpdateHospital" runat="server" Text="Update Hospital" OnClick="AmbUpdateHospital_Click" Height="37px" Width="172px" />
                    </div>
                    <div class="col-md-6 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="AmbClearForm" runat="server" Text="Clear Full Form" OnClick="AmbClearForm_Click" />
                    </div>
                    <asp:Label ID="UpdateStatus" runat="server" Text=""></asp:Label>
                </div>
        </div>
    </div>

</asp:Content>
