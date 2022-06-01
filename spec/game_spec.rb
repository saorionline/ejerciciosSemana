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
                @round boxes 
                