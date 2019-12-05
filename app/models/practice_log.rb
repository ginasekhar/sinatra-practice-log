class PracticeLog < ActiveRecord::Base
    belongs_to :student
    validate :log_date_in_range?
    validates :date, presence: true
    validates :practice_minutes, presence: true
    validates :practice_minutes, numericality: { greater_than_or_equal_to: 10, less_than_or_equal_to: 600}

    def log_date_in_range?
      if !((Date.today - 365)..Date.today).include?(date)
        errors.add(:date, "must be within the past year")
      end
    end

    def self.avg_total_practice_mins
      #month_ago = Date.today << 1
      num_students_with_logs = PracticeLog.select("student_id").distinct.count
      total_practice_mins = PracticeLog.sum("practice_minutes")
      class_average = total_practice_mins / num_students_with_logs
    end
  end