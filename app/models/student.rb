class Student < ActiveRecord::Base
    has_secure_password
    validates :password, length: { minimum: 4 }
    validates :fullname, presence: true
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true
    
    has_many :practice_logs

  end