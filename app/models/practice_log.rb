class PracticeLog < ActiveRecord::Base
    belongs_to :student

    validates :date, presence: true
    #validates date: { after: Proc.new { Time.now - 1.year}, before_or_equal_to: Time.now }
    validates :practice_minutes, presence: true
    validates :practice_minutes, numericality: { greater_than: 10 }
    
  end