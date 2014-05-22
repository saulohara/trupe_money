require "spec_helper"

describe Entry do
	
    context "validates fiels" do

        before(:each) do
            @entry = FactoryGirl.build(:entry)
        end
        
        it "validates presence of user" do
            @entry.should validate_presence_of :user
        end

        it "validates presence of amount" do
            @entry.should validate_presence_of :amount
        end

        it "validates presence of month" do
            @entry.should validate_presence_of :month
        end

        it "validates presence of year" do
            @entry.should validate_presence_of :year
        end

        it "validates presence of entry type" do
            @entry.should validate_presence_of :entry_type
        end

        it "validates amount greater than 0" do
            @entry.should validate_numericality_of(:amount).is_greater_than(0)
        end

        it "validates values of entry type" do
            @entry.should ensure_inclusion_of(:entry_type).in_array(%w(m y))
        end

    end

    context "Creating" do

        before(:all) do
            @user = FactoryGirl.create(:user)
            @params = {user_id: @user.id, amount: 50 , month: 5, year: 2014}
        end
        
        it "monthly" do
            entry = Entry.create_monthly!(@params)
            expect(entry.entry_type).to eq("m")
        end

        it "yield" do
            entry = Entry.create_yield!(@params)
            expect(entry.entry_type).to eq("y")
        end
    end

  end
