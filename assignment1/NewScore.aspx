<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewScore.aspx.cs" Inherits="assignment1.NewScore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%:Title %>
    <h2>New Score</h2>
    <p>Referee: <asp:DropDownList ID="refereeDropDownList" runat="server" AutoPostBack="true" DataSourceID="refereeSqlDataSource" DataTextField="full_name" DataValueField="referee_id"></asp:DropDownList>
        <asp:SqlDataSource ID="refereeSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HASCConnectionString %>" SelectCommand="SELECT [referee_id], CONCAT([first_name], ' ', [last_name]) AS full_name FROM [referees] ORDER BY [full_name]"></asp:SqlDataSource>
    </p>
    <asp:GridView ID="scoreGridView" runat="server" AutoGenerateColumns="false" CssClass="table-condensed" DataKeyNames="game_id" DataSourceID="scoreSqlDataSource" EmptyDataText="There are no data to display" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="game_id" HeaderText="ID" ReadOnly="True" SortExpression="game_id" />
            <asp:BoundField DataField="game_date" HeaderText="Date" SortExpression="game_date" DataFormatString="{0:yyyy-MM-dd}" ReadOnly="True" />
            <asp:BoundField DataField="field" HeaderText="Field" SortExpression="field" ReadOnly="True" />
            <asp:BoundField DataField="home_team_id" HeaderText="Home Team ID" SortExpression="home_team_id" ReadOnly="True" />
            <asp:BoundField DataField="home_team_score" HeaderText="Score" SortExpression="home_team_score" />
            <asp:BoundField DataField="away_team_id" HeaderText="Away Team ID" SortExpression="away_team_id" ReadOnly="True" />
            <asp:BoundField DataField="away_team_score" HeaderText="Score" SortExpression="away_team_score" />
            <asp:BoundField DataField="game_notes" HeaderText="Game Notes" SortExpression="game_notes" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

    <asp:SqlDataSource ID="scoreSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HASCConnectionString %>" SelectCommand="SELECT [game_id], [game_date], [field], [home_team_id], [home_team_score], [away_team_id], [away_team_score], [referee_id], [game_notes] FROM [games] WHERE ([referee_id] = @referee_id) AND [away_team_score] IS NULL AND [home_team_score] IS NULL" UpdateCommand="UPDATE [games] SET [home_team_score] = @home_team_score, [away_team_score] = @away_team_score, [game_notes] = @game_notes WHERE [game_id] = @game_id">
        <SelectParameters>
            <asp:ControlParameter ControlID="refereeDropDownList" Name="referee_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="home_team_score" Type="Int32" />
            <asp:Parameter Name="away_team_score" Type="Int32" />
            <asp:Parameter Name="game_notes" Type="String" />
            <asp:Parameter Name="game_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
