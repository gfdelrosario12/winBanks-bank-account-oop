import 'dart:convert';
import 'dart:io';
import 'BankAccount.dart';


void main()
{
  bool mainProcess = true;
  bool bankProcess = true;
  var mike = new BankAccount();
  var dustin = new BankAccount();
  var will = new BankAccount();
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
      while(bankProcess) {
        print("""Please select your operation below.
D for deposit
W for withdrawals
C for checking your balance
T for transferring money to another account
E to exit""");
        stdout.writeln("What would you like to do?: ");
        String? action = stdin.readLineSync();
        action = action!.toUpperCase();
        if (action == "D") {
          print("Enter Deposit Amount:");
          double amountToDeposit = double.parse(stdin.readLineSync()!);
          mike.deposit(amountToDeposit);
        } else if (action == "W") {
          print("Enter amount to withdraw");
          double amountToWithdraw = double.parse(stdin.readLineSync()!);
          if (amountToWithdraw <= mike.checkBalance() && mike.checkBalance() > 0) {
            mike.withdraw(amountToWithdraw);
            print(mike.checkBalance());
          } else {
            print("Insufficient Balance");
          }
        } else if (action == "C") {
          print(mike.checkBalance());
        } else if (action == "T") {
          stdout.writeln("""Whom to transfer? 
Users: Dustin, Will
Input: """);
          String? transferAction = stdin.readLineSync();
          transferAction = transferAction!.toLowerCase();
          print("Transferring to " + transferAction);
          stdout.writeln("Amount to transfer: ");
          double transferAmount = double.parse(stdin.readLineSync()!);
          if (transferAction == "dustin") {
            if (transferAmount <= mike.checkBalance() && mike.checkBalance() > 0) {
              dustin.deposit(mike.transferMoney(transferAmount));
            } else {
              print("Insufficent Balance");
            }
          } else if (transferAction == "will") {
            if (transferAmount <= mike.checkBalance() && mike.checkBalance() > 0) {
              will.deposit(mike.transferMoney(transferAmount));
            } else {
              print("Insufficent Balance");
            }
          }
        } else if(action == "E") {
          bankProcess = false;
        }
      }
    } else if (username == "dustin" && password == "suzie") {

    } else if (username == "will" && password == "upsidedown") {

    }
  }
}