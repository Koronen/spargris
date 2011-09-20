require 'machinist/active_record'

BudgetItem.blueprint do
  budget
  budget_post
  amount { sn.to_i % 1000 }
end

BudgetPost.blueprint do
  user
  name { "BP#{sn}" }
  description { "Desc#{sn}" }
  parent { nil }
end

Budget.blueprint do
  user
  starts_at { 2.weeks.ago }
  ends_at { 2.weeks.from_now }
end

Transaction.blueprint do
  user
  timestamp { 1.day.ago }
  vendor
  description { "Desc#{sn}" }
end

TransactionItem.blueprint do
  transaction
  budget_post
  amount { sn.to_i % 1000 }
  description { "Desc#{sn}" }
end

User.blueprint do
  username { "user#{sn}" }
  email { "sample@example.com" }
  time_zone { "London" }
  language { "en" }
end

Vendor.blueprint do
  user
  name { "Vendor#{sn}" }
end
