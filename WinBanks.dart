import 'dart:io';
import 'BankAccount.dart';
import 'dart:convert';

class WinBanks {
  // Declaring Global Variables
  bool bankProcess = true;
  var mike = new BankAccount();
  var dustin = new BankAccount();
  var will = new BankAccount();

  void userProcess (bankOwner) {
    while(bankProcess) {
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
      if (action == "D") {
        stdout.write("Enter Deposit Amount:");
        double amountToDeposit = double.parse(stdin.readLineSync()!);
        bankOwner.deposit(amountToDeposit);
      } else if (action == "W") {
        stdout.write("Enter amount to withdraw: ");
        double amountToWithdraw = double.parse(stdin.readLineSync()!);
        if (amountToWithdraw <= bankOwner.checkBalance() && bankOwner.checkBalance() > 0) {
          bankOwner.withdraw(amountToWithdraw);
          print(bankOwner.checkBalance());
        } else {
          print("Insufficient Balance");
        }
      } else if (action == "C") {
        print(bankOwner.checkBalance());
      } else if (action == "T") {
        print("""Whom to transfer? 
Users: Dustin, Will""");
        stdout.write("Input: ");
        String? transferAction = stdin.readLineSync();
        transferAction = transferAction!.toLowerCase();
        double transferAmount = 0;
        if (transferAction == "dustin" && dustin.owner == false) {
          print("Transferring to " + transferAction);
          stdout.write("Amount to transfer: ");
          double transferAmount = double.parse(stdin.readLineSync()!);
          if (transferAmount <= bankOwner.checkBalance() && bankOwner.checkBalance() > 0) {
            bankOwner.withdraw(transferAmount);
            dustin.deposit(transferAmount);
          } else {
            print("Insufficent Balance");
          }
        } else if (transferAction == "will" && bankOwner.owner == false) {
          if (transferAmount <= bankOwner.checkBalance() && bankOwner.checkBalance() > 0) {
            will.deposit(transferAmount);
          } else {
            print("Insufficent Balance");
          }
        } else if (transferAction == "mike" && bankOwner.owner == false) {
          if (transferAmount <= bankOwner.checkBalance() && bankOwner.checkBalance() > 0) {
            mike.deposit(transferAmount);
          } else {
            print("Insufficent Balance");
          }
        } else {
          print("Either you are the owner of this bank or something is wrong");
        }
      } else if(action == "E") {
        bankProcess = false;
      }
    }
  }
  void bankProcessFunction() {
    bool mainProcess = true;
    while(mainProcess) {
      print("Welcome to Win Banks!");
      stdout.write("Please enter your username: ");
      String? username = stdin.readLineSync();
      username = username!.toLowerCase();
      stdout.write("Please enter Password: ");
      String? password = stdin.readLineSync();
      password = password!.toLowerCase();
      bankProcess = true;
      if (username == "mike" && password == "eleven") {
        userProcess(mike);
      } else if (username == "dustin" && password == "suzie") {
        userProcess(dustin);
      } else if (username == "will" && password == "upsidedown") {
        userProcess(will);
      }
    }
  }
}