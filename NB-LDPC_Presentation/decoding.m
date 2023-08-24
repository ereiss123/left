% Code construction
pkg load communications
q = 2^2;
N = 64;
K = 16;
M = N-K;
t = 3; 
H = zeros(M,N);
h = 0:q-1;
count = 0;
for idx = 1:N
    while(sum(H(:,N) ~= t))
        H(mod(randint,M),N) = mod(randint,q); 
    end
    
end

% Channel parameters
s = 1;
sigma = 1;
R = 0.8413;
SNR = s^2/(2*R*sigma^2);
% Channel output
y = stdnormal_rnd(N,1);
