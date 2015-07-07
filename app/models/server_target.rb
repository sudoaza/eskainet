class ServerTarget < ActiveRecord::Base
  belongs_to :server
  belongs_to :target
end
