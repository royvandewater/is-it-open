class GangplanksController < ApplicationController
  def show
    @gangplank = Gangplank.first
  end

  def edit
    @gangplank = Gangplank.first
  end

  def update
    @gangplank = Gangplank.first
    @gangplank.update_attributes status_params
    redirect_to root_path
  end

private
  def status_params
    params.require(:gangplank).permit :status
  end
end
