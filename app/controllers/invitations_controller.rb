class InvitationsController < ApplicationController
  def new
    @wavy = [true, false].sample
  end
end
