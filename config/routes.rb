Rssuni::Application.routes.draw do
  match "/articles(/:kind)" => "articles#index", :as => :articles
  
  root :to => "static#index"
end
