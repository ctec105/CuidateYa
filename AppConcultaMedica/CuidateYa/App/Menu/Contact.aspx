<%@ Page Title="Contacto" Language="C#" MasterPageFile="~/App/Site.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h2><%: Title %>.</h2>
    <hr />

    <div class="disease-profile">
        <div class="row">
            <div class="col-lg-12">
                <div class="disease-profile-content">
                    <div class="content-description">
                        <h4>¿Eres médico y te gustaria formar parte de nuestro equipo? Envianos su CV</h4>
                        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger" Visible="False"></asp:Label>
                        <hr />

                        <!--<asp:ValidationSummary runat="server" HeaderText="Por favor ingrese los campos obligatorios (*) faltantes:" CssClass="text-danger" />-->

                        <div class="form-horizontal">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtNombre" CssClass="col-md-2 control-label">Nombre</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVNombre" runat="server" ErrorMessage="El campo Nombre es obligatorio." ControlToValidate="txtNombre" CssClass="text-danger"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtApellido" CssClass="col-md-2 control-label">Apellido</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtApellido" CssClass="form-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVApellido" runat="server" ErrorMessage="El campo Apellido es obligatorio." ControlToValidate="txtApellido" CssClass="text-danger"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="cboNacionalidad" CssClass="col-md-2 control-label">Nacionalidad</asp:Label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="cboNacionalidad" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RdVNacionalidad" runat="server" ErrorMessage="Seleccione una Nacionalidad." ControlToValidate="cboNacionalidad" CssClass="text-danger" InitialValue="0"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ErrorMessage="El campo Email es obligatorio." ControlToValidate="txtEmail" CssClass="text-danger"/>
                                    <asp:RegularExpressionValidator id="REVEmail" runat="server" ErrorMessage="Ingresa un correo valido" 
                                        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" CssClass="text-danger" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtTelefono" CssClass="col-md-2 control-label">Telefono</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtTelefono" CssClass="form-control" />
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVTelefono" runat="server" ErrorMessage="El campo Telefono es obligatorio." ControlToValidate="txtTelefono" CssClass="text-danger"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="cboEspecialidad" CssClass="col-md-2 control-label">Especialidad</asp:Label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="cboEspecialidad" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVEspecialidad" runat="server" ErrorMessage="Seleccione una Especialidad." ControlToValidate="cboEspecialidad" CssClass="text-danger" InitialValue="0"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="cboPaisDeResidencia" CssClass="col-md-2 control-label">País de Residencia</asp:Label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="cboPaisDeResidencia" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVPaisDeResidencia" runat="server" ErrorMessage="Seleccione un país." ControlToValidate="cboPaisDeResidencia" CssClass="text-danger" InitialValue="0"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="txtComentario" CssClass="col-md-2 control-label">Comentario</asp:Label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtComentario" TextMode="multiline" Columns="50" Rows="5" CssClass="form-control" />
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="fileCurriculum" CssClass="col-md-2 control-label">Curriculum</asp:Label>
                                <div class="col-md-6">
                                    <asp:FileUpload ID="fileCurriculum" runat="server" />
                                    <p class="help-block">Solo pdf, docx o xls son permitidos.</p>
                                </div>                        
                                <div class="col-md-4">
                                    <asp:RequiredFieldValidator ID="RFVCurriculum" runat="server" ErrorMessage="Seleccione un archivo." ControlToValidate="fileCurriculum" CssClass="text-danger"/>
                                    <!--<asp:RegularExpressionValidator
                                        ID="REVCurriculum" runat="server"
                                        ErrorMessage="Solo pdf, docx o xls son permitidos."
                                        ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.pdf|.doc|xls)$"
                                        ControlToValidate="fileCurriculum" CssClass="text-danger" ValidationGroup="medicoInfoGroup"></asp:RegularExpressionValidator>-->
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-md-offset-2 col-md-10">
                                    <asp:Button runat="server"  ID="btnRegistrarse" Text="Registrarse" CssClass="btn btn-default" OnClick="btnRegistrarse_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

