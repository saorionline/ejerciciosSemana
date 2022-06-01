#Boxes here mean the frames where the points are noted

class Box
    MAX_PINS = 10
    STRIKE = 'X'
    SPARE = '/'
    GUTTER = '-'

    attr_accessor :lauches, :remaining_pins

    def first_launch
        launches.first
    end

    def second_launch
        launches[1]
    end

    def score
        launches.reduce(:+)
    end

    def bonus?
        score == MAX_PINS
    end

    def strike?
        first_launch == MAX_PINS
    end

    def spare?
        bonus? && !strike?
    end

    def gutter?
        launches.size == 2 && score == 0
    end

    def finished?
        launches.size == 2 || remaining_pins == 0


    def initialize
        @launches = []
        @remaining_pins = MAX_PINS
    end

    def lauch(pins)
        remaining = remaining_pins - pins
        raise ArgumentError.new("Wrong count of pins") if remaining < 0 || pins > MAX_PINS
        @remaining_pins = remaining
        launches << pins
    end

    def to_s
        if strike?
            STRIKE
        elsif spare?
            "#{launches.first}#{SPARE}"
        else
            launches.join("|").gsub("0", GUTTER)
        end
    end
end
end
