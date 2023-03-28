class OriginalUrlFetcher
  include Sidekiq::Worker

  def perform(shortened_url_id)
    fetch_shortened_url(shortened_url_id)
    fetch_title
    store_title
  end

  def fetch_shortened_url
    @shortened_url = ShortenedUrl.find(shortened_url_id)
  end

  def fetch_title
    original_url = @shortened_url.original_url
    page_element = open(original_url).read
    html_document = Nokogiri::HTML(page_element)

    @title = html_document.title
  end

  def store_title
    @shortened_url.update(title: @title)
  end
end
