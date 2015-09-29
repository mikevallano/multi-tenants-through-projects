class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :about]
  def home
  end

  def about
  end

  def welcome
    @project = Project.new
    @projects = Project.all
  end

  def my_home
  end

  def dashboard
    @projects = Project.all
  end
end
