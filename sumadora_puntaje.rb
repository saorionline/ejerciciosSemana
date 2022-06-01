require_relative "./adding_up.rb"

# Cada juego consta de 10 casillas con el último lanzamiento dando una oportunidad más

# Cuando se calcula el puntaje total sólo se cuentan los casillas enteros

# El tablero del puntaje puede ser visualizado en cualquier momento

# Nuevo juego con 6 integrantes en el equipo 

tournament = Tournament.new "Saori", "Lorena", "Daniel", "Nicolás"

# Grabar un bowl para el jugador actual

tournament.round 10 # strike
tournament.round 6; tournament.round 4 #spare

tournament.points

=begin
Bitácora de lanzamientos

Casilla 1, ball 1: 8 pins
Casilla 1, ball 2: 0 pins
Casilla 2, ball 1: 7 pins
Casilla 2, ball 2: 2 pins


El puntaje: hasta el momento sería
Casilla one: 8 + 0 = 8
Casilla two: 7 + 2 = 9

Puntaje total = 17
=end

class Tournament
    MAX_COMPETITORS = 6

    attr_reader :competitors, :competitor_list

    def initialize(*names)
        raise ArgumentError.new("Deben jugar 6 o menos personas") if names.size > MAX_COMPETITORS
        @jugadores = []
        names.each {|name| @jugadores << Jugador.new(name)}
        reset_player
        announce_player
    end

    #It's nice to create just one function to reset and announce

    def reset_player
        @indice_jugadores = 0
    end

    def announce_player
        puts "#{jugador_actual.name} to bowl"
    end

    def switch_player
        if indice_jugadores < jugadores.size - 1
            @indice_jugadores += 1
        else
            reset_player
        end
    end

    def nextPlayer
        switch_player if jugador_actual.casillas.last.finished?
        announce_player unless finished?
    end
 
    def jugador_actual
        jugadores[indice_jugadores]
    end

    def play(pins)
        return "El juego terminó, miren el puntaje final" if finished?
        jugador_actual.bowl(pins)
        puts "#{jugador_actual.name} le dio a #{pins} pines"
        nextPlayer
    end
end

  

   
   

   

   
   
   
   
   
   
   
   
   
   

   
   
   
   
   
   








