class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about]
  def home
  end

  def about
  end

  def welcome
    @project = Project.new
  end

  def my_home
  end
end
