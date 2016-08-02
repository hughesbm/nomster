class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @place = Place.find(params[:place_id])
    @comment = @place.comments.create(comment_params.merge(user: current_user))
    if @comment.valid?
      flash[:success] = "Review successfully added."
      redirect_to place_path(@place)
    else
      redirect_to place_path(@place)
      flash[:error] = flash_error_message(@comment)
    end
  end

  def flash_error_message(arg)
    "Could not add review for the following reasons: #{arg.errors.full_messages.join(', ')}"
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end

end
