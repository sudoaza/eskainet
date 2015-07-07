class ScanType < ActiveRecord::Base
  has_many :scans
  belongs_to :service_type
  belongs_to :service_version

  scope :general, -> { where('service_type_id IS NULL AND service_version_id IS NULL') }

  def to_s
    name
  end
end
