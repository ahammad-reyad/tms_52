class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :title
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
