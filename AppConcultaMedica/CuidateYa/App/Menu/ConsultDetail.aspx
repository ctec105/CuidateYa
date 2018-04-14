<%@ Page Title="" Language="C#" MasterPageFile="~/App/Site.master" AutoEventWireup="true" CodeFile="ConsultDetail.aspx.cs" Inherits="App_Menu_ConsultDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h1>
        <asp:Label ID="lblTitulo" runat="server"/></h1>
    <hr />

    <div class="disease-profile">
        <div class="row">
            <div class="col-lg-7">
                <div class="disease-profile-content">
                    <asp:Image ID="Image1" runat="server" ImageUrl="https://informe21.com/sites/default/files/styles/node_default/public/images/ghjcfhgkjgukfuklik.jpg?itok=aOaJomWA" Width="100%" />

                    <div class="content-description">
                        <p><asp:Label ID="lblResumen" runat="server"/></p>                        
                        <p>&nbsp;</p>
                        <h4>Descripción General</h4>
                        <p><asp:Label ID="lblDescripcionGeneral" runat="server"/></p>
                        <p>&nbsp;</p>
                        <h4>Causas</h4>
                        <p><asp:Label ID="lblCausas" runat="server"/></p>
                        <p>&nbsp;</p>
                        <h4>Sintomas</h4>
                        <p><asp:Label ID="lblSintomas" runat="server"/></p>
                        <p>&nbsp;</p>
                        <h4>Pruebas/Exámenes</h4>
                        <p><asp:Label ID="lblPruebas" runat="server"/></p>
                        <p>&nbsp;</p>
                        <h4>Tratamiento</h4>
                        <p><asp:Label ID="lblTratamiento" runat="server"/></p>
                        <p>&nbsp;</p>
                        <h4>Información Adicional</h4>
                        <p><asp:Label ID="lblInfoAdicional" runat="server"/></p>
                        <p>&nbsp;</p>
                        <h4>Bibliografía</h4>
                        <p><asp:Label ID="lblBibliografia" runat="server"/></p>
                    </div>
                </div>
            </div>

            <div class="col-lg-5">
                <div class="disease-profile-sidebar">
                    <h4>Epidemiología</h4>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <asp:Label ID="lblLsEpidemiologia" runat="server"/>
                        </li>
                    </ul>

                    <h4>Síntomas</h4>
                    <ul class="list-group">
                        <asp:Repeater ID="RepeaterlsSintomas" runat="server">
                            <ItemTemplate>
                                <li class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-1">
                                            <img src="../Images/check.png" />
                                        </div>
                                        <div class="col-md-10">
                                            <%# Container.DataItem %>
                                        </div>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                        
                    <!--<h6>Síntomas</h6>
                    <ul class="list-group">
                        <li class="list-group-item">
                            <div class="row">
                                <div class="col-md-8">
                                    Dolor de cabeza
                                </div>
                                <div class="col-md-4">
                                    <div class="progress">
                                        <div class="progress-bar greybar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>-->

                    <h4>Factores desencadenantes</h4>
                    <ul class="list-group">
                        <asp:Repeater ID="RepeaterLsFactoresDesc" runat="server">
                            <ItemTemplate>
                                <li class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-1">
                                            <img src="../Images/check.png" />
                                        </div>
                                        <div class="col-md-10">
                                            <%# Container.DataItem %>
                                        </div>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                    <h4>Especialidades</h4>
                    <div class="list-group">
                        <asp:Repeater ID="RepeaterLsEspecialidades" runat="server">
                            <ItemTemplate>
                                <a href="#" class="list-group-item list-group-item-image">
                                    <img src="../Images/especialidad.png" style="width:30px" />
                                    <%# Container.DataItem %>		    					
                                    <i class="fa fa-angle-right nav-icon"></i>
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <h4>Autor</h4>
                    <div class="list-group">
                        <div class="list-group-item" >
                            <asp:Label ID="lblAutor" runat="server"/>
                            <p>&nbsp;</p>
                            Última Versión: 
                            <asp:Label ID="lblVersion" runat="server"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

