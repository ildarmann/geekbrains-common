function Player(name, enigmaNumber) {
    this.name = name;
    this.enigmaNumber = enigmaNumber;
    this.win = false;

    this.tryGuess = function (attemptCount) {
        var userNumber = +prompt(this.name + ", угадайте загаданное число. Попытка №" + attemptCount);
        var resultString = "";
        if (userNumber === this.enigmaNumber) {
            this.win = true;
            resultString = "Ура, Вы угадали c " + attemptCount + " попытки!"
        } else if (userNumber < this.enigmaNumber) {
            resultString = "Не угадали, оно больше.";
        } else if (userNumber > this.enigmaNumber) {
            resultString = "Не угадали, оно меньше.";
        } else {
            resultString = "Вы должны ввести число.";
        }
        alert(this.name + ", " + resultString);
    }
}

function playGuessMult() {
    //Инициируем игроков
    var players = [];
    for (var i = 0; i < 2; i++) {
        var name = i == 0 ? document.getElementById("userName1").value : document.getElementById("userName2").value;
        var computerNumber = parseInt(Math.random() * 100);
        players[i] = new Player(name, computerNumber);
    }

    //Запускаем игру
    var attemptCount = 0;
    userWin = false;
    do {
        attemptCount++;
        for (var i in players) {
            players[i].tryGuess(attemptCount);
            userWin = userWin || players[i].win;
        }

        if (userWin) break; //кто-то победил

    } while (window.confirm(" Хотите продолжить?"));


    var alertStr = "";
    if (players[0].win && players[1].win) { // Оба угадали
        alertStr = "Поздравляю Вы оба угадали, у Вас ничья!";

    } else if (players[0].win || players[1].win) { // Один из них победил
        alertStr = "Поздравляю " +
            (players[0].win ? players[0].name : players[1].name) +
            "! Вы победили c " + attemptCount + " попытки!";
    } else { // никто не угадал
        var alertStr = "К сожалению никто из Вас не смог угадать загаданное число.";
        for (var i in players) {
            alertStr += "\n\t- У " + players[i].name + " было загадано число: " + players[i].enigmaNumber + ";";
        }
        alertStr += "\nКол-во попыток: " + attemptCount + "."
    }
    alert(alertStr);

}
