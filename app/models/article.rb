class Article < ApplicationRecord
    validates :Title , presence: true , length: {minimum:3, maximum:10}
    validates :Description, presence: true , length: {minimum:5, maximum:20}
end