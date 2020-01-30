class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
    @machine = Machine.find_by(id:@image.machine_id)
  end

end
