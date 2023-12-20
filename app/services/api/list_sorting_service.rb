# frozen_string_literal: true

module Api
  class ListSortingService
    attr_reader :lists, :list_params, :the_list_position

    def initialize(lists, list_params, the_list_position)
      @lists = lists
      @list_params = list_params
      @the_list_position = the_list_position
    end

    def call
      list_array = lists.to_a
      list_array.insert(list_params[:position].to_i, list_array.delete_at(the_list_position.to_i))
      list_array.each_with_index { |value, index| value.position = index }
      List.import list_array, on_duplicate_key_update: { conflict_target: [:id], columns: [:position] }
    end
  end
end
