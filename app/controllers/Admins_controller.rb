class AdminsController < ApplicationController
    

    def sign_in
      
       admin = Admin.find_by(username: params[:username])
       if admin && admin.authenticate(params[:password])
        render json: { username: admin.username, token: generate_token({ id: admin.id})}
       else
        render json: { message: "Failure!" }
       end
    end

    def validate
        admin = get_admin
        if admin 
            render json: { username: admin.username, token: generate_token({ id: admin.id})}
           else
            render json: { message: "Failure!" }
           end
    end

end