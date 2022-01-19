class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.string :status, null: false, default: :not_started
      t.references :project, null: false, foreign_key: true
      t.references :creator, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
