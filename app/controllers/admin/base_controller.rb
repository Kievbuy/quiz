class Admin::BaseController < ApplicationController
    prepend_view_path 'app/views/admin'

    before_action :check_admin

    private

    def check_admin
      unless current_user.admin?
        redirect_to root_path, notice: 'You have no rights to access this page'
      end
    end
end
