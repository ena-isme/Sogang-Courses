//
//  main.cpp
//  CSE4152_20211547_HW01_1
//
//  Created by 신지원 on 2023/09/20.
//

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int n, k, cnt;
vector<int> v;

int calculator(int nn){
    if (nn == 0 || nn == 1) return 1;
    
    if(nn%2 == 0){
        v.push_back(nn/2);
    }
    else{
        v.push_back(nn/2);
        v.push_back(nn/2 + 1);
    }
    
    k=calculator(nn/2);
    return 0;
}

int main(int argc, const char * argv[]) {
    
    cin >> n;
    calculator(n);
    
    sort(v.begin(), v.end());
    v.erase(unique(v.begin(), v.end()), v.end());

    cnt = v.size();
    
    cout << cnt << " ";
    for(int i=0;i<cnt;i++){
        cout << v[i] << " ";
    }
    cout << n << " ";
    
    return 0;
}
