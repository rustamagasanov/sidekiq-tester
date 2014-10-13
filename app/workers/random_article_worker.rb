require 'faker'

class RandomArticleWorker
  include Sidekiq::Worker

  def perform
    Post.create(
      :title => Faker::Lorem.words(3),
      :content => Faker::Lorem.paragraph
    )
  end
end
