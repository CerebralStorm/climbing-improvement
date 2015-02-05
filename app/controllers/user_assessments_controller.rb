class UserAssessmentsController < ApplicationController
  before_action :set_user_assessment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_assessments = UserAssessment.all
    respond_with(@user_assessments)
  end

  def show
    respond_with(@user_assessment)
  end

  def new
    @user_assessment = UserAssessment.new
    respond_with(@user_assessment)
  end

  def edit
  end

  def create
    @user_assessment = UserAssessment.new(user_assessment_params)
    @user_assessment.save
    respond_with(@user_assessment)
  end

  def update
    @user_assessment.update(user_assessment_params)
    respond_with(@user_assessment)
  end

  def destroy
    @user_assessment.destroy
    respond_with(@user_assessment)
  end

  private
    def set_user_assessment
      @user_assessment = UserAssessment.find(params[:id])
    end

    def user_assessment_params
      params.require(:user_assessment).permit(:user_id)
    end
end
