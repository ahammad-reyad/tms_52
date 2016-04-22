class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :title
      t.text :instruction
      t.datetime :start_date
      t.datetime :end_date
      t.string :status

      t.timestamps null: false
    end
  end
end
