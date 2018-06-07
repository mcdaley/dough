# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  image                  :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  nickname               :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  tokens                 :json
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  #
  # Verify DB columns for model exist with the correct data type
  #
  describe 'db columns' do
    it { should have_db_column( :id                     ).of_type( :integer   ) }
    it { should have_db_column( :first_name             ).of_type( :string    ) }
    it { should have_db_column( :last_name              ).of_type( :string    ) }
    it { should have_db_column( :email                  ).of_type( :string    ) }
    it { should have_db_column( :encrypted_password     ).of_type( :string    ) }
    it { should have_db_column( :created_at             ).of_type( :datetime  ) }
    it { should have_db_column( :confirmed_at           ).of_type( :datetime  ) }
    it { should have_db_column( :confirmation_token     ).of_type( :string    ) }
    it { should have_db_column( :confirmation_sent_at   ).of_type( :datetime  ) }
    it { should have_db_column( :current_sign_in_at     ).of_type( :datetime  ) }
    it { should have_db_column( :current_sign_in_ip     ).of_type( :inet      ) }
    it { should have_db_column( :last_sign_in_at        ).of_type( :datetime  ) }
    it { should have_db_column( :last_sign_in_ip        ).of_type( :inet      ) }
    it { should have_db_column( :remember_created_at    ).of_type( :datetime  ) }
    it { should have_db_column( :reset_password_sent_at ).of_type( :datetime  ) }
    it { should have_db_column( :reset_password_token   ).of_type( :string    ) }
    it { should have_db_column( :sign_in_count          ).of_type( :integer   ) } 
    it { should have_db_column( :unconfirmed_email      ).of_type( :string    ) }
    it { should have_db_column( :updated_at             ).of_type( :datetime  ) }
  end # end of describe 'db columns'
  
  describe 'relational schema' do
    it { should have_many( :cars ) }
  end # end of describe 'relations'
  
  describe 'indexes' do
    it { should have_db_index( :confirmation_token    ).unique( true ) }
    it { should have_db_index( :email                 ).unique( true ) }
    it { should have_db_index( :reset_password_token  ).unique( true ) }
    
  end # end of describe 'indexes'
  
  #
  # Verify the "user" factory creates a confirmed user, so we know the
  # user factories are working as expected
  #
  describe 'Verify user factory' do
    context 'When unconfirmed' do
      let(:unconfirmed_user) { FactoryBot.create(:unconfirmed_user) }

      it 'should be unconfirmed' do
        expect(unconfirmed_user.confirmed_at).to be_nil
      end

      it 'should be valid' do
        expect(unconfirmed_user).to be_valid
      end
    end
    
    context 'When confirmed' do
      let(:user) { FactoryBot.create(:user) }

      it 'should be confirmed' do
        expect(user.confirmed_at).not_to be_nil
      end

      it 'should be valid' do
        expect(user).to be_valid
      end
    end
  end # end of describe 'Verify user factory'
  
  #
  # Verify model validations
  #
  describe 'validations' do
    let(:user) { FactoryBot.build(:unconfirmed_user) }

    describe 'email' do
      it 'requires an email address' do
        expect( FactoryBot.build(:user, { email: '' }) ).to be_invalid
      end
      
      it 'rejects an invalid email' do
        invalid_emails = %w[joe, @example.com,joe@example@example.com ]
        invalid_emails.each do |email|
          expect( FactoryBot.build(:user, { email: email }) ).to be_invalid
        end
      end
    end # end of describe 'email'
    
    describe 'first name' do
      it 'rejects first name that is too long' do
        expect( FactoryBot.build(:user, { first_name: "K" * 65 }) ).to_not be_valid 
      end
    end # end of describe 'first name'
  
    describe 'last name' do
      it 'rejects last name that is too long' do
        expect( FactoryBot.build(:user, { last_name: "K" * 65 }) ).to_not be_valid 
      end
    end # end of describe 'last name'
    
  end # end of describe 'validations
  
end # end of RSpec.describe User
