class DimentionsController < ApplicationController
  def index
    @dimentions = Dimention.joins(:priority).order('priorities.title asc, dimentions.weight desc') 
    #includes(:priority).order(priority_id: :asc, weight: :desc)
    
    if params[:keyword].present?
      q = params[:keyword]
      @dimentions = @dimentions.where("dimentions.title LIKE '%#{q}%' OR priorities.title LIKE '%#{q}%'")
    end
    
    if request.xhr?
      render partial: "table", locals: {dimentions: @dimentions}
    end
  end

  def show
    @dimention = Dimention.find(params[:id])
    @factors = @dimention.factors
  end

  def new
    @dimention = Dimention.new
  end

  def create
    @dimention = Dimention.new(dimentions_params)

    @totalPeso = Priority.find(@dimention.priority_id).sum(:weight)
    @porcentaje = 0.0

    if(@totalPeso > 0.0)
      @porcentaje = @dimention.weight.to_f / @totalPeso.to_f
    end

    if (@porcentaje >= 0.0 and @porcentaje <= 1.0)
      if @dimention.save
        redirect_to dimentions_path,
          flash: {notice: "Dimension creada exitosamente"}
       else
        render :new
      end
    else
      @notice = "El peso esta fuera de rango"
      render :new
    end
  end

  def edit
    @dimention = Dimention.find(params[:id])
  end

  def update
    @dimention = Dimention.find(params[:id])

    @totalPeso = Priority.find(@dimention.priority_id).sum(:weight)
    @porcentaje = 0.0

    if(@totalPeso > 0.0)
      @porcentaje = @dimention.weight.to_f / @totalPeso.to_f
    end

    if (@porcentaje >= 0.0 and @porcentaje <= 1.0)
      if @dimention.update(dimentions_params)
        redirect_to dimentions_path,
          flash: {notice: "Dimension editada exitosamente"}
      else
        render :edit
      end
    else
      @notice = "El peso esta fuera de rango"
      render :edit
    end
  end

  def destroy
    @dimention = Dimention.find(params[:id])

    @factors = @dimention.factors

    if @factors.any?
      redirect_to dimention_path(@dimention),
        flash: {notice: "No se puede borrar la dimension porque tiene factores"}
    else
      @dimention.destroy
      redirect_to dimentions_path,
        flash: {notice: "Dimension borrada exitosamente"}
    end
  end

  private
    def dimentions_params
      params.require(:dimention).permit!
    end

end
