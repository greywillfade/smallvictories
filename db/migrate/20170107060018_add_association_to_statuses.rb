class AddAssociationToStatuses < ActiveRecord::Migration
  def change

  	change_table :statuses do |t|
  		t.remove :categories_id
  		t.belongs_to :category, index:true
  	end

  end
end
