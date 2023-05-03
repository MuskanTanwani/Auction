class Product < ApplicationRecord
    belongs_to :user
    has_many :bids, dependent: :destroy
    has_one_attached :image
    validates :name, :comapny_name, :phone_number, :bank_account,:description, presence: true
    validates :phone_number, length: {is:10}
    validates :bank_account, length:{is:10}
    validates :description, length:{minimum:25}
    validates :name, uniqueness: true
    validates :starting_bid, :numericality => { :greater_than_or_equal_to => 0 }
end
