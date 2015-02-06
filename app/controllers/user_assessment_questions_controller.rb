class UserAssessmentQuestionsController < ApplicationController
  before_action :set_user_assessment_question, only: [:show, :update, :destroy]

  respond_to :html

  def update
    @user_assessment_question.update(user_assessment_question_params)
    @user_assessment = @user_assessment_question.user_assessment
    @user_assessment.compute_totals
    next_assessment_question = @user_assessment.next_question(@user_assessment_question)
    next_assessment_question = @user_assessment.user_assessment_questions.first unless next_assessment_question.present?
    if params[:finish].present?
      redirect_to user_assessment_path(@user_assessment)
    else
      redirect_to edit_user_assessment_path(@user_assessment, user_assessment_question_id: next_assessment_question.id)
    end
  end

  private
    def set_user_assessment_question
      @user_assessment_question = UserAssessmentQuestion.find(params[:id])
    end

    def user_assessment_question_params
      params.require(:user_assessment_question).permit(:value)
    end
end
