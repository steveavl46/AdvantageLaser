<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="artuploader.aspx.cs" Inherits="CheckProject.artworkupload.artuploader" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../styles/checkproject.css" type="text/css">
        <script language="javascript" type="text/javascript">
        function hookFileClick() {
            // Initiate the File Upload Click Event
            document.getElementById('FileUploadControl').click();
        }
        
        function fnOnChange(obj)
        {
            document.getElementById("txtUploadFile").value = obj.value;
        }
        function uploadClicked() {
            var ctl = document.getElementById("lblUploadStatus");
            ctl.innerHTML = "Upload Status: Uploading...";
            ctl.classList.add('uploadInProcess');
        }
    </script>
    <style>
        .uploadButton
        {
            border-radius: 4px;
            background-color: #ff9900;
            color: white;
            height:30px;
            border: none;
        }
        .uploadHide{
            display:none;
        }
        .uploadSuccess{
            font-weight:bold;
            color:green;
        }
        .uploadError{
            font-weight:bold;
            color:red;
        }
        .uploadInProcess
        {
            font-weight:bold;
            color:#ff9900;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table width="100%">
        <tr>
            <td>
                <div class="holderdiv" style="margin: 0 auto;">
                    
                    <!--<b class="b1"></b><b class="b2"></b><b class="b3"></b><b class="b4"></b> -->
                    <div class="contentb2">
                        <a href="http://www.advlaser.com">
                        <img src="../images/uploadheader.png" width="720px" /> 
                        </a>
                        <div style="padding-left:10px;">
                            <div><h3>Upload Artwork</h3></div>    
                    
                                    <div>
            
                                    <input type="button" runat="server" id="btnUpload" value="Choose File" onclick="hookFileClick()"  />
                                    <input type="text" runat="server" id="txtUploadFile" disabled="disabled" size="50" />
                                    <asp:Button runat="server" CssClass="uploadButton" ID="btnUploadFileToServer" Text="Upload" OnClick="UploadButton_Click" OnClientClick="uploadClicked();return true;" />
                                    <asp:FileUpload runat="server" ID="FileUploadControl" Style="visibility: hidden;" onchange="fnOnChange(this);"  />

                                        <br />
                                        <asp:Label  runat="server" id="lblUploadStatus" />
                                </div>
                            <div style="padding-top:10px">
                                <div>Order#, Customer ID, or Company Name (required)</div>
                                <div>
                                    <asp:TextBox runat="server" ID="txtCustomerID" Columns="50" />
                                    <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator6"  runat="server" ControlToValidate="txtCustomerID" ErrorMessage="Order number is required" Display="None" />
                                </div>
                                <div style="padding-top:10px">Your Email (required)</div>
                                <div>
                                    <asp:TextBox runat="server" ID="txtEmail" Columns="50" />
                                    <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator1"  runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" Display="None" />
                                </div>
                                <div style="padding-top:10px">Confirm Email (required)</div>
                                <div>
                                    <asp:TextBox runat="server" ID="txtConfirmEmail" Columns="50" />
                                    <asp:RequiredFieldValidator EnableClientScript="false" ID="RequiredFieldValidator2"  runat="server" ControlToValidate="txtConfirmEmail" ErrorMessage="Confirmation email is required" Display="None" />
                                    <asp:CompareValidator EnableClientScript="false" ID="CompareValidator1" runat="server" ControlToCompare="txtEmail" ControlToValidate="txtConfirmEmail" Display="None" ErrorMessage="Please verify email address" Operator="Equal" Type="String" />
                                </div>

                                
                                <div style="padding-top:10px;font-size:small">
                                    File Formats: PDF, GIF, JPG, AI, PSD, TIF, BMP, PCX, PS, DOC, DOCX
                                    <br />
                                    Make sure your image is at least 300 dpi and all images and fonts are imbedded.
                                </div>
                                <div>
                                    <asp:Label runat="server" Visible="false"  ID="lblErrorMessage" />
                                    <asp:ValidationSummary runat="server" DisplayMode="List" />
                                </div>
                            </div>
                        </div>
                        <!--<b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b>-->
                    </div>   
                    <div><b class="b4"></b><b class="b3"></b><b class="b2"></b><b class="b1"></b></div>             
                </div>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
