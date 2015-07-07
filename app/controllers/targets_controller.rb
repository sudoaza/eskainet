class TargetsController < ApplicationController
  def index
  end

  def show
    @target = Target.find(params[:id])
  end

  def new
  end

  def create
    get_domains.each do |domain|
      t = Target.where(domain: domain).first_or_create
    end
    redirect_to action: :index
  end

  def target_params
    params.require(:target).permit(:domains)
  end

  private
    def get_domains
      get_list_from_input(target_params[:domains]).collect{ |d| Target.normalize_domain d }.reject(&:empty?).uniq
    end

    def get_list_from_input(input)
      input.lines.map(&:strip).reject(&:empty?)
    end
end
