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
        siguientes_dos_casillas = casillas[(numero_casilla + 1)..
(numero_casilla + 2)]
        lanza_sigui_dos = siguientes_dos_casillas.inject([]) {|lanzamiento, 
casillas| lanzamiento += casillas.lanzamiento if frame.finished?} || []
        lanza_sigui_dos.take(2)
    end
end