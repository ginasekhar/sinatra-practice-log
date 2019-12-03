class CreatePracticeLogs < ActiveRecord::Migration
  def change
    create_table :practice_logs do |t|
      t.date :date
      t.integer :practice_minutes
      t.text :notes
      t.integer :student_id
    end
  end
end
