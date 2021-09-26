<%@ Page Title="Divisions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Divisions.aspx.cs" Inherits="assignment1.Divisions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h3><%:Title %></h3>
    <h2>HASC Features the following divisions.</h2>

    <asp:GridView ID="divisionGridView" runat="server" AutoGenerateColumns="false" DataKeyNames="division_id" DataSourceID="divisionsSqlDataSource" EmptyDataText="There is no data to display." BackColor="#cccccc" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="table-condensed" ForeColor="Black">
       <Columns>
           <asp:BoundField DataField="division_name" HeaderText="Division" SortExpression="division_name"/>
       </Columns>
        <FooterStyle BackColor="#CCC"/>
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"/>
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left"/>
        <RowStyle BackColor="White"/>
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"/>
        <SortedAscendingCellStyle BackColor="#F1F1F1"/>
        <SortedAscendingHeaderStyle BackColor="#808080"/>
        <SortedDescendingCellStyle BackColor="#CAC9C9"/>
        <SortedDescendingHeaderStyle BackColor="#383838"/>
    </asp:GridView>
    <asp:SqlDataSource ID="divisionsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HASCConnectionString %>" DeleteCommand="DELETE FROM [division] WHERE [division_id] = @division_id" InsertCommand="INSERT INTO [divisions] ([division_id],[division_name],[teams_made]) VALUES (@division_id, @division_name, @teams_made)" ProviderName="<%$ ConnectionStrings:HASCConnectionString.ProviderName %>" SelectCommand="SELECT [division_id], [division_name], [teams_made] FROM [divisions]" UpdateCommand="UPDATE [divisions] SET [division_name] = @division_name, [teams_made] = @teams_made WHERE [division_id] = @division_id">
        <DeleteParameters>
            <asp:Parameter name="division_id" Type="Int32"/>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter name="division_id" Type="Int32"/>
            <asp:Parameter name="division_name" Type="String"/>
            <asp:Parameter name="teams_made" Type="Boolean"/>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter name="division_name" Type="String"/>
            <asp:Parameter name="teams_made" Type="Boolean"/>
            <asp:Parameter name="division_id" Type="Int32"/>
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <p>Age is determined as of March 1 of each year</p>
</asp:Content>
