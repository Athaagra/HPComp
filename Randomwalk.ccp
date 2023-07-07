/*#include <stdio.h> 
#include <stdlib.h>
#include <time.h>
#include <random>
int randomInt(int max);
int main()
{
    int i, j = 0;
    const int L = 10;
    const int totalHops = 20;
    int sites[10] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
    for (int k = 0; k < L; k++)
    {
        sites[k] = k + 1;
    }
    int* location;
    location = &sites[j];
    //srandom(time(NULL));
    printf("\nThe seed value for this 'random walk' is: %ld.\n\n", time(NULL));
    printf("Initial location of the particle is at site %d.\n\n", *location);
    //tracker[0] = sites[0];
    for (i = 1; i <= totalHops; i++)
    {
        int direction = randomInt(2);
        // Two possible directions for particle to move, 0 = left, 1 = right // 
        if (direction == 1) {
            location += 1; // pointer moves right one space on array //
            if (location == &sites[L - 1] + 1) // takes particle from site 10 to 1 //
            {
                location = &sites[0];
            }
        }
        else if (direction == 0) {
            location -= 1; // pointer moves left one space on array //
            if (location == &sites[0] - 1) // takes particle from site 1 to 10 //
            {
                location = &sites[L - 1];
            }
        }
        printf("After %2.d hop(s), the particle is at site %d.\n", i, (*location));
    } printf("\n");
}
// function definition //
int randomInt(int max)
{
    return ( random() % max);
}*/

/* This program generates an N step Random Walk */
//#ifdef _WIN32
//#define _CRT_SECURE_NO_WARNINGS
//#endif
//#include <stdlib.h>
//#include <stdio.h>
//#include <math.h>
//#include <time.h>
//#include <iostream>
//#include <list>
// 
//#include <bits/stdc++.h>
//using namespace std;
//using namespace Graph;

//using namespace std;

//double getRand()
//{
//    return rand() / ((double)RAND_MAX);
//}
//class Graph {
//    int numVertices;
//    std::list<int>* adjLists;
//    bool* visited;

//public:
    //std::list<int>* adjLists;
//    Graph(int vertices);
//    void addEdge(int src, int dest);
//    void RW(int startVertex);
//    void print() {
//        for (int i = 0; i < 1; i++) {
//            list<int> aR;
//            cout << i << ": ";
//           for (int j = 0; j < adjLists[i].size(); j++) {
//                cout << &adjLists[j] << " ";
//                aR.push_back(2);// adjLists[j]);
                //std::cin >> aR[n];
                //aR.push_back(adjLists[j]);
                //std::copy(adjLists[i].begin(), adjLists[i].end(), std::back_inserter(aR));
                //std::cout << "The list " << &ar << " ";
//            }
//            cout << "The list " << &aR << " ";
//            const int nbr = aR.size();
//            std::cout << "The nbr " << &nbr << " ";
//            int prob[10] = {};
//            for (int x = 0; x < 2; x++) {
//                 prob[x] = x + 1;
//            }
//            int* max = prob; //larger element pointer initially pointed to first element
//            for (int f = 1; f < 10; f++) {
//                if (prob[f] > *max)
//                {
//                  max = &prob[f]; //updating the pointer to maximum 
//                }
//            }
//            int index = max - prob; //pointer arithmetic to obtain the index
//            std::cout << "The largest index is " << index << "\n";
//            }
//         cout << endl;
        
//    }
//};

// Create a graph with given vertices,
// and maintain an adjacency list
//Graph::Graph(int vertices) {
//    numVertices = vertices;
//    adjLists = new list<int>[vertices];
//}

// Add edges to the graph
//void Graph::addEdge(int src, int dest) {
//    adjLists[src].push_back(dest);
//    adjLists[dest].push_back(src);
//}
//void Graph::RW(int startVertex) {
//    FILE* fileout;
//    fileout = fopen("rajiv.txt", "w");
//    int N, j, x;
    //int sites[10] = { 1,2,3,4,5,6,7,8,9,10 };
//    const int L = 10;
//    int sites[L] = {};
//    float r;
//    srand((unsigned int)time(NULL));
//    visited = new bool[numVertices];
//    cout << "Visited Start Vertex" << visited[startVertex] << " ";
//    int currVertex = visited[startVertex];
//    cout << "Visited " << currVertex << " ";
    //list<int>::iterator currVertex; //vertexnow = adjLists; // [currVertex] .begin();
    //cout << " adjlist " << currVertex << " ";
    //scanf("%i", &vertexnow);
    //printf("Enter number of steps, N: ");
    //scanf("%i", &);;
//    x = 0 ;
//    for (j = 1; j < 2; j++) {
//        visited[j] = false;
//    list<int>::iterator j;
//    list<int> queue;
   // cout << "adjvertex " << adjLists << " ";
    //if (j != adjLists[currVertex].end()) {
    //    int adjVertex = *j;
    //    queue.push_back(adjVertex);
    //}
//    queue.push_back(currVertex);
//    int nextVertex = queue.front();
//    int size = queue.size();
//    cout << "size of the list is : " << size;
//    queue.pop_front();
    //j = adjLists[nextVertex].begin();
    //cout << j << " ";
    //j++;
    //int adjVertex = *j;
    //queue.push_back(adjVertex);
    //int nnextVertex = queue.front();
    //cout << "List 9 contents: " << endl;
    //list<int>::iterator ptr= adjLists[nextVertex].begin();
    //auto it = next(ptr, 3);
    //cout << "ptr " << *ptr;
 //   for (auto it = adjLists[nextVertex].begin(); it != adjLists[nextVertex].end(); ++it){
 //       cout << *it << endl;
 //       int adjVertex = *it;
 //       queue.push_back(adjVertex);
 //       cout << "size of the list is : " << adjLists[nextVertex].max_size();
 //       }
    //cout << "nextadjvertex" << nnextVertex << " ";
        //for (j = adjLists[currVertex].begin(); j != adjLists[currVertex].end(); ++j) {
        //    int adjVertex = *j;
        //    cout << "adjvertex " << adjLists << " ";
        //    if (!visited[adjVertex]) {
        //        visited[adjVertex] = true;
        //        queue.push_back(adjVertex);
        //    }
        //}
//    }

    //for (j = 1; j < 200; j++)//(j = adjLists[currVertex].begin(); j != adjLists[currVertex].end(); ++j)
    //{
    //    r = getRand();
    //    if (r < 0.5)
    //    {
            //x = x - 1;
    //        x -= 1; // pointer moves right one space on array //
    //        if (x == (int)&sites[L - 1] + 1) // takes particle from site 10 to 1 //
    //        {
    //            x = (int)&sites[0];
    //        }
    //    }
    //    else
    //    {
    //        x += 1; // pointer moves left one space on array //
    //        if (x == (int)&sites[0] - 1) // takes particle from site 1 to 10 //
    //        {
    //            x = (int)&sites[L - 1];
    //        }
    //    }
    //    fprintf(fileout, " %d %d \n", j, x);
    //}
    //fclose(fileout);
    //return 0;
//}

#include <iostream>
#include <vector>
#ifdef _WIN32
#define _CRT_SECURE_NO_WARNINGS
#endif
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <time.h>
#include <list>
#include <iterator>
#include <algorithm>

using namespace std;

class Graph {
//private:
    int numVertices;
    vector<vector<int>> adjList;

public:
    Graph(int n) {
        numVertices = n;
        adjList.resize(numVertices);
        void RW(int startVertex);
    }

    void addEdge(int src, int dest) {
        adjList[src].push_back(dest);
        adjList[dest].push_back(src);
    }

    void deleteEdge(int src, int dest) {
        // Find the index of the destination vertex in the source vertex's adjacency list
        int destIndex = -1;
        for (int i = 0; i < adjList[src].size(); i++) {
            if (adjList[src][i] == dest) {
                destIndex = i;
                break;
            }
        }
        // Remove the destination vertex from the source vertex's adjacency list
        if (destIndex != -1) {
            adjList[src].erase(adjList[src].begin() + destIndex);
        }

        // Find the index of the source vertex in the destination vertex's adjacency list
        int srcIndex = -1;
        for (int i = 0; i < adjList[dest].size(); i++) {
            if (adjList[dest][i] == src) {
                srcIndex = i;
                break;
            }
        }
        // Remove the source vertex from the destination vertex's adjacency list
        if (srcIndex != -1) {
            adjList[dest].erase(adjList[dest].begin() + srcIndex);
        }
    }

    bool isConnected(int src, int dest) {
        for (int i = 0; i < adjList[src].size(); i++) {
            if (adjList[src][i] == dest) {
                return true;
            }
        }
        return false;
    }

    void print() {
        for (int i = 0; i < numVertices; i++) {
            cout << i << ": ";
            for (int j = 0; j < adjList[i].size(); j++) {
                cout << adjList[i][j] << " ";
            }
            cout << endl;
        }
    }
    void RW(int startVertex) {
        int startVert = startVertex;
        list<int> queue;
        int b = 0;
        while (b < 1500) {
            for (int i = 0; i < 200; i++) {
                list<int> aR;
                //cout << i << ": ";
                cout << startVert << ": ";
                //if (i == startVert) 
                for (int j = 0; j < adjList[i].size(); j++) {
                    //cout << j << " ";
                    aR.push_back(j);
                    //std::cin >> aR[n];
                    //aR.push_back(adjLists[j]);
                    //std::copy(adjLists[i].begin(), adjLists[i].end(), std::back_inserter(aR));
                    //std::cout << "The list " << &ar << " ";

                }
                //cout << "The list " << *aR << " ";
                const int nbr = aR.size();
                //cout << "The nbr " << nbr << " ";
                int prob[20] = {};
                for (int x = 0; x < nbr; x++) {
                    prob[x] = x + 1;
                }
                int* max = prob; //larger element pointer initially pointed to first element
                for (int f = 1; f < nbr; f++) {
                    if (prob[f] > *max)
                    {
                        max = &prob[f]; //updating the pointer to maximum 
                    }
                }
                int index = max - prob; //pointer arithmetic to obtain the index
                //std::cout << "The largest index is " << index << "\n";
                auto vertex = std::next(aR.begin(), index);
                //int newVertex = aR[index];
                std::cout << "Vertex = " << *vertex << std::endl;
                queue.push_back(*vertex);
                b++;
                //startVert = *vertex;
                //for (int z = 0; z < queue.size(); z++) {
                //    cout << queue[z] << " ";
                //    cout << endl;
                //}
                std::cout << "The while " << b << "\n";
            }
            cout << endl;

        }
    }
};

//void Graph::RW(int startVertex) {
//            for (int i = 0; i < 1; i++) {
//                list<int> aR;
//                cout << i << ": ";
//               for (int j = 0; j < adjList[i].size(); j++) {
//                    cout << &adjList[j] << " ";
                    //aR.push_back(2);// adjLists[j]);
                    //std::cin >> aR[n];
                    //aR.push_back(adjLists[j]);
                    //std::copy(adjLists[i].begin(), adjLists[i].end(), std::back_inserter(aR));
                    //std::cout << "The list " << &ar << " ";
//                }
//                cout << "The list " << &aR << " ";
//                const int nbr = aR.size();
//                std::cout << "The nbr " << &nbr << " ";
//                int prob[10] = {};
//                for (int x = 0; x < 2; x++) {
//                     prob[x] = x + 1;
//                }
//                int* max = prob; //larger element pointer initially pointed to first element
//                for (int f = 1; f < 10; f++) {
//                    if (prob[f] > *max)
//                    {
//                      max = &prob[f]; //updating the pointer to maximum 
//                    }
//                }
//                int index = max - prob; //pointer arithmetic to obtain the index
//                std::cout << "The largest index is " << index << "\n";
//                }
//             cout << endl;

//        }

    //};



int main()
{   
    Graph g(251);
    g.addEdge(0, 1);
    g.addEdge(0, 2);
    g.addEdge(1, 2);
    g.addEdge(2, 0);
    g.addEdge(2, 3);
    g.addEdge(3, 3);
    g.addEdge(3, 4);
    g.addEdge(3, 5);
    g.addEdge(3, 6);
    g.addEdge(3, 7);
    g.addEdge(3, 8);
    g.addEdge(3, 9);
    g.addEdge(3, 10);
    g.addEdge(3, 11);
    g.addEdge(3, 12);
    g.addEdge(3, 13);
    g.addEdge(3, 14);
    g.addEdge(3, 15);
    g.addEdge(4, 67);
    g.addEdge(4, 68);
    g.addEdge(4, 8);
    g.addEdge(4, 69);
    g.addEdge(4, 70);
    g.addEdge(4, 71);
    g.addEdge(4, 75);
    g.addEdge(4, 72);
    g.addEdge(4, 74);
    g.addEdge(4, 73);
    g.addEdge(4, 76);
    g.addEdge(5, 66);
    g.addEdge(5, 76);
    g.addEdge(5, 86);
    g.addEdge(5, 96);
    g.addEdge(5, 100);
    g.addEdge(5, 81);
    g.addEdge(5, 82);
    g.addEdge(5, 83);
    g.addEdge(5, 84);
    g.addEdge(5, 85);
    g.addEdge(5, 86);
    g.addEdge(5, 87);
    g.addEdge(5, 88);
    g.addEdge(5, 89);
    g.addEdge(5, 101);
    g.addEdge(6, 69);
    g.addEdge(6, 79);
    g.addEdge(6, 89);
    g.addEdge(6, 99);
    g.addEdge(6, 109);
    g.addEdge(6, 119);
    g.addEdge(6, 129);
    g.addEdge(6, 139);
    g.addEdge(6, 149);
    g.addEdge(6, 159);
    g.addEdge(6, 169);
    g.addEdge(6, 179);
    g.addEdge(6, 189);
    g.addEdge(6, 199);
    g.addEdge(6, 209);
    g.addEdge(7, 106);
    g.addEdge(7, 107);
    g.addEdge(7, 108);
    g.addEdge(7, 109);
    g.addEdge(7, 101);
    g.addEdge(7, 111);
    g.addEdge(7, 121);
    g.addEdge(7, 131);
    g.addEdge(7, 141);
    g.addEdge(7, 151);
    g.addEdge(7, 161);
    g.addEdge(7, 171);
    g.addEdge(7, 181);
    g.addEdge(7, 191);
    g.addEdge(7, 201);
    g.addEdge(8, 106);
    g.addEdge(8, 107);
    g.addEdge(8, 108);
    g.addEdge(8, 109);
    g.addEdge(8, 110);
    g.addEdge(8, 111);
    g.addEdge(8, 112);
    g.addEdge(8, 113);
    g.addEdge(8, 114);
    g.addEdge(8, 115);
    g.addEdge(8, 116);
    g.addEdge(8, 117);
    g.addEdge(8, 118);
    g.addEdge(8, 119);
    g.addEdge(8, 120);
    g.addEdge(9, 160);
    g.addEdge(9, 170);
    g.addEdge(9, 180);
    g.addEdge(9, 190);
    g.addEdge(9, 210);
    g.addEdge(9, 211);
    g.addEdge(9, 112);
    g.addEdge(9, 213);
    g.addEdge(9, 214);
    g.addEdge(9, 215);
    g.addEdge(9, 216);
    g.addEdge(9, 217);
    g.addEdge(9, 218);
    g.addEdge(9, 219);
    g.addEdge(9, 220);
    g.addEdge(10, 6);
    g.addEdge(10, 7);
    g.addEdge(10, 8);
    g.addEdge(10, 9);
    g.addEdge(10, 10);
    g.addEdge(10, 221);
    g.addEdge(10, 222);
    g.addEdge(10, 223);
    g.addEdge(10, 224);
    g.addEdge(10, 225);
    g.addEdge(10, 226);
    g.addEdge(10, 227);
    g.addEdge(10, 228);
    g.addEdge(10, 229);
    g.addEdge(10, 230);
    g.addEdge(11, 6);
    g.addEdge(11, 7);
    g.addEdge(11, 8);
    g.addEdge(11, 9);
    g.addEdge(11, 10);
    g.addEdge(11, 11);
    g.addEdge(11, 12);
    g.addEdge(11, 13);
    g.addEdge(11, 14);
    g.addEdge(11, 15);
    g.addEdge(11, 16);
    g.addEdge(11, 17);
    g.addEdge(11, 18);
    g.addEdge(11, 19);
    g.addEdge(11, 20);
    g.addEdge(12, 231);
    g.addEdge(12, 232);
    g.addEdge(12, 233);
    g.addEdge(12, 234);
    g.addEdge(12, 235);
    g.addEdge(12, 236);
    g.addEdge(12, 237);
    g.addEdge(12, 238);
    g.addEdge(12, 239);
    g.addEdge(12, 240);
    g.addEdge(12, 241);
    g.addEdge(12, 242);
    g.addEdge(12, 243);
    g.addEdge(12, 244);
    g.addEdge(12, 245);
    g.addEdge(13, 246);
    g.addEdge(13, 247);
    g.addEdge(13, 248);
    g.addEdge(13, 249);
    g.addEdge(13, 250);
    g.addEdge(13, 71);
    g.addEdge(13, 72);
    g.addEdge(13, 73);
    g.addEdge(13, 74);
    g.addEdge(13, 75);
    g.addEdge(13, 76);
    g.addEdge(13, 77);
    g.addEdge(13, 78);
    g.addEdge(13, 79);
    g.addEdge(13, 80);
    g.addEdge(14, 6);
    g.addEdge(14, 7);
    g.addEdge(14, 8);
    g.addEdge(14, 9);
    g.addEdge(14, 90);
    g.addEdge(14, 91);
    g.addEdge(14, 92);
    g.addEdge(14, 93);
    g.addEdge(14, 94);
    g.addEdge(14, 95);
    g.addEdge(14, 96);
    g.addEdge(14, 97);
    g.addEdge(14, 98);
    g.addEdge(14, 99);
    g.addEdge(14, 100);
    g.addEdge(15, 6);
    g.addEdge(15, 7);
    g.addEdge(15, 8);
    g.addEdge(15, 9);
    g.addEdge(15, 10);
    g.addEdge(15, 11);
    g.addEdge(15, 12);
    g.addEdge(15, 13);
    g.addEdge(15, 14);
    g.addEdge(15, 15);
    g.addEdge(15, 16);
    g.addEdge(15, 17);
    g.addEdge(15, 18);
    g.addEdge(15, 19);
    g.addEdge(15, 20);
    g.addEdge(16, 6);
    g.addEdge(16, 7);
    g.addEdge(16, 8);
    g.addEdge(16, 9);
    g.addEdge(16, 10);
    g.addEdge(16, 11);
    g.addEdge(16, 12);
    g.addEdge(16, 13);
    g.addEdge(16, 14);
    g.addEdge(16, 15);
    g.addEdge(16, 16);
    g.addEdge(16, 17);
    g.addEdge(16, 18);
    g.addEdge(16, 19);
    g.addEdge(16, 20);
    g.addEdge(17, 6);
    g.addEdge(17, 7);
    g.addEdge(17, 8);
    g.addEdge(17, 9);
    g.addEdge(17, 10);
    g.addEdge(17, 11);
    g.addEdge(17, 12);
    g.addEdge(17, 13);
    g.addEdge(17, 14);
    g.addEdge(17, 15);
    g.addEdge(17, 16);
    g.addEdge(17, 17);
    g.addEdge(17, 18);
    g.addEdge(17, 19);
    g.addEdge(17, 20);
    g.addEdge(18, 6);
    g.addEdge(18, 7);
    g.addEdge(18, 8);
    g.addEdge(18, 9);
    g.addEdge(18, 10);
    g.addEdge(18, 11);
    g.addEdge(18, 12);
    g.addEdge(18, 13);
    g.addEdge(18, 14);
    g.addEdge(18, 15);
    g.addEdge(18, 16);
    g.addEdge(18, 17);
    g.addEdge(18, 18);
    g.addEdge(18, 19);
    g.addEdge(18, 20);
    g.addEdge(19, 6);
    g.addEdge(19, 7);
    g.addEdge(19, 8);
    g.addEdge(19, 9);
    g.addEdge(19, 10);
    g.addEdge(19, 11);
    g.addEdge(19, 12);
    g.addEdge(19, 13);
    g.addEdge(19, 14);
    g.addEdge(19, 15);
    g.addEdge(19, 16);
    g.addEdge(19, 17);
    g.addEdge(19, 18);
    g.addEdge(19, 19);
    g.addEdge(19, 20);
    g.addEdge(20, 6);
    g.addEdge(20, 7);
    g.addEdge(20, 8);
    g.addEdge(20, 9);
    g.addEdge(20, 10);
    g.addEdge(20, 11);
    g.addEdge(20, 12);
    g.addEdge(20, 13);
    g.addEdge(20, 14);
    g.addEdge(20, 15);
    g.addEdge(20, 16);
    g.addEdge(20, 17);
    g.addEdge(20, 18);
    g.addEdge(20, 19);
    g.addEdge(20, 20);
    g.addEdge(21, 6);
    g.addEdge(21, 7);
    g.addEdge(21, 8);
    g.addEdge(21, 9);
    g.addEdge(21, 10);
    g.addEdge(21, 11);
    g.addEdge(21, 12);
    g.addEdge(21, 13);
    g.addEdge(21, 14);
    g.addEdge(21, 15);
    g.addEdge(21, 16);
    g.addEdge(21, 17);
    g.addEdge(21, 18);
    g.addEdge(21, 19);
    g.addEdge(21, 20);
    g.addEdge(22, 6);
    g.addEdge(22, 7);
    g.addEdge(22, 8);
    g.addEdge(22, 9);
    g.addEdge(22, 10);
    g.addEdge(22, 11);
    g.addEdge(22, 12);
    g.addEdge(22, 13);
    g.addEdge(22, 14);
    g.addEdge(22, 15);
    g.addEdge(22, 16);
    g.addEdge(22, 17);
    g.addEdge(22, 18);
    g.addEdge(22, 19);
    g.addEdge(22, 20);
    g.addEdge(23, 6);
    g.addEdge(23, 7);
    g.addEdge(23, 8);
    g.addEdge(23, 9);
    g.addEdge(23, 10);
    g.addEdge(23, 11);
    g.addEdge(23, 12);
    g.addEdge(23, 13);
    g.addEdge(23, 14);
    g.addEdge(23, 15);
    g.addEdge(23, 16);
    g.addEdge(23, 17);
    g.addEdge(23, 18);
    g.addEdge(23, 19);
    g.addEdge(23, 20);
    g.addEdge(24, 6);
    g.addEdge(24, 7);
    g.addEdge(24, 8);
    g.addEdge(24, 9);
    g.addEdge(24, 10);
    g.addEdge(24, 11);
    g.addEdge(24, 12);
    g.addEdge(24, 13);
    g.addEdge(24, 14);
    g.addEdge(24, 15);
    g.addEdge(24, 16);
    g.addEdge(24, 17);
    g.addEdge(24, 18);
    g.addEdge(24, 19);
    g.addEdge(24, 20);
    g.addEdge(25, 6);
    g.addEdge(25, 7);
    g.addEdge(25, 8);
    g.addEdge(25, 9);
    g.addEdge(25, 10);
    g.addEdge(25, 11);
    g.addEdge(25, 12);
    g.addEdge(25, 13);
    g.addEdge(25, 14);
    g.addEdge(25, 15);
    g.addEdge(25, 16);
    g.addEdge(25, 17);
    g.addEdge(25, 18);
    g.addEdge(25, 19);
    g.addEdge(25, 20);
    g.addEdge(26, 6);
    g.addEdge(26, 7);
    g.addEdge(26, 8);
    g.addEdge(26, 9);
    g.addEdge(26, 10);
    g.addEdge(26, 11);
    g.addEdge(26, 12);
    g.addEdge(26, 13);
    g.addEdge(26, 14);
    g.addEdge(26, 15);
    g.addEdge(26, 16);
    g.addEdge(26, 17);
    g.addEdge(26, 18);
    g.addEdge(26, 19);
    g.addEdge(26, 20);
    g.addEdge(27, 6);
    g.addEdge(27, 7);
    g.addEdge(27, 8);
    g.addEdge(27, 9);
    g.addEdge(27, 10);
    g.addEdge(27, 11);
    g.addEdge(27, 12);
    g.addEdge(27, 13);
    g.addEdge(27, 14);
    g.addEdge(27, 15);
    g.addEdge(27, 16);
    g.addEdge(27, 17);
    g.addEdge(27, 18);
    g.addEdge(27, 19);
    g.addEdge(27, 20);
    g.addEdge(28, 6);
    g.addEdge(28, 7);
    g.addEdge(28, 8);
    g.addEdge(28, 9);
    g.addEdge(28, 10);
    g.addEdge(28, 11);
    g.addEdge(28, 12);
    g.addEdge(28, 13);
    g.addEdge(28, 14);
    g.addEdge(28, 15);
    g.addEdge(28, 16);
    g.addEdge(28, 17);
    g.addEdge(28, 18);
    g.addEdge(28, 19);
    g.addEdge(28, 20);
    g.addEdge(29, 6);
    g.addEdge(29, 7);
    g.addEdge(29, 8);
    g.addEdge(29, 9);
    g.addEdge(29, 10);
    g.addEdge(29, 11);
    g.addEdge(29, 12);
    g.addEdge(29, 13);
    g.addEdge(29, 14);
    g.addEdge(29, 15);
    g.addEdge(29, 16);
    g.addEdge(29, 17);
    g.addEdge(29, 18);
    g.addEdge(29, 19);
    g.addEdge(29, 20);
    g.addEdge(30, 6);
    g.addEdge(30, 7);
    g.addEdge(30, 8);
    g.addEdge(30, 9);
    g.addEdge(30, 10);
    g.addEdge(30, 11);
    g.addEdge(30, 12);
    g.addEdge(30, 13);
    g.addEdge(30, 14);
    g.addEdge(30, 15);
    g.addEdge(30, 16);
    g.addEdge(30, 17);
    g.addEdge(30, 18);
    g.addEdge(30, 19);
    g.addEdge(30, 20);
    g.addEdge(31, 6);
    g.addEdge(31, 7);
    g.addEdge(31, 8);
    g.addEdge(31, 9);
    g.addEdge(31, 10);
    g.addEdge(31, 11);
    g.addEdge(31, 12);
    g.addEdge(31, 13);
    g.addEdge(31, 14);
    g.addEdge(31, 15);
    g.addEdge(31, 16);
    g.addEdge(31, 17);
    g.addEdge(31, 18);
    g.addEdge(31, 19);
    g.addEdge(31, 20);
    g.addEdge(32, 6);
    g.addEdge(32, 7);
    g.addEdge(32, 8);
    g.addEdge(32, 9);
    g.addEdge(32, 10);
    g.addEdge(32, 11);
    g.addEdge(32, 12);
    g.addEdge(32, 13);
    g.addEdge(32, 14);
    g.addEdge(32, 15);
    g.addEdge(32, 16);
    g.addEdge(32, 17);
    g.addEdge(32, 18);
    g.addEdge(32, 19);
    g.addEdge(32, 20);
    g.addEdge(33, 6);
    g.addEdge(33, 7);
    g.addEdge(33, 8);
    g.addEdge(33, 9);
    g.addEdge(33, 10);
    g.addEdge(33, 11);
    g.addEdge(33, 12);
    g.addEdge(33, 13);
    g.addEdge(33, 14);
    g.addEdge(33, 15);
    g.addEdge(33, 16);
    g.addEdge(33, 17);
    g.addEdge(33, 18);
    g.addEdge(33, 19);
    g.addEdge(33, 20);
    g.addEdge(34, 6);
    g.addEdge(34, 7);
    g.addEdge(34, 8);
    g.addEdge(34, 9);
    g.addEdge(34, 10);
    g.addEdge(34, 11);
    g.addEdge(34, 12);
    g.addEdge(34, 13);
    g.addEdge(34, 14);
    g.addEdge(34, 15);
    g.addEdge(34, 16);
    g.addEdge(34, 17);
    g.addEdge(34, 18);
    g.addEdge(34, 19);
    g.addEdge(34, 20);
    g.addEdge(35, 6);
    g.addEdge(35, 7);
    g.addEdge(35, 8);
    g.addEdge(35, 9);
    g.addEdge(35, 10);
    g.addEdge(35, 11);
    g.addEdge(35, 12);
    g.addEdge(35, 13);
    g.addEdge(35, 14);
    g.addEdge(35, 15);
    g.addEdge(35, 16);
    g.addEdge(35, 17);
    g.addEdge(35, 18);
    g.addEdge(35, 19);
    g.addEdge(35, 20);
    g.addEdge(36, 6);
    g.addEdge(36, 7);
    g.addEdge(36, 8);
    g.addEdge(36, 9);
    g.addEdge(36, 10);
    g.addEdge(36, 11);
    g.addEdge(36, 12);
    g.addEdge(36, 13);
    g.addEdge(36, 14);
    g.addEdge(36, 15);
    g.addEdge(36, 16);
    g.addEdge(36, 17);
    g.addEdge(36, 18);
    g.addEdge(36, 19);
    g.addEdge(36, 20);
    g.addEdge(37, 6);
    g.addEdge(37, 7);
    g.addEdge(37, 8);
    g.addEdge(37, 9);
    g.addEdge(37, 10);
    g.addEdge(37, 11);
    g.addEdge(37, 12);
    g.addEdge(37, 13);
    g.addEdge(37, 14);
    g.addEdge(37, 15);
    g.addEdge(37, 16);
    g.addEdge(37, 17);
    g.addEdge(37, 18);
    g.addEdge(37, 19);
    g.addEdge(37, 20);
    g.addEdge(38, 6);
    g.addEdge(38, 7);
    g.addEdge(38, 8);
    g.addEdge(38, 9);
    g.addEdge(38, 10);
    g.addEdge(38, 11);
    g.addEdge(38, 12);
    g.addEdge(38, 13);
    g.addEdge(38, 14);
    g.addEdge(38, 15);
    g.addEdge(38, 16);
    g.addEdge(38, 17);
    g.addEdge(38, 18);
    g.addEdge(38, 19);
    g.addEdge(38, 20);
    g.addEdge(39, 6);
    g.addEdge(39, 7);
    g.addEdge(39, 8);
    g.addEdge(39, 9);
    g.addEdge(39, 10);
    g.addEdge(39, 11);
    g.addEdge(39, 12);
    g.addEdge(39, 13);
    g.addEdge(39, 14);
    g.addEdge(39, 15);
    g.addEdge(39, 16);
    g.addEdge(39, 17);
    g.addEdge(39, 18);
    g.addEdge(39, 19);
    g.addEdge(39, 20);
    g.addEdge(40, 6);
    g.addEdge(40, 7);
    g.addEdge(40, 8);
    g.addEdge(40, 9);
    g.addEdge(40, 10);
    g.addEdge(40, 11);
    g.addEdge(40, 12);
    g.addEdge(40, 13);
    g.addEdge(40, 14);
    g.addEdge(40, 15);
    g.addEdge(40, 16);
    g.addEdge(40, 17);
    g.addEdge(40, 18);
    g.addEdge(40, 19);
    g.addEdge(40, 20);
    g.addEdge(41, 6);
    g.addEdge(41, 7);
    g.addEdge(41, 8);
    g.addEdge(41, 9);
    g.addEdge(41, 10);
    g.addEdge(41, 11);
    g.addEdge(41, 12);
    g.addEdge(41, 13);
    g.addEdge(41, 14);
    g.addEdge(41, 15);
    g.addEdge(41, 16);
    g.addEdge(41, 17);
    g.addEdge(41, 18);
    g.addEdge(41, 19);
    g.addEdge(41, 20);
    g.addEdge(42, 6);
    g.addEdge(42, 7);
    g.addEdge(42, 8);
    g.addEdge(42, 9);
    g.addEdge(42, 10);
    g.addEdge(42, 11);
    g.addEdge(42, 12);
    g.addEdge(42, 13);
    g.addEdge(42, 14);
    g.addEdge(42, 15);
    g.addEdge(42, 16);
    g.addEdge(42, 17);
    g.addEdge(42, 18);
    g.addEdge(42, 19);
    g.addEdge(42, 20);
    g.addEdge(43, 6);
    g.addEdge(43, 7);
    g.addEdge(43, 8);
    g.addEdge(43, 9);
    g.addEdge(43, 10);
    g.addEdge(43, 11);
    g.addEdge(43, 12);
    g.addEdge(43, 13);
    g.addEdge(43, 14);
    g.addEdge(43, 15);
    g.addEdge(43, 16);
    g.addEdge(43, 17);
    g.addEdge(43, 18);
    g.addEdge(43, 19);
    g.addEdge(43, 20);
    g.addEdge(44, 6);
    g.addEdge(44, 7);
    g.addEdge(44, 8);
    g.addEdge(44, 9);
    g.addEdge(44, 10);
    g.addEdge(44, 11);
    g.addEdge(44, 12);
    g.addEdge(44, 13);
    g.addEdge(44, 14);
    g.addEdge(44, 15);
    g.addEdge(44, 16);
    g.addEdge(44, 17);
    g.addEdge(44, 18);
    g.addEdge(44, 19);
    g.addEdge(44, 20);
    g.addEdge(45, 6);
    g.addEdge(45, 7);
    g.addEdge(45, 8);
    g.addEdge(45, 9);
    g.addEdge(45, 10);
    g.addEdge(45, 11);
    g.addEdge(45, 12);
    g.addEdge(45, 13);
    g.addEdge(45, 14);
    g.addEdge(45, 15);
    g.addEdge(45, 16);
    g.addEdge(45, 17);
    g.addEdge(45, 18);
    g.addEdge(45, 19);
    g.addEdge(45, 20);
    g.addEdge(46, 6);
    g.addEdge(46, 7);
    g.addEdge(46, 8);
    g.addEdge(46, 9);
    g.addEdge(46, 10);
    g.addEdge(46, 11);
    g.addEdge(46, 12);
    g.addEdge(46, 13);
    g.addEdge(46, 14);
    g.addEdge(46, 15);
    g.addEdge(46, 16);
    g.addEdge(46, 17);
    g.addEdge(46, 18);
    g.addEdge(46, 19);
    g.addEdge(46, 20);
    g.addEdge(47, 6);
    g.addEdge(47, 7);
    g.addEdge(47, 8);
    g.addEdge(47, 9);
    g.addEdge(47, 10);
    g.addEdge(47, 11);
    g.addEdge(47, 12);
    g.addEdge(47, 13);
    g.addEdge(47, 14);
    g.addEdge(47, 15);
    g.addEdge(47, 16);
    g.addEdge(47, 17);
    g.addEdge(47, 18);
    g.addEdge(47, 19);
    g.addEdge(47, 20);
    g.addEdge(48, 6);
    g.addEdge(48, 7);
    g.addEdge(48, 8);
    g.addEdge(48, 9);
    g.addEdge(48, 10);
    g.addEdge(48, 11);
    g.addEdge(48, 12);
    g.addEdge(48, 13);
    g.addEdge(48, 14);
    g.addEdge(48, 15);
    g.addEdge(48, 16);
    g.addEdge(48, 17);
    g.addEdge(48, 18);
    g.addEdge(48, 19);
    g.addEdge(48, 20);
    g.addEdge(49, 6);
    g.addEdge(49, 7);
    g.addEdge(49, 8);
    g.addEdge(49, 9);
    g.addEdge(49, 10);
    g.addEdge(49, 11);
    g.addEdge(49, 12);
    g.addEdge(49, 13);
    g.addEdge(49, 14);
    g.addEdge(49, 15);
    g.addEdge(49, 16);
    g.addEdge(49, 17);
    g.addEdge(49, 18);
    g.addEdge(49, 19);
    g.addEdge(49, 20);
    g.addEdge(50, 6);
    g.addEdge(50, 7);
    g.addEdge(50, 8);
    g.addEdge(50, 9);
    g.addEdge(50, 10);
    g.addEdge(50, 11);
    g.addEdge(50, 12);
    g.addEdge(50, 13);
    g.addEdge(50, 14);
    g.addEdge(50, 15);
    g.addEdge(50, 16);
    g.addEdge(50, 17);
    g.addEdge(50, 18);
    g.addEdge(50, 19);
    g.addEdge(50, 20);
    g.addEdge(51, 6);
    g.addEdge(51, 7);
    g.addEdge(51, 8);
    g.addEdge(51, 9);
    g.addEdge(51, 10);
    g.addEdge(51, 11);
    g.addEdge(51, 12);
    g.addEdge(51, 13);
    g.addEdge(51, 14);
    g.addEdge(51, 15);
    g.addEdge(51, 16);
    g.addEdge(51, 17);
    g.addEdge(51, 18);
    g.addEdge(51, 19);
    g.addEdge(51, 20);
    g.addEdge(52, 6);
    g.addEdge(52, 7);
    g.addEdge(52, 8);
    g.addEdge(52, 9);
    g.addEdge(52, 10);
    g.addEdge(52, 11);
    g.addEdge(52, 12);
    g.addEdge(52, 13);
    g.addEdge(52, 14);
    g.addEdge(52, 15);
    g.addEdge(52, 16);
    g.addEdge(52, 17);
    g.addEdge(52, 18);
    g.addEdge(52, 19);
    g.addEdge(52, 20);
    g.addEdge(53, 6);
    g.addEdge(53, 7);
    g.addEdge(53, 8);
    g.addEdge(53, 9);
    g.addEdge(53, 10);
    g.addEdge(53, 11);
    g.addEdge(53, 12);
    g.addEdge(53, 13);
    g.addEdge(53, 14);
    g.addEdge(53, 15);
    g.addEdge(53, 16);
    g.addEdge(53, 17);
    g.addEdge(53, 18);
    g.addEdge(53, 19);
    g.addEdge(53, 20);
    g.addEdge(54, 6);
    g.addEdge(54, 7);
    g.addEdge(54, 8);
    g.addEdge(54, 9);
    g.addEdge(54, 10);
    g.addEdge(54, 11);
    g.addEdge(54, 12);
    g.addEdge(54, 13);
    g.addEdge(54, 14);
    g.addEdge(54, 15);
    g.addEdge(54, 16);
    g.addEdge(54, 17);
    g.addEdge(54, 18);
    g.addEdge(54, 19);
    g.addEdge(54, 20);
    g.addEdge(55, 6);
    g.addEdge(55, 7);
    g.addEdge(55, 8);
    g.addEdge(55, 9);
    g.addEdge(55, 10);
    g.addEdge(55, 11);
    g.addEdge(55, 12);
    g.addEdge(55, 13);
    g.addEdge(55, 14);
    g.addEdge(55, 15);
    g.addEdge(55, 16);
    g.addEdge(55, 17);
    g.addEdge(55, 18);
    g.addEdge(55, 19);
    g.addEdge(55, 20);
    g.addEdge(56, 6);
    g.addEdge(56, 7);
    g.addEdge(56, 8);
    g.addEdge(56, 9);
    g.addEdge(56, 10);
    g.addEdge(56, 11);
    g.addEdge(56, 12);
    g.addEdge(56, 13);
    g.addEdge(56, 14);
    g.addEdge(56, 15);
    g.addEdge(56, 16);
    g.addEdge(56, 17);
    g.addEdge(56, 18);
    g.addEdge(56, 19);
    g.addEdge(56, 20);
    g.addEdge(57, 6);
    g.addEdge(57, 7);
    g.addEdge(57, 8);
    g.addEdge(57, 9);
    g.addEdge(57, 10);
    g.addEdge(57, 11);
    g.addEdge(57, 12);
    g.addEdge(57, 13);
    g.addEdge(57, 14);
    g.addEdge(57, 15);
    g.addEdge(57, 16);
    g.addEdge(57, 17);
    g.addEdge(57, 18);
    g.addEdge(57, 19);
    g.addEdge(57, 20);
    g.addEdge(58, 6);
    g.addEdge(58, 7);
    g.addEdge(58, 8);
    g.addEdge(58, 9);
    g.addEdge(58, 10);
    g.addEdge(58, 11);
    g.addEdge(58, 12);
    g.addEdge(58, 13);
    g.addEdge(58, 14);
    g.addEdge(58, 15);
    g.addEdge(58, 16);
    g.addEdge(58, 17);
    g.addEdge(58, 18);
    g.addEdge(58, 19);
    g.addEdge(58, 20);
    g.addEdge(59, 6);
    g.addEdge(59, 7);
    g.addEdge(59, 8);
    g.addEdge(59, 9);
    g.addEdge(59, 10);
    g.addEdge(59, 11);
    g.addEdge(59, 12);
    g.addEdge(59, 13);
    g.addEdge(59, 14);
    g.addEdge(59, 15);
    g.addEdge(59, 16);
    g.addEdge(59, 17);
    g.addEdge(59, 18);
    g.addEdge(59, 19);
    g.addEdge(59, 20);
    g.addEdge(60, 6);
    g.addEdge(60, 7);
    g.addEdge(60, 8);
    g.addEdge(60, 9);
    g.addEdge(60, 10);
    g.addEdge(60, 11);
    g.addEdge(60, 12);
    g.addEdge(60, 13);
    g.addEdge(60, 14);
    g.addEdge(60, 15);
    g.addEdge(60, 16);
    g.addEdge(60, 17);
    g.addEdge(60, 18);
    g.addEdge(60, 19);
    g.addEdge(60, 20);
    g.addEdge(61, 6);
    g.addEdge(61, 7);
    g.addEdge(61, 8);
    g.addEdge(61, 9);
    g.addEdge(61, 10);
    g.addEdge(61, 11);
    g.addEdge(61, 12);
    g.addEdge(61, 13);
    g.addEdge(61, 14);
    g.addEdge(61, 15);
    g.addEdge(61, 16);
    g.addEdge(61, 17);
    g.addEdge(61, 18);
    g.addEdge(61, 19);
    g.addEdge(61, 20);
    g.addEdge(62, 6);
    g.addEdge(62, 7);
    g.addEdge(62, 8);
    g.addEdge(62, 9);
    g.addEdge(62, 10);
    g.addEdge(62, 11);
    g.addEdge(62, 12);
    g.addEdge(62, 13);
    g.addEdge(62, 14);
    g.addEdge(62, 15);
    g.addEdge(62, 16);
    g.addEdge(62, 17);
    g.addEdge(62, 18);
    g.addEdge(62, 19);
    g.addEdge(62, 20);
    g.addEdge(63, 6);
    g.addEdge(63, 7);
    g.addEdge(63, 8);
    g.addEdge(63, 9);
    g.addEdge(63, 10);
    g.addEdge(63, 11);
    g.addEdge(63, 12);
    g.addEdge(63, 13);
    g.addEdge(63, 14);
    g.addEdge(63, 15);
    g.addEdge(63, 16);
    g.addEdge(63, 17);
    g.addEdge(63, 18);
    g.addEdge(63, 19);
    g.addEdge(63, 20);
    g.addEdge(64, 6);
    g.addEdge(64, 7);
    g.addEdge(64, 8);
    g.addEdge(64, 9);
    g.addEdge(64, 10);
    g.addEdge(64, 11);
    g.addEdge(64, 12);
    g.addEdge(64, 13);
    g.addEdge(64, 14);
    g.addEdge(64, 15);
    g.addEdge(64, 16);
    g.addEdge(64, 17);
    g.addEdge(64, 18);
    g.addEdge(64, 19);
    g.addEdge(64, 20);
    g.addEdge(65, 6);
    g.addEdge(65, 7);
    g.addEdge(65, 8);
    g.addEdge(65, 9);
    g.addEdge(65, 10);
    g.addEdge(65, 11);
    g.addEdge(65, 12);
    g.addEdge(65, 13);
    g.addEdge(65, 14);
    g.addEdge(65, 15);
    g.addEdge(65, 16);
    g.addEdge(65, 17);
    g.addEdge(65, 18);
    g.addEdge(65, 19);
    g.addEdge(65, 20);
    g.addEdge(66, 6);
    g.addEdge(66, 7);
    g.addEdge(66, 8);
    g.addEdge(66, 9);
    g.addEdge(66, 10);
    g.addEdge(66, 11);
    g.addEdge(66, 12);
    g.addEdge(66, 13);
    g.addEdge(66, 14);
    g.addEdge(66, 15);
    g.addEdge(66, 16);
    g.addEdge(66, 17);
    g.addEdge(66, 18);
    g.addEdge(66, 19);
    g.addEdge(66, 20);
    g.addEdge(67, 6);
    g.addEdge(67, 7);
    g.addEdge(67, 8);
    g.addEdge(67, 9);
    g.addEdge(67, 10);
    g.addEdge(67, 11);
    g.addEdge(67, 12);
    g.addEdge(67, 13);
    g.addEdge(67, 14);
    g.addEdge(67, 15);
    g.addEdge(67, 16);
    g.addEdge(67, 17);
    g.addEdge(67, 18);
    g.addEdge(67, 19);
    g.addEdge(67, 20);
    g.addEdge(68, 6);
    g.addEdge(68, 7);
    g.addEdge(68, 8);
    g.addEdge(68, 9);
    g.addEdge(68, 10);
    g.addEdge(68, 11);
    g.addEdge(68, 12);
    g.addEdge(68, 13);
    g.addEdge(68, 14);
    g.addEdge(68, 15);
    g.addEdge(68, 16);
    g.addEdge(68, 17);
    g.addEdge(68, 18);
    g.addEdge(68, 19);
    g.addEdge(68, 20);
    g.addEdge(69, 6);
    g.addEdge(69, 7);
    g.addEdge(69, 8);
    g.addEdge(69, 9);
    g.addEdge(69, 10);
    g.addEdge(69, 11);
    g.addEdge(69, 12);
    g.addEdge(69, 13);
    g.addEdge(69, 14);
    g.addEdge(69, 15);
    g.addEdge(69, 16);
    g.addEdge(69, 17);
    //g.print();
    g.RW(2);
}
