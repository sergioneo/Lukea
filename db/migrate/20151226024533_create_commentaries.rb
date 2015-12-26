class CreateCommentaries < ActiveRecord::Migration
  def change
    create_table :commentaries do |t|

      t.timestamps null: false
    end
  end
end
