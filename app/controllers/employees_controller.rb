class EmployeesController < ApplicationController
  before_action :authenticate_employee!

  def index
    @employee = current_employee
  end

  def new
    @employee = Employee.new
  end

  def show
  end

  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, flash[:notice] =  'Account was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :email, :password)
    end

end
