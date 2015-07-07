class ScanController < ApplicationController
  def index
  end

  def show
    @scan = Scan.find params[:id]
  end
end
