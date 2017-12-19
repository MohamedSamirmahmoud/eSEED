class ReportsController < ApplicationController
  def range
    @employee = Employee.find(params[:id]) ;
    @attendances = @employee.attendances;
  end

  def filter
    @employee = Employee.find(params[:id]) ;
    @attendances = @employee.attendances.where(:day => params[:attendance][:from]..params[:attendance][:to]);
    render 'range'
  end

  def monthstar
  end

  def star
    attendanceGroup = Attendance.where(:day => params[:attendance][:from]..params[:attendance][:to]).select('employee_id , sum(workingHours) as hour').group('employee_id').order('hour desc').first
    @employee = Employee.find(attendanceGroup.employee_id);
    render 'monthstar'
  end


end
