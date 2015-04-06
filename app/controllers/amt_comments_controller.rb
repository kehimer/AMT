class AmtCommentsController < ApplicationController

  def new
    @technology = Technology.find(params[:technology_id])
    @amt_comment = AmtComment.new
  end

  def create
    @technology = Technology.find(params[:technology_id])
    @amt_comment = @technology.amt_comments.build(amt_comment_params)

    if current_user.present?
      @amt_comment.user_id = current_user.id
    end

    if @amt_comment.save
      redirect_to @technology,
          flash: {notice: "Comentario creado exitosamente"}
    else
      render :new
    end

  end
private
    def amt_comment_params
      params.require(:amt_comment).permit!
    end
end
