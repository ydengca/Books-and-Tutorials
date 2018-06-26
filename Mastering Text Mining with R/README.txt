Mastering Text Mining with R

This is the code repository for Mastering Text Mining with R, published by Packt. It contains all the supporting project files necessary to work through the book from start to finish.
Instructions and Navigations

All of the code is organized into folders. Each folder starts with a number followed by the application name. Codes are available for chapter 2, 4, 5, 6 and 7. For example, Chapter 2.

The code will look like the following:

 library(prob)
 S <- rolldie(2, makespace = TRUE)
 A <- subset(S, X1 + X2 >= 8)
 B <- subset(S, X1 == 3) #Given
 Prob(A, given = B)

Software requirements:

R 3.3.2 is tested on the following platforms:

    Windows® 7.0 (SP1), 8.1, 10, Windows Server® 2008 R2 (SP1) and 2012
    Ubuntu 14.04, 16.04
    CentOS / Red Hat Enterprise Linux 6.5, 7.1
    SUSE Linux Enterprise Server 11
    Mavericks (10.9), Yosemite (10.10), El Capitan (10.11), Sierra (10.12)

