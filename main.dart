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
    print("Enter username");
    String? username = stdin.readLineSync();
    username = username!.toLowerCase();
    print("Enter Password");
    String? password = stdin.readLineSync();
    password = password!.toLowerCase();
    if (username == "mike" && password == "eleven") {
      while(bankProcess) {
        print("What would you like to do?");
        String? action = stdin.readLineSync();
        action = action!.toLowerCase();
        if (action == "deposit") {
          double amountToDeposit = double.parse(stdin.readLineSync()!);
          mike.deposit(amountToDeposit);
          print(mike.checkBalance());
        }
      }
    } else if (username == "dustin" && password == "suzie") {
    } else if (username == "will" && password == "upsidedown") {
    }
  }
}