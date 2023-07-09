# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create destroy]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    @report = Report.find(params[:report_id])
    if @comment.save
      redirect_to @commentable, notice: t('comments.create.notice')
    else
      @comments = @report.comments
      render :'reports/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy!
    redirect_to @commentable, notice: t('comments.destroy.notice')
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :report_id)
  end

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
