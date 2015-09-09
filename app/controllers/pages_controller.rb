class PagesController < ApplicationController
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
