require 'spec_helper'

describe "Deleting todo lists" do
  let!(:todo_list) { todo_list = TodoList.create(title: "Groceries", description: "Grocery list.") }

  def destroy_todo_list(options={})
    visit "/todo_lists"
    
    within "#todo_list_#{todo_list.id}" do
      click_link "Destroy"
    end
  end

  it "is successful when clicking the destroy link" do 
    destroy_todo_list

    expect(page).to_not have_content(todo_list.title)
    expect(TodoList.count).to eq(0)
  end
end