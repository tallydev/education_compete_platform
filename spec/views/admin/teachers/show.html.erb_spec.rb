require 'rails_helper'

RSpec.describe "admin/teachers/show", type: :view do
  before(:each) do
    @admin_teacher = assign(:admin_teacher, Admin::Teacher.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
