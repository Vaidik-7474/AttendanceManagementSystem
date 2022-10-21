<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="OnlineAttendanceManagementSystem.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 35%;
            height: 70px;
            background-color: #CCFFFF;
        }
        .auto-style2 {
            width: 200px;
        }
        .auto-style3 {
            width: 500px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
    <div class="container" style="margin-top:20px;margin-bottom:20px">
        <div class="row" style="border:2px solid blue; background-color:aqua;">
           <!-- <div class="row align-items-center justify-content-center"> -->
                <form id="form1" runat="server" >
                    <div>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Attendance Portal"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="Label2" runat="server" Text="Online Attendance Marking System" ForeColor="Black"></asp:Label>
                        <br />
                        <br />
                        <table border="1" class="auto-style1">
                            <tr>
                                <td class="auto-style2" style="text-align: center;">Select Class</td>
                                <td class="auto-style3" style="text-align: center;">
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="class" DataValueField="class" Width="250px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            </table>
                    </div>
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" BackColor="Silver" Height="40px" Text="Mark Attendance For Selected Class" Width="300px" OnClick="Button1_Click" BorderColor="Black" BorderStyle="Groove" />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" Height="200px" Width="600px" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="rollno" HeaderText="Roll Number" SortExpression="rollno">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="studentname" HeaderText="Student Name" SortExpression="studentname">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Mark Attendance">
                            <ItemTemplate>
                                <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" Text="Present" GroupName="g1" />
                                &nbsp;&nbsp;
                                <asp:RadioButton ID="RadioButton2" runat="server" Text="Absent" GroupName="g1" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <br />
                    <asp:Button ID="Button2" runat="server" BackColor="Silver" Text="Save Attendance" OnClick="Button2_Click" Height="40px" Width="220px" BorderStyle="Groove" />
                    <br />
                    <br />
                    <asp:Label ID="Label4" runat="server" ForeColor="Blue"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="Button3" runat="server" BackColor="Silver" ForeColor="Black" Height="40px" OnClick="Button3_Click" Text="Show Attendance Report" Width="220px" BorderStyle="Groove" />
                    <br />
                    <br />
                    <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" Height="199px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="600px">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AttendanceConnectionString %>" SelectCommand="SELECT DISTINCT [class] FROM [StudentDetail]"></asp:SqlDataSource>
                    <br />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AttendanceConnectionString %>" SelectCommand="SELECT [rollno], [studentname] FROM [StudentDetail] WHERE ([class] = @class)" ProviderName="<%$ ConnectionStrings:AttendanceConnectionString.ProviderName %>">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="class" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </form>
            <!-- </div> -->
        </div>
    </div>
</body>
</html>

