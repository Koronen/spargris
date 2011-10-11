class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :time_zone, :language, :remember_me

  has_many :transactions
  has_many :transaction_items, :through => :transactions
  has_many :budgets
  has_many :budget_items, :through => :budgets
  has_many :budget_posts
  has_many :vendors

  acts_as_tagger
end
