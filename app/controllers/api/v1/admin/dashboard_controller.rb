class Api::V1::DashboardsController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :admin_only, except: %i[show create]

end
