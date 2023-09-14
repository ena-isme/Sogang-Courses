//
//  main.cpp
//  CSE4152_20211547_HW00_1
//
//  Created by 신지원 on 2023/09/13.
//

// 4 (상하좌우) + 8 (나이트움직임)
// 갔던 곳 가도 괜찮음
// 나이트가 뛰어넘을 수 있음 (나이트로 도착하는 위치가 1만 아니면 됨)

#include <iostream>
#include <queue>
using namespace std;

int r,c,k,res=0;
int maze[100][100], path[100][100];
int minX, minY, maxX, maxY;
queue<pair<pair<int, int>,int>> q;

int dy[12] = {-2, -2, -1, -1, 1, 1, 2, 2, 1, -1, 0, 0};
int dx[12] = {-1, 1, -2, 2, -2, 2, -1, 1, 0, 0, 1, -1};

void input() {
    cin >> r >> c >> k;
    
    for (int i=0;i<r;i++){
        for(int j=0;j<c;j++){
            char check; cin >> check;
            
            if (check == 'S') {
                minX = j, minY = i;
                maze[i][j] = -1;
            }
            else if (check == 'E') {
                maxX = j, maxY = i;
                maze[i][j] = 2;
            }
            else {
                maze[i][j] = (int)check - 48;
            }
        }
    }
}

void bfs(int y, int x) {
    q.push(make_pair(make_pair(y, x),0));
    
    while(!q.empty()){
        
        int y = q.front().first.first;
        int x = q.front().first.second;
        path[y][x] = q.front().second;
        q.pop();
        bool shouldBreak = false;
        
        if (path[y][x] < k) {
            
            for (int i = 0; i < 12; i++) {
                int ny = y + dy[i];
                int nx = x + dx[i];
                
                if (ny < 0 || nx < 0 || ny >= r || nx >= c || maze[ny][nx] == 1) continue;
                
                path[ny][nx] = path[y][x] + 1;
                if (path[ny][nx] == k && ny == maxY && nx == maxX) {
                    res++;
                    shouldBreak = true;
                }
                else if (path[ny][nx] < k) q.push(make_pair(make_pair(ny, nx),path[ny][nx]));
                
                if (shouldBreak) {
                    break;  // 플래그가 설정되면 for 루프 탈출
                }
            }
        }
    }
}

int main(int argc, const char * argv[]) {
    
    input();
    bfs(minY, minX);
    
    cout << res << "\n";
    
    return 0;
}
