class Budget < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :start, :end

  scope :current, lambda {
    where('start < ? AND end > ?', Time.zone.now, Time.zone.now)
  }

  def transactions
    Transaction.between(self.start, self.end)
  end

  def spent
    @spent ||= -transactions.credit.sum(:amount)
  end

  def left
    self.amount - spent
  end

  def holds?
    left > 0
  end

  def blown?
    left < 0
  end

  def days
    (self.end-self.start)/(1.day.to_i)
  end

  def days_gone
    return 0 if Time.zone.now < self.start
    [(Time.zone.now-self.start)/(1.day.to_i), days].min
  end

  def days_left
    return days if Time.zone.now < self.start
    [(self.end-Time.zone.now)/(1.day.to_i), 0].max
  end
end
