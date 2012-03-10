# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    if user_signed_in?
      primary.item :budgets, I18n.t('navigation.budgets'), budgets_path do |secondary|
        secondary.item :all_budgets, I18n.t('navigation.all_budgets'), budgets_path
        secondary.item :new_budget, I18n.t('navigation.new_budget'), new_budget_path
      end

      primary.item :budget_posts, I18n.t('navigation.budget_posts'), budget_posts_path do |secondary|
        secondary.item :all_budget_posts, I18n.t('navigation.all_budget_posts'), budget_posts_path
        secondary.item :new_budget_post, I18n.t('navigation.new_budget_post'), new_budget_post_path
      end

      primary.item :transactions, I18n.t('navigation.transactions'), transactions_path do |secondary|
        secondary.item :all_transactions, I18n.t('navigation.all_transactions'), transactions_path
        secondary.item :new_transaction, I18n.t('navigation.new_transaction'), new_transaction_path
      end

      primary.item :vendors, I18n.t('navigation.vendors'), vendors_path do |secondary|
        secondary.item :all_vendors, I18n.t('navigation.all_vendors'), vendors_path
        secondary.item :new_vendor, I18n.t('navigation.new_vendor'), new_vendor_path
      end

      primary.item :tags, I18n.t('navigation.tags'), tags_path
      primary.item :dashboard, I18n.t('navigation.dashboard'), dashboard_path

      primary.item :user, current_user.email.to_s, user_path do |secondary|
        secondary.item :my_page, I18n.t('navigation.my_page'), user_path
        secondary.item :logout, I18n.t('navigation.log_out'), destroy_user_session_path, method: :delete
      end
    else
      primary.item :login, I18n.t('navigation.log_in'), new_user_session_path
      primary.item :register, I18n.t('navigation.register'), new_user_registration_path
    end
  end
end
