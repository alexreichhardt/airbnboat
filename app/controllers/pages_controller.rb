class PagesController < ApplicationController
  def home
    @error = params[:error]
  end
end
