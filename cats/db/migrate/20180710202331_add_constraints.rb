class AddConstraints < ActiveRecord::Migration[5.1]
  def change
    change_column :cats, :birth_date, :date, null: false
    change_column :cats, :color, :string, null: false
  end
end
