# Kernel- 2 moons
Propose and implement in R a kernel

Initial clusters are in 2D space and are expected to be projected into 3D space.

Solution:
To solve this problem, a function has been implemented to
generate the moon in 2 dimensions. After that, a vector of labels
is created to consider the points that will be separated in
the kernel implementation. The process is summarized in the
following steps:

1) A for loop is initialized and a distance that
considers the square root of the sum squares per each coordinate ”x” and ”y” is calculated
![kernel-1](https://user-images.githubusercontent.com/87973999/235524701-1c4da6a2-1ae4-4dd5-98e6-9b9cbc719599.png)
2) A restriction that divides the
points inside or outside the mean of the calculated distance is
implemented.
3) New labels are assigned based on the condition in the previous condition.
4) Points are linearly separated in 2d.
![kernel1](https://user-images.githubusercontent.com/87973999/235525081-c46aea9b-1667-4a2e-bdb7-b07a0e3f9f39.png)

5)A new coordinate is created, now considering the sum of squares of the coordinates ”x” and ”y”, the output will be
a 3D paraboloid.
![kernel-f](https://user-images.githubusercontent.com/87973999/235525780-ac585b56-8372-4833-a5c5-ceb6d488dcf1.png)


