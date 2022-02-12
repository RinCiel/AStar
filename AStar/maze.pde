int[][] maze; //<>// //<>//

void createMaze(int size) {
  size(600, 600);
  maze = new int[size][size];
  for (int i = 0; i < maze.length; i++) {
    for (int j = 0; j < maze[i].length; j++) {
      maze[i][j] = 1;
    }
  }
  unexplored = new ArrayList<int[]>();
  makeMaze(int(random(mazeSize)), int(random(mazeSize)));
  boolean beginSet = false;
  for (int i = 0; i < mazeSize; i++) {
    if (!beginSet) {
      for (int j = 0; j < mazeSize; j++) {
        if (maze[i][j] == 0) {
          maze[i][j] = 2;
          beginSet = true;
          break;
        }
      }
    }
  }
  boolean endSet = false;
  for (int i = mazeSize - 1; i >= 0; i--) {
    if (!endSet) {
      for (int j = mazeSize - 1; j >= 0; j--) {
        if (maze[i][j] == 0) {
          maze[i][j] = 3;
          endSet = true;
          break;
        }
      }
    }
  }
}


ArrayList<int[]> unexplored;
void makeMaze(int i, int j) {
  maze[i][j] = 0;
  if (i >= 2 && maze[i-2][j] == 1) {
    int[] coords = {i-1, j, i-2, j};
    unexplored.add(coords);
  }
  if (i < mazeSize - 2 && maze[i+2][j] == 1) {
    int[] coords = {i+1, j, i+2, j};
    unexplored.add(coords);
  }
  if (j >= 2 && maze[i][j-2] == 1) {
    int[] coords = {i, j-1, i, j-2};
    unexplored.add(coords);
  }
  if (j < mazeSize - 2 && maze[i][j+2] == 1) {
    int[] coords = {i, j+1, i, j+2};
    unexplored.add(coords);
  }
  while (unexplored.size() > 0) {
    int randInt = int(random(unexplored.size()));
    int[] current = unexplored.get(randInt);
    unexplored.remove(randInt);
    if (maze[current[2]][current[3]] == 1) {
      maze[current[0]][current[1]] = 0;
      makeMaze(current[2], current[3]);
    }
  }
}
