<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recent.aspx.cs" Inherits="assignment1.Recent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>Recent Games</h3>

    <asp:GridView ID="recentGridView" runat="server" AutoGenerateColumns="false" DataKeyNames="game_id" DataSourceID="recentSqlDataSource" EmptyDataText="There is no data to show." BackColor="#cccccc" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="table-condensed" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="game_date" HeaderText="Date" SortExpression="game_date" DataFormatString="{0:yyyy-MM-dd}"/>
            <asp:BoundField DataField="team_name1" HeaderText="Away"/>
            <asp:BoundField DataField="away_team_score" HeaderText="Score" SortExpression="away_team_score">
                <ItemStyle HorizontalAlign="Center"/>
            </asp:BoundField>
            <asp:BoundField DataField="team_name" HeaderText="Home"/>
            <asp:BoundField DataField="home_team_score" HeaderText="Score" SortExpression="home_team_score">
                <ItemStyle HorizontalAlign="Center"/>
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC"/>
        <HeaderStyle BackColor="Black" Font-Bold="true" ForeColor="White"/>
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left"/>
        <RowStyle BackColor="White"/>
        <SelectedRowStyle BackColor="#000099" Font-Bold="true" ForeColor="White"/>
        <SortedAscendingCellStyle BackColor=#F1F1F1/>
        <SortedAscendingHeaderStyle BackColor="Gray"/>
        <SortedDescendingCellStyle BackColor="#CAC9C9"/>
        <SortedDescendingHeaderStyle BackColor="#383838"/>
    </asp:GridView>
    <asp:SqlDataSource ID="recentSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:HASCConnectionString %>" DeleteCommand="DELETE FROM [games] WHERE [game_id] = @game_id" InsertCommand="INSERT INTO [games] ([game_id], [game_date], [field], [home_team_id], [home_team_score], [away_team_id], [away_team_score], [referee_id], [game_notes]) VALUES (@game_id, @game_date, @field, @home_team_id, @home_team_score, @away_team_id, @away_team_score, @referee_id, @game_notes)" SelectCommand="SELECT TOP 10 [game_id], [game_date], [field], [home_team_id], [home_team_score], [away_team_id], [away_team_score], [referee_id], [game_notes], [a].[team_name], [b].[team_name] FROM [games] INNER JOIN [teams] [a] ON [games].[home_team_id]=[a].[team_id] INNER JOIN [teams] [b] ON [games].[away_team_id]=[b].[team_id] WHERE ([away_team_score] IS NOT NULL) ORDER BY [game_date] DESC
" UpdateCommand="UPDATE [games] SET [game_date] = @game_date, [field] = @field, [home_team_id] = @home_team_id, [home_team_score] = @home_team_score, [away_team_id] = @away_team_id, [away_team_score] = @away_team_score, [referee_id] = @referee_id, [game_notes] = @game_notes WHERE [game_id] = @game_id">
        <DeleteParameters>
            <asp:Parameter name="game_id" Type="Int32"/>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="game_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="game_date" />
            <asp:Parameter Name="field" Type="String" />
            <asp:Parameter Name="home_team_id" Type="Int32" />
            <asp:Parameter Name="home_team_score" Type="Int32" />
            <asp:Parameter Name="away_team_id" Type="Int32" />
            <asp:Parameter Name="away_team_score" Type="Int32" />
            <asp:Parameter Name="referee_id" Type="Int32" />
            <asp:Parameter Name="game_notes" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="game_date" />
            <asp:Parameter Name="field" Type="String" />
            <asp:Parameter Name="home_team_id" Type="Int32" />
            <asp:Parameter Name="home_team_score" Type="Int32" />
            <asp:Parameter Name="away_team_id" Type="Int32" />
            <asp:Parameter Name="away_team_score" Type="Int32" />
            <asp:Parameter Name="referee_id" Type="Int32" />
            <asp:Parameter Name="game_notes" Type="String" />
            <asp:Parameter Name="game_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
