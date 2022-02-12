import pathfinder.*;

Graph graph;

int id = 0;
int startid = 0;
int endid = 0;
int[] steps;
int[] examined;

block[][] mazeView; 

int mazeSize = 50;

void setup() {
  size(600, 600);
  strokeWeight(0);
  createMaze(mazeSize);
  mazeView = new block[mazeSize][mazeSize];
  loadMaze();
  solve();
}

void solve() {
  graph = new Graph(maze.length * maze[0].length);
  addNodes();
  addEdges();
  graph.compact();
  search();
}

int currentStep = 0;
void draw() {
  for (int i = 0; i < mazeSize; i++) {
    for (int j = 0; j < mazeSize; j++) {
      mazeView[i][j].display();
    }
  }
  if (currentStep < steps.length) {
    int x = steps[currentStep] / mazeSize;
    int y = steps[currentStep] % mazeSize;
    mazeView[x][y].type = 4;
    currentStep++;
  }
  
  // show examined edges
  //else {
  //  for (int i = 0; i < examined.length; i++) {
  //    int x = examined[i] / mazeSize;
  //    int y = examined[i] % mazeSize;
  //    if (mazeView[x][y].type != 4) mazeView[x][y].type = 5;
  //  }
  //}
}

void loadMaze() {
  float blockHeight = float(height) / maze.length;
  float blockWidth  = float(width)  / maze[0].length;
  
  for (int i = 0; i < maze.length; i++) {
    for (int j = 0; j < maze[i].length; j++) {
      mazeView[i][j] = new block(j * blockWidth, i * blockHeight, blockWidth, blockHeight, maze[i][j]); 
    }
  }
}
