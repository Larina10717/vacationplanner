class Vacation < ApplicationRecord
  include VacationHelper

  belongs_to :employee

  validate :start_date
  validate :end_date
  validate :start_date_greater?
  #validate :dates_overlap?

  private

  #def dates_overlap?
  #  if Vacation.where(start_date: self.start_date).blank?
  #    errors.messages[:start_date] << :start_date_overlap
  #  end
  #end

  def start_date_greater?
    if :start_date > :end_date
      errors.messages[:start_date] << :start_greater_than_end
    end
  end
end
