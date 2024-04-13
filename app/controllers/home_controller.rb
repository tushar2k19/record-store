# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @artists = Artist.all
    render json: @artists
  end
end
