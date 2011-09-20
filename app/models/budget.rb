class Budget < ActiveRecord::Base
  belongs_to :user
  has_many :budget_items
  has_many :budget_posts, :through => :budget_items

  attr_accessible :starts_at, :ends_at, :budget_items_attributes
  accepts_nested_attributes_for :budget_items, :allow_destroy => true

  validates_presence_of :user, :starts_at, :ends_at

  default_scope order("starts_at DESC")

  scope :current, lambda {
    where('starts_at < ? AND ends_at > ?', Time.zone.now, Time.zone.now)
  }

  scope :chronological_order, order("starts_at ASC")
  scope :reverse_chronological_order, order("starts_at DESC")

  def days
    @days ||= (self.ends_at-self.starts_at)/1.day.to_f
  end

  def days_gone
    return 0 if self.starts_at.future?
    [(Time.zone.now-self.starts_at)/1.day.to_f, days].min
  end

  def days_left
    return days if self.starts_at.future?
    [(self.ends_at-Time.zone.now)/1.day.to_f, 0].max
  end

  def amount
    @amount ||= budget_items.sum(:amount)
  end

  def sum
    @sum ||= budget_items.inject(0) { |result, element| result + element.sum }
  end

  def spent
    @spent ||= budget_items.inject(0) { |result, element| result + element.spent }
  end

  def earned
    @earned ||= budget_items.inject(0) { |result, element| result + element.earned }
  end

  def difference
    @difference ||= budget_items.inject(0) { |result, element| result + element.difference }
  end
  alias :diff :difference

  def margin
    -self.difference
  end

  def spent_per_day
    return 0 if self.starts_at.future?
    self.spent / self.days_gone
  end

  def earned_per_day
    return 0 if self.starts_at.future?
    self.earned / self.days_gone
  end

  def difference_per_day
    return 0 if self.starts_at.future?
    self.diff / self.days_gone
  end
  alias :diff_per_day :difference_per_day

  def margin_per_day
    return 0 if self.ends_at.past?
    self.margin / self.days_left
  end
end

