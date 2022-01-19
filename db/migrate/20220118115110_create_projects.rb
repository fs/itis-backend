class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.references :creator, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
