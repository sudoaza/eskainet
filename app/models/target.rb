class Target < ActiveRecord::Base
  has_and_belongs_to_many :servers
  has_many :scans
  has_many :services

  after_create :create_general_scans

  def to_s
    domain
  end

  def create_general_scans
    ScanType.general.each do |scan_type|
      scan = scan_type.scans.create(target: self)
      scan.delay.run_scan
    end
  end

  def self.normalize_domain(domain)
    uri = URI(domain)
    uri = URI('http://'+domain) if uri.scheme.nil? && uri.host.nil?
    uri.host.downcase
  end
end
