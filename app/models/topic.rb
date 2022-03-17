class Topic < ApplicationRecord
  belongs_to :course


  def to_string
    return "id: #{self.id}, name: #{self.name}"
  end
end
