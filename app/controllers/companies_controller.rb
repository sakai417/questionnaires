class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  def index
    @company = Company.all
  end
  def new
    @company = Company.new
  end
  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @users = User.where(company_id: 4)
  end

  def edit
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @company.destroy
    redirect_to root_path
  end

  private
  def company_params
    params[:company].permit(:name, :chief_user_id)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
