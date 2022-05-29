class Retailer < ApplicationRecord
	has_and_belongs_to_many :products
	has_one_attached :qr_code
	validates :name, presence: { message: "Please enter a name" }
	validates :maps_url, presence: { message: "Please select a valid address from the dropdown" }
  
	
	after_save :generate_qr, if: :saved_change_to_maps_url?

  def generate_qr
		# get maps_url (google maps url generated based on retailer address)
		url = self.maps_url
    
		# generate a qr code for url
		qrcode = RQRCode::QRCode.new(url)

		# convert qr code to png
		# stored as ChunkyPNG::Image instance
		# 	(see https://github.com/wvanbergen/chunky_png)
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

		# returns a saved blob instance
		blob = ActiveStorage::Blob.create_after_upload!(
			# create in-memory file-like object
			# file needs to be created and "stored" prior to upload
      io: StringIO.new(png.to_s),
      filename: "retailer-#{self.id}-qr",
      content_type: 'image/png' # specifies MIME type
    )

		# attach active_storage blob to retailer record
		self.qr_code.attach(blob)
  end
end
