class Tagging < ActiveRecord::Base
  belongs_to :game
  belongs_to :tag
end
