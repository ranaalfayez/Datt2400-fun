class Hexaboard {

  float w = 10;
  float h = sin(radians(60))*w;
  int columns, rows;
  
  Cell[][] board;
  Hexaboard() {
    // Initialize rows, columns and set-up arrays
    columns = 150;
    rows = 200;
    board = new Cell[columns][rows];
    init();
  }

  void init() {
    float h = sin(radians(60))*w;
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        if (j % 2 == 0) board[i][j] = new Cell(i*w*3 - 100, j*h -100,w);
        else board[i][j] = new Cell(i*w*3+w+w/2, j*h, w);
      }
    }
  }

  void display() {
    for ( int i = 0; i < columns;i++) {
      for ( int j = 0; j < rows;j++) {
        board[i][j].display();
      }
    }
  }
}
