IsItOpen::Application.routes.draw do

  root :to => 'gangplanks#show'

  namespace :api do
    namespace :v1 do
      resource :gangplank
    end
  end

  get '/*path' => 'gangplanks#show'
end
