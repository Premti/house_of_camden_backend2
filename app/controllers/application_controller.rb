class ApplicationController < ActionController::API

    def secret
        ENV["MY_SECRET"]
    end

    def generate_token(data)
        data["time"] = Time.now.to_i
        JWT.encode(data, secret)
    end

    
    def decode_token
        token = request.headers["Authorization"]
        JWT.decode(token, secret).first["id"]
    end
    
    def get_admin
        id = decode_token
        Admin.find_by(id: id)
    end
    
end
