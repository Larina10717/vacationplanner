require 'rails_helper'

RSpec.describe Employee, type: :model do
  before do
    @employee = Fabricate(:employee)
  end
  it 'creates a new employee' do
    expect(@employee).to be_truthy
  end

end
