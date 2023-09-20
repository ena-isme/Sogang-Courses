//
//  CSE4152_20211547_HW00_1_1.cpp
//  CSE4152_20211547_HW00_1_1
//
//  Created by 신지원 on 2023/09/18.
//

#include <iostream>
#include <algorithm>
#include <vector>
#include <queue>
using namespace std;

int type, change, change_num;
vector<pair<int,int>> coin;
queue<pair<int,int>> res_coin;

void calculate(int x, int y) {
    
    int a=coin[x].first;
    int b=coin[x].second;
    int res = y;
    
    for(int i=0;i<b;i++){
        calculate(x+1, res);
    }
    
    
    
//    for(int i=0;i<type;i++){
//
//        int a = coin[i].first;
//        int b = coin[i].second;
//        int res = change;
//
//        while(b>0){
//            queue<pair<int,int>> count_coin;
//
//            for(int k=0;k<type;k++){
//
//                int na = coin[k].first;
//                int nb = coin[k].second;
//                int cnt=0;
//
//                while((res >= na) && cnt < j){
//                    res -= na;
//                    cnt++;
//                }
//
//                count_coin.push(pair<int,int>(k,cnt));
//
//                if(res == 0) {
//                    change_num++;
//                    while(!count_coin.empty()){
//                        int x,y;
//                        x = count_coin.front().first;
//                        y = count_coin.front().second;
//                        count_coin.pop();
//
//                        for(int m=0;m<y;m++){
//                            res_coin.push(pair<int,int>(change_num,x));
//                        }
//                    }
//                    break;
//                }
//            }
//
//            if(res > 0) {
//
//            }
//        }
//    }
}

void input() {
    
    cin >> type >> change;
    for(int i=0;i<type;i++){
        int a,b;
        cin >> a >> b;
        coin.push_back(pair<int,int>(a,b));
    }
    sort(coin.begin(), coin.end(), greater<>());
}

int main(int argc, const char * argv[]) {
    
    input();
    int num = 0;
    calculate(num,change);
    
    cout << change_num << "\n";
    
    return 0;
}
