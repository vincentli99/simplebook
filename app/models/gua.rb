class Gua < ActiveRecord::Base
    has_many :yaos, dependent: :destroy
end