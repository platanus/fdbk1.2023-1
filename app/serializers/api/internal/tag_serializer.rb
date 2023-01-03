class Api::Internal::TagSerializer < ActiveModel::Serializer
  type :tag

  attributes(
    :id,
    :name
  )
end
