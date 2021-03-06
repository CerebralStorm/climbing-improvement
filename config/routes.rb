ClimbingImprovement::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'user_assessments#index'
  resources :questions
  resources :user_assessments
  resources :user_assessment_questions
  devise_for :users
end
