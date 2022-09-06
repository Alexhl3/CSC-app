module Cantdelete
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::DeleteRestrictionError do
      redirect_to products_path, alert: t('.cant_delete')
    end
  end
end