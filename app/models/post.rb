
require 'pry'

class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    #This helper validates that the attributes'
    #values are included in a given set. In fact,
    # this set can be any enumerable object.
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  validate :clickbait

  def clickbait
  arr = ["Won't Believe", "Secret", "Top", "Guess"]
 if self.title
    if arr.none? { |ele| self.title.include?(ele) }
      errors.add(:title, "must be clickbait")
    end
end

end
end


# class EmailValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
#       record.errors[attribute] << (options[:message] || "is not an email")
#     end
#   end
# end
#
# class Person < ApplicationRecord
#   validates :email, presence: true, email: true
# end
