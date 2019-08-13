# Lien heroku : http://better-eventbrite.herokuapp.com/

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




