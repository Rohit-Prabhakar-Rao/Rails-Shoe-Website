class GalleryController < ApplicationController
  def index
    @shoes_gallery = Store.all
  end
end
