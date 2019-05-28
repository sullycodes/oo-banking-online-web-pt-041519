class Transfer
  
  attr_accessor :sender, :receiver, :transfer, :status, :amount
  
  @@executed_transactions = []
  
  def initialize(sender, receiver, amount)
    # @transfer = transfer
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if receiver.valid? == true && sender.valid? == true
      return true
    else
      return false 
    end
  end
  
  def execute_transaction
    if @sender.balance < 1 || @sender.status == "closed" 
    # if self.valid? 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      if @@executed_transactions.none? { |e| e == self }  
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
        @@executed_transactions << self
      end
    end
  end
  
  def reverse_transfer
    @@executed_transactions.each do |e|
      if e == self
        @sender.balance = @sender.balance + @amount
        @receiver.balance = @receiver.balance - @amount
        @status = "reversed"
      end
    end
  end
  
end #Transfer

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
  
end #BankAccount


