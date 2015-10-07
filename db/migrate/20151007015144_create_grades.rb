class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.decimal :score
      t.date :date
      t.integer :student_id
      t.integer :assignment_id

      t.timestamps null: false
    end
  end
end
