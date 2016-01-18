class CreateMultimedia < ActiveRecord::Migration
  def change
    create_table :multimedia do |t|
      t.string :imagen
      t.string :titulo
      t.string :video_url

      t.timestamps null: false
    end
  end
end
