class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :fullname
      t.string :username
      t.string :email
      t.string :password_digest
    end
  end
end
