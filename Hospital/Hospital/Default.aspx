<%@ Page Title="KwikMedical Hospital Client" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Hospital._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<link href="styles.css" rel ="stylesheet" />
    <div class="wrapper rounded bg-white">

        <div class="h3">KwikMedical Hospital Database</div>
        <div class="form">
            <hr/>
            <div class="h3">Patient(s) Details</div>
                <div class="row">
                    <div class="col-md-12 mt-md-0 mt-3">
                        <table class="table">
                          <thead>
                            <tr>
                              <th scope="col">#</th>
                              <th scope="col">First</th>
                              <th scope="col">Last</th>
                              <th scope="col">Handle</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>@mdo</td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>Jacob</td>
                              <td>Thornton</td>
                              <td>@fat</td>
                            </tr>
                            <tr>
                              <th scope="row">3</th>
                              <td>Larry</td>
                              <td>the Bird</td>
                              <td>@twitter</td>
                            </tr>
                          </tbody>
                        </table>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-5 mt-md-0 mt-3">
                        <div class="h4">Previous Incidents</div>
                        <table class="table">
                          <thead>
                            <tr>
                              <th scope="col">#</th>
                              <th scope="col">First</th>
                              <th scope="col">Last</th>
                              <th scope="col">Handle</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>@mdo</td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>Jacob</td>
                              <td>Thornton</td>
                              <td>@fat</td>
                            </tr>
                            <tr>
                              <th scope="row">3</th>
                              <td>Larry</td>
                              <td>the Bird</td>
                              <td>@twitter</td>
                            </tr>
                          </tbody>
                        </table>
                    </div>
                    <div class="col-md-2 mt-md-0 mt-3">
                        </div>
                    <div class="col-md-5 mt-md-0 mt-3">
                        <div class="h4">Active Incidents</div>
                        <table class="table">
                          <thead>
                            <tr>
                              <th scope="col">#</th>
                              <th scope="col">First</th>
                              <th scope="col">Last</th>
                              <th scope="col">Handle</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <th scope="row">1</th>
                              <td>Mark</td>
                              <td>Otto</td>
                              <td>@mdo</td>
                            </tr>
                            <tr>
                              <th scope="row">2</th>
                              <td>Jacob</td>
                              <td>Thornton</td>
                              <td>@fat</td>
                            </tr>
                            <tr>
                              <th scope="row">3</th>
                              <td>Larry</td>
                              <td>the Bird</td>
                              <td>@twitter</td>
                            </tr>
                          </tbody>
                        </table>
                    </div>
                </div>
                <hr/>
                <div class="row">
                    <div class="col-md-4 mt-md-0 mt-5 text-center" style="margin-bottom: 10px;">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="HospUpdatePatient" runat="server" Text="Update Selected Patient" />
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center" style="margin-bottom: 10px;">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="HospFilterPatient" runat="server" Text="Filter Selected Patient" />
                    </div>
                    <div class="col-md-4 mt-md-0 mt-3 text-center">
                        <asp:Button class="btn btn-danger mt-3 align-middle" ID="HospDeletePatient" runat="server" Text="Delete Selected Patient" />
                    </div>
                </div>
        </div>
    </div>

</asp:Content>
