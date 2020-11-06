class MemosController < ApplicationController
  before_action :authenticate_user!

  def index 
    @memos = Memo.includes(:user)
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(params_memo)
    @memo.save
    redirect_to user_memos_path(current_user)

  end

  private
  def params_memo
    params.require(:memo).permit(:title, :content).merge(user_id: current_user.id)
  end
end
