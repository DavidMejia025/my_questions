class Api::V1::Admin::DashboardsController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :admin_only, except: %i[show create]

  def index
    dashboard = DashboardsService.new.get_data

    json_response(dashboard)
  end
end
