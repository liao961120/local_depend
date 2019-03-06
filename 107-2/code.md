```python
c = int(input())
a1 = int(input())    
r1 = int(input())
r2 = int(input())

a1 = a1
a2 = a1 + r1
a3 = a1 + r1 - r2
b1 = 1
b2 = 2
b3 = 1

maxProfit = 0
optimalPrice = 0
optimalDemand = 0

largest = max{r1, a3}

for p in (c 至 (largest - 1)):
    
    # 依據 p 所在區間決定 q(p)
    if 0 <= p < r1:
        q = a1 - b1*p
    else if r1 <= p < r2:
        q = a2 - b2*p
    else if r2 <= p < a3:
        q = a3 - b3*p
    else:
        q = 0
    
    # 處理 q(p) < 0 的情況
    q = max{q, 0}

    # 計算利潤
    profit = (p - c) * q

    # Algorithm: 求取最大值
    if (profit > maxProfit) 或 (profit == maxProfit and p < optimalPrice):
        maxProfit = profit
        optimalPrice = p
        optimalDemand = q


print(optimalPrice, optimalDemand, maxProfit)
```
