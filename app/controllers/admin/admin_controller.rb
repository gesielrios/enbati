class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :authenticate_user!
end