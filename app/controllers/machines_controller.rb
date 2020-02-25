class MachinesController < ApplicationController
before_action :set_machine, only: [ :edit, :show, :update]
  
  def index
    @machines = Machine.search(params[:search])
  end
  def new
    @machine = Machine.new
    @machine.images.new
    @parts = Part.all
  end

  def create
    binding.pry
    @machine = Machine.new(machine_params)
    if @machine.save
      redirect_to root_path
    else
      redirect_to "/machines/new", flash: {error: '入力フォームにエラーがあります！'}
    end
  end

  def edit
    @images = @machine.images
    @parts = Part.all
    if @images.empty?
      @machine.images.new
    end
  end

  def update
    if @machine.update(machine_params)
      # binding.pry
      redirect_to machine_path(@machine.id)
    else
      render :edit
    end

  end

  def show
    @images = Image.where(machine_id: @machine)
    @parts = Part.find(@machine.part_ids)
  end

  def destroy
    @machine = Machine.find(params[:id])
    @machine.destroy
    redirect_to root_path, alert: 'alertメッセージ'
  end

  def search
    @machine = Machine.search(params[:keyword])
  end

  private

  def machine_params
    params.require(:machine).permit(:name, {:part_ids => []},images_attributes: [:image, :_destroy, :id])
  end


  def set_machine
    @machine = Machine.find(params[:id])
  end


end
