using Roots

# Función para calcular el método de Newton-Raphson. Requiere todos los datos planteados anteriormente.
function newtonRaphson(Vi, A, B, R, Temp, P, N)
    # Se define el número de iteraciones
    iteraciones = 10
    # Y un ciclo donde ocurrirá cada iteración
    for i in 1:iteraciones
        # Después se evalua la función en v
        v = (Vi^3 - (B + ((R*Temp)/P))*Vi^2 + (A/P)*Vi - ((A*B)/P))
        # Y su derivada en vd
        vd = ((3*Vi^2) - (2*(B + ((R*Temp)/P))*Vi) + (A/P))
        # Para proceder a calcular el método Newton-Raphson
        Vi = (Vi - (v / vd))

        # Además, se calcula el factor de compresibilidad del gas
        factorZ = (((Vi/N) * P) / (R * Temp))

        # Se muestra por pantalla el volumen y el factor de compresibilidad después de cada iteración
        println("Iteración: ", i, " Volumen: $Vi")
        println("Iteración: ", i, " Compresibilidad: $factorZ")
        println("------------------------------------------------------------------------------------------------------------------------")
    end
end

# Función que calcula el valor del dato A. Requiere la constante de los gases ideales, la temperatura crítica y presión crítica
function calculoA(R, Tcrit, Pcrit)
    valorA = ((27 * R^2 * Tcrit^2) / (64 * Pcrit))
    return valorA
end

# Función que calcula el valor del dato B. Requiere la constante de los gases ideales, la temperatura crítica y presión crítica
function calculoB(R, Tcrit, Pcrit)
    valorB = ((R * Tcrit) / (8 * Pcrit))
    return valorB
end

# Función que calcula el volumen inicial. Requiere la presión, la temperatura, la constante de los gases ideales y el número de moles
function vol_inicial(P, N, R, Temp)
    volumen = ((N * R * Temp) / P)
    return volumen
end

# Datos iniciales
P = 56.0 # Presión en atm
N = 1.0 # Moles
R = 0.08205746 # Constante de los gases ideales
Temp = 450.0 # Temperatura en Kelvin
Tcrit = 405.5 # Temperatura crítica en Kelvin
Pcrit = 111.3 # Presión crítica en atm

Vi = vol_inicial(P, N, R, Temp)
A = calculoA(R, Tcrit, Pcrit)
B = calculoB(R, Tcrit, Pcrit)
NR = newtonRaphson(Vi, A, B, R, Temp, P, N)
