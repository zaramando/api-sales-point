class ApplicationController < ActionController::API
    before_action :set_jbuilder_defaults 
    before_action :authenticate_request      
    attr_reader :current_user


    protected

    def authenticate_request
        @current_user = AuthorizeApiRequest.call(request.headers).result
        error!("Not Authorized", :unauthorized) unless @current_user
    end    

    def set_jbuilder_defaults
        @errors = []
    end
    
    def error!(message,status)     
        @errors << message
        response.status = status
        render template: "errors"
    end
    
    def error_array!(array,status)
        @errors = @errors + array
        response.status = status
        render template: "errors"
    end 
    
end
