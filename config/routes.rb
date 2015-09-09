class SubdomainPresent
  def self.matches?(request)
    restricted_subdomains = %w{ www admin }
    request.subdomain.present? && !restricted_subdomains.include?(request.subdomain)
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end


Rails.application.routes.draw do
  resources :invites
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :roles
  resources :accounts

  constraints(SubdomainPresent) do
    root 'pages#my_home', as: :subdomain_root
    get 'welcome', to: 'pages#welcome', as: :welcome
    resources :projects do
      resources :posts
    end

    resources :memberships

  end

  constraints(SubdomainBlank) do
    root 'pages#home'
    get 'pages/about'
  end

end
