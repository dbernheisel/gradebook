class CreateGuardianRelationships < ActiveRecord::Migration
  def change
    create_table :guardian_relationships do |t|
      t.integer :guardian_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
