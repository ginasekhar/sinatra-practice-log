class CreatePracticeLogs < ActiveRecord::Migration
  def change
    create_table :practice_logs do |t|
      t.string :year
      t.string :month
      t.string :day
      t.integer :practice_minutes
      t.string :notes
    end
  end
end
