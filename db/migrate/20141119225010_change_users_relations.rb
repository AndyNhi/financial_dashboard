class ChangeUsersRelations < ActiveRecord::Migration
  def change
    change_table :twtickers do |t|
      t.belongs_to :user
    end
  end
end
