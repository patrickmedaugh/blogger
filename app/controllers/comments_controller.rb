class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    if @comment.save
      redirect_to article_path(@comment.article)
    else
      render :show
    end
  end

  def destroy
    puts "Parameters are #{params}"
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to article_path(@comment.article)
  end


  private

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

end
