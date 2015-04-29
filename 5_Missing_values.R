# R_Prog_Swirl_5_Missing_Values

Selection: 1

| Please choose a lesson, or type 0 to return to course menu.

 1: Basic Building Blocks      2: Workspace and Files        3: Sequences of Numbers       4: Vectors                 
 5: Missing Values             6: Subsetting Vectors         7: Matrices and Data Frames   8: Logic                   
 9: Functions                 10: lapply and sapply         11: vapply and tapply         12: Looking at Data         
13: Simulation                14: Dates and Times           15: Base Graphics             

Selection: 5

  |                                                                                                                   |   0%

| Missing values play an important role in statistics and data analysis. Often, missing values must not be ignored, but
| rather they should be carefully studied to see if there's an underlying pattern or cause for their missingness.

...

  |======                                                                                                             |   5%

| In R, NA is used to represent any value that is 'not available' or 'missing' (in the statistical sense). In this lesson,
| we'll explore missing values further.

...

  |============                                                                                                       |  11%

| Any operation involving NA generally yields NA as the result. To illustrate, let's create a vector c(44, NA, 5, NA) and
| assign it to a variable x.

> c(44, NA, 5, NA)
[1] 44 NA  5 NA

| Try again. Getting it right on the first try is boring anyway! Or, type info() for more options.

| Assign the vector c(44, NA, 5, NA) to a variable x. The NA must uppercase.

> x <- c(44, NA, 5, NA)

| That's a job well done!

  |==================                                                                                                 |  16%

| Now, let's multiply x by 3.

> x*3
[1] 132  NA  15  NA

| Nice work!

  |========================                                                                                           |  21%

| Notice that the elements of the resulting vector that correspond with the NA values in x are also NA.

...

  |==============================                                                                                     |  26%

| To make things a little more interesting, lets create a vector containing 1000 draws from a standard normal distribution
| with y <- rnorm(1000).

> y <- rnorm(1000)

| Keep working like that and you'll get there!

  |====================================                                                                               |  32%

| Next, let's create a vector containing 1000 NAs with z <- rep(NA, 1000).

> z <- rep(NA, 1000)

| You got it!

  |==========================================                                                                         |  37%

| Finally, let's select 100 elements at random from these 2000 values (combining y and z) such that we don't know how many
| NAs we'll wind up with or what positions they'll occupy in our final vector -- my_data <- sample(c(y, z), 100).

> my_data <- sample(c(y, z), 100)

| You got it!

  |================================================                                                                   |  42%

| Let's first ask the question of where our NAs are located in our data. The is.na() function tells us whether each element
| of a vector is NA. Call is.na() on my_data and assign the result to my_na.

> is.na(my_Data)
Error: object 'my_Data' not found
> is.na(my_data)
  [1] FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE
 [21]  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
 [41]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE
 [61]  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
 [81]  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE

| Try again. Getting it right on the first try is boring anyway! Or, type info() for more options.

| Assign the result of is.na(my_data) to the variable my_na.

> my_na <- is.na(my_data)

| Your dedication is inspiring!

  |======================================================                                                             |  47%

| Now, print my_na to see what you came up with.

> my_na
  [1] FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE
 [21]  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE FALSE
 [41]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE
 [61]  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE
 [81]  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE

| You got it!

  |=============================================================                                                      |  53%

| Everywhere you see a TRUE, you know the corresponding element of my_data is NA. Likewise, everywhere you see a FALSE, you
| know the corresponding element of my_data is one of our random draws from the standard normal distribution.

...

  |===================================================================                                                |  58%

| In our previous discussion of logical operators, we introduced the `==` operator as a method of testing for equality
| between two objects. So, you might think the expression my_data == NA yields the same results as is.na(). Give it a try.

> my_data == NA
  [1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [41] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
 [81] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA

| Excellent work!

  |=========================================================================                                          |  63%

| The reason you got a vector of all NAs is that NA is not really a value, but just a placeholder for a quantity that is not
| available. Therefore the logical expression is incomplete and R has no choice but to return a vector of the same length as
| my_data that contains all NAs.

...

  |===============================================================================                                    |  68%

| Don't worry if that's a little confusing. The key takeaway is to be cautious when using logical expressions anytime NAs
| might creep in, since a single NA value can derail the entire thing.

...

  |=====================================================================================                              |  74%

| So, back to the task at hand. Now that we have a vector, my_na, that has a TRUE for every NA and FALSE for every numeric
| value, we can compute the total number of NAs in our data.

...

  |===========================================================================================                        |  79%

| The trick is to recognize that underneath the surface, R represents TRUE as the number 1 and FALSE as the number 0.
| Therefore, if we take the sum of a bunch of TRUEs and FALSEs, we get the total number of TRUEs.

...

  |=================================================================================================                  |  84%

| Let's give that a try here. Call the sum() function on my_na to count the total number of TRUEs in my_na, and thus the
| total number of NAs in my_data. Don't assign the result to a new variable.

> sum(my_na)
[1] 54

| You are amazing!

  |=======================================================================================================            |  89%

| Pretty cool, huh? Finally, let's take a look at the data to convince ourselves that everything 'adds up'. Print my_data to
| the console.

> print(my_data)
  [1] -0.03675957          NA          NA  1.26012832 -1.01724831 -0.96934328 -0.29330360          NA          NA  0.37225445
 [11]          NA          NA  0.94357156 -0.69182388  1.11530898          NA  0.26362827          NA          NA          NA
 [21]          NA -0.63218321          NA -0.97438026 -0.14871036  0.68242360          NA -0.42300308          NA          NA
 [31] -0.97297998 -0.68212762 -0.59456564 -0.54746005          NA          NA          NA -0.76740434          NA -0.21574458
 [41]          NA          NA          NA          NA -0.52088522          NA  1.30180270  1.26828495          NA          NA
 [51]          NA          NA          NA          NA          NA -0.40018626 -0.70784851          NA          NA -0.74865773
 [61]          NA -0.23979027          NA -0.83786680 -0.11128831          NA          NA          NA          NA  0.34195750
 [71] -0.12537765  0.16325000          NA  1.29584590          NA          NA          NA          NA  0.22823379          NA
 [81]          NA -0.48015009  1.31729341          NA          NA  1.04750621          NA  2.57703885          NA  0.17292204
 [91]  1.55526298 -0.82446701  1.10315873  0.55825759          NA  0.19358494  2.00207637          NA          NA          NA

| You're close...I can feel it! Try it again. Or, type info() for more options.

| Print my_data to the console.

> my_data
  [1] -0.03675957          NA          NA  1.26012832 -1.01724831 -0.96934328 -0.29330360          NA          NA  0.37225445
 [11]          NA          NA  0.94357156 -0.69182388  1.11530898          NA  0.26362827          NA          NA          NA
 [21]          NA -0.63218321          NA -0.97438026 -0.14871036  0.68242360          NA -0.42300308          NA          NA
 [31] -0.97297998 -0.68212762 -0.59456564 -0.54746005          NA          NA          NA -0.76740434          NA -0.21574458
 [41]          NA          NA          NA          NA -0.52088522          NA  1.30180270  1.26828495          NA          NA
 [51]          NA          NA          NA          NA          NA -0.40018626 -0.70784851          NA          NA -0.74865773
 [61]          NA -0.23979027          NA -0.83786680 -0.11128831          NA          NA          NA          NA  0.34195750
 [71] -0.12537765  0.16325000          NA  1.29584590          NA          NA          NA          NA  0.22823379          NA
 [81]          NA -0.48015009  1.31729341          NA          NA  1.04750621          NA  2.57703885          NA  0.17292204
 [91]  1.55526298 -0.82446701  1.10315873  0.55825759          NA  0.19358494  2.00207637          NA          NA          NA

| Nice work!

  |=============================================================================================================      |  95%

| Now that we've got NAs down pat, let's look at a second type of missing value -- NaN, which stands for 'not a number'. To
| generate NaN, try dividing (using a forward slash) 0 by 0 now.

> NaN
[1] NaN

| You're close...I can feel it! Try it again. Or, type info() for more options.

| Try 0/0.

> Try 0/0
Error: unexpected numeric constant in "Try 0"
> 0/0
[1] NaN

| Great job!

  |===================================================================================================================| 100%

| Let's do one more, just for fun. In R, Inf stands for infinity. What happens if you subtract Inf from Inf?

> inf-inf
Error: object 'inf' not found
> Inf - Inf
[1] NaN

| You are amazing!
