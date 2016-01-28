The following installation steps are suggested for this
web application because it typically requires some extra
setup... From within the application root directory:

#1. Before initially building the application's database

    The Java & Apache based Elasticsearch server MUST be installed on your machine as follows:

      $ brew install elasticsearch

      ** This will FAIL when it attempts to install if you don't already have Oracle Java on your
      machine. If it does fail, just follow the new prompts to install Java before ES. For example:

      $ brew cask install ... (not the full line)

#2. Bundle to install rubygems, then prep the database

    $ bundle install

      The command bundle exec can be abbreviated to 'be'

      $ killall ruby         <-- stops any running servers
      $ be rake db:drop      <-- drops any existing DB
      $ be rake db:create    <-- creates the new DB
      $ be rake db:migrate   <-- sets up the new DB tables
      $ be rake db:seed      <-- populates DB w/ test data

#3.The last command, db:seed may cause an error
   ... involving Faraday and localhost:9200. That''s
   because the Elasticsearch search server must be running
   before 'be rake db:seed' executes. To run elasticsearch
   open a separate terminal window and type:

      $ elasticsearch

   Next, back in your original terminal window, re-type:

      $ be rake db:seed

#4. Before running this app for the first time
    ... you must also create the elasticsearch index. You can do this by typing:

      $ be rake searchkick:reindex CLASS=Game

#5. Now run the Rails server and open the web page
    ... to view the application:

      $ rails server       <-- or abbreviate to 'rails s'

      In your web browser, navigate to --> localhost:3000

--------------------------------------------------------------
NOTE:

We learned how to incorporate ElasticSearch, and originally hoped
      to include autocomplete by using typeahead.js, but we
      ran out of time from the instructions on this website:

	http://blog.ragnarson.com/2013/10/10/adding-search-and-autocomplete-to-a-rails-app-with-elasticsearch.html

We also used the APIs of boardgamegeek.com to incorporate game content:

	http://boardgamegeek.com/wiki/page/BGG_XML_API
	https://bgg-json.azurewebsites.net/