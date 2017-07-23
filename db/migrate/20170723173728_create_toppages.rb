class CreateToppages < ActiveRecord::Migration[5.0]
  def change
    create_table :toppages do |t|
      t.string :filename
      t.string :name
      t.float :score

      t.timestamps
    end
  end
end
