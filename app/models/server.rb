class Server < ActiveRecord::Base
  has_and_belongs_to_many :targets
end
