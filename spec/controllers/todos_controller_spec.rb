require 'rails_helper'

describe TodosController, type: :controller do
  
    describe 'login user access' do
      before do
        # todo_params = FactoryBot.attributes_for(:todo)
        @todo = create(:todo)
        @user = @todo.user
        sign_in @user
      end
      
      it 'get #show' do
        get :show, params: { id: @todo.id}
        expect(response).to render_template :show
      end
      
      it 'get #index' do
        get :index
        expect(response).to render_template :index
      end
      
      it 'get #edit' do
        get :edit, params: { id: @todo.id}
        expect(response).to render_template :edit
      end
      
      describe '#create' do
        it 'create a valid todo' do
        # new_todo = { subject: "NewSubject",description:"NewDescription" }
        # @usre.todos.create(new_todo)
        todo_params = FactoryBot.attributes_for(:todo)
        
        
        expect {
          post :create, 
          params: { todo: todo_params }
          }.to change(@user.todos, :count).by(1)
        end
        
      end
      
      xit 'get #index without factory' do
        user = User.create!(email: "user@example.com", password: "userpassword",    password_confirmation: "userpassword")
        todo = user.todos.build(subject:"mysubject",description:"mydescription")
        todo.save
        sign_in user
        get :show, params: { id: todo.id}
        expect(response).to render_template :show
      end
      
      
    end
    describe 'anonymous access' do
        xdescribe 'GET #show' do
          it 'requires login' do
            todo = create(:todo)
            get :show, params: { id: todo.id}
            expect(response).to redirect_to new_user_session_path
            
          end
        end
        # describe 'GET #index' do
        #   it 'requires login' do
        #     get :index
        #     expect(response).to redirect_to login_url
        #   end
        # end
    
        # describe 'GET #new' do
        #   it 'requires login' do
        #     get :new
        #     expect(response).to redirect_to login_url
        # end
    end
    
    
    
#   describe 'GET #index' do
#     it "render the :index template" do
#       get :index
#       expect(response).to render_template :index
#     end
#   end
end