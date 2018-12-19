class Admin::QuizzesController < Admin::BaseController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  before_action :set_instructions, only: [:new, :edit]
  before_action :set_instruction, only: :new

  # GET /admin/quizzes
  def index
    @quizzes = Quiz.all
  end

  # GET /admin/quizzes/1
  def show
  end

  # GET /admin/quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /admin/quizzes/1/edit
  def edit
  end

  # POST /admin/quizzes
  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      if params[:key].present? && params[:key] == "dashboard"
        @instruction = @quiz.instructions.last
        redirect_to admin_root_path(instruction_id: @instruction.id), flash: { show_modal: true }
      else
        redirect_to admin_quiz_path(@quiz), notice: 'Quiz was successfully created.'
      end
    else
      render :new
    end
  end

  # PATCH/PUT /admin/quizzes/1
  def update
      if @quiz.update(quiz_params)
        redirect_to admin_quiz_path(@quiz), notice: 'Quiz was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /admin/quizzes/1
  def destroy
    @quiz.destroy
    redirect_to admin_quizzes_url, notice: 'Quiz was successfully destroyed.'
  end

  private
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def set_instructions
      @instructions = Instruction.active
    end

    def set_instruction
      @instruction = Instruction.find(params[:instruction_id]) if params[:instruction_id]
    end

    def quiz_params
      params.require(:quiz).permit(:title,
                                   :level,
                                   :active,
                                   :answers_to_pass,
                                   :percent_to_pass,
                                   :pool_size,
                                   instruction_ids: [])
    end
end
