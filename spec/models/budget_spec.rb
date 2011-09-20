require 'spec_helper'

describe Budget do
  describe "validations" do
    it "attr_accessible :starts_at, :ends_at, :budget_items_attributes"
    it "accepts_nested_attributes_for :budget_items"
    it "validates_presence_of :user, :starts_at, :ends_at"
  end

  describe "scopes" do
    it "default scope"
    it "scope :current"
  end

  describe "days" do
    it "#days" do
      budget = Budget.make :starts_at => 1.day.ago, :ends_at => 1.day.from_now
      budget.days.should be_within(0.01).of(2.0)
    end

    it "#days_gone" do
      budget = Budget.make :starts_at => 1.day.from_now, :ends_at => 3.days.from_now
      budget.days_gone.should eq(0)

      budget = Budget.make :starts_at => 1.day.ago, :ends_at => 1.day.from_now
      budget.days_gone.should be_within(0.01).of(1.0)

      budget = Budget.make :starts_at => 3.days.ago, :ends_at => 1.day.ago
      budget.days_gone.should be_within(0.01).of(2.0)
    end

    it "#days_left" do
      budget = Budget.make :starts_at => 1.day.from_now, :ends_at => 3.days.from_now
      budget.days_left.should be_within(0.01).of(2.0)

      budget = Budget.make :starts_at => 1.day.ago, :ends_at => 1.day.from_now
      budget.days_left.should be_within(0.01).of(1.0)

      budget = Budget.make :starts_at => 3.days.ago, :ends_at => 1.day.ago
      budget.days_left.should eq(0)
    end
  end

  it "amount"

  it "sum"

  it "spent"

  it "earned"

  it "difference"

  it "margin"

  it "spent_per_day"

  it "earned_per_day"

  it "difference_per_day"

  it "margin_per_day"
end
