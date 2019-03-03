class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.boolean :done, default: false
      t.references :todo, foreign_key: true, index: true

      t.timestamps
    end
  end
end
