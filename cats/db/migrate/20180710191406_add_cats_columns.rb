class AddCatsColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :cats, :sex, :string, limit: 1, null: false
    add_column :cats, :description, :text, null: false
  end
end
