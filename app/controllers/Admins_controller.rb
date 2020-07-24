class AdminsController < ApplicationController
    

    def create
        admin = Admin.create(admin_signup_params)
        if admin 
            render json: { username: admin.username, token: generate_token({ id: admin.id})}
           else
            render json: { message: "Failure!" }
           end
    end

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

    private

    def admin_params
        params.require(:admin).permit(:username, :password_digest)
    end

    def admin_signup_params
        params.permit(:username, :password)
    end

end