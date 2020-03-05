class ContactsController < ApplicationController
    # GET request to /contact us
    #show new contact form
    def new
        @contact = Contact.new
    end

    #POST request /contacts
    def create
        #Mass assignment of form fields into contact object
        @contact = Contact.new(contact_params)
        #Save the contact object to the database
        if @contact.save 
            #store form fields via parameters into variables
            name = params[:contact][:name]
            email = params[:contact][:email]
            body = params[:contact][:comments]
            #plug variables into contact mailer email method and send eail

            ContactMailer.contact_email(name, email, body).deliver
            #store success in flash has and redirect to new actions
            flash[:success] = "Thank you for contacting us. 
            We will reply as soon as we can."
            redirect_to root_path
        else 
            #if contact object doesnt save store error in flash hash 

            #and redirect

            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to contact_us_path
        end 
    end 

    private
    #to collect data from form we need to use
    #strong parameters and whitelist the form fields
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end 
end