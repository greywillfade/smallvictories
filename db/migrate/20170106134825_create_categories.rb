class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :cat_name, :null => false

    end

    add_reference :statuses, :categories

  end
end
