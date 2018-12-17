class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /admin/questions
  def index
    @questions = Question.all
  end

  # GET /admin/questions/1
  def show
  end

  # GET /admin/questions/new
  def new
    @question = Question.new
  end

  # GET /admin/questions/1/edit
  def edit
  end

  # POST /admin/questions
  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to admin_question_path(@question), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/questions/1
  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question), notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/questions/1
  def destroy
    @question.destroy
    redirect_to admin_questions_url, notice: 'Question was successfully destroyed.'
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:body, :active, quiz_ids: [], options_attributes: [:id, :body, :correct, :_destroy])
    end
end
