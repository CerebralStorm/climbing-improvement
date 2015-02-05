class UserAssessmentsController < ApplicationController
  before_action :set_user_assessment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_assessments = current_user.user_assessments.order('created_at')
    respond_with(@user_assessments)
  end

  def show
    respond_with(@user_assessment)
  end

  def edit
    @user_assessment_question = @user_assessment.first_unanswered_question if params[:continue].present?
  end

  def new
    create
  end

  def create
    @user_assessment = current_user.user_assessments.create!
    redirect_to edit_user_assessment_path(@user_assessment)
  end

  def destroy
    @user_assessment.destroy
    respond_with(@user_assessment)
  end

  private
    def set_user_assessment
      @user_assessment = UserAssessment.find(params[:id])
      if params[:user_assessment_question_id].present?
        @user_assessment_question = UserAssessmentQuestion.find(params[:user_assessment_question_id])
      else
        @user_assessment_question = @user_assessment.user_assessment_questions.first
      end
    end
end
