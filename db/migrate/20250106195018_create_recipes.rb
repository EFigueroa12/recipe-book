class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :prep_time
      t.integer :cook_time
      t.integer :servings
      t.string :difficulty
      t.string :cuisine_type
      t.string :category
      t.text :instructions

      t.timestamps
    end
  end
end
