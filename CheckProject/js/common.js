var isDirty;
isDirty = 0;

var HELPIMAGE_ROUTINGNUMBER = 1;
var HELPIMAGE_ACCOUNTNUMBER = 2;
var HELPIMAGE_FRACTION = 3;

var helpImageEnum =
{
    HELPIMAGE_ROUTINGNUMBER : 1,
    HELPIMAGE_ACCOUNTNUMBER : 2,
    HELPIMAGE_FRACTION : 3
}

function confirmCancel() {
    var msg = "Are you sure you want to leave this page without saving changes?";
    if (isDirty) {
        return confirm(msg);
    }
    else {
        return true;
    }
}

function confirmViewOrder() {
    var msg = "Viewing your order now will not save this item.\n\r\n\r";
    msg += "Are you sure you want to leave this page?";
    return confirm(msg);
}

function confirmProof() {
    var msg = "This image is a proof of your order\n\r\n\r";
    msg += "Please verify all information\n\r\n\r";
    msg += "Are you sure the information is correct?";
    return confirm(msg);
}

function confirmDelete() {
    var msg = "Are you sure you want to delete this item?";
    return confirm(msg);
}

function setDirty() {
    //alert("Setting dirty");
   	isDirty = 1;
}

function clearDirty() {
    //alert("Clearing dirty");
    isDirty = 0;
}

function checkSave() {
    //alert("Checking is dirty");
    var msg = "You have some changes that have not been saved. Click OK to continue without saving or CANCEL to remain on this page.";
    if (isDirty) {
        if (isDirty == 1) {
            return window.confirm(msg);
        }
    }
}

function checkLimit(control, fieldName) {
    var ctl = document.getElementById(fieldName);
    if (ctl) {
        var maxLen = parseFloat(ctl.getAttribute('maxlength'));
        ctl.innerHTML = '(' + (maxLen - control.value.length).toString() + ' char)';
    }
}

function showHelpImage(lngHelpImage) {
    var url = "../helpimage.aspx?HelpImage=" + lngHelpImage;
    window.open(url, '', 'toolbar=no,menubar=no,height=400px,width=700px');   
}