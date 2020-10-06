Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'blogs' => 'main#index', as: 'blogs'
  get 'blogs/new' => 'main#new', as: 'new_blog'
  post 'blogs' => 'main#create'
  get 'blogs/:id' => 'main#show', as: 'blog'
  get 'blogs/:id/edit' => 'main#edit', as: 'edit_blog'
  patch 'blogs/:id' => 'main#update'
  delete 'blogs/:id' => 'main#destroy', as: 'delete_blog'
end
