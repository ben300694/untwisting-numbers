︠969bc182-43f6-4812-946e-6e73ed54d6c8w︠
## first input lists of mG (the d-invariants, which we denote d), the mQ (which we denote l), and the determinant of K, which we denote D.

d=[0, 6/37, 24/37, -20/37, 22/37, 2/37, -6/37, -2/37, 14/37, -32/37, 8/37, -14/37, -24/37, -22/37, -8/37, -56/37, -18/37, -42/37, -54/37, -54/37, -42/37, -18/37, -56/37, -8/37, -22/37, -24/37, -14/37, 8/37, -32/37, 14/37, -2/37, -6/37, 2/37, 22/37, -20/37, 24/37, 6/37];
l=[0, 2/37, 8/37, 18/37, 32/37, 50/37, 72/37, 98/37, 128/37, 162/37, 126/37, 94/37, 66/37, 42/37, 22/37, 6/37, -6/37, -14/37, -18/37, -18/37, -14/37, -6/37, 6/37, 22/37, 42/37, 66/37, 94/37, 126/37, 162/37, 128/37, 98/37, 72/37, 50/37, 32/37, 18/37, 8/37, 2/37];
D=37
︡1db5e669-a02c-4a96-af32-a766793e879b︡
︠c00bf621-f49e-4398-aeb2-6229f046bc88︠
## then print mQ[ki%D]

def shiftedl(k):
    shiftedlk = [];
    for i in range(0,len(l)):
        shiftedlk.append(l[(i*k)%D])
    return shiftedlk

︡aad5b8a0-17df-4a5e-9485-8df822d89146︡︡{"done":true}
︠e4e7f0a2-c7b3-48a4-90f4-cc9ad59fed78︠
## then compare the lists

def poscompare(k):
    compared = [];
    if all(shiftedl(k)[i]>=d[i] for i in range(0,len(l))) and all(((shiftedl(k)[i].numerator() % (2*shiftedl(k)[i].denominator()))/(shiftedl(k)[i].denominator())) == ((d[i].numerator() % (2*d[i].denominator()))/(d[i].denominator())) for i in range(0,len(l))):
            compared.append('success')
    else:
            compared.append('fail')
    return compared
︡aa354600-5da4-4090-b4ff-50b4b5efae73︡︡{"done":true}
︠7796300f-f025-41f5-be3c-e75703fa67b9︠
def negcompare(k):
    negcompared = [];
    if all(shiftedl(k)[i]<=d[i] for i in range(0,len(l))) and all(((shiftedl(k)[i].numerator() % (2*shiftedl(k)[i].denominator()))/(shiftedl(k)[i].denominator())) == ((d[i].numerator() % (2*d[i].denominator()))/(d[i].denominator())) for i in range(0,len(l))):
            negcompared.append('success')
    else:
            negcompared.append('fail')
    return negcompared
︡3247721f-37d4-4d21-ab68-9fc1b6d510fc︡︡{"done":true}
︠6ddb0ee7-20f9-4859-84e8-4f481d84d9b4︠
def congcompare(k):
    congcompared = [];
    if all(((shiftedl(k)[i].numerator() % (2*shiftedl(k)[i].denominator()))/(shiftedl(k)[i].denominator())) == ((d[i].numerator() % (2*d[i].denominator()))/(d[i].denominator())) for i in range(0,len(l))):
            congcompared.append('success')
    else:
            congcompared.append('fail')
    return congcompared
︡1fd77beb-b392-419b-a860-8590bf809528︡︡{"done":true}
︠a032c6da-9ad1-4496-b534-c465e4824cc5︠
## for every k that's not congruent to a divisor of D

for k in range(0,D):
    poscompare(k)

︡13a42a30-c94d-4a51-a590-cbcf84c190d3︡︡{"stdout":"['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n"}︡{"done":true}
︠330c252d-9ea0-4bc5-9cf9-1c2f6c937118︠
for k in range(0,D):
    congcompare(k)
︡ea19d51c-86cd-4697-a189-bf705c70ea2c︡︡{"stdout":"['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n['fail']\n"}︡{"done":true}









