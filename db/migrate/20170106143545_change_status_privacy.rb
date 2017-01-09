class ChangeStatusPrivacy < ActiveRecord::Migration
  def change
  	change_column_default :statuses, :private, false
  end
end
