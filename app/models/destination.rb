class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_5
        self.posts.order(:created_at).limit(5)
    end

    def top_post
        self.posts.order(:likes).first
    end

    def avg_blogger_age
        age = 0 
        bloggers = self.posts.count

        self.posts.each do |post|
            age += post.blogger.age
        end
        age / bloggers
    end

end
