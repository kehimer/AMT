class CompanysController < ApplicationController
  def index
    @companys = Company.order(:name)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(companys_params)

    if @company.save
      redirect_to companys_path,
        flash: {notice: "Company creada exitosamente"}
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update(petition_params)
      redirect_to companys_path,
        flash: {notice: "Company editada exitosamente"}
    else
      render :new
    end
  end

  private

    def companys_params
      params.require(:company).permit!
    end

end
