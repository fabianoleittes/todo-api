class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title, null: false, default: ""
      t.string :created_by, null: false, default: ""

      t.timestamps
    end
  end
end
