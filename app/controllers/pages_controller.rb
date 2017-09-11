class PagesController < ApplicationController

  def home
    @launches = SpaceXApi.new.launches
  end
end
