# encoding: utf-8
require 'sinatra/base'
require 'erb'
require 'web_translate_it'

class WebTranslateItServer < Sinatra::Base
  attr_reader :config
  
  dir = File.dirname(File.expand_path(__FILE__))

  set :views,  "#{dir}/views"
  set :public_folder, "#{dir}/public"
  set :static, true
  set :lock, true
      
  helpers do
    def wti_root
      ""
    end
    
    def highlight(value, expected)
      return if value.nil?
      print_value = value == true ? "Yes" : "No"
      value == expected ? "<em>#{print_value}</em>" : "<em class=\"information\">#{print_value}</em>"
    end
  end
  
  get '/' do
    @config = ::WebTranslateIt::Configuration.new('.')
    erb :index, :locals => { :config => config, :locale => "" }
  end
  
  get '/:locale' do
    @config = ::WebTranslateIt::Configuration.new('.')
    erb :index, :locals => { :config => config, :locale => params[:locale] }
  end
  
  post '/pull/' do
    `wti pull`
    redirect "/"
  end
  
  post '/pull/:locale' do
    `wti pull -l #{params[:locale]}`
    redirect "/#{params[:locale]}"
  end
  
  def self.start(host, port)
    puts "Starting wti server on port #{port}..."
    Dir::mkdir('log') unless FileTest::directory?('log')
    logger = ::File.open("log/webtranslateit.log", "a+")
    STDOUT.reopen(logger)
    STDERR.reopen(logger)
    WebTranslateItServer.run! :host => host, :port => port
  end
end