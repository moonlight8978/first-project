class GroupSerializeService
  def initialize(collection, key, keys, serializer)
    @collection = collection
    @key = key
    @keys = keys
    @serializer = serializer
  end

  def perform
    @result = @collection.group_by(&@key).map do |key, collection|
      [@keys[key], serialize(collection)]
    end.to_h
    self
  end

  def result
    @result
  end

private
  def serialize(collection)
    collection.map do |member|
      ActiveModelSerializers::SerializableResource.new(
        member,
        serializer: @serializer,
        root: false,
        key_transform: :camel_lower
      )
    end
  end
end
