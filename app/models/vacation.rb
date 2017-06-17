class Vacation < ApplicationRecord
  include VacationHelper

  belongs_to :employee

  validate :start_date_greater?
  validate :days_overlap?

  private

    def start_date_greater?
      if self.start_date > self.end_date
        self.errors.add(:start_date, :start_greater)
      end
    end

    def days_overlap?
      if overlap_check?
        errors.add(:start_date, :already_taken)
      end
    end

    def overlap_check?
      unless employee_vacations.blank?
        dates_range = (self.start_date..self.end_date)
        employee_vacations.each do |vacation|
          dates_range.include?(vacation.start_date..vacation.end_date)
        end
      end
    end

  def employee_vacations
    employee_vacations = Vacation.where(employee_id: @vacation.employee_id).to_a
  end    
    
 end
