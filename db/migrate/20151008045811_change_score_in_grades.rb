class ChangeScoreInGrades < ActiveRecord::Migration
  def change
    change_column :grades, :score, :decimal, precision: 4, scale: 2
  end
end
