syms h1 h2
x = [1 1 -1];
y = [1 3 1 -2];

h_length = length(y) - length(x) + 1;

h = [h1 h2];

y_h = [h1 h1+h2 -h1+h2 -h2];

sol = solve(y_h == y, [h1 h2]);

disp('Estimated h(n):');
disp([sol.h1, sol.h2]);