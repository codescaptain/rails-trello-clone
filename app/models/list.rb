# frozen_string_literal: true

class List < ApplicationRecord
  db_belongs_to :board
  has_many :items, dependent: :destroy

  validates :title, db_presence: true
end
