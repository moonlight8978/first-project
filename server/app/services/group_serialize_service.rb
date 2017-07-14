class GroupSerializeService
  def initialize(collection, serializer, grouping_keys = {})
    @collection = collection
    @serializer = serializer
    @grouping_keys = grouping_keys
  end

  def perform(&block)
    @result = @collection.group_by(&block).map do |key, collection|
      [(@grouping_keys && @grouping_keys[key]) || key,
       serialize(collection)]
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
