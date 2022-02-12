void addNodes() {
  for (int i = 0; i < maze.length; i++) {
    for (int j = 0; j < maze[i].length; j++) {
      GraphNode node = new GraphNode(id, j, i); // j - x, i - y
      if (maze[i][j] == 2) {
        startid = id;
      }
      else if (maze[i][j] == 3) {
        endid = id;
      }
      id++;
      graph.addNode(node);
    }
  }
}

void addEdges() {
  for (int i = 0; i < maze.length; i++) {
    for (int j = 0; j < maze[i].length; j++) {
      int currentID = i * maze[i].length + j;
      if (maze[i][j] == 0 || maze[i][j] == 2 || maze[i][j] == 3) {
        if (i > 0) {
          if (maze[i-1][j] == 0 || maze[i-1][j] == 2 || maze[i-1][j] == 3) {
            graph.addEdge(currentID, currentID - maze[i].length, 1, 1);
          }
        }
        if (i < maze.length - 1) {
          if (maze[i+1][j] == 0 || maze[i+1][j] == 2 || maze[i+1][j] == 3) {
            graph.addEdge(currentID, currentID + maze[i].length, 1, 1);
          }
        }
        if (j > 0) {
          if (maze[i][j-1] == 0 || maze[i][j-1] == 2 || maze[i][j-1] == 3) {
            graph.addEdge(currentID, currentID - 1, 1, 1);
          }
        }
        if (j < maze[i].length - 1) {
          if (maze[i][j+1] == 0 || maze[i][j+1] == 2 || maze[i][j+1] == 3) {
            graph.addEdge(currentID, currentID + 1, 1, 1);
          }
        }
      }
    }
  }
}

void search() {
  GraphSearch_Astar search = new GraphSearch_Astar(graph);
  search.search(startid, endid, true);
  GraphNode[] nodes = search.getRoute();
  steps = new int[nodes.length];
  for (int i = 0; i < nodes.length; i++) {
    steps[i] = nodes[i].id();
  }
  
  // examined
  GraphEdge[] edges = search.getExaminedEdges();
  examined = new int[edges.length * 2];
  for (int i = 0; i < edges.length; i+=2) {
    examined[i] = edges[i].from().id();
    examined[i+1] = edges[i].to().id();
  }
}
