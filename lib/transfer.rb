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
      @receiver.deposit(amount)
      @sender.deposit(-amount)
      @status = "complete"
    else
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    end
  end

end
