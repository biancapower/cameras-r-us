class Retailer < ApplicationRecord
	has_and_belongs_to_many :products
	has_one_attached :qr_code
	validates :name, presence: { message: "Please enter a name" }
	validates :maps_url, presence: { message: "Please select a valid address from the dropdown" }
  
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

		blob = ActiveStorage::Blob.create_after_upload!(
      io: StringIO.new(png.to_s),
      filename: "retailer-#{self.id}-qr",
      content_type: 'image/png'
    )

		self.qr_code.attach(blob)
  end
end
