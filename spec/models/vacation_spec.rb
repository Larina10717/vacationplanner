require 'rails_helper'

RSpec.describe Vacation, type: :model do

  context 'when start date is lesser than end date' do
    before do
      employee = Fabricate(:employee)
      @vacation = Vacation.new(employee_id: employee.id,
                                start_date: Date.new(2017,8,13),
                                end_date: Date.new(2017,8,20))
    end

    it 'is valid' do
      expect(@vacation.start_date).to be <= @vacation.end_date
    end
  end

  context 'when there is already another vacation with the same dates' do
    before do
      employee = Fabricate(:employee)
      @vacation = Vacation.new(employee_id: employee.id,
                                start_date: Date.new(2017,8,14),
                                end_date: Date.new(2017,8,20))
    allow(@vacation).to receive(:overlap_check?) { true }
    end
 
    it 'is not valid' do
      expect(@vacation).not_to be_valid
      expect(@vacation.errors.messages).not_to be_empty
    end
  end
end
