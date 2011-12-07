BudgetItem.blueprint do
  budget
  budget_post
  amount { sn.to_i % 1000 }
end
