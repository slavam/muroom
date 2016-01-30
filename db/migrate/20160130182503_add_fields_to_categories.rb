class AddFieldsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :title, :string
    add_column :categories, :path, :string
    add_column :categories, :weight, :integer
  end
end
