class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = current_user.answers.all.order(created_at: :desc)
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @question = Question.find_by_id(@answer.question.id)
  end

  # GET /answers/new
  def new
    @answer = current_user.answers.new
    @question = Question.find_by_id(params[:question_id])
  end

  # GET /answers/1/edit
  def edit
    @question = Question.find_by_id(@answer.question.id)
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = current_user.answers.new(answer_params)
    @question = Question.find_by_id(answer_params[:question_id])
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { redirect_to new_answer_path(question_id: @question.id), notice: @answer.errors.full_messages.to_sentence }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { redirect_to edit_answer_path, notice: @answer.errors.full_messages.to_sentence }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = current_user.answers.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:content, :user_id, :question_id)
    end
end
