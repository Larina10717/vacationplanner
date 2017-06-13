class Vacation < ApplicationRecord
  include VacationHelper

  belongs_to :employee

  validates :start_date, uniqueness: true
  validates :end_date, uniqueness: true
  validate :start_date_greater?
  validate :days_already_taken?

  private

  def start_date_greater?
    if self.start_date > self.end_date
      self.errors.add(:start_date, :start_greater)
    end
  end

  def vacations
    Vacation.where(employee_id: self.employee_id)
  end

  def days_already_taken?
    days_range = (self.start_date..self.end_date)
    vacations.each do |vacation|
       days_range.overlaps?(vacation.start_date..vacation.end_date)
    end
    self.errors.add(:start_date, :already_taken)
  end    
end
