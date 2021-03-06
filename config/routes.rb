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

  devise_for :users, :controllers => {:registrations => "registrations"}

  constraints(SubdomainPresent) do
    root 'pages#account_home', as: :subdomain_root
    get 'welcome', to: 'pages#welcome', as: :welcome
    get 'dashboard', to: 'pages#dashboard', as: :dashboard

    namespace :admin do
      resources :users
    end

    resources :projects do
      resources :posts
      resources :chats
    end

    resources :memberships
    resources :invites
    resources :memberinvites
    resources :roles
    resources :participations
  end

  constraints(SubdomainBlank) do
    root 'pages#home'
    get 'pages/about'
    resources :accounts
  end

end
