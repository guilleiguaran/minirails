require 'action_controller'
require 'erb'
require 'tilt'

Router = ActionDispatch::Routing::RouteSet.new
Router.draw do
  root :to => 'site#index'
  match '/:name' => "site#hello"
end

class SiteController < ActionController::Metal
  def index
    self.response_body = "Hello World"
  end

  def hello
    template = Tilt.new('views/hello.erb')
    output = template.render(:name => params[:name])
    self.response_body = output
  end
end
