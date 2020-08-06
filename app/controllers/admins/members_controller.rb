class Admins::MembersController < ApplicationController
  def index
  		@members = Member.page(params[:id]).reverse_order
  end

  def show
  	@member = Member.find(params[:id])
  end

  def edit
  end
end
