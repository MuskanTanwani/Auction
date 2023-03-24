class Product < ApplicationRecord
    belongs_to :user
    validates :name, :comapny_name, :phone_number, :bank_account, :description, presence: true
    validates :phone_number, length: {is:10}
    validates :bank_account, length:{is:10}
    validates :description, length:{minimum:25}
end
