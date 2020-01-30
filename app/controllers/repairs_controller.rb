class RepairsController < ApplicationController
  before_action :set_machine, only: [:index, :new, :create,:show,:destroy]

  def index
    # binding.pry

    @repairs = Repair.where(machine_id: @machine)
    
  end

  def new
    @machine = Machine.find(params[:machine_id])
    @repair = Repair.new
    if @machine.parts.empty?
      @parts = Part.all
    else 
      @parts = @machine.parts
    end
  end

  def create
    @repair = Repair.new(repair_params)
    # @repair.save
    if @repair.save
      redirect_to "/repairs/#{@repair.id}/edit"
    else
      
      # render 'repairs/new', id: params[:id]
      redirect_to "/machines/#{@machine.id}/repairs/new", flash: {error: '入力フォームにエラーがあります！'}
    end
    
  end

  def edit
    @repair = Repair.find(params[:id])
    @parts = @repair.parts

  end

  def update
    # binding.pry
    @repair = Repair.find(params[:id])
    @repair.update(edit_params)
    # @parts = @repair.parts
    redirect_to "/machines/#{@repair.machine_id}/repairs/#{@repair.id}"
    
    
    # @parts.save
  end

  def show
    @repair = Repair.find(params[:id])
    # @parts = @repair.parts
    @user = User.find(@repair.user_id)
    respond_to do |format|
      format.html # show.html.erb
      format.pdf do
        # PDF文書を作成
        pdf = RecordPdf.new(@repair,@user)
        # PDFに "Hello, Prawn!!" と表示する
        pdf.text ""
        # 画面にPDFを表示する
        # disposition: "inline" によりPDFはダウンロードではなく画面に表示される
        send_data pdf.render,
          filename:    "#{@repair}.pdf",
          type:        "application/pdf",
          disposition: "inline"
      end
    end
  end

  def destroy
    @repair = Repair.find(params[:id])
    @repair.destroy
    redirect_to "/machines/#{@machine.id}/repairs"
  end

  private

  def repair_params
    params.require(:repair).permit(:title, :text, {:part_ids => []},parts_attributes: [:quentity, :replenishment, :id]).merge(machine_id: @machine.id).merge(user_id: current_user.id)
    
    
    # .merge(parts_attributes: [:replenishment])
  end

  def edit_params
    params.require(:repair).permit(:title, :text, {part_ids: []},parts_attributes: [:quentity, :replenishment, :id])
  end

  def set_machine
    @machine = Machine.find(params[:machine_id])
  end

  def part_params
    params.require(:part).permit(:name, :quentity, :replenishment)
  end
end
