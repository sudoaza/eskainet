class ScanTypesController < ApplicationController
  def index
  end

  def new
  end

  def create
    ScanType.create(scan_type_params)
    redirect_to action: :index
  end

  def scan_type_params
    params.require(:scan_type).permit(:name, :command, :service_type_id, :service_version_id)
  end
end
