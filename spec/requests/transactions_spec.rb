require 'spec_helper'

describe "Transactions" do
  describe "Add a transaction" do
    it "accepts valid input" do
      visit new_transaction_path
      response.status.should be(200)
    end
  end
end

