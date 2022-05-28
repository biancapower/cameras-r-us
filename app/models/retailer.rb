class Retailer < ApplicationRecord
	has_and_belongs_to_many :products
	has_one_attached :qr_code
	validates :name, :address, presence: true
  
	after_save :generate_qr, if: :saved_change_to_maps_url?

  def generate_qr
		url = self.maps_url
    
		qrcode = RQRCode::QRCode.new(url)

		png = qrcode.as_png(
			bit_depth: 1,
			border_modules: 4,
			color_mode: ChunkyPNG::COLOR_GRAYSCALE,
			color: "black",
			file: nil,
			fill: "white",
			module_px_size: 6,
			resize_exactly_to: false,
			resize_gte_to: false,
			size: 240
		)

		image_name = "retailer-#{self.id}-qr"
		IO.binwrite("tmp/#{image_name}.png", png.to_s)

		blob = ActiveStorage::Blob.create_after_upload!(
      io: File.open("tmp/#{image_name}.png"),
      filename: image_name,
      content_type: 'png'
    )

		self.qr_code.attach(blob)
  end
end
