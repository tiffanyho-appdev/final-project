class OdysseyController < ApplicationController
    def index
        @user = current_user

        render("odyssey_templates/index.html.erb")
    end
end