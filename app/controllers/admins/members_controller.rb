class Admins::MembersController < ApplicationController
  def index
  		@members = Member.page(params[:id]).reverse_order
  end

  def show
  end

  def edit
  end
end
