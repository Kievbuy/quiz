class Admin::DashboardController < Admin::BaseController
  before_action :set_instruction, only: :index

  def index
    @instructions = Instruction.all.order(active: :desc, created_at: :desc)
    @instruction ||= Instruction.new
  end

  private

  def set_instruction
    @instruction = Instruction.find(params[:instruction_id]) if params[:instruction_id]
  end

end
