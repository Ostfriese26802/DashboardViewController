class CreateComputers < ActiveRecord::Migration[6.1]
  def change
    create_table :computers do |t|
      t.string :fqdn
      t.string :url
      t.references :gruppe, null: false, foreign_key: true
      t.string :standort

      t.timestamps
    end
  end
end
