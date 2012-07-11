require 'spec_helper'

describe WelcomeController, '#index' do
  before { get :index }
  
  it { should render_template(:index) }
  it { should respond_with(:success) }
  it { should_not set_the_flash }
end

describe WelcomeController, '#pathway' do
  before { get :pathway }
  it { should render_template(:path) }
end