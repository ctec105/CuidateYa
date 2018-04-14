<%@ Page Title="Configuración" Language="C#" MasterPageFile="~/App/Site.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="App_Account_Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h2><%: Title %>.</h2>
    <hr />

        <div class="disease-profile">
        <div class="row">
            <div class="col-lg-12">
                <div class="disease-profile-content">
                    <div class="content-description">
                        <h4>Configuración de Cuenta</h4>
                        <hr />

                        <div class="form-group">
                            <asp:Label ID="lblOpciones" runat="server" ForeColor="#0000CC" Text="{administrador}{medico}{paciente}"></asp:Label>
                        </div>

                        <% if(lblOpciones.Text == "Médico"){ %>
                        <!--<div class="list-group col-sm-4 col-md-3">
                            <a href="#" class="list-group-item list-group-item-image">
                                <asp:Label runat="server" CssClass="row col-md-12 control-label"><h4>Actualizar Datos Personales</h4></asp:Label>

                                <asp:Label runat="server" CssClass="row col-md-12 control-label">Realizar algún cambio en mi información personal</asp:Label>
                                
                                <asp:Label runat="server" CssClass="row col-md-12 control-label">______</asp:Label>
                            </a>
                        </div>-->

                        <div class="list-group col-sm-4 col-md-3">
                            <a href="#" class="list-group-item list-group-item-image">
                                <asp:Label runat="server" CssClass="row col-md-12 control-label"><h4>Gestionar Contenido</h4></asp:Label>

                                <asp:Label runat="server" CssClass="row col-md-12 control-label">Crear, actualizar, eliminar contenido de la aplicación.</asp:Label>
                                
                                <asp:Label runat="server" CssClass="row col-md-12 control-label">______</asp:Label>
                            </a>
                        </div>

                        <!--<div class="list-group col-sm-4 col-md-3">
                            <a href="#" class="list-group-item list-group-item-image">
                                <asp:Label runat="server" CssClass="row col-md-12 control-label"><h4>Gestionar Preguntas y Respuestas</h4></asp:Label>

                                <asp:Label runat="server" CssClass="row col-md-12 control-label">Consultar y responder las preguntas hechas por los pacientes de la aplicación.</asp:Label>
                                
                                <asp:Label runat="server" CssClass="row col-md-12 control-label">______</asp:Label>
                            </a>
                        </div>-->
                        <%} %>

                        <% if(lblOpciones.Text == "Paciente"){ %>   
                        <div class="list-group col-sm-4 col-md-3">
                            <a href="#" class="list-group-item list-group-item-image">
                                <asp:Label runat="server" CssClass="row col-md-12 control-label"><h4>Actualizar Datos Personales</h4></asp:Label>

                                <asp:Label runat="server" CssClass="row col-md-12 control-label">Realizar algún cambio en mi información personal</asp:Label>
                                
                                <asp:Label runat="server" CssClass="row col-md-12 control-label">______</asp:Label>
                            </a>
                        </div>

                        <div class="list-group col-sm-4 col-md-3">
                            <a href="#" class="list-group-item list-group-item-image">
                                <asp:Label runat="server" CssClass="row col-md-12 control-label"><h4>Consultar Respuestas</h4></asp:Label>

                                <asp:Label runat="server" CssClass="row col-md-12 control-label">Consultar mis preguntas y sus respuestas hechas por los médicos.</asp:Label>
                                
                                <asp:Label runat="server" CssClass="row col-md-12 control-label">______</asp:Label>
                            </a>
                        </div>
                        <%} %>

                        <% if(lblOpciones.Text == "Administrador"){ %>   
                        <div class="list-group col-sm-4 col-md-3">
                            <a href="#" class="list-group-item list-group-item-image">
                                <asp:Label runat="server" CssClass="row col-md-12 control-label"><h4>Aprobar Solicitudes de inscripción de Médicos</h4></asp:Label>

                                <asp:Label runat="server" CssClass="row col-md-12 control-label">Consultar y aprobar las solicitudes de los médicos que quieren formar parte del equipo ¡CuidateYa!.</asp:Label>
                                
                                <asp:Label runat="server" CssClass="row col-md-12 control-label">______</asp:Label>
                            </a>
                        </div>
                        <%} %>
                        
                    </div>
                </div>
            </div>
        </div>
    
    
    </div>
</asp:Content>

