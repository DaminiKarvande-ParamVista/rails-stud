module ImageVariantable
  extend ActiveSupport::Concern

  def generate_variants_for(image)
    return unless image.attached?

    image.variant(resize_to_fill: [100, 100]).processed
    image.variant(resize_to_limit: [300, 300]).processed
    image.variant(resize_to_limit: [800, 800]).processed

  rescue => e
    Rails.logger.error("Variant generation failed: #{e.message}")
  end

  def variant_thumb(image)
    image.variant(resize_to_fill: [100, 100]).processed  # removed format: :webp
  end

  def variant_medium(image)
    image.variant(resize_to_limit: [300, 300]).processed
  end

  def variant_large(image)
    image.variant(resize_to_limit: [800, 800]).processed
  end
end