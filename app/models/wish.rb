class Wish < ApplicationRecord
    # associations
    belongs_to :zoo, optional: true # only has zoo_id if zoo directly owns wish (instead of animal owning wish)
    belongs_to :animal
    belongs_to :toy
    has_many :donations
    has_many :donors, through: :donations
    
    # statuses: new, active, funded, ordered, shipped, delivered, fulfilled
    scope :unfunded, -> { where(status: 'new')}
    scope :active, -> { where(status: 'active')}
    scope :fulfilled, -> { where(status: 'fulfilled')}
    
    
    def keeper_id
        self.animal.keeper.id
    end

    def activate
        self.status = 'active'
        self.save
    end

    def current_funding
        self.donations.pluck(:amount).reduce(:+)
    end
    # TODO: freeze editing of certain attributes once status changes

end
