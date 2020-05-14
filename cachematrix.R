## Put comments here that give an overall description of what your
## functions do

## This programm has been made using two functions. The first one ("makeCacheMatrix") helps save 
## the matrix you want so you can compute its inverse. The second one ("cacheSolve") compute the inverse
## you saved in the function "makeCacheMatrix". If you compute the inverse of the same function again using
## the second function, a message will appear saying that the programm is using the "cache data".

## Write a short comment describing this function

## Function starts here. This function is a list of functions. The first function is called "set" and helps
## you set the matrix you will use. The matrix supplied always have to be invertible.
## The second function is called "get", and helps you print the matrix you set previously.
## The third function is called "setInverse", and helps to write a matrix that is already "inverted". You
## can write whatever kind of matrix. This part of the function "makeCacheMatrix" is used inside the
## function "cacheSolve".
## The fourth function is called "getInverse" and helps printing the matrix written in "setInverse".

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
        x <<- y
        m <<- NULL
      }
    get <- function() x
    setInverse <- function(solve) m <<- solve
    getInverse <- function() m
    list(set = set, get = get,
        setInverse = setInverse,
        getInverse = getInverse)
}


## Write a short comment describing this function
## The second function starts here. Once you set the matrix you want tu invert in the function
## "makeCacheMatrix" you can use this function as an argument in the funcion "cacheSolve". Then
## the function will print the inverse of the matrix. If you call the function again with the same matrix, you will
## get a message saying "getting cached data", finally, the function will print the inverse of the function
## again.

## In an specific way, what the function does is that it assigns to m the value that is in the subfunction
## "getInverse" that is in the function "makeCacheMatrix". If there is a value in m, then it will print
## a message saying "getting cached data".
## If there is not a value in m, then the function will get the matrix we set previously in the function
## "makeCacheMatrix" and it will be assigned in the "data" variable.
## Once the matrix is in "data", it will compute the inverse of the matrix there and the result will be
## assigned in "m". Then, the variable "m" will be set as the inverse of the matrix using the instrucion
## "x$setInverse(m)". Finally, "m" will be printed.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
  }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
  }