Rails.application.routes.draw do
  devise_for :users

  root to: 'home#questions'

  resources :questions
  resources :answers
  resources :topics
  
  get '/question/:question_id', to: 'home#question', as: :home_question
  get '/follow_user/:id', to: 'followings#follow_user', as: :follow_user
  get '/follow_topic/:id', to: 'followings#follow_topic', as: :follow_topic
  get '/followed_users', to: 'followings#followed_users', as: :followed_users
  get '/followed_topics', to: 'followings#followed_topics', as: :followed_topics
end
