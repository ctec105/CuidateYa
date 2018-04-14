<%@ Page Title="Registro de Usuario" Language="C#" MasterPageFile="~/App/Site.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="App_Account_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h2><%: Title %>.</h2>
    <hr />

    <div class="disease-profile">
        <div class="row">
            <div class="col-lg-12">
                <div class="disease-profile-content">
                    <div class="content-description">
                        <h4>Registrate para consultar a los médicos el problema que tienes</h4>
                        <hr />

                        <asp:ValidationSummary runat="server" CssClass="text-danger" HeaderText="Por favor ingrese los campos obligatorios (*) faltantes:" ValidationGroup="registerValidationGroup" />

                        <div class="form-horizontal">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Correo Electrónico"/>
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ErrorMessage="El campo Email es obligatorio." ControlToValidate="txtEmail" CssClass="text-danger" ValidationGroup="registerValidationGroup" />
                                    <asp:RegularExpressionValidator id="REVEmail" runat="server" ErrorMessage="Ingresa un correo valido" 
                                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" CssClass="text-danger" ValidationGroup="registerValidationGroup" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtContraseña" CssClass="col-md-2 control-label">Contraseña</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtContraseña" CssClass="form-control" TextMode="Password" placeholder="Contraseña (6-20 caracteres)" ValidationGroup="registerValidationGroup" />
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVContraseña" runat="server" ErrorMessage="El campo Contraseña es obligatorio." ControlToValidate="txtContraseña" CssClass="text-danger" ValidationGroup="registerValidationGroup"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtConfirmarContraseña" CssClass="col-md-2 control-label">Confirmar Contraseña</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtConfirmarContraseña" CssClass="form-control" TextMode="Password" placeholder="Confirmar Contraseña" />
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVConfirmarContraseña" runat="server" ErrorMessage="El campo Confirmar Contraseña es obligatorio." ControlToValidate="txtConfirmarContraseña" CssClass="text-danger" ValidationGroup="registerValidationGroup"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtNombre" CssClass="col-md-2 control-label">Nombre</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVNombre" runat="server" ErrorMessage="El campo nombre es obligatorio." ControlToValidate="txtNombre" CssClass="text-danger" ValidationGroup="registerValidationGroup" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtApellido" CssClass="col-md-2 control-label">Apellido</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVApellido" runat="server" ErrorMessage="El campo Apellido es obligatorio." ControlToValidate="txtApellido" CssClass="text-danger" ValidationGroup="registerValidationGroup" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtTelefono" CssClass="col-md-2 control-label">Telefono</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVTelefono" runat="server" ErrorMessage="El campo Telefono es obligatorio." ControlToValidate="txtTelefono" CssClass="text-danger" ValidationGroup="registerValidationGroup" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="RBSexo" CssClass="col-md-2 control-label">Sexo</asp:Label>
                                <div class="col-md-6">
                                    <asp:RadioButtonList ID="RBSexo" runat="server" CssClass="radio">
                                        <asp:ListItem>Masculino</asp:ListItem>
                                        <asp:ListItem>Femenino</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVSexo" runat="server" ErrorMessage="Seleccione genero." ControlToValidate="RBSexo" CssClass="text-danger" ValidationGroup="registerValidationGroup" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="cboNacionalidad" CssClass="col-md-2 control-label">Nacionalidad</asp:Label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="cboNacionalidad" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RdVNacionalidad" runat="server" ErrorMessage="Seleccione una Nacionalidad." ControlToValidate="cboNacionalidad" CssClass="text-danger" InitialValue="0" ValidationGroup="registerValidationGroup" />
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server"  ID="btnRegistrarse" Text="Registrarse" CssClass="btn btn-default" OnClick="btnRegistrarse_Click" ValidationGroup="registerValidationGroup" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

