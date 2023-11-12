# frozen_string_literal: true

class Board < ApplicationRecord
  db_belongs_to :user
  has_many :lists, dependent: :destroy

  validates :name, db_presence: true
end
