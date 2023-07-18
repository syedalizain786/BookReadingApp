class Book < ApplicationRecord
    belongs_to :author, optional: true
    validates :title, presence: true, uniqueness: {scope: :title}
    validates :summary, presence: true, length: { minimum: 10 }
    validates :pubdate, presence: true
    validates :author_id, presence: true

end
