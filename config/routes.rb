Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :quizzes, only: %i[show index]
  resources :words, only: %i[index]
  resources :tutorials, only: [] do
    get 'quiz_show', on: :member
    get 'quiz_explanation', on: :member
    get 'next', on: :member
    get 'library_index', on: :collection
    get 'library_explanation/:word_id', to: 'tutorials#library_explanation', as: :library_explanation, on: :collection
  end
  resources :users, only: [] do
    resources :dialogues, only: %i[index]
  end  
  resources :explanations, only: [] do
    member do
      get :programming
      get :english
    end
  end
  namespace :api do
    namespace :v1 do
      resources :quizzes, only: [] do
        member do
          get :conversations
        end
      end
    end
  end

  get 'pages/privacy'
  get 'pages/terms'
  root "homes#top"
end