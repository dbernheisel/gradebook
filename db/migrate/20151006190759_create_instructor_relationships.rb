class CreateInstructorRelationships < ActiveRecord::Migration
  def change
    create_table :instructor_relationships do |t|
      t.integer :instructor_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
