TransactionItem.blueprint do
  transaction
  budget_post
  amount { sn.to_i % 1000 }
  description { "Desc#{sn}" }
end
