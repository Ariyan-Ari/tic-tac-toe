<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Tic-Tac-Toe Game</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
    }

    #game-container {
      margin-top: 50px;
    }

    #board {
      display: grid;
      grid-template-columns: repeat(3, 100px);
      grid-template-rows: repeat(3, 100px);
      gap: 5px;
      justify-content: center;
      margin-bottom: 20px;
    }

    .cell {
      width: 100px;
      height: 100px;
      background-color: #ddd;
      display: flex;
      justify-content: center;
      align-items: center;
      font-size: 36px;
      cursor: pointer;
      border: 2px solid #333;
    }

    h1 {
      font-size: 36px;
    }

    #message {
      font-size: 24px;
      font-weight: bold;
      color: #333;
      margin-bottom: 10px;
    }

    #reset-btn {
      padding: 10px 20px;
      font-size: 16px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div id="game-container">
    <h1>Tic-Tac-Toe</h1>
    <div id="board">
      <div class="cell" data-index="0"></div>
      <div class="cell" data-index="1"></div>
      <div class="cell" data-index="2"></div>
      <div class="cell" data-index="3"></div>
      <div class="cell" data-index="4"></div>
      <div class="cell" data-index="5"></div>
      <div class="cell" data-index="6"></div>
      <div class="cell" data-index="7"></div>
      <div class="cell" data-index="8"></div>
    </div>
    <div id="message">Player X's turn</div>
    <button id="reset-btn">Reset Game</button>
  </div>

  <script>
    let currentPlayer = 'X';
    let board = ['', '', '', '', '', '', '', '', ''];
    let gameOver = false;

    const cells = document.querySelectorAll('.cell');
    const message = document.getElementById('message');
    const resetBtn = document.getElementById('reset-btn');

    function checkWinner() {
      const winningCombos = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
        [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
        [0, 4, 8], [2, 4, 6] // diagonals
      ];

      for (let combo of winningCombos) {
        const [a, b, c] = combo;
        if (board[a] && board[a] === board[b] && board[a] === board[c]) {
          return board[a];
        }
      }
      return null;
    }

    function isBoardFull() {
      return board.every(cell => cell !== '');
    }

    function handleCellClick(event) {
      if (gameOver) return;

      const index = event.target.dataset.index;

      if (board[index]) return;

      board[index] = currentPlayer;
      event.target.textContent = currentPlayer;

      if (checkWinner()) {
        message.textContent = `${currentPlayer} wins!`;
        gameOver = true;
        return;
      }

      if (isBoardFull()) {
        message.textContent = "It's a draw!";
        gameOver = true;
        return;
      }

      currentPlayer = currentPlayer === 'X' ? 'O' : 'X';
      message.textContent = `Player ${currentPlayer}'s turn`;
    }

    function resetGame() {
      board = ['', '', '', '', '', '', '', '', ''];
      gameOver = false;
      currentPlayer = 'X';
      message.textContent = `Player ${currentPlayer}'s turn`;

      cells.forEach(cell => {
        cell.textContent = '';
      });
    }

    cells.forEach(cell => {
      cell.addEventListener('click', handleCellClick);
    });

    resetBtn.addEventListener('click', resetGame);
  </script>
</body>
</html>
