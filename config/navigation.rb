# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    if user_signed_in?
      primary.item :transactions, I18n.t('navigation.transactions'), transactions_path do |secondary|
        secondary.item :all_transactions, I18n.t('navigation.all_transactions'), transactions_path
        secondary.item :new_transaction, I18n.t('navigation.new_transaction'), new_transaction_path
      end

      primary.item :user, current_user.email.to_s, user_path do |secondary|
        secondary.item :my_page, I18n.t('navigation.my_page'), user_path
        secondary.item :logout, I18n.t('navigation.log_out'), destroy_user_session_path
      end
    else
      primary.item :login, I18n.t('navigation.sign_in'), new_user_session_path
    end
  end
end
