class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :image
      t.boolean :flesh

      t.timestamps
    end
  end
end
