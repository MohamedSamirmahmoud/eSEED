class AttendancesController < ApplicationController
  def create
    @employee = Employee.find(params[:employee_id])
    @comment = @employee.attendances.create({:day => params[:attendance][:day] , :workingHours => params[:attendance][:workingHours] , :status => params[:status]})
    redirect_to employee_path(@employee)
  end

end
