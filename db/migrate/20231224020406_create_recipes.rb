class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|

      t.string :title,null: false
      t.boolean :favorite,default: false,null: false
      t.integer :user_id,null: false

      t.timestamps
    end
  end
end
