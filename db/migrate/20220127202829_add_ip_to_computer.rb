class AddIpToComputer < ActiveRecord::Migration[6.1]
  def change
    add_column :computers, :ip, :string
  end
end
