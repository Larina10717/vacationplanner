require 'rails_helper'

RSpec.describe Vacation, type: :model do
  before do
    @vacation = Fabricate(:vacation)
  end
  it 'is a valid vacation' do
    expect(@vacation.start_date).to be_truthy
    expect(@vacation.end_date).to be_truthy
    expect(@vacation.employee_id).to be_truthy
  end

  context 'when start_date is greater than end date' do
    before do
      @vacation.start_date = Date.new(2017,6,20)
      @vacation.end_date = Date.new(2017,6,18)
    end
    it 'is not valid' do
      expect(@vacation).not_to be_valid
      expect(@vacation.errors.messages).not_to be_empty
    end
  end

  context 'when an already requested day is taken' do
    before do
      @vacation.start_date = Date.new(2017,6,20)
      @vacation.end_date = Date.new(2017,6,24)
end
