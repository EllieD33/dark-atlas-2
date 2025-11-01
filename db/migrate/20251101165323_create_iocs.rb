class CreateIocs < ActiveRecord::Migration[8.1]
  def change
    create_table :iocs do |t|
      t.string :ioc_type
      t.string :value
      t.string :source
      t.datetime :first_seen
      t.datetime :last_seen
      t.jsonb :raw_data

      t.timestamps
    end
    add_index :iocs, :value, unique: true
  end
end
