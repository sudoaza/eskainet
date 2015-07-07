class ServiceVersion < ActiveRecord::Base
  has_many :scans
  has_many :scan_types

  def to_s
    version
  end
end
