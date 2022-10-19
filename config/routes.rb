Rails.application.routes.draw do
  get("/forex", { :controller => "currencies", :action => "first_currency" })

  get("/forex/:symbol", { :controller => "currencies", :action => "from_currency" })
end
