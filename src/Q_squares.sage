

test_matrix = matrix([[1, 2, 3, 4],
                      [1, 1, 2, 2],
                      [1, 3, 2, 4],
                      [2, 3, 1, 1]])

def Qd(Q : matrix, full = false, vectors = false):
    """
    Qd computes and orders d invariants (recording short vectors) of a 
    positive-definite
    intersection pairing Q.

    Optional parameter full:
    if true,
    short characteristic covectors are taken in the full hypercube
    -Q_ii <= K_i <= Q_ii (gets full set of short representatives)
    If false or omitted, just look in
    -Q_ii <= K_i<= Q_ii-2 (faster)
    Optional paramter vectors: if true, output a list of short vectors
    with each d invariant         
    """
    # List of local variables used in the function
    #
    # p, rankQ, Qinv, K, sqK, dK, QinvK, dlist, QinvKlist, topadjust, Klistno, pointer, i, tempcount,
    # newclassflag, nextK, m, Korder, spinfound, spinindex, S, Uq, biggerthanone, exponents, numberexp, darray, thiselementindex, indexvector, j

    #############################################################################    
    # nextK moves K to the next characteristic vector in the 'hypercuboid'
    def nextK():
        if K[pointer] < m[pointer]-2+topadjust:
            K[pointer] = K[pointer]+2 
        else:
            K[pointer] = -m[pointer] 
            pointer = pointer+1
            if pointer <= rankQ:
                nextK()
            else:
                K[rankQ] = m[rankQ]+topadjust 
    #############################################################################


    p = determinant(Q)
    rankQ = rank(Q)
    Qinv = Q.inverse();
    dlist:=array(1..p);
    QinvKlist:=array(1..p);
    m:=[seq(Q[i,i],i=1..rankQ)];
    m:=Vector(m);
    K:=-m;

    topadjust:=`if`(full,2,0);
    Klistno:=0;
    spinfound:=false;
    while K[rankQ] <= m[rankQ]-2+topadjust:
        pointer = 1

        QinvK:=(1/2).Qinv.K;
        dK:=(2*DotProduct(K,QinvK)-rankQ)/4;
        QinvK:=[seq(QinvK[i],i=1..rankQ)];

        newclassflag:=true;

        for i from 1 to Klistno while newclassflag do
            if nops(remove(is,op(2,op(1,QinvKlist[i]))-QinvK,integer))=0 then newclassflag:=false;
            fi;
        od;

        if newclassflag then
            Klistno:=Klistno+1; 
            dlist[Klistno]:=dK;

        if not spinfound then
            if nops(remove(is,map(x-&gt;2*x,QinvK),integer))=0 then spinfound:=true; spinindex:=Klistno fi;

        QinvKlist[Klistno]:=[[convert(K,Vector),QinvK]];
        else
            if dK=dlist[i-1] then QinvKlist[i-1]:=[op(QinvKlist[i-1]),[convert(K,Vector),QinvK]] fi;
            if dK<dlist[i-1] then dlist[i-1]:=dK; QinvKlist[i-1]:=[[convert(K,Vector),QinvK]] fi;

        nextK();
    
    S:=SmithForm(Q);
    Uq:=SmithForm(Q,output='U');biggerthanone:=true;
    exponents:=[];

    for i from rankQ by -1 to 1 while biggerthanone do
        if S[i,i]=1 then biggerthanone=false
        else exponents:=[0..S[i,i]-1,op(exponents)]
        fi; #if S[i,i]=1
    od; #for i

    numberexp:=nops(exponents);
    darray:=Array(op(exponents));

    for i from 1 to p do
        thiselementindex:=[];
        indexvector:=(1/2).Uq.(op([1,1],QinvKlist[i])-op([1,1],QinvKlist[spinindex]));
        for j from rankQ-numberexp+1 to rankQ do
        thiselementindex:=[op(thiselementindex),indexvector[j] mod S[j,j]] od;# for j
        darray[op(thiselementindex)]:=`if`(vectors,[dlist[i],[seq(op([j,1],QinvKlist[i]),j=1..nops(QinvKlist[i]))]],dlist[i]);
        od; #for i

    return darray
