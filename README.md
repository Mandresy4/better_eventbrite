# Lien heroku : http://better-eventbrite.herokuapp.com/



# gem Devise, choses à faire

## gem 'devise' dans Gemfile

## $ bundle install

## $ rails generate devise:install

==> fichier devise.rb dans config/initializers

    le fichier de configuration de Devise. On s'en servira par exemple pour paramétrer le service que l'on va utiliser pour les envois d'e-mails

==> fichier devise.en.yml dans config/locales

    un fichier contenant les messages d'erreur de Devise. Tu pourras utiliser ses version françaises quand tu seras plus à l'aise avec la gem

Mettre config.action_mailer.default_url_options = { host: 'localhost', port: 3000 } dans config/environments/develpment.rb

## $ rails g devise user 

==> va créer et modif notamment trois fichiers

1) Le fichier de migration

    def self.up
    => ce que devise va ajouter à la table en rails db:migrate

    Si un model User existe déjà, AVEC des entrées similaires, genre :email et :encrypted_password
    ==> supprimer ces colonnes

    end

    def self.down
    => ce que devise devra enlever en rollback, cad ce qu'il ajoute!!

    ex: remove_add_index
        remove_column...
    mettre éventuellement un begin/rescue/end

    end


2) Le fichier de model

RAS

3) Le fichier des routes

$ rails routes 

ATTENTION: pas de controllers devise user généré....

# ATTENTION: mettre les routes devise en premier, sinon les routes des autres controllers, notamment users), vont croiser celles de devise!!!!!

Par ex:

    Rails.application.routes.draw do

      devise_for :users
      resources :users, only: [:show, :edit, :update]
      resources :events

      root 'events#index'
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    end


## $ rails generate devise:views

Mettre les liens des views

Devise utilise des helpers importants:

- user_signed_in?
=>s'utilise en condition d'accès à certaine page: "si l'utilisateur est connecté..."

- current_user
=> le user devient current_user quand l'utilisateur est connecté

- athenticate_user!: 
=> s'utilise dans les callbacks

Pimpage de formulaires: ex

    <div class="container">
      <div class="row">
        <div class="col-md-6 offset-md-3">
          <br><br><br>
          <%= form_for resource, as: resource_name, url: registration_path(resource_name), html: { class: "form-signin mt-3" } do |f| %>
            <h1 class="h3 mb-3 font-weight-normal text-center">Sign up</h1>
            <%= devise_error_messages! %>
            <div class="form-group">
              <%= f.label :email, "Email" %><br />
              <%= f.email_field :email, autofocus: true, autocomplete: "email", class: "form-control" %>
            </div>
            <div class="form-group">
              <%= f.label :password %>
              <% if @minimum_password_length %>
              <em>(<%= @minimum_password_length %> characters minimum)</em>
              <% end %><br />
              <%= f.password_field :password, autocomplete: "new-password", class: "form-control" %>
            </div>
            <div class="form-group">
              <%= f.label :password_confirmation %><br />
              <%= f.password_field :password_confirmation, autocomplete: "new-password", class: "form-control" %>
            </div>
            <div class="actions mt-5">
              <%= f.submit "Sign up", class: "btn btn-lg btn-primary btn-block" %>
            </div>
          <% end %>
          <%= render "devise/shared/links" %>
        </div>
      </div>
    </div>



# Mettre dans environments/develepment config.action_mailer.default_url_options = { :host => 'YOURAPPNAME.herokuapp.com' }

## AVOIR COMMITÉ!!!!

## $ git push heroku master

## $ heroku run rails db:create

## $ heroku run rails db:migrate

## $ heroku run rails db:seed

# ATTENTION, POUR RENDRE LES IMAGES DANS HEROKU:

==> dans config/environments/production.rb 

Mettre "config.assets.compile = false" en "true"






 <!-- 

<div class="form container">
  <%= form_tag url_for(action: 'create'), method: "post" do %>
    
    <div class="form-group">
      <%= label_tag 'Nom' %><br>
      <%= text_field_tag 'last_name' %>
      <br /> <br />
    </div>
    
    <div class="form-group">
      <%= label_tag 'Prénom' %><br>
      <%= text_field_tag 'first_name'%>
      <br /> <br />
    </div>

    <div class="form-group">
      <%= label_tag 'Description' %><br>
      <%= textarea_field_tag 'description' %>
      <br /> <br />
    </div>

    <div class="form-group">
      <%= label_tag 'Email' %><br>
      <%= text_field_tag 'email'%>
      <br /> <br />
    </div>


    <%= submit_tag "Crée ton event" %>

   <% end %>
 </div>

-->


