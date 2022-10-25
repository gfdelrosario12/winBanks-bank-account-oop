import 'dart:io';
import 'BankAccount.dart';

class WinBanks {
  // Declaring Global Variables
  bool bankProcess =
      true; // bank process is a global variable as it will be used in two methods
  // account initializers that are instantiated from the BankAccount objects
  var mike = new BankAccount();
  var dustin = new BankAccount();
  var will = new BankAccount();

  // money transfer method to shorten code
  void transferMoneyToPerson(transferAction, bankOwner, transferPerson) {
    if (transferPerson.owner == false) {
      print("Transferring to " + transferAction);
      stdout.write("Amount to transfer: ");
      double transferAmount = double.parse(stdin.readLineSync()!);
      print("");
      if (transferAmount <= bankOwner.checkBalance() &&
          bankOwner.checkBalance() > 0) {
        // withdraws money from the user and deposits this money to the target person
        bankOwner.withdraw(transferAmount);
        transferPerson.deposit(transferAmount);
      } else {
        print("Insufficient Balance");
        print("");
      }
    } else {
      print(
          "Either you are the owner of this account and cannot transfer or something is wrong.");
      print("");
    }
  }

  // method for the four main processes of Win Banks.
  void userProcess(bankOwner) {
    while (this.bankProcess) {
      bankOwner.owner = true;
      print("""Please select your operation below.
D for deposit
W for withdrawals
C for checking your balance
T for transferring money to another account
E to exit""");
      stdout.write("What would you like to do?: ");
      String? action = stdin.readLineSync();
      action = action!.toUpperCase();
      print("");
      // deposit
      if (action == "D") {
        stdout.write("Enter Deposit Amount:");
        double amountToDeposit = double.parse(stdin.readLineSync()!);
        // deposit method for the bank owner from the BankAccount class
        bankOwner.deposit(amountToDeposit);
        print("");
      } else if (action == "W") {
        // withdraw
        stdout.write("Enter amount to withdraw: ");
        double amountToWithdraw = double.parse(stdin.readLineSync()!);
        if (amountToWithdraw <= bankOwner.checkBalance() &&
            bankOwner.checkBalance() > 0) {
          // withdraws money from the users balance
          bankOwner.withdraw(amountToWithdraw);
        } else {
          print("Insufficient Balance");
          print("");
        }
      } else if (action == "C") {
        print(bankOwner.checkBalance());
      } else if (action == "T") {
        print("""Whom to transfer? 
Users: dustin, will, or mike?""");
        stdout.write("Input: ");
        String? transferAction = stdin.readLineSync();
        transferAction = transferAction!.toLowerCase();
        print("");
        // transfer actions this transfer money to the three users registered in Win Banks
        if (transferAction == "dustin") {
          transferMoneyToPerson(transferAction, bankOwner, dustin);
        } else if (transferAction == "will") {
          transferMoneyToPerson(transferAction, bankOwner, will);
        } else if (transferAction == "mike") {
          transferMoneyToPerson(transferAction, bankOwner, mike);
        } else {
          print("Account not registered or something is wrong.");
          print("");
        }
      } else if (action == "E") {
        this.bankProcess = false;
      }
    }
  }

  // bank process method of Win Banks
  void bankProcessFunction() {
    bool mainProcess = true;
    while (mainProcess) {
      // User Login
      print("Welcome to Win Banks!");
      stdout.write("Please enter your username: ");
      String? username = stdin.readLineSync();
      username = username!.toLowerCase();
      stdout.write("Please enter Password: ");
      num password = num.parse(stdin.readLineSync()!);
      print("");
      this.bankProcess = true;
      if (username == "mike" && password == 0001) {
        userProcess(mike);
      } else if (username == "dustin" && password == 0002) {
        userProcess(dustin);
      } else if (username == "will" && password == 0003) {
        userProcess(will);
      } else if ((username == "E" || username == "e") && password == 0000) {
        print("Exit codes initialized. Exiting WinBanks");
        mainProcess = false;
      } else {
        print("Incorrect username and password or user does not exist.");
      }
    }
  }
}
