class AddPrivacy < ActiveRecord::Migration
  def change
  	add_column :statuses, :private, :boolean, default: true
  end
end
