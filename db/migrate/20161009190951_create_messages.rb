class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :username
      t.text :body

      t.timestamps null: false
    end
  end
end
