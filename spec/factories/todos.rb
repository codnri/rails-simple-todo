FactoryBot.define do
  factory :todo do
    
    subject = "mysubject"
    description "mydescription"
    association :user # ファクトリよびだし
    
    factory :invalid_todo do #child factory
  		subject nil
  	end
    
    factory :no_user_todo do #child factory
  		user_id nil
  	end
    
  end
end
