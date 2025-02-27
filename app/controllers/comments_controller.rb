class CommentsController < ApplicationController
    def create
        @comment = current_user.comments.new(comment_params)

        if !@comment.save
            flash[:notice] = @comment.errors.full_messages.to_sentence
        end
        redirect_to recipe_path(params[:recipe_id])
    end

    private
    def comment_params
        params.require(:comment).permit(:context).merge(recipe_id: params[:recipe_id])
    end
end
