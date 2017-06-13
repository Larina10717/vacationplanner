module VacationHelper

  def vacation_days
    @vacation.end_date - @vacation.start_date
  end

  def approved_vacations
    Vacation.where(employee_id: current_employee.id, approved: true).to_a
  end

  def pending_vacations
    Vacation.where(employee_id: current_employee.id, pending: true).to_a
  end

  def beautify(time)
      time.strftime("%d %B %Y")
  end

  def requested_vacation_days
    if @vacation.pending?
      @vacation.end_date - @vacation.start_date
    end
  end
end
