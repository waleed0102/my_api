class ShortenedUrl < ApplicationRecord
  include UniqueIdentifierGenerator

  after_commit :set_access_code, on: :create
  validates_presence_of :original_url

  def set_access_code
    self.access_code = bijective_encode(self.id)
    save!

    OriginalUrlFetcher.perform_async(self.id)
  end
end
