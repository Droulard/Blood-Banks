function CheckInventoryTransForm()
{
	console.log("inventory transactions")
	var f = document.forms['InventoryTransForm'].elements;
	var cansubmit = true;
	
	for (var i = 0; i < f.length; i++) {
		if (f[i].value.length == 0) { 
			cansubmit = false;
			break;
		}
	}
	
	document.getElementById('InventoryTransSubmitButton').disabled = !cansubmit;
}

function CheckRequestForm()
{
	console.log("request")
	var f = document.forms['RequestForm'].elements;
	var cansubmit = true;
	
	for (var i = 0; i < f.length; i++) {
		if (f[i].value.length == 0) { 
			cansubmit = false;
			break;
		}
	}
	
	document.getElementById('RequestSubmitButton').disabled = !cansubmit;
}

function CheckDonationForm()
{
	console.log("donation")
	var f = document.forms['DonationForm'].elements;
	var cansubmit = true;
	
	for (var i = 0; i < f.length; i++) {
		if (f[i].value.length == 0) cansubmit = false;
	}
	
	document.getElementById('DonationSubmitButton').disabled = !cansubmit;
}

