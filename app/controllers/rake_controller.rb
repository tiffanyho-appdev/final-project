require 'rake'

Rake::Task.clear # necessary to avoid tasks being loaded several times in dev mode
Scrape:Yelp::Application.load_tasks # providing your application name is 'sample'

class RakeController < ApplicationController

  def yelp
    Rake::Task[params[:task]].reenable # in case you're going to invoke the same task second time.
    Rake::Task[params[:task]].invoke
  end

end