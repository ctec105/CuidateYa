<%@ Page Title="Iniciar Sesión" Language="C#" MasterPageFile="~/App/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="App_Account_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2><%: Title %>.</h2>
    <hr />

    <div class="disease-profile">
        <div class="row">
            <div class="col-lg-12">
                <div class="disease-profile-content">
                    <div class="content-description">
                        <h4>Ingrese su Usuario y Contraseña</h4>
                        <hr />

                        <div class="form-group">
                            <!--<asp:ValidationSummary ID="VSLogin" runat="server" CssClass="text-danger" HeaderText="Por favor ingrese los campos obligatorios (*) faltantes: " ValidationGroup="loginValidationGroup" />-->
                            <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
                        </div>

                        <div class="form-horizontal">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Usuario</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Dirección de correo electrónico"/>
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ErrorMessage="El campo Usuario es obligatorio." ControlToValidate="txtEmail" CssClass="text-danger" ValidationGroup="loginValidationGroup" ></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator id="REVEmail" runat="server" ErrorMessage="Ingresa un correo valido" 
                                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" CssClass="text-danger" ValidationGroup="loginValidationGroup"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtContraseña" CssClass="col-md-2 control-label">Contraseña</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtContraseña" CssClass="form-control" TextMode="Password" placeholder="Contraseña" />
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVContraseña" runat="server" ErrorMessage="El campo Contraseña es obligatorio." ControlToValidate="txtContraseña" CssClass="text-danger" ValidationGroup="loginValidationGroup"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <div class="checkbox">
                                        <label>
                                            <asp:CheckBox runat="server" ID="chkRecordar" />
                                            Recordar Usuario
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-1">
                                    <asp:Button runat="server" ID="btnIngresar" Text="Ingresar" CssClass="btn btn-default" OnClick="btnIngresar_Click" ValidationGroup="loginValidationGroup" />
                                </div>
                                <span id="helpBlock" class="help-block col-md-2"><a>Recuperar Contraseña</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

