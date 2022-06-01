#Print player, scoreboard

class Competitor
    MAX_BOXES = 10
    attr_reader :name, :boxes
    def initialized(name)
        @name = name
        @boxes = []
        new_box
    end
    
    def launch(pins)
        new_box if present_box.finished?
        present_box.launch(pins)
    end


    def score
    initial_boxes_score + bonus_box_score
    end

    def total_box_score(box, box_tag)
        total_score = box.score
        total_score += bonus_scorekeeper(box, box_tag) if frame.bonus?
        total_score
    end

    def finished?
        boxes.size == MAX_BOXES && boxes.last.finished?
    end


    def initial_box_score
        box_tag = 0
        total_score = 0
        while box_tag < MAX_BOXES - 1 && box_tag < boxes.size
            box = boxes[box_tag]
            break unless box.finished?
            total_score += total_box_score(box, box_tag)
            box_tag += 1
        end
        total_score 
    end


    def bonus_scorekeeper(box, box_tag)
        total = 0
        pair_launches = next_pair_launches(box_tag)
        if box.strike? && pair_launches.size == 2 
            total += pair_launches.reduce(:+)
        elsif box.spare? && !next_pair_launches.first.nil? 
            total += pair_launches.first
        end 
        total
    end

    def scoreboard
        screen = "#{name}:".ljust(15)
        frames.each do |box|
            screen << box.to_s.ljust(6)
        end
        screen << "|".ljust(6) << "#{score}"
        screen
    end

    def next_pair_lauches(box_tag)
        next_two_boxes = boxes[(box_tag + 1)..
(box_tag + 2)]
        next_launch = next_two_boxes.inject([]) {|lauch, 
box| launches += box.launches if box.finished?} || []
        next_launch.take(2)
    end

    def bonus_box_score
        bonus_box_total = 0
        last_box = boxes.last
        bonus_boxes_total += last_box.score if boxes.size == MAX_BOXES && last_box.finished?
        bonus_box_total
    end


    private
    
    attr_reader :current_box
    attr_writer :boxes

    def new_box
        if boxes.size == MAX_BOXES - 1
            boxes << BonusBox.new
        else
            boxes << Box.new
        end
        @current_box = boxes.last
    end
end



  
  
  

