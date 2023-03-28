class ShortenedUrlsController < ApplicationController
  def index
    shortened_urls = ShortenedUrl.order(fetched_count: :desc).limit(100)

    render json: {data: ShortenedUrlSerializer.new(shortened_urls).serialize}, status: :ok
  end

  def create
    shortened_url = ShortenedUrl.new(shortened_url_params)

    if shortened_url.save
      render json: { data: "#{root_path}/#{shortened_url.access_code}" }, status: :ok
    else
      render json: { errors: shortened_url.errors.messages.join(",") }, status: :unprocessible_entity
    end
  end

  def show
    shortened_url = ShortenedUrl.find_by(access_code: params[:access_code])

    if shortened_url
      shortened_url.update!(fetched_count: shortened_url.fetched_count + 1)
      redirect_to shortened_url.original_url
    else
      render json: { errors: "Not Found" }, status: '404'
    end
  end

  private

  def shortened_url_params
    params.require(:shortened_url).permit(:original_url)
  end
end
