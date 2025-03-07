% Code construction
pkg load communications
pkg load statistics
b = 2
q = 2^b;
N = 16;
K = 2;
M = N-K;
t = 3; 
H = zeros(M,N);

% Generate some kind of parity check matrix, not really what is described in the paper
% for i = 1:N
%     for j = 1:t-1
%         H(randint(1,1,[1 M]),i) = randint(1,1,[0 q-1]); 
%     end
% end
% 3,3 trapping set
H = [
    1 0 0 
    0 2 0
    0 0 1
    2 0 1
    0 1 3
    3 1 0
];


H = gf(H,b); % Conver to a Galois field

% Channel parameters
s = 1;
sigma = 1;
R = K/N;
SNR = s^2/(2*R*sigma^2);
% Channel output
y = normrnd(1, sigma, [1 N]);
x = sign(y);
x = (x==-1);


% Decode
q0 = zeros(M,N);
q1 = zeros(M,N);
q2 = zeros(M,N);
q3 = zeros(M,N);

%initialize q
for i = 1:M
    for j = 1:N
        if H(i,j) ~= 0
            q0(i,j) = (1-(1/(1+exp(2*s*abs(y(j))))))*(1-(1/(1+exp(2*s*abs(y(j))))));
            q1(i,j) = (1-(1/(1+exp(2*s*abs(y(j))))))*(1/(1+exp(2*s*abs(y(j)))));
            q2(i,j) = (1/(1+exp(2*s*abs(y(j)))))*(1-(1/(1+exp(2*s*abs(y(j))))));
            q3(i,j) = (1/(1+exp(2*s*abs(y(j)))))*(1/(1+exp(2*s*abs(y(j)))));
        end
    end
end
