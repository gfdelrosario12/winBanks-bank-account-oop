// the bank account class contains the data and processes that could be done on each registered user
class BankAccount {
  // the master amount is the users total balance
  num _masterAmount = 0; // master amount is privates since we do not allow to be directly changed on other classes, only BankAccount class methods could modify it.
  // this just tells if the user is in his account for the transferMoneyToPerson function in WinBanks.dart
  var owner = false;

  // deposit method
  num deposit(amountToDeposit) {
    return this._masterAmount += amountToDeposit;
  } // withdraw method, the transfer method also contains this
  num withdraw(amountToWithdraw) {
    return this._masterAmount -= amountToWithdraw;
  } // checks the balance of the user
  num checkBalance() {
    return this._masterAmount;
  }
}