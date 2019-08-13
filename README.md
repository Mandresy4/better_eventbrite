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

Mettre les liens des views

# Mettre dans environments/develepment config.action_mailer.default_url_options = { :host => 'YOURAPPNAME.herokuapp.com' }

$ git push heroku master

$ heroku run rails db:create




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


