class Student < ActiveRecord::Base
    has_secure_password
    validates :email, confirmation: true
    validates :email_confirmation, presence: true

    has_many :practice_logs

    def self.valid_params?(params)
        return !params[:fullname].empty? && !params[:username].empty? && !params[:email].empty?
    end
  end