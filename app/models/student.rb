class Student < ActiveRecord::Base
    has_secure_password
    validates :password, length: { minimum: 4 }
    validates :fullname, presence: true
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true
    
    has_many :practice_logs

    def valid_username?
     (username =~ /\A[a-z0-9_]{2,10}\Z/) == 0
    end
  end