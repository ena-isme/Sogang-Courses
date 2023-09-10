//
//  main.cpp
//  CSE4152_20211547_HW00_0
//
//  Created by 신지원 on 2023/09/06.
//

#include <iostream>
using namespace std;

//dp 로 구현
int dp_way(int num, int data[]){
    int dp[num]; int max = 0;
    dp[0] = data[0];
    
    for(int i=1;i<num;i++){
        
        int res = dp[i-1] + data[i];
        dp[i] = ( res > data[i] ) ? res : data[i];
        max = ( max > dp[i] ) ? max : dp[i];
    
    }
    
    return max;
}

int main(int argc, const char * argv[]) {
    
    int N; int res;
    cin >> N;
    
    int list[N];
    for(int i=0;i<N;i++){
        cin >> list[i];
    }
    
    if(N > 1) res = dp_way(N, list);
    else if (N == 1) res = list[0];
    else {
        cout << "error" << "\n";
        return 0;
    }
    
    if(res < 0){
        res = 0;
    }
    
    cout << res << "\n";
    
    return  0;
}
