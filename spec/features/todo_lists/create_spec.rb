require 'spec_helper'

describe "Creating todo lists" do
  def create_todo_list(options={})
    options[:title] ||= "My todo list"
    options[:description] ||= "This is my todo list."

    visit "/todo_lists"
    click_link "New Todo list"
    expect(page).to have_content("New todo_list")

    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    click_button "Create Todo list"
  end

  it "redirects to the todo list index page on success" do
    create_todo_list
    expect(page).to have_content("My todo list")
  end

  it "displays an error when the todo list has no title" do
    expect(TodoList.count).to eq(0)

    create_todo_list title: ""

    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it "displays an error when the todo list has a title less than 3 characters" do
    expect(TodoList.count).to eq(0)

    create_todo_list title: "Hi"

    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("This is what I'm doing today.")
  end

  it "displays an error when the todo list has no description" do
    expect(TodoList.count).to eq(0)

    create_todo_list title: "Grocery list", description: ""

    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("Grocery list")
  end

  it "displays an error when the todo list description is less than 5 characters" do
    expect(TodoList.count).to eq(0)

    create_todo_list title: "Grocery list", description: "Food"

    expect(page).to have_content("error")
    expect(TodoList.count).to eq(0)

    visit "/todo_lists"
    expect(page).to_not have_content("Grocery list")
  end
end


########## VERSION ONE - HAD ALOT OF DUPLICATED FUNCTIONALITY #######
# filing in title and description 
# then clicking click_button 
# so we build a function 


require 'spec_helper'

# describe "Creating todo lists" do 
#   it "redirects to the todo list index page on success" do
#     visit "/todo_lists"
#     click_link "New Todo list"
#     expect(page).to have_content("New todo_list")

#     fill_in "Title", with: "My todo list"
#     fill_in "Description", with: "This is what I'm doing today."
#     click_button "Create Todo list"

#     expect(page).to have_content("My todo list")
#   end 

#   it "displays an error when the todo list has no title" do
#     expect(TodoList.count).to eq(0)

#     visit "/todo_lists"
#     click_link "New Todo list"
#     expect(page).to have_content("New todo_list")

#     fill_in "Title", with: ""
#     fill_in "Description", with: "This is what I'm doing today."
#     click_button "Create Todo list"

#     expect(page).to have_content("error")
#     expect(TodoList.count).to eq(0)

#     visit "/todo_lists"
#     expect(page).to_not have_content("This is what I'm doing today.")
#   end
    
#    it "displays an error when the todo list has less than 3 characters" do
#      expect(TodoList.count).to eq(0)

#      visit "/todo_lists"
#      click_link "New Todo list"
#      expect(page).to have_content("New todo_list")

#      fill_in "Title", with: "Hi"
#      fill_in "Description", with: "This is what I'm doing today."
#      click_button "Create Todo list"

#      expect(page).to have_content("error")
#      expect(TodoList.count).to eq(0)

#      visit "/todo_lists"
#      expect(page).to_not have_content("This is what I'm doing today.")
#    end 

#    it "displays an error when the todo list has no description" do
#      expect(TodoList.count).to eq(0)

#      visit "/todo_lists"
#      click_link "New Todo list"
#      expect(page).to have_content("New todo_list")

#      fill_in "Title", with: "Grocery List"
#      fill_in "Description", with: ""
#      click_button "Create Todo list"

#      expect(page).to have_content("error")
#      expect(TodoList.count).to eq(0)

#      visit "/todo_lists"
#      expect(page).to_not have_content("Grocery List")
#    end 

#    it "displays an error when the todo list has no description" do
#      expect(TodoList.count).to eq(0)

#      visit "/todo_lists"
#      click_link "New Todo list"
#      expect(page).to have_content("New todo_list")

#      fill_in "Title", with: "Grocery list"
#      fill_in "Description", with: "Food"
#      click_button "Create Todo list"

#      expect(page).to have_content("error")
#      expect(TodoList.count).to eq(0)

#      visit "/todo_lists"
#      expect(page).to_not have_content("Grocery list")
#    end
# end 