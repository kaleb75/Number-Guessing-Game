#!/bin/bash

# Generar un número aleatorio entre 1 y 1000
secret_number=$(shuf -i 1-1000 -n 1)

# Solicitar al usuario que ingrese un nombre de usuario
echo "Enter your username:"
read username

# Verificar si el nombre de usuario ya existe en la base de datos
# Si es un usuario nuevo, inicializar el contador de juegos a 0
games_played=0
best_game=1000

# Mostrar un mensaje de bienvenida personalizado o genérico
# Dependiendo de si el usuario es nuevo o existente
if [ "$username" == "existing_user" ]; then
    echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
else
    echo "Welcome, $username! It looks like this is your first time here."
fi

# Iniciar el juego de adivinanza de números
echo "Guess the secret number between 1 and 1000:"
while true; do
    read guess
    # Validar que la entrada del usuario sea un número entero
    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "That is not an integer, guess again:"
        continue
    fi
    # Comparar el número ingresado por el usuario con el número secreto
    if [ "$guess" -lt "$secret_number" ]; then
        echo "It's higher than that, guess again:"
    elif [ "$guess" -gt "$secret_number" ]; then
        echo "It's lower than that, guess again:"
    else
        echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
        break
    fi
done
