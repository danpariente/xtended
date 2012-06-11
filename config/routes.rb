Jobster::Application.routes.draw do
  
  resources :friendships, :memberships, :comments, :likes, :requests, :profiles, :preferences, :jobs
  
  resources :posts, :only => [:create, :destroy] do 
  	resources :comments
  	resources :likes
  end 
  
  resource :profile do 
  	resources :abouts
  	resources :preferences
  	resources :educations
  	resources :experiences
  	resources :competencies
  	resources :languages
  	resources :references
  end
  	
  get "home/show"
  get "home/landing"
  
  resources :activities do 
  	resources :comments
  	resources :likes
  end
  
  resources :statuses do 
  	resources :comments
  	resources :likes
  end
  
  resources :pages do 
  	resources :comments
  	resources :likes
  end
  
  resources :users do
  	#get :profile, :on => :collection  
  	get :change_profile, :on => :collection 
  	resources :pages
  end
  
  resources :events do
  	get :add, :on => :collection
  	put :assistance, :on => :collection
  	#post :page, :on => :collection
  	resources :pages
  end 	
  
  resources :groups do 
  	resources :pages
  end
  
  resources :messages do 
  	collection do 
  	  get :all
  	  get :inbox
  	  get :sentbox
  	  get :trash
  	end
  	resources :replies
  end

  
  devise_for :users do
    get "/login", :to => "devise/sessions#new"
    get "/logout", :to => "devise/sessions#destroy"
    get "/register", :to => "registrations#new"
  end
  
  match '/user/:username',
            :controller => 'users',
            :action => 'show_by_username' 
  
  match '/pages',
            :controller => 'pages',
            :action => 'index' 
            
  match '/contacts' => "contacts#contacts"
  
  match 'contacts/:id' => "contacts#contacts_user"
  
  match 'request/:user_id' => "requests#send_request"                                              
  match 'requests/pending' => "requests#pending"
  match 'profiles/:profile_id/preference/new' => "preferences#new"
  match 'profiles/:profile_id/education/new' => "educations#new"
  match 'profiles/:profile_id/experience/new' => "experiences#new"
  match 'profiles/:profile_id/competency/new' => "competencies#new"
  match 'profiles/:profile_id/language/new' => "languages#new"
  match 'profiles/:profile_id/reference/new' => "references#new"
            
  root :to => "home#show"            

  #match ':controller(/:action(/:id(.:format)))'
end
