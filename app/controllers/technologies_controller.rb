class TechnologiesController < ApplicationController

  def index
    @technologies = Technology.order(:title)
  end

  def show
    @technology = Technology.find(params[:id])
    @amt_comments = @technology.amt_comments
  end

  def new
    @factor = Factor.find(params[:factor_id])
    @technology = Technology.new
  end

  def create
    @factor = Factor.find(params[:factor_id])
    
    @technology = @factor.technologies.build(technology_params)

    if @technology.save
      redirect_to @factor,
          flash: {notice: "Tecnologia creada exitosamente"}
    else
      render :new
    end
  end

  def edit
    @technology = Technology.find(params[:id])
  end

  def update
    @technology = Technology.find(params[:id])

    if @technology.update(technology_params)
      redirect_to technologies_path,
          flash: {notice: "Tecnologia actualizada exitosamente"}
    else
      render :new
    end
  end

  def destroy
    @technology = Technology.find(params[:id])
    AmtComment.destroy_all(:technology_id => technology.id)
    @technology.destroy

    redirect_to technologies_path,
      flash: {notice: "AMT eliminada exitosamente"}
  end

  private
    def technology_params
      params.require(:technology).permit!
    end

end
