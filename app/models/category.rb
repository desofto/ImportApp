class Category < ActiveRecord::Base
  has_and_belongs_to_many :operations

  validates :name,
    presence: true

  class << self
    def find_or_create(name)
      find_by(name: name) || create(name: name)
    end
  end
end
