﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddNewCenters.aspx.cs" Inherits="AddNewCenters" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>..:: Car Sales System ::..</title>
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" language="javascript" src="js/jquery-1.7.min.js"></script>

    <script type="text/javascript" src="js/emulatetab.joelpurra.js"></script>

    <script type="text/javascript" src="js/plusastab.joelpurra.js"></script>

    <script type='text/javascript' language="javascript" src='js/jquery.alphanumeric.pack.js'></script>

    <script type="text/javascript" language="javascript">window.history.forward(1);</script>

    <script src="js/jquery.formatCurrency-1.4.0.js" type="text/javascript"></script>

    <script type="text/javascript">
    
    
    function poptastic(url)
    {
    newwindow=window.open(url,'name','directories=no,titlebar=no,toolbar=no,location=no,status=no,menubar=no,height=420,width=300');
    if (window.focus) {newwindow.focus()}
    }
 function pageLoad()
   {    
      //InitializeTimer();      
   }
   
    var ssTime,TimerID;
   function  InitializeTimer()
   {  
     WebService.sessionGet(onsuccessGet,onError);      
   }
     function onsuccessGet(result)
     {
      ssTime=result; 
      ssTime=parseInt(ssTime)*60000;
     
      TimerDec(ssTime);
     }
   
  
   
   function  TimerDec(ssTime)
   {
   
     ssTime=ssTime-1000;
   
    TimerID=setTimeout(function(){TimerDec(ssTime);},1000);
      
    if(ssTime==60000)
    {      
     SessionInc();     
    }
     
   }
  
    
    function SessionInc()//Increase the session time
    {
     debugger    
      ssTime=parseInt("<%= Session.Timeout %>");     
      WebService.sessionSet(ssTime,onsuccessInc,onError);//call webservice to set the session variable
       ssTime=(parseInt(ssTime)-2)*60000;       
       TimerDec(ssTime);     
    }
    
    function onsuccessInc(result)
    {
     
    }    

     function onError(exception, userContext, methodName)
     {
       try 
       {
        //window.location.href='error.aspx';
        strMessage = strMessage + 'ErrorType: ' + exception._exceptionType + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
        strMessage = strMessage + 'Message: ' + exception._message + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
        strMessage = strMessage + 'Stack Trace: ' + exception._stackTrace + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
        strMessage = strMessage + 'Status Code: ' + exception._statusCode + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
        strMessage = strMessage + 'Timed Out: ' + exception._timedOut;
        ///alert(strMessage);
      } catch (ex) {}
     return false;
   }



    </script>

    <script type='text/javascript'>
	$(function() {
		$('.number').numeric();
	});
	
	
	   function ShowAddAgent() {
            

            
            document.getElementById('<%= txtFName.ClientID%>').value = "";
            document.getElementById('<%= txtCenterCode.ClientID%>').value = "";
            $find('<%= mpeAddNew.ClientID%>').show();
            return false;
        }
	
    </script>

    <script type="text/javascript" language="javascript">

    
    
        function ValidateUpdate() {
        
            var valid = true;
            if (document.getElementById('<%=txtUpFName.ClientID%>').value.trim().length < 1) {
                document.getElementById('<%=txtUpFName.ClientID%>').focus();
                alert("Enter center name");
                valid = false;
                return valid;
            }
            var grid = document.getElementById("chkbxlistupdateCenterRoles");  //Retrieve the grid   
            var inputs = grid.getElementsByTagName("input"); //Retrieve all the input elements from the grid
             var isValid = false;
            for (var i=0; i < inputs.length; i += 1) { //Iterate over every input element retrieved
            if (inputs[i].type === "checkbox") { //If the current element's type is checkbox, then it is wat we need
            if(inputs[i].checked === true) { //If the current checkbox is true, then atleast one checkbox is ticked, so break the loop
                isValid = true;                
                        break;
            }
            }
            }
             if(!isValid) {
            alert('Please select atleast one role');
             valid = false;
             return valid; 
            }
                if (valid == true) {
                document.getElementById("<%= btnUpdate.ClientID %>").value = 'Please Wait';
                }
            
            return valid;
             
 
            }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

       
        
         function ShowPW() {
            


          
            document.getElementById('<%= txtNewPW.ClientID%>').value = "";
            document.getElementById('<%= txtConfirmPW.ClientID%>').value = "";        
         
        

            $find('<%= mpeChangePW.ClientID%>').show();
            $find('<%= MPEUpdate.ClientID%>').hide();
            
            return false;
        }
        
        function ClearAddData() {
            


            document.getElementById('<%= txtFName.ClientID%>').value = "";
            document.getElementById('<%= txtCenterCode.ClientID%>').value = "";

            $find('<%= mpeAddNew.ClientID%>').hide();
            return false;
        }
        function ValidateAdd() {        
        debugger;
            var valid = true;
            if (document.getElementById('<%=txtFName.ClientID%>').value.trim().length < 1) {
                document.getElementById('<%=txtFName.ClientID%>').focus();
                alert("Enter center name");
                valid = false;
                return valid;
            }
           
              else if (document.getElementById('<%=txtCenterCode.ClientID%>').value.trim().length < 1) {
                document.getElementById('<%=txtCenterCode.ClientID%>').focus();
                alert("Enter center code");
                valid = false;
                return valid;
            }
            var grid = document.getElementById("chbklstCenterRoles");  //Retrieve the grid   
            var inputs = grid.getElementsByTagName("input"); //Retrieve all the input elements from the grid
             var isValid = false;
            for (var i=0; i < inputs.length; i += 1) { //Iterate over every input element retrieved
            if (inputs[i].type === "checkbox") { //If the current element's type is checkbox, then it is wat we need
            if(inputs[i].checked === true) { //If the current checkbox is true, then atleast one checkbox is ticked, so break the loop
                isValid = true;                
                        break;
            }
            }
            }
             if(!isValid) {
            alert('Please select atleast one role');
             valid = false;
             return valid; 
            }
           
            if (valid == true) {
                document.getElementById("<%= btnAddCenter.ClientID %>").value = 'Please Wait';
                }
            return valid;                   
             
 
            }

       
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }
        function echeck(str) {
            var at = "@"
            var dot = "."
            var lat = str.indexOf(at)
            var lstr = str.length
            var ldot = str.indexOf(dot)
            if (str.indexOf(at) == -1) {
                alert("Enter valid Email-ID")
                return false
            }

            if (str.indexOf(at) == -1 || str.indexOf(at) == 0 || str.indexOf(at) == lstr) {
                alert("Enter valid Email-ID")
                return false
            }

            if (str.indexOf(dot) == -1 || str.indexOf(dot) == 0 || str.indexOf(dot) == lstr) {
                alert("Enter valid Email-ID")
                return false
            }

            if (str.indexOf(at, (lat + 1)) != -1) {
                alert("Enter valid Email-ID")
                return false
            }

            if (str.substring(lat - 1, lat) == dot || str.substring(lat + 1, lat + 2) == dot) {
                alert("Enter valid Email-ID")
                return false
            }

            if (str.indexOf(dot, (lat + 2)) == -1) {
                alert("Enter valid Email-ID")
                return false
            }

            if (str.indexOf(" ") != -1) {
                alert("Enter valid Email-ID")
                return false
            }

            return true
        }


        function ValidateChangePW()
        {
        debugger
            var valid=true;
     
           if (document.getElementById('<%=txtNewPW.ClientID%>').value.trim().length < 1) {
                document.getElementById('<%=txtNewPW.ClientID%>').focus();
                alert("Enter password");
                valid = false;
            }
            else if (document.getElementById('<%=txtConfirmPW.ClientID%>').value.trim().length < 1) {
                document.getElementById('<%=txtConfirmPW.ClientID%>').focus();
                alert("Confirm password");
                valid = false;
            }
            else if (document.getElementById('<%=txtNewPW.ClientID%>').value.trim() != document.getElementById('<%=txtConfirmPW.ClientID%>').value.trim()) {
                document.getElementById('<%=txtConfirmPW.ClientID%>').focus();
                alert("Passwords entered did not match");
                valid = false;
            }
            return valid;
        }
    

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="SM" runat="server" EnablePageMethods="true">
        <Services>
            <asp:ServiceReference Path="~/WebService.asmx" />
        </Services>
    </asp:ScriptManager>
    <asp:UpdateProgress ID="Progress" runat="server" AssociatedUpdatePanelID="updtpnlMain"
        DisplayAfter="0">
        <ProgressTemplate>
            <div id="spinner">
                <h4>
                    <div>
                        Processing
                        <img src="images/loading.gif" />
                    </div>
                </h4>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <div class="headder">
        <table style="width: 100%">
            <td style="width: 280px;">
                <a>
                    <img src="images/logo2.png" /></a>
            </td>
            <td>
                <h1 style="border-bottom: none; padding-top: 5px;">
                    UNITED CAR EXCHANGE <span>Centers Management</span></h1>
            </td>
            <td style="width: 470px; padding-top: 10px;">
                <div class="loginStat">
                    Welcome &nbsp;<asp:Label ID="lblUserName" runat="server" Visible="false"></asp:Label>
                    <br />
                    <ul class="menu2">
                        <li><span style="font-size: 13px; font-weight: bold; cursor: pointer; color: #FFC50F">
                            Menu &nabla;</span>
                            <ul>
                                <li>
                                    <asp:LinkButton ID="lnkTicker" runat="server" Text="Sales Ticker"></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lnkbtnIPAddress" runat="server" Text="IP Address" PostBackUrl="~/IPAddress.aspx"></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lnkbtnQCReport" runat="server" Text="QC Report" PostBackUrl="~/QCReport.aspx"></asp:LinkButton>
                                </li>
                                <li>
                                <asp:LinkButton ID="lnkbtnBulkReport" runat="server" Text="Bulk Process" PostBackUrl="~/BulkProcess.aspx"></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lnkbtnAllCentersReport" runat="server" Text="Centers report"
                                        PostBackUrl="~/AllCentersReport.aspx"></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lnkbtnAllusersmgmnt" runat="server" Text="User Mgmt" PostBackUrl="~/AllUsersManagement.aspx"></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lnkbtnSalesreport" runat="server" Text="Sales Report" PostBackUrl="~/CarSalesReportNew.aspx"></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lnkbtnLeadsAssign" runat="server" Text="Leads Assign" PostBackUrl="~/LeadAssign.aspx"></asp:LinkButton>
                                </li>
                                <li>
                                    <asp:LinkButton ID="lnkbtnLeadsDownLoad" runat="server" Text="Leads Download" PostBackUrl="~/LeadDownLoad.aspx"></asp:LinkButton>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <asp:LinkButton ID="lnkBtnLogout" runat="server" Text="Logout" Visible="false" OnClick="lnkBtnLogout_Click"></asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </td>
        </table>
        <div class="clear">
            &nbsp;
        </div>
    </div>
    <div style="height: 10px;">
    </div>
    <div class="main">
        <asp:UpdatePanel ID="updtpnlMain" runat="server">
            <ContentTemplate>
                <table style="width: 720px;">
                    <tr>
                        <td style="vertical-align: top;">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="lblCenterCode" runat="server" Font-Bold="true"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="50%">
                                                <asp:Label ID="lblResHead" runat="server"></asp:Label>
                                            </td>
                                            <td style="text-align: right">
                                                <div align="right" style="width: 220px; text-align: right; float: right">
                                                    <asp:LinkButton ID="lnkAddUSer" runat="server" CssClass="pageAction" OnClick="lnkAddUSer_Click"
                                                        Text="Add Center"></asp:LinkButton>
                                                    <asp:HiddenField ID="hdnAddnew" runat="server" />
                                                    <cc1:ModalPopupExtender ID="mpeAddNew" runat="server" TargetControlID="hdnAddnew"
                                                        PopupControlID="tblAddNew" CancelControlID="btnCancelAdd" BackgroundCssClass="ModalPopupBG">
                                                    </cc1:ModalPopupExtender>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div style="width: 100%; position: relative; padding: 0 3px; height: 1px">
                                <asp:UpdatePanel ID="updtPnlHeaders" runat="server">
                                    <ContentTemplate>
                                        <table class="grid1 " cellpadding="0" cellspacing="0" style="position: absolute;
                                            top: 2px; width: 800px; background: #fff; border-top: #fff 2px solid;">
                                            <tr class="tbHed">
                                                <td width="130px" align="left">
                                                    <asp:LinkButton ID="lnkCenterCode" runat="server" Text="Center Code &#8659" OnClick="lnkCenterCode_Click"></asp:LinkButton>
                                                </td>
                                                <td width="180px" align="left">
                                                    <asp:LinkButton ID="lnkCenterName" runat="server" Text="Name &darr; &uarr;" OnClick="lnkCenterName_Click"></asp:LinkButton>
                                                </td>
                                                <td align="left">
                                                    Roles
                                                </td>
                                                <td width="100px" align="left">
                                                    <asp:LinkButton ID="lnkStatus" runat="server" Text="Status &darr; &uarr;" OnClick="lnkStatus_Click"></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div style="width: 820px; overflow-y: scroll; overflow-x: hidden; padding: 26px 3px 3px 3px;
                                border: #ccc 1px solid; height: 230px">
                                <asp:Panel ID="pnl1" Width="100%" runat="server">
                                    <asp:UpdatePanel ID="UpdPnlGrid" runat="server">
                                        <ContentTemplate>
                                            <input style="width: 91px" id="txthdnSortOrder" type="hidden" runat="server" enableviewstate="true" />
                                            <input style="width: 40px" id="txthdnSortColumnId" type="hidden" runat="server" enableviewstate="true" />
                                            <asp:GridView Width="800px" ID="grdUserDetails" runat="server" CellSpacing="0" CellPadding="0"
                                                CssClass="grid1" AutoGenerateColumns="False" GridLines="None" ShowHeader="false"
                                                OnRowCommand="grdUsers_RowCommand" OnRowDataBound="grdUsers_RowDataBound">
                                                <PagerStyle HorizontalAlign="Right" BackColor="#C6C3C6" ForeColor="Black" />
                                                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                                                <HeaderStyle CssClass="headder" />
                                                <PagerSettings Position="Top" />
                                                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                                                <RowStyle CssClass="row1" />
                                                <AlternatingRowStyle CssClass="row2" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lnkCenterCode" runat="server" Text='<%# Eval("AgentCenterCode")%>'
                                                                CommandArgument='<%# Eval("AgentCenterID")%>' CommandName="view"></asp:LinkButton>
                                                            <asp:HiddenField ID="hdnCenterID" runat="server" Value='<%# Eval("AgentCenterID")%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="130px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("AgentCenterName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="180px" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblUserType" runat="server"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("status_name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Left" Width="100px" />
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="grdUserDetails" EventName="Sorting" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </asp:Panel>
                            </div>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="tblAddNew" class="PopUpHolder" style="display: none;">
        <div class="main" style="width: 600px; margin: 60px auto 0 auto;">
            <h4>
                Add Center Details
                <!-- <div class="cls">
            </div> -->
            </h4>
            <div class="dat" style="padding: 15px 0; margin: 0 auto">
                <table id="Table1" runat="server" align="center" cellpadding="0" cellspacing="0"
                    style="width: 100%; margin: 0 auto; background-color: White">
                    <tr>
                        <td width="100%" colspan="2" align="center">
                            <asp:UpdatePanel ID="updtpnlAddCenter" runat="server">
                                <ContentTemplate>
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 98%; margin: 0 auto">
                                        <tr>
                                            <td style="width: 100px">
                                                Name<span class="star">*</span>
                                            </td>
                                            <td style="width: 200px">
                                                <asp:TextBox MaxLength="15" CssClass="input1" ID="txtFName" runat="server"></asp:TextBox>
                                            </td>
                                            <td style="width: 30px; padding: 0">
                                                &nbsp;
                                            </td>
                                            <td style="width: 150px;">
                                                Center Code<span class="star">*</span>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCenterCode" CssClass="input1" MaxLength="20" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <asp:UpdatePanel ID="UpdtpnlChkbxlst" runat="server">
                                <ContentTemplate>
                                    <table cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td colspan="3">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="padding-left: 5px;">
                                                            Center Roles<span class="star">*</span>
                                                        </td>
                                                        <td style="padding-left: 2px; padding: 0" class="innerTable">
                                                            <asp:CheckBoxList ID="chbklstCenterRoles" RepeatColumns="3" runat="server" RepeatDirection="Horizontal">
                                                            </asp:CheckBoxList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" style="padding-top: 15px;">
                            <div style="width: 220px; margin: 0 auto;">
                                <asp:Button ID="btnAddCenter" runat="server" CssClass="g-button g-button-submit"
                                    Text="Submit" OnClientClick="return ValidateAdd();" OnClick="btnAddCenter_Click" />
                                <asp:Button ID="btnCancelAdd" CssClass="g-button g-button-submit" runat="server"
                                    Text="Cancel" />
                            </div>
                        </td>
                    </tr>
                </table>
                <div class="clearFix">
                    &nbsp</div>
            </div>
        </div>
    </div>
    <div id="tblUpdate" class="PopUpHolder" style="display: none;">
        <div class="main" style="width: 600px; margin: 60px auto 0 auto;">
            <h4>
                Update Center Details
                <!-- <div class="cls">
            </div> -->
            </h4>
            <table id="Table2" runat="server" align="center" cellpadding="0" cellspacing="0"
                style="width: 100%; margin: 0 auto">
                <tr>
                    <td style="width: 100%;">
                        <asp:UpdatePanel ID="updPnlUser" runat="server">
                            <ContentTemplate>
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 98%; margin: 0 auto;">
                                    <tr>
                                        <td colspan="5">
                                            &nbsp;
                                            <asp:Label ID="lblUpdateAgentCenterCode" runat="server" Font-Bold="true"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 18%">
                                            &nbsp; Name<span class="star">*</span>
                                        </td>
                                        <td style="width: 28%">
                                            <asp:TextBox ID="txtUpFName" CssClass="input1" MaxLength="20" runat="server"></asp:TextBox>
                                        </td>
                                        <td style="width: 50px;">
                                            &nbsp;
                                        </td>
                                        <td>
                                            Center Status<span class="star">*</span>
                                        </td>
                                        <td valign="top">
                                            <asp:UpdatePanel runat="server" ID="updlDDL">
                                                <ContentTemplate>
                                                    <asp:DropDownList ID="ddlUpStatus" Width="101%" AutoPostBack="true" CssClass="input1"
                                                        runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlUpStatus_SelectedIndexChanged">
                                                        <asp:ListItem Value="1">Active</asp:ListItem>
                                                        <asp:ListItem Value="0">Inactive</asp:ListItem>
                                                    </asp:DropDownList>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <%--<tr style="height: 10px;">
                                        <td colspan="5">
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td>
                                            &nbsp; Center Roles<span class="star">*</span>
                                        </td>
                                        <td colspan="5">
                                            <asp:CheckBoxList ID="chkbxlistupdateCenterRoles" RepeatColumns="3" runat="server"
                                                RepeatDirection="Horizontal">
                                            </asp:CheckBoxList>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <table style="width: 100%;">
                            <tr align="center">
                                <td colspan="4" style="padding-top: 15px;">
                                    <div style="width: 240px; margin: 0 auto;">
                                        <asp:Button ID="btnUpdate" OnClientClick="return ValidateUpdate();" runat="server"
                                            Text="Update" CssClass="g-button g-button-submit" OnClick="btnUpdate_Click" />&nbsp;&nbsp;
                                        <asp:Button ID="btnCancelUpdate" CssClass="g-button g-button-submit" runat="server"
                                            Text="Cancel" />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <div class="clearFix">
                &nbsp</div>
        </div>
    </div>
    <asp:HiddenField ID="btnOpen" runat="server" />
    <cc1:ModalPopupExtender ID="MPEUpdate" runat="server" PopupControlID="tblUpdate"
        BackgroundCssClass="ModalPopupBG" TargetControlID="btnOpen" CancelControlID="btnCancelUpdate">
    </cc1:ModalPopupExtender>
    <cc1:ModalPopupExtender ID="mpealteruser" runat="server" PopupControlID="AlertUser"
        BackgroundCssClass="ModalPopupBG" TargetControlID="hdnAlertuser" CancelControlID="btnclose"
        OkControlID="btnGo">
    </cc1:ModalPopupExtender>
    <asp:HiddenField ID="hdnAlertuser" runat="server" />
    <div id="AlertUser" class="alert" style="display: none;">
        <h4 id="alertHead">
            Alert
            <asp:Button ID="btnclose" CssClass="cls" runat="server" BorderWidth="0" />
        </h4>
        <div class="data">
            <p>
                <asp:UpdatePanel ID="updpnlMsgUser1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblErr" runat="server" Visible="false"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </p>
            <asp:Button ID="btnGo" CssClass="btn" runat="server" Text="Ok" />
            <div class="clearFix">
            </div>
        </div>
        <div class="clearFix">
        </div>
    </div>
    <cc1:ModalPopupExtender ID="mpelblUerExist" runat="server" PopupControlID="divUerExist"
        BackgroundCssClass="ModalPopupBG" TargetControlID="hdnlblUerExist">
    </cc1:ModalPopupExtender>
    <asp:HiddenField ID="hdnlblUerExist" runat="server" />
    <div id="divUerExist" class="alert" style="display: none;">
        <h4 id="alertHead">
            Alert
            <asp:Button class="cls" ID="btnCancel" runat="server" BorderWidth="0" OnClick="btnlblUerExist_Click" />
        </h4>
        <div class="data">
            <p>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblUerExist" runat="server" Visible="false"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </p>
            <asp:Button class="btn" ID="btnlblUerExist" runat="server" Text="Ok" OnClick="btnlblUerExist_Click" />
            <div class="clearFix">
            </div>
        </div>
        <div class="clearFix">
        </div>
    </div>
    <cc1:ModalPopupExtender ID="mpeChangePW" runat="server" PopupControlID="tblChangePW"
        BackgroundCssClass="ModalPopupBG" TargetControlID="hdnChangePW">
    </cc1:ModalPopupExtender>
    <asp:HiddenField ID="hdnChangePW" runat="server" />
    <div id="tblChangePW" class="PopUpHolder" style="display: none;">
        <div class="main" style="width: 25%; margin: 60px auto 0 auto;">
            <h4>
                Change Password
                <!-- <div class="cls">
            </div> -->
            </h4>
            <table width="100%" align="center" style="background-color: #ffffff;">
                <tr>
                    <td style="padding-left: 5px;">
                        <br />
                        <asp:UpdatePanel ID="uplPW" runat="server">
                            <ContentTemplate>
                                <span style="font-weight: bold">User Name: </span>
                                <asp:Label ID="lblUnamePW" runat="server"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;">
                        New Password<span class="star">*</span>
                    </td>
                    <td style="padding-right: 5px;">
                        <asp:TextBox ID="txtNewPW" TextMode="Password" MaxLength="10" CssClass="input1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 5px;">
                        Confirm New Password<span class="star">*</span>
                    </td>
                    <td style="padding-right: 5px;">
                        <asp:TextBox ID="txtConfirmPW" MaxLength="10" TextMode="Password" CssClass="input1"
                            runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="center" style="padding-bottom: 20px;">
                        <div style="width: 40px; margin: 0 auto">
                            <asp:Button ID="btnChangePW" CssClass="g-button g-button-submit" runat="server" Text="Change"
                                OnClientClick="return ValidateChangePW();" /></div>
                    </td>
                    <td align="left" style="padding-bottom: 20px;">
                        <asp:Button ID="btnCancelPW" CssClass="g-button g-button-submit" runat="server" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
