# frozen_string_literal: true

class Item < ApplicationRecord
  db_belongs_to :list

  validates :title, db_presence: true
end
