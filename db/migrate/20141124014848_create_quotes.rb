class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :ticker
      t.belongs_to :user
    end
  end
end
