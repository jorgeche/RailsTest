var setupModule = function (module) {  
   module.controller = mozmill.getBrowserController();  
}  
  
var setupTest = function(test) {  
  // Open a tab for wikipedia  
  // controller.window.alert('setupTest');  
  controller.click(new elementslib.Elem(controller.menus.File['menu_newNavigatorTab']));  
  controller.open('http://localhost:3001/user');  
}  
  
var teardownTest = function(test) {  
  // Close the tab  
  controller.window.alert('teardownTest');  
  controller.click(new elementslib.Elem(controller.menus.File['menu_close']));  
}  


var validUsers = [
	'validUser_0',
	'validUser_1',
	'validUser_2',
	'validUser_3',
	'validUser_4'
];

var validPasswords = [
	'validPassword_0',
	'validPassword_1',
	'validPassword_2',
	'validPassword_3',
	'validPassword_4'
];

var invalidUsers = [
	'invalidUser_0',
	'invalidUser_1',
	'invalidUser_2',
	'invalidUser_3',
	'invalidUser_4'
];

var invalidPasswords = [
	'invalidPassword_0',
	'invalidPassword_1',
	'invalidPassword_2',
	'invalidPassword_3',
	'invalidPassword_4'
];

var addresses = [
	'address_0@gmail.com',
	'address_1@hotmail.com',
	'address_2@yahoo.com',
	'address_3@msn.com'
];

var addressPasswords = [
	'address_password_0',
	'address_password_1',
	'address_password_2',
	'address_password_3',
];

function addAddresses(numberOfAddresses)
{
	for(var i = 0; i <= numberOfAddresses; i = i + 1)
	{
		// click create button
		controller.click(new elementslib.Link(controller.tabs.activeTab, "New address")); 
		controller.waitForPageLoad();
		
		// search input boxes
		addressTextBox= new elementslib.ID(controller.tabs.activeTab, "input_address");
		encryptedPassowdTextBox= new elementslib.ID(controller.tabs.activeTab, "input_encrypted_password");

		// type info
		controller.type(addressTextBox, addresses[i]);
		controller.type(encryptedPassowdTextBox, addressPasswords[i]);
		
		// click commit button
		controller.click(new elementslib.Name(controller.tabs.activeTab, "commit")); 
		
		// wait to process user creation
		controller.waitForPageLoad();
	}
}

function addUsers(numberOfUsers)
{
	for(var i = 0; i <= numberOfUsers; i = i + 1)
	{
		// go to login page
		controller.click(new elementslib.Link(controller.tabs.activeTab, "Sing in"));
		controller.waitForPageLoad();
	
		// search input boxes
		usernameTextBox= new elementslib.ID(controller.tabs.activeTab, "user_username");
		userFirstNameTextBox= new elementslib.ID(controller.tabs.activeTab, "user_firstname");
		userLastNameTextBox= new elementslib.ID(controller.tabs.activeTab, "user_lastname");
			
		// type user's info
		controller.type(usernameTextBox, validUsers[i]);
		controller.type(userFirstNameTextBox, validUsers[i] + '_firstname');
		controller.type(userLastNameTextBox, validUsers[i] + '_lastname');
		
		// click create button
		controller.click(new elementslib.ID(controller.tabs.activeTab, "dialog")); 
		
		// search password input boxes
		userPasswordTextBox= new elementslib.ID(controller.tabs.activeTab, "user_password");
		userConfirmPasswordTextBox= new elementslib.ID(controller.tabs.activeTab, "confirm_user_password");

		// type password
		controller.type(userPasswordTextBox, validPasswords[i]);
		controller.type(userConfirmPasswordTextBox, validPasswords[i]);
		
		// click create button
		controller.click(new elementslib.XPath(controller.tabs.activeTab, 
			"/html/body/form[@id='new_user']/div[@id='boxes']/div[@id='dialog']/input"
		)); 
		
		// wait to process user creation
		controller.waitForPageLoad();
		
		// add addresses
		addAddresses(Math.floor(Math.random()* addresses.length));
		
		// log out user	
		controller.click(new elementslib.Link(controller.tabs.activeTab, "Log out")); 
		controller.waitForPageLoad();
			
		// go to login page
		controller.click(new elementslib.Link(controller.tabs.activeTab, "Back"));
		controller.waitForPageLoad();
	}
}

var testSingin = function () 
{ 	
	controller.window.alert('Doing a sing in test'); 
	
	addUsers(Math.floor(Math.random()* validUsers.length));	
}

var testLoginValidUsers = function () 
{ 	
	controller.window.alert('Login with valid users'); 
		
	loginUser(validUsers, validPasswords, true, Math.floor(Math.random()* validUsers.length));	
}

/*
var testLoginValidUsersInvalidPasswords = function () 
{ 	
	controller.window.alert('Login with valid users with invalid passwords'); 
		
	loginUser(validUsers, invalidPasswords, false, Math.floor(Math.random()* validUsers.length));	
}

var testLoginInvalidUsers = function () 
{ 	
	controller.window.alert('Login with invalid users'); 
		
	loginUser(invalidUsers, validPasswords, false, Math.floor(Math.random()* validUsers.length));	
}
*/

function loginUser(usersArray, passwordsArray, mustAddAddresses, numberOfUsers)
{
	// go to login page
	controller.click(new elementslib.Link(controller.tabs.activeTab, "Login"));
	controller.waitForPageLoad();
	
	for(var i = 0; i <= numberOfUsers; i = i + 1)
	{		
		// search input boxes
		usernameTextBox= new elementslib.ID(controller.tabs.activeTab, "user_username");
		userPasswordTextBox= new elementslib.ID(controller.tabs.activeTab, "user_password");
		
		// type login info
		controller.type(usernameTextBox, '');
		controller.type(usernameTextBox, usersArray[i]);
		controller.type(userPasswordTextBox, passwordsArray[i]);
		
		// click commit button
		controller.click(new elementslib.Name(controller.tabs.activeTab, "commit"));
		controller.waitForPageLoad();


		if(mustAddAddresses)
		{
			controller.waitForElement(new elementslib.Link(controller.tabs.activeTab, "New address"),
				2000
			);
			
			// add addresses
			addAddresses(Math.floor(Math.random()* addresses.length));
			
			// log out user
			controller.click(new elementslib.Link(controller.tabs.activeTab, "Log out"));
			controller.waitForPageLoad();
		}
	} 

}
  