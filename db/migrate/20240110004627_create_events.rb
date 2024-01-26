class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title,null: false
      t.integer :cooking_number

      t.timestamps
    end
  end
end
