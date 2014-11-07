class CreateTwtickers < ActiveRecord::Migration
  def change
    create_table :twtickers do |t|
      t.string :tick_name
    end
  end
end
