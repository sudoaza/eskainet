class Scan < ActiveRecord::Base
  belongs_to :scan_type
  belongs_to :target
  belongs_to :service

  validate :has_date!

  def has_date!
    self.date = DateTime.now if date.nil?
  end

  state_machine :state, initial: :pending do
    event :run do
      transition all => :running
    end

    event :complete do
      transition :running => :completed
    end

    event :fail do
      transition all => :failed
    end
  end

  def run_scan
    fail! && return unless can_run?
    self.date = DateTime.now
    run!
    save
    self.output = run_command live_command
    complete!
    save
  end

  def can_run?
    (tokens - available_data).empty?
  end

  def tokens
    scan_type.command.scan(/:\w+/).map{|t| t[1..-1]}.uniq
  end

  def available_data
    available = ['domain', 'proxy']
  end

  def run_command(command)
    `#{command}`
  end

  def live_command
    live = scan_type.command
    tokens.each do |t|
      value = target.send(t) || (service.present? && service.send(t))
      live.gsub!(":#{t}", value)
    end
    live
  end
end
