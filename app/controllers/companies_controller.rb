class CompaniesController < ApplicationController
  def index
    @companies = Company.order(:name)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(companies_params)

    if @company.save
      redirect_to companies_path,
        flash: {notice: "Empresa creada exitosamente"}
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(companies_params)
      redirect_to companies_path,
        flash: {notice: "Empresa editada exitosamente"}
    else
      render :edit
    end
  end

  private

    def companies_params
      params.require(:company).permit!
    end
end
