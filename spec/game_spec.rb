require_relative './bonus.rb'
require_relative './box_launch.rb'
require_relative './adding_up.rb'
require_relative './sumadora_puntaje'
require 'spec_helper'

describe 'super_bowling' do 
    before do
        @tournament =  Tournament.new "Bogota"
        @competitor = @tournament.competitors.first
        @launch = [ 8, 7, 2, 7]
    end

    context "bonus scores"
        context "strike" do
            before do
                round @launch
                @box = @competitor.boxes.first
            end
            
            it "should record a strike when 10 pins fall in one launch" do
                expect(@box.strike?).to be true
            end

            it "should add bonus to score when competitor launch a strike" do
                expect(@competitor.score).to eql 46
            end
        end