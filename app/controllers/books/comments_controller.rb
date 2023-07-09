# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    @book = Book.find(params[:book_id])
    if @comment.save
      redirect_to @commentable, notice: t('comments.create.notice')
    else
      @comments = @book.comments
      render :'books/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @commentable, notice: t('comments.destroy.notice')
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :book_id)
  end

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end
end
