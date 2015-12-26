class CreateComentaries < ActiveRecord::Migration
  def change
    create_table :comentaries do |t|
      t.text :contenido

      t.timestamps null: false
    end
  end
end
