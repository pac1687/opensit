class AddPrivacyFields < ActiveRecord::Migration
  def change
  	add_column :users, :privacy_setting, :string, default: ''
  	add_column :users, :authorised_users, :string, default: ''
  end
end
