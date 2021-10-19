Rails.application.routes.draw do
  resources :events
  resources :turmas
  resources :teachers
  resources :students
  resources :series
	resources :series
	resources :subjects
	resources :years
	resources :schools
	resources :matriculas
  resources :situations
  
  
  
  namespace :relatorios do
    get 'turmas'
    get 'matriculados'
  end	

	root 'home#index'
	devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'sessions', controller: 'application', action: 'set_session'
  
  get 'mudar_turma', controller: 'matriculas', action: 'mudar'
  #get 'mudar_turma/:id', controller: 'matriculas#', action: 'alunos_mudar'

  get 'mudar_turma/:id', controller: 'matriculas', action: 'alunos_mudar', as: 'alunos_mudar'


  get '/student/:cpf', to: 'students#mostrar', as: 'lista'
end
