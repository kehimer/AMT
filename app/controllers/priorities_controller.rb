class PrioritiesController < ApplicationController
  def index
    @priorities = Priority.order(weight: :desc)
  end

  def show
    @priority = Priority.find(params[:id])
    @dimentions = @priority.dimentions
  end

  def new
    @priority = Priority.new
  end

  def create
    @priority = Priority.new(priorities_params)

    @totalPeso = Priority.sum(:weight)
    @porcentaje = 0

    if(@totalPeso > 0)
      @porcentaje = @priority.weight / @totalPeso
    end

    if (@porcentaje >= 0 and @porcentaje <= 1)
      if @priority.save
        redirect_to priorities_path,
          flash: {notice: "Prioridad creada exitosamente"}
      else
        render :new
      end
    else
      @notice = "El peso esta fuera de rango"
      render :new
    end

  end

  def edit
    @priority = Priority.find(params[:id])
  end

  def update
    @priority = Priority.find(params[:id])

    @totalPeso = Priority.sum(:weight)
    @porcentaje = 0.0

    if(@totalPeso > 0.0)
      @porcentaje = @priority.weight.to_f / @totalPeso.to_f
    end

    if (@porcentaje >= 0.0 and @porcentaje <= 1.0)
      if @priority.update(priorities_params)
        redirect_to priorities_path,
          flash: {notice: "Prioridad editada exitosamente"}
      else
        render :edit
      end
    else
      @notice = "El peso esta fuera de rango"
      render :edit
    end
  end

  def destroy
    @priority = Priority.find(params[:id])
    
    @dimentions = @priority.dimentions

    if @dimentions.any?
      redirect_to priority_path(@priority),
        flash: {notice: "No se puede borrar la prioridad porque tiene dimensiones"}
    else
      @priority.destroy
      redirect_to priorities_path,
        flash: {notice: "Prioridad borrada exitosamente"}
    end
  end

  private
    def priorities_params
      params.require(:priority).permit!
    end

end
