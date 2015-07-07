class Service < ActiveRecord::Base
  belongs_to :target
  belongs_to :service_type
  belongs_to :serice_version
  has_many :scans
end
