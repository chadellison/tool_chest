class UpdateUsernameAndPassword < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :name
      t.string :username
      t.string :password_digest
    end
  end
end
