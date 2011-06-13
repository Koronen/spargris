class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :budget_items
  has_many :budget_posts, :through => :budget_items

  attr_accessible :start, :end, :budget_items
  accepts_nested_attributes_for :budget_items, :allow_destroy => true

  validates_presence_of :user, :start, :end

  scope :current, lambda {
    where('start < ? AND end > ?', Time.zone.now, Time.zone.now)
  }

  def days
    @days ||= (self.end-self.start)/1.day.to_f
  end

  def days_gone
    return 0 if self.start.future?
    [(Time.zone.now-self.start)/1.day.to_f, days].min
  end

  def days_left
    return days if self.start.future?
    [(self.end-Time.zone.now)/1.day.to_f, 0].max
  end

  def amount
    @amount ||= budget_items.sum(:amount)
  end

  def spent
    @spent ||= budget_items.inject(0) { |result, element| result + element.spent }
  end

  def left
    @left ||= budget_items.inject(0) { |result, element| result + element.left }
  end

  def spent_per_day
    return 0 if self.start.future?
    self.spent / self.days_gone
  end

  def left_per_day
    return self.left if self.end.past?
    self.left / self.days_left
  end
end

