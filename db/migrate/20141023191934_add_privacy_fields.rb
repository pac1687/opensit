class AddPrivacyFields < ActiveRecord::Migration
  class User < ActiveRecord::Base
  end

  def change
  	say 'Adding new columns...'
  	add_column :users, :privacy_setting, :string, default: 'public'
  	add_column :users, :authorised_users, :string, default: ''

  	say '`Migrating private_stream=true over to privacy_setting...'
  	User.reset_column_information
  	User.where(private_stream: true).each	do |u|
  		u.privacy_setting = 'private'
  		u.save!
  	end

  	say 'Removing redundant columns'
  	remove_column :users, :private_stream, :boolean
  	remove_column :users, :private_diary, :boolean
  end
end
