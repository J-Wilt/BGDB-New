class PagesController < ApplicationController
require 'will_paginate'
  def home
    @posts = Post.order(created_at: :desc)
                  .paginate(:page => params[:page], :per_page => 3)
  end

  def about
  end
  
  def index
     @posts = Post.order(created_at: :desc)
  end
 
  

end