class AddColumnsToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string :genero
      t.string :pais
    end
  end
end
