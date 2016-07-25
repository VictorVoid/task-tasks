Rails.application.routes.draw do
    #get 'login/new'
	
	#  Para saber as rotas que tenho rodando:
	#  rake routes
	#  Prefix Verb URI Pattern       Controller#Action
	#  root GET  /                 login#new
	#  signup GET  /signup(.:format) signup#new
	#
	# controller => classe => LoginController
	# action => método => new
	# LoginController#new 
	root to: "login#new", via: :get
   	get "/signup", to: "signup#new"
end
