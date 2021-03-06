require "application_system_test_case"

class InventoriesTest < ApplicationSystemTestCase
  setup do
    @inventory = inventories(:one)
  end

  test "visiting the index" do
    visit inventories_url
    assert_selector "h1", text: "Inventories"
  end

  test "creating a Inventory" do
    visit inventories_url
    click_on "New Inventory"

    fill_in "Brand", with: @inventory.brand
    fill_in "Category", with: @inventory.category
    fill_in "Model", with: @inventory.model
    fill_in "Price", with: @inventory.price
    fill_in "Size", with: @inventory.size
    fill_in "Tag", with: @inventory.tag
    click_on "Create Inventory"

    assert_text "Inventory was successfully created"
    click_on "Back"
  end

  test "updating a Inventory" do
    visit inventories_url
    click_on "Edit", match: :first

    fill_in "Brand", with: @inventory.brand
    fill_in "Category", with: @inventory.category
    fill_in "Model", with: @inventory.model
    fill_in "Price", with: @inventory.price
    fill_in "Size", with: @inventory.size
    fill_in "Tag", with: @inventory.tag
    click_on "Update Inventory"

    assert_text "Inventory was successfully updated"
    click_on "Back"
  end

  test "destroying a Inventory" do
    visit inventories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Inventory was successfully destroyed"
  end
end
