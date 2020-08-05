class Members::MembersController < ApplicationController
  def show
  end

  def edit
  	@member = Member.find(params[:id])
  end

  def leave
  end
end
