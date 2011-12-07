Transaction.blueprint do
  user
  timestamp { 1.day.ago }
  vendor
  description { "Desc#{sn}" }
end
