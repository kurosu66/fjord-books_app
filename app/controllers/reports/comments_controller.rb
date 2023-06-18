# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create update]
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: 'success'
    else
      # TODO: 失敗した場合は入力していた内容を表示する
      redirect_to @commentable, notice: '失敗!!'
    end
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :report_id)
  end

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
