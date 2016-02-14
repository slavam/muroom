class CreateHeros < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :title
      t.string :picture
      t.string :description
      t.integer :eye_right_x
      t.integer :eye_right_y
      t.integer :eye_left_x
      t.integer :eye_left_y

      t.timestamps null: false
    end
  end
end
