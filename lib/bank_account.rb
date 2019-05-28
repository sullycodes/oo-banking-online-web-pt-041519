class BankAccount
  
  attr_accessor :account, :balance, :status
  attr_reader :name
  
  def initialize(account)
    @account = account
    @name = account
    @balance = 1000
    @status = "open"
  end
  
  def deposit(deposit)
    @balance = @balance + deposit
  end
  
  def display_balance
    return "Your balance is $#{@balance}."
  end

  #need valid? to return true if more than zero or open, need to return false if balnce is 0 or status is closed
  def valid?
    if @balance == 0 || @status == "closed"
      return false
    else
      true
    end
  end

  def close_account
    self.status = "closed"
  end
  
end

