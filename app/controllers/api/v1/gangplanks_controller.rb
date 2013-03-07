class Api::V1::GangplanksController < ApplicationController
  protect_from_forgery :with => :null_session
  respond_to :json

  def show
    respond_with Gangplank.first.to_json(:methods => :open)
  end

  def update
    respond_with Gangplank.first.update_attributes status_params
  end

protected
  def status_params
    params.require(:gangplank).permit :open_until
  end
end
