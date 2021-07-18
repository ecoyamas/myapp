Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # mount Split::Dashboard, at: 'split'

  # get  "sample/index"  => "sample#index"
  get "cats" => "cats#index"
end
