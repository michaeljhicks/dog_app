class DogSerializer < ActiveModel::Serializer
  attributes :id, :breed
  has_one :owner
end
