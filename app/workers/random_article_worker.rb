class RandomArticleWorker
  include Sidekiq::Worker

  def perform
    Post.create(
      :title => 'title',
      :content => 'content'
    )
  end
end
