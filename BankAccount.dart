class BankAccount {
  num _masterAmount = 0;
  var owner = true;

  num deposit(amountToDeposit) {
    return this._masterAmount += amountToDeposit;
  }
  num withdraw(amountToWithdraw) {
    return this._masterAmount -= amountToWithdraw;
  }
  num checkBalance() {
    return this._masterAmount;
  }
  num transferMoney (transferAmount) {
    return this._masterAmount - transferAmount;
  }
}