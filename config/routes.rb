LearningZoneLogger::Application.routes.draw do
  
  resource :rise_and_shine
  
  resources :students do
    get 'hours_per_week_by_reason', :on => :member
    get 'hours_per_period_by_reason', :on => :member
    resources :sessions
  end
  
  resources :staff, :users
  resource :dashboard
  
  namespace :import do
    resources :on_calls do
      post 'mail', :on => :member
    end
  end
  
  resources :year_groups do
    get 'students_per_week_by_reason', :on => :member
    get 'students_per_week_by_gender', :on => :member
    get 'students_per_week_by_ethnicity', :on => :member
  end  
  
  resource :user_sessions
  resources :set_passwords
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  
  match '/on_calls' => "dashboards#on_calls", :as => :on_calls
  match '/exclusions' => "dashboards#exclusions", :as => :exclusions
  root :to => "dashboards#show"
  
end
