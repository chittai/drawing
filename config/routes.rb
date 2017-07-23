Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'toppages#index'
  get 'draw' , to: 'toppages#index'
  
  get 'create' , to: 'toppages#create'
  
  get 'getresult' , to: 'toppages#getVisionAPIresult'

end
