class EmployeesController < ApplicationController
   http_basic_authenticate_with name: "admin", password: "admin", except: []

  def index
    @employess = Employee.all
  end

  def new
  end

  def show
    @employee = Employee.find(params[:id]);
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.save
    redirect_to @employee
  end

  def edit
    @employee = Employee.find(params[:id]);
  end

  def update
    @employee = Employee.find(params[:id]);

    if @employee.update(employee_params)
			redirect_to @employee
		else
			rednder 'edit'
		end

  end

  def destroy
    @employee = Employee.find(params[:id]);
    @employee.destroy
    redirect_to employees_path
  end


  private
  def employee_params
    params.require(:employee).permit(:name, :email, :mobileNumber)
  end


end
