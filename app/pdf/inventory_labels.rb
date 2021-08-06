# app > pdf > inventory_labels.rb
class InventoryLabels < Prawn::Document
  require 'barby'
  require 'barby/barcode/code_128'
  require 'barby/outputter/png_outputter'
  include ActionView::Helpers::NumberHelper

  def initialize(inventory)
    super(:page_layout => :landscape)
    @inventory = inventory
    create_barcode_labels
  end

  def create_barcode_labels
    define_grid(:top_margin => 16,:bottom_margin => 16, :left_margin => 38, :right_margin => 38,
                  :columns => 5, :rows => 2, :column_gutter => 0, :row_gutter => 18 )

         #our variables for our grid starting point
         x = 0
         y = 0

         @inventory.each do |inventory|
           price = number_to_currency(inventory.price, precision: 0)
           tag = Barby::Code128B.new(inventory.tag)
           barcode = Barby::PngOutputter.new(tag)
           barcode.height = 50
           File.open("tmp/barcode.png", 'wb'){|f| f.write barcode.to_png }

           grid(x, y).bounding_box do
             text "\n"
             text "Tag \##{inventory.tag}", align: :center
             text " #{inventory.brand.truncate(11)}", size:18, align: :center
             text " #{inventory.model.truncate(11)}", size:16, align: :center
             text "Size: #{inventory.size}", size:14, align: :center
             image "#{Rails.root.to_s}/tmp/barcode.png", width:120, position: :center
             text "#{inventory.tag}", size:10, align: :center
             text " #{price}", align: :center, size:40, style: :bold
             text "#{inventory.category}", align: :center

             if x == 1 and y == 4
                x = 0
                y = 0
                start_new_page
             elsif y == 4
               x = 1
               y = 0
             else
               y = y + 1
             end
           end
         end
    end
  end
