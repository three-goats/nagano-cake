class Members::MembersController < ApplicationController
  def show
  		@member = Member.find(current_member.id)
  end

  def edit
  end

  def leave
  end
end
