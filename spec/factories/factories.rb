#------------------------------------------------------------------------------
# spec/factories/factories.rb
#------------------------------------------------------------------------------

FactoryBot.define do
  #----------------------------------------------------------------------------
  # User model factories
  #----------------------------------------------------------------------------
  
  #
  # Unconfirmed User
  #
  # Default user factory is an unconfirmed_user so that the
  # "user" can be used for all tests that require a confirmed user.
  #
  factory :unconfirmed_user, class: User do |f|
    f.first_name              "Thurmon"
    f.last_name               "Thomas"
    f.email                   "thurmon@bills.com"
    f.password                "foobar123"
    f.password_confirmation   "foobar123"
    
    after(:build) do |u|
      u.skip_confirmation_notification!
    end

    #
    # User - confirmed user to keep the tests cleaner
    #
    factory :user, :parent => :unconfirmed_user do
      after(:build)  do |u|
        u.skip_confirmation_notification!
      end
  
      after(:create) do |u|
        u.confirm
      end
    end # end of factory :user

    factory :user_with_cars, :parent => :user do
      first_name              "Alex"
      last_name               "Van Pelt"
      email                   "avp@bills.com"
      
      after(:create) do |user|
        FactoryBot.create(:car, user: user)
      end
    end # end of factory :user_with_cars

  end # end of factory :unconfirmed_user
  
  #----------------------------------------------------------------------------
  # Car model
  #----------------------------------------------------------------------------
  factory :car, class: Car do |f|
    f.make                "Subaru"
    f.model               "Forrester"
    f.miles_per_gallon    25
    user
  end # end of factory :car, class Car
  
end # end of FactoryBot.define