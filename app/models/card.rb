require 'elasticsearch/model'
class Card < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
Card.import
