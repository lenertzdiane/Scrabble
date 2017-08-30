require_relative 'spec_helper'

describe 'TileBag' do

  before do
    @new_tile_bag = Scrabble::TileBag.new
  end
  describe "initialize" do

    it "must be instance of TileBag" do
      @new_tile_bag.must_be_instance_of Scrabble::TileBag
    end

    ##VERIFY WE WANT AN ARRAY (thinking an array of each possible tile which can be key values from our hash)
    it "must be a collection of tiles" do
      @new_tile_bag.bag_of_tiles.must_be_kind_of Array
    end

    it "must contain the correct quantitiy of each letter" do
      #contains_eight_of_O_pattern = /(O){8}/
      o = 0
      d = 0
      w = 0
      @new_tile_bag.bag_of_tiles.each do |tile|
        if tile == "O"
          o += 1
        elsif tile == "D"
          d += 1
        elsif tile == "W"
          w += 1
        end
      end
        o.must_equal 8
        d.must_equal 4
        w.must_equal 2
    end
  end

  describe "#draw_tiles" do

    it "must be a method of TileBag" do
      @new_tile_bag.must_respond_to :draw_tiles
    end

    it "must return an array of tiles drawn" do
      @new_tile_bag.draw_tiles.must_be_kind_of Array
    end
    #Check tiles are randomly drawn (Create 2-3 bags of tiles and draw tiles, see if they are same tiles)
    it "must randomly draw tiles" do
      @new_tile_bag2 = Scrabble::TileBag.new
      bag_one_tiles_drawn = @new_tile_bag.draw_tiles(7)
      bag_two_tiles_drawn = @new_tile_bag2.draw_tiles(7)
      bag_two_tiles_drawn.must_not_equal bag_one_tiles_drawn
    end
    #Check that it removed the tiles from the tile bag
    it "must remove the tiles from the tile bag array once drawn" do
      starting_length = @new_tile_bag.length
      @new_tile_bag.draw_tiles(3)
      @new_tile_bag.bag_of_tiles.length.must_equal (starting_length - 3)
    end

    # ?? Not required : Test for correct number between 0 and 7
    # it "must accept a number input" do
    #   assert_send([@new_tile_bag, :draw_tiles, 3])
    # end


  end
end
