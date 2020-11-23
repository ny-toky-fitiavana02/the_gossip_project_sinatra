#require 'bundler'
#Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base

  # gossips index
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  
  # show a specific gossip
  get '/gossip/:id' do
    erb :show, locals: {gossip: Gossip.find(params['id'])}
  end
  
  # display new gossip form
  get '/gossips/new/' do
    erb :new_gossip
  end
  
  # save new gossip to DB
  post '/gossips/new/' do
  
    Gossip.new(params['gossip_author'], params['gossip_content']).save
    
    redirect '/'
    
    puts "Salut, je suis dans le serveur"
    puts "Ceci est le contenu du hash params : #{params}"
    puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
    puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
  end

  # show edit form for a gossip
  get '/gossips/:id/edit' do
    erb :edit_gossip, locals: {gossip: Gossip.find(params['id'])}
  end

  # update a specific gossip
  # TODO
  post '/gossips/:id/edit' do
    puts "Update gossip"
    Gossip.new(params['gossip_author'], params['gossip_content']).update(params['id'])
    
    redirect '/gossip/' + params['id']
  end


end
