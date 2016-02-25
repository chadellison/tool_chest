class UpdateTool < ActiveRecord::Migration
  def change
    change_table :tools do |t|
      t.integer :category_id
    end
  end
end
