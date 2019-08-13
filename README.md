# gem Devise, choses à faire

gem 'devise' dans Gemfile

$ bundle install

$ rails generate devise:install

==> fichier devise.rb dans config/initializers

    le fichier de configuration de Devise. On s'en servira par exemple pour paramétrer le service que l'on va utiliser pour les envois d'e-mails

==> fichier devise.en.yml dans config/locales

    un fichier contenant les messages d'erreur de Devise. Tu pourras utiliser ses version françaises quand tu seras plus à l'aise avec la gem

Mettre config.action_mailer.default_url_options = { host: 'localhost', port: 3000 } dans config/environments/develpment.rb

$ rails g devise user 

==> va créer et modif notamment trois fichiers

1) Le fichier de migration

Si un model User existe déjà, AVEC des entrées similaires, genre :email et :encrypted_password
==> supprimer ces colonnes

Mettre la def change en def self.up et ce qui suit en def self.down remove_add_index

2) Le fichier de model

RAS

3) Le fichier des routes

$ rails routes 

ATTENTION: pas de controllers user généré....

$ rails generate devise:views

$ rails g controller static_pages index secret

    Il est assez pratique de réunir toutes tes pages statiques dans un seul et même controller.

Fais en sorte que static_pages#index soit la root de ton application
==> dans routes.rb root 'static_pages#indes'

Mettre texten dans app/views/static_pages/index.html.erb 

	<ul>
	  <% if user_signed_in? %>
	    <li>
	      <%= link_to "Sign out", destroy_user_session_path, method: :delete %>
	    </li>

	    <li>
	      Voici ton email : <%= current_user.email %>
	    </li>

	    <li>
	      <%= link_to "Secret page", static_pages_secret_path %>
	    </li>

	    <li>
	      <%= link_to "Edit email / password", edit_user_registration_path %>
	    </li>

	  <% else %>
	    <li>    
	      <%= link_to "Sign in", new_user_session_path %>
	    </li>

	    <li>
	      <%= link_to "Sign up", new_user_registration_path %>
	    </li>

	  <% end %>
	</ul>




<!DOCTYPE html>
<html>
  <head>
    <title>Better Eventbrite</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>
    

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    

    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>

    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>

  </head>
  
  <header>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" <%= link_to "Better Eventbrite", events_path %> </a>
        <!-- lien alternatif pour garder la class="navbar..." vers le page /home-->

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <a class="nav-item nav-link active" <%= link_to "Les Events", events_path %>
            </a>
            <a class="nav-item nav-link active" <%= link_to "Crée ton Event!", new_event_path %>
            </a>
          </div>
        </div>

    

          <div class="profil">
            <form class="form-inline my-2 my-lg-0">
              <div class="btn-group">
                <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Ton profil
                </button>
                
                  <div class="dropdown-menu">
                    <p><%= link_to "Ton profil", "#" %></p>
                    <p> <%= link_to "Deconnecte-toi", "#" %></p>
                  </div>
              
              </div>
            </form>
         </div>

          <div class="profil">
            <form class="form-inline my-2 my-lg-0">
              <div class="btn-group">
                <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Crée ton compte/Connecte-toi
                </button>
                
                  <div class="dropdown-menu">
                    <p><%= link_to "Crée ton compte", "#" %></p>
                    <p> <%= link_to "Connecte-toi", "#" %></p>
                  </div>
              
              </div>
            </form>
          </div>
          

      </nav>
  </header>

  <body>

  <% flash.each do |key, value| %>
        <div class="alert alert-<%= key %>"><%= value %></div>
  <% end %>

      <%= yield %>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  </body>
</html>

