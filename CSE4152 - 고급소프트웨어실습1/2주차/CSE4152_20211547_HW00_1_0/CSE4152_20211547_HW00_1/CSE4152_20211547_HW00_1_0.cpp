//
//  main.cpp
//  CSE4152_20211547_HW00_1_0
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
    q.push(make_pair(make_pair(y, x), 0));
    
    while(!q.empty()){
        
        y = q.front().first.first;
        x = q.front().first.second;
        int tmp = q.front().second;
        tmp++;
        q.pop();
        
        for(int i=0;i<12;i++){
            
            int ny = y + dy[i];
            int nx = x + dx[i];
            
            if (ny < 0 || nx < 0 || ny >= r || nx >= c || maze[ny][nx] == 1) continue;
            
            if(ny==maxY && nx==maxX){
                if(tmp == k) res++;
            }
        
            else{
                if(tmp > k) break;
                else q.push(make_pair(make_pair(ny, nx), tmp));
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
