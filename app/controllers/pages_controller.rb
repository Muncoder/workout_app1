class PagesController < ApplicationController

  def home
  	@athletes = User.all.order("created_at desc")
  end

end
