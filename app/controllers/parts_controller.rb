class PartsController < ApplicationController
  before_action :set_part, only: [:edit, :show, :update]
  def  index
    # @parts = Part.all
    @parts = Part.search(params[:search])
  end
  
  def new
    @part = Part.new
    @machines = Machine.all
  end
  def create
    @part = Part.new(part_params)
    if @part.save
      redirect_to parts_path
    else
      redirect_to "/parts/new" , flash: {error: '入力フォームにエラーがあります！'}
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    
    if @part.update(part_params)
      redirect_to edit_part_path(@part.id)
    else
      render :edit
    end
  end

  def destroy
    @part = Part.find(params[:id])
    @part.destroy
    redirect_to "/parts"
  end

  def search
    @machine = Machine.search(params[:keyword])
  end
  
  private

  def part_params
    params.require(:part).permit(:name, :quentity, :replenishment, {:machine_ids => []})
  end

  def set_part
    @part = Part.find(params[:id])
  end

  def search
    @part = Part.search(params[:keyword])
  end
  
end
