class VacationsController < ApplicationController
  before_action :set_vacation, only: [:show, :edit, :update, :destroy]

  attr_accessor :employee


  def new
    @vacation = current_employee.vacations.build
  end

  def edit
  end

  def index
   @vacations = Vacation.where(employee_id: current_employee.id).to_a.pluck(:start_date)
  end

  def create
    @vacation = current_employee.vacations.new(vacation_params)
      if @vacation.save
        flash[:notice] = 'Vacation request was successfully created'
        redirect_to root_path
      else
        flash[:error] = 'Could not be saved'
        render :new
      end
  end

  def show
  end


  # PATCH/PUT /vacations/1
  # PATCH/PUT /vacations/1.json
  def update
    respond_to do |format|
      if @vacation.update(vacation_params)
        format.html { redirect_to @vacation, notice: 'vacation was successfully updated.' }
        format.json { render :show, status: :ok, location: @vacation }
      else
        format.html { render :edit }
        format.json { render json: @vacation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacations/1
  # DELETE /vacations/1.json
  def destroy
    @vacation.destroy
    respond_to do |format|
      format.html { redirect_to vacations_url, notice: 'vacation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation
      @vacation = Vacation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacation_params
      params.require(:vacation).permit(:start_date, :end_date, :employee_id)
    end
end
