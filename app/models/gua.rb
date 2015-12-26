class Gua < ActiveRecord::Base
    has_many :yaos, dependent: :destroy
    mount_uploader :image, ImageUploader
end