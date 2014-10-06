class ContactsController < ApplicationController
  # GET /contacts/new
  def new
    @contact = Contact.new
  end


  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    
    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: 'Contato enviado com sucesso.'  }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end
end
