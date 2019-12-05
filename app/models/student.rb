class Student < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 4 }
  validates :fullname, presence: true
  validates :fullname, format: { with: /\A[a-zA-Z][0-9a-zA-Z .,'-]*{1,39}\z/,
                        message: "must start with alpha, be 2 to 40 characters and only contain alphanumeric or (. , - ') " }
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :username, format: { with: /\A[a-z]+[a-z0-9_]{1,9}\z/,
                        message: "must start with alpha, be 2 to 10 characters and only contain lower case alpha and numeric or (_)" }
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/,
                        message: "invalid email format" }
  
  has_many :practice_logs
    
  def total_practice_mins
    #month_ago = Date.today << 1
    self.practice_logs.sum("practice_minutes")
  end
end