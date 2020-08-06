class Admins::MembersController < ApplicationController
  def index
  end

  def show
  	@member = Member.find(params[:id])
  end

  def edit
  end
end
