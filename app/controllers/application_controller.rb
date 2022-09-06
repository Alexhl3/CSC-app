class ApplicationController < ActionController::Base
  include Authorization
  include Authentication
  include Pagy::Backend
  include Notfound
  include Cantdelete
  include Language
end
