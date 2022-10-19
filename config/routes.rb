Rails.application.routes.draw do
  get("/forex", { :controller => "currencies", :action => "first_currency" })

  get("/forex/:symbol", { :controller => "currencies", :action => "from_currency" })

  get("/forex/:from_symbol/:to_symbol", { :controller => "currencies", :action => "conversion" })
end
