class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :age, numericality: { only_integer: true, greater_than: 0 , message: "must be older than 0" }
    validates :name, uniqueness: true
    validates :bio, length: { minimum: 30}

    def total_likes
        t_likes = 0
        
        self.posts do |post|
            likes += post.likes
        end
        t_likes
    end

    def top_post
        self.posts.order(:likes).first
    end

end
