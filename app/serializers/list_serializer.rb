# frozen_string_literal: true

class ListSerializer
  include JSONAPI::Serializer
  attributes :board_id, :title, :class_list, :items
end
