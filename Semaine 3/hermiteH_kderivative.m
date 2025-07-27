function dkHn = hermiteH_kderivative(k,n, x)
    if n <=  k-1
        dkHn = zeros(size(x));
    else
        dkHn = 2^k * prod(n:-1:n-k+1) *hermiteH(n-k,x);
    end
end
