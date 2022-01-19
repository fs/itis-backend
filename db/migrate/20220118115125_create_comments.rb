class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :task, null: false, foreign_key: true
      t.references :creator, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
