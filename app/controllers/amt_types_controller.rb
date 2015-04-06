class AmtTypesController < ApplicationController
  def index
    @amt_types = AmtType.order(:title)
  end

  def show
    @amt_type = AmtType.find(params[:id])
    @technologies = @amt_type.technologies
  end

  def new
    @amt_type = AmtType.new
  end

  def create
    @amt_type = AmtType.new(amt_types_params)

    if @amt_type.save
      redirect_to amt_types_path,
        flash: {notice: "Tipo AMT creado exitosamente"}
    else
      render :new
    end

  end

  def edit
    @amt_type = AmtType.find(params[:id])
  end

  def update
    @amt_type = AmtType.find(params[:id])

    if @amt_type.update(amt_types_params)
      redirect_to amt_types_path,
        flash: {notice: "Tipo AMT editado exitosamente"}
    else
      render :edit
    end
  end

  def destroy
    @amt_type = AmtType.find(params[:id])

    @technologies = @amt_type.technologies

    if @technologies.any?
      redirect_to amt_type_path(@amt_type),
        flash: {notice: "No se puede borrar el tipo AMT porque tiene Tecnologias"}
    else
      @amt_type.destroy
      redirect_to amt_types_path,
        flash: {notice: "Tipo AMT eliminado exitosamente"}
    end
  end

  private
    def amt_types_params
      params.require(:amt_type).permit!
    end
end
