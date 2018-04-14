<%@ Page Title="Consulta Médica" Language="C#" MasterPageFile="~/App/Site.master" AutoEventWireup="true" CodeFile="Consult.aspx.cs" Inherits="Consult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <h2><%: Title %>.</h2>
    <hr />

    <div class="form-inline">
        <div class="form-group">
            <asp:TextBox runat="server" ID="txtEnfermedad" placeholder="Dolor de cabeza, dolor de pecho..." CssClass="form-control" />
        </div>
        <asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-default" OnClick="btnBuscar_Click"  />
    </div>

    <!--<div class="disease-profile">
        <div class="row">
            <div class="col-lg-12">
                <div class="disease-profile-content">
                    <div class="content-description">
                        <h4>Usted podría estar pareciendo de alguna de estas enfermedades. Seleccione para ver más detalle</h4>
                        <hr />

                        <asp:DataList ID="DataListEnfermedades" runat="server" RepeatColumns="3" CellPadding="4" ForeColor="#333333" RepeatDirection="Horizontal" Width="100%">
                            <AlternatingItemStyle BackColor="White" />
                            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemStyle BackColor="#EFF3FB" />
                            <ItemTemplate>
                                <table style="width:100%;">
                                    <tr>
                                        <td rowspan="2" style="width: 10%">
                                            <a href='ConsultDetail.aspx?enfermedadID=<%# Eval("id_cont") %>'>
                                                <asp:Image ID="Image1" runat="server" Height="80px" ImageUrl='<%# Eval("id_cont", "~/App/Images/Avatar/{0}.jpg") %>' Width="80px" />
                                            </a>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblTitulo" runat="server" Text='<%# Eval("titulo_cont") %>'></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblMedico" runat="server" Text='<%# Eval("medico") %> '></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                    </div>
                </div>
            </div>
        </div>
    </div>-->

    <br/>
    <div class="disease-profile">
        <div class="row">
            <div class="col-lg-12">
                <div class="disease-profile-content">
                    <div class="content-description">
                        <h4>Usted podría estar pareciendo de alguna de estas enfermedades. Seleccione para ver más detalle</h4>
                        <hr />

                        <asp:Repeater ID="RepeaterEnfermedades" runat="server">
                            <ItemTemplate>
                                <div class="list-group col-sm-4 col-md-3">
                                    <a href="ConsultDetail.aspx?enfermedadID=<%# DataBinder.Eval(Container.DataItem, "id_cont") %>" class="list-group-item list-group-item-image">
                                        <img src="../Images/especialidad.png" style="width:30px" />
                                        <%# DataBinder.Eval(Container.DataItem, "titulo_cont") %>
                                        <br />
                                        <%# DataBinder.Eval(Container.DataItem, "medico") %>
                                    </a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

