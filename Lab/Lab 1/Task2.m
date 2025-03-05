%%Task 2 - Images
Cat = imread("Cat.jpg");
Cat1_Gray = rgb2gray(Cat);

Cat2 = imread("Cat 2.jpg");
Cat2_Gray = rgb2gray(Cat2);

subplot(2, 2, 1)
imshow(Cat)
title("Cat 1")

subplot(2, 2, 2)
imshow(Cat2)
title("Cat 2")

subplot(2, 2, 3)
imshow(Cat1_Gray)
title("Cat 1")

subplot(2, 2, 4)
imshow(Cat2_Gray)
title("Cat 2")

%%
Cat1_transpose = (Cat1_Gray)';
Cat2_transpose = (Cat2_Gray)';

Cat_Add = Cat1_Gray + Cat2_Gray;

Cat_1_Mult = Cat1_Gray .* 0.5;

subplot(2, 2, 1)
imshow(Cat1_transpose)
title("Cat 1 Transpose")

subplot(2, 2, 2)
imshow(Cat2_transpose)
title("Cat 2 Transpose")

subplot(2, 2, 3)
imshow(Cat_Add)
title("Added Two Images")

subplot(2, 2, 4)
imshow(Cat_1_Mult)
title("Cat With 0.5 Mult")