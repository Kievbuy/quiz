class Admin::InstructionsController < Admin::BaseController
  before_action :set_instruction, only: [:show, :edit, :update, :destroy]
  before_action :set_categories,  only: [:new, :edit]
  before_action :prepare_data_to_binding, only: [:add_user, :remove_user]

  # GET /instructions
  def index
    @instructions = Instruction.all
  end

  # GET /instructions/1
  def show
  end

  # GET /instructions/new
  def new
    @instruction = Instruction.new
  end

  # GET /instructions/1/edit
  def edit
  end

  # POST /instructions
  def create
    @instruction = Instruction.new(instruction_params)

    if @instruction.save
      if params[:key].present? && params[:key] == "new"
        redirect_to new_admin_quiz_path(instruction_id: @instruction)
      else
        redirect_to admin_instruction_path(@instruction), notice: 'Instruction was successfully created.'
      end
    else
      render :new
    end
  end

  # PATCH /instructions/1
  def update
    if @instruction.update(instruction_params)
      redirect_to admin_instruction_path(@instruction), notice: 'Instruction was successfully updated.'
    else
      render :edit
    end
  end

  def add_user
    @instruction
    @instruction.users << @user
    redirect_to admin_user_path(@user), notice: 'Instruction added successfully.'
  end

  def remove_user
    @instruction.users.delete(@user)
    redirect_to admin_user_path(@user), notice: 'Instruction removed successfully.'
  end

  # DELETE /instructions/1
  def destroy
    @instruction.destroy
    redirect_to admin_instructions_url, notice: 'Instruction was successfully destroyed.'
  end

  private
    def set_instruction
      @instruction = Instruction.find(params[:id])
    end

    def set_categories
      @categories = Category.active
    end

    def prepare_data_to_binding
      @instruction = Instruction.find(instruction_params[:instruction_id])
      @user = User.find(instruction_params[:user_id])
    end

    def instruction_params
      params.require(:instruction).permit(:instruction_id,
                                          :user_id,
                                          :title,
                                          :body,
                                          :category_id,
                                          :repeat,
                                          :control,
                                          :active,
                                          :for_employees)
    end
end
