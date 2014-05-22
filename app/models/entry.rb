class Entry < ActiveRecord::Base
	validates :user, :amount, :month, :year, :entry_type, presence: true
	validates :entry_type, inclusion: { in: %w(m y),
	    message: "%{value} is not a valid entry_type" }
	validates :amount, numericality: { greater_than: 0 } 
	belongs_to :user
	belongs_to :created_by, :class_name => "User", :foreign_key => "created_by_id"

	def self.create_monthly!(params)
		entry = Entry.new_by_params(params)
		entry.entry_type = "m"
		entry.save!
		entry 
	end

	def self.create_yield!(params)
		entry = Entry.new_by_params(params)
		entry.entry_type = "y"
		entry.save!
		entry
	end

	private
		def self.new_by_params(params)
			entry = Entry.new
			entry.user = User.find params[:user_id] if params.include?(:user_id)
			entry.amount = params[:amount] if params.include?(:amount)
			entry.month = params[:month] if params.include?(:month)
			entry.year = params[:year] if params.include?(:year)
			entry.created_by_id = params[:created_by_id] if params.include?(:created_by_id)
			entry			
		end
end


