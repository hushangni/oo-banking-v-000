class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      puts @receiver.balance
      puts @sender.balance
      puts @status
      @receiver.deposit(amount)
      @sender.deposit(-amount)
      @status = "complete"
      puts @receiver.balance
      puts @sender.balance
      puts @status
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status = "complete"
      @sender.deposit(amount)
      @receiver.deposit(-amount)
      @status = "reversed"
    end
  end

end
