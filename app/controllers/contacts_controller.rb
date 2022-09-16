class ContactsController < ApplicationController
  skip_before_action :protect_pages

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to homes_path, notice: t('.created')
    else
      render :new, alert: t('.error')
    end
  end
end
