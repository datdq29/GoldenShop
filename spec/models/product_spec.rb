require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "db schema" do
    context "columns" do
      it { is_expected.to have_db_column(:name).of_type(:string) }
      it { is_expected.to validate_length_of(:name).is_at_least(5).is_at_most(20) }
      it { is_expected.to have_db_column(:image).of_type(:string) }
      it { is_expected.to have_db_column(:description).of_type(:text) }
      it { is_expected.to validate_length_of(:description).is_at_least(20).is_at_most(255) }
      it { is_expected.to have_db_column(:price).of_type(:integer) }
      it { is_expected.to have_db_column(:year).of_type(:integer) }
      it { is_expected.to have_db_column(:category_id).of_type(:string) }
      it { is_expected.to have_db_column(:user_id).of_type(:string) }
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:image) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_length_of(:category_id) }
    it { is_expected.to validate_length_of(:user_id) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category) }
  end

end
