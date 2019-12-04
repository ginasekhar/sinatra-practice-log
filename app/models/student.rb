class Student < ActiveRecord::Base
    has_secure_password
    validates :password, length: { minimum: 4 }
    validates :fullname, presence: true
    validates :username, uniqueness: true
    validates :username, presence: true
    validates :username, format: { with: /\A[a-z]+[a-z0-9_]{1,9}\z/,
                         message: "must start with letter and only contain lower case alpha and numeric" }
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/,
                         message: "invalid email format" }
    
    has_many :practice_logs

    # def valid_username?
    #   (username =~ /\A\A[a-z]+[a-z0-9_]{1,9}\z\Z/) == 0
    # end
    
    # def valid_email?
    #   (email =~ /\A[^@\s]+@[^@\s]+\z/) == 0
    # end
  end