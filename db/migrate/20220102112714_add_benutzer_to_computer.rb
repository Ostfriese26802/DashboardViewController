class AddBenutzerToComputer < ActiveRecord::Migration[6.1]
  def change
    add_column :computers, :benutzer, :string
  end
end
