class FactorsController < ApplicationController
  def index
    @factors = Factor.joins(dimention: :priority).order('priorities.title asc, dimentions.title asc, factors.weight desc') 
    
    if params[:keyword].present?
      q = params[:keyword]
      @factors = @factors.where("priorities.title LIKE '%#{q}%' OR dimentions.title LIKE '%#{q}%' OR factors.title LIKE '%#{q}%'")
    end
    
    if request.xhr?
      render partial: "table", locals: {factors: @factors}
    end

  end

  def show
    @factor = Factor.find(params[:id])
    @technologies = @factor.technologies
  end

  def new
    @factor = Factor.new
    @priorities = Priority.order(:title)
  end

  def create
    @factor = Factor.new(factors_params)

    @factors = Factor.order(:weight)
    q = @factor.dimention_id
    @factors = @factors.where("factors.dimention_id = #{q}")
    @totalPeso = @factors.sum(:weight)
    @porcentaje = 0.0

    if(@totalPeso > 0.0)
      @porcentaje = @factor.weight.to_f / @totalPeso.to_f
    end

    if (@porcentaje >= 0.0 and @porcentaje <= 1.0)
      if @factor.save
        redirect_to factors_path,
          flash: {notice: "Factor creado exitosamente"}
      else
        render :new
      end
    else
      @notice = "El peso esta fuera de rango"
      render :new
    end
  end

  def edit
    @factor = Factor.find(params[:id])
    @priorities = Priority.order(:title)
  end

  def update
    @factor = Factor.find(params[:id])

    @factors = Factor.order(:weight)
    q = @factor.dimention_id
    id = @factor.id
    @factors = @factors.where("factors.dimention_id = #{q} and factors.id != #{id}")
    @totalPeso = @factors.sum(:weight)
    @porcentaje = 0.0

    if(@totalPeso > 0.0)
      @porcentaje = @factor.weight.to_f / @totalPeso.to_f
    end

    if (@porcentaje >= 0.0 and @porcentaje <= 1.0)
      if @factor.update(factors_params)
        redirect_to factors_path,
          flash: {notice: "Factor editado exitosamente"}
      else
        render :edit
      end
    else
      @notice = "El peso esta fuera de rango"
      render :edit
    end
  end

  def destroy
    @factor = Factor.find(params[:id])

    @technologies = @factor.technologies

    if @technologies.any?
      redirect_to factor_path(@factor),
        flash: {notice: "No se puede borrar el factor porque tiene AMT&M"}
    else
      @factor.destroy
      redirect_to factors_path,
        flash: {notice: "Factor eliminado exitosamente"}
    end
  end

  private
    def factors_params
      params.require(:factor).permit!
    end

end
