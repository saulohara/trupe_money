class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
    	t.references :user, null: false
    	t.integer :created_by_id
    	t.decimal :amount, precision: 5, scale: 2, null: false
    	t.string :entry_type, length: 1, null: false
    	t.integer :month, null: false
    	t.integer :year, null: false
      t.timestamps
    end
  end
end
