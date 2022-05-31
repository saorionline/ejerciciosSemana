# Cada juego consta de 10 casillas con el último lanzamiento dando una oportunidad más

# Cuando se calcula el puntaje total sólo se cuentan los casillas enteros

# El tablero del puntaje puede ser visualizado en cualquier momento

# Nuevo juego con 6 integrantes en el equipo 

juego = Juego.new "Saori", "Lorena", "Daniel", "Nicolás", "Roberto"

# Grabar un bowl para el jugador actual

juego.play 10 # strike
juego.play 6; juego.play 4 #spare

juego.scoreboard

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

class Juego
    MAX_PLAYERS = 6

    attr_reader :jugadores, :indice_jugadores

    def initialize(*names)
        raise ArgumentError.new("Deben jugar 6 o menos personas") if names.size > MAX_PLAYERS
        @jugadores = []
        names.each {|name| @jugadores << Jugador.new(name)}
        reset_player
        announce_player
    end

    def switch_player
        if indice_jugadores < jugadores.size - 1
            @indice_jugadores += 1
        else
            reset_player
        end
    end

    def announce_player
        puts "#{jugador_actual.name} to bowl"
    end

    def nextPlayer
        switch_player if jugador_actual.casillas.last.finished?ç
        announce_player unless finished?
    end

    def reset_player
        @indice_jugadores = 0
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

    #Print player, scoreboard

    class Jugador
        MAX_FRAMES = 10

        attr_reader :name, :casillas

        def initialized(name)
            @name = name
            @casillas = []
            nueva_casilla
        end
        
        def lanzamiento(pins)
            nueva_casilla if casilla_actual.finished?
            casilla_actual.bowl(pins)
        end

        def lanza_sigui_dos(numero_casilla)
            siguientes_dos_casillas = casillas[(numero_casilla + 1)..(numero_casilla + 2)]
            lanza_sigui_dos = siguientes_dos_casillas.inject([]) {|lanzamiento, casillas| lanzamiento += casillas.lanzamiento if frame.finished?} || []
            lanza_sigui_dos.take(2)
        end
    end








