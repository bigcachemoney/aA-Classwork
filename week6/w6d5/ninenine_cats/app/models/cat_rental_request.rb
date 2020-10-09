    # t.integer "cat_id", null: false
    # t.date "start_date", null: false
    # t.date "end_date", null: false
    # t.string "status", default: "PENDING", null: false
    # t.index ["cat_id"], name: "index_cat_rental_requests_on_cat_id"
    
    
class CatRentalRequest < ApplicationRecord
    validates :cat_id, :start_date, :end_date, :status, presence: true
    validates :status, inclusion: {in: ['PENDING', 'APPROVED', 'DENIED']}

    belongs_to :cat

    def overlapping_requests(cat)
        .find_by(:cat_id)
        .where('cat_id LIKE ')
    end
end