class SearchsController < ApplicationController
	def index
        if !(params[:fname].present?)
            flash[:alert] = "Please enter something...."
            #render plain: "Please enter something in search field...."
            redirect_to root_path
        else 
            new_string = params[:fname].to_s
            new_string[0] = new_string[0].capitalize!
            st=new_string.to_sym
            #self.fname[0] = self.fname[0].capitalize
           # new_string = new_string.slice(0,1).capitalize + new_string.slice(1..len-1)
            @articles = Article.where("fname LIKE ? OR lname Like ?", "%#{st}%", "%#{st}%")
        end
    end
end