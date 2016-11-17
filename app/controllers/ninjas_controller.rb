class NinjasController < ApplicationController
  def index
  	
  end
  def success
  	@ninja = Ninja.last
  end
  def new
  	@ninja = Ninja.new(name: params[:name], description: params[:description])
  	if @ninja.valid?
  		@ninja.save
  	else 
  		[:name, :description].each { |field|
		  if @ninja.errors.has_key? field
		    @ninja.errors[field].each { |error|
		      flash[field] = field.to_s.capitalize + " " + error
		    }
		  end
		}
		flash[:fail] = "Sorry, failed to submit form. Please enter the required information."
  		redirect_to '/'
  		return	
  	end
  	redirect_to '/success'
  end
end

