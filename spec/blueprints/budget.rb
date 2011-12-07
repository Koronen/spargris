Budget.blueprint do
  user
  starts_at { 2.weeks.ago }
  ends_at { 2.weeks.from_now }
  budget_items { [] }
end
