Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get("/",{:controller => , :action =>})
  get("/forex", { :controller => "forex", :action => "firstInput" })
  get("/forex/:fromPrevious", { :controller => "forex", :action => "secondInput" })
  get("/forex/:firstCurr/:secondCurr", { :controller => "forex", :action => "currOutput" })
  get("/", { :controller => "main", :action => "primary" })
end
