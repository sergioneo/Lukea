class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.text :contenido

      t.timestamps null: false
    end
  end
end
