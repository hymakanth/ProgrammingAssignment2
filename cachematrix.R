## Caching inverse of matrix and retrieving from cache could be of some benefit 
## over computing the inverse repeatedly. Below are functions to create a matrix 
## compute the inverse and return the matrix from cache

## The first function 'makeCacheMatrix' creates a matrix and returns a list
## containing functions to (1) set the matrix (2) get the matrix 
## (3) Compute and set the inverse (4) get the inverse

makeCacheMatrix <- function(x = matrix()) {
  invMat <- NULL
  set <- function(y) {
    ## <<- operator is used to assign a value to an object in an - 
    ## - environment that is different from the current environment
    x <<- y
    invMat <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) invMat <<- inverse
  getinverse <- function() invMat
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  

}

## The cacheSolve function calculates the inverse of the matrix created with the 
## above 'makeCacheMatrix' function. However, it first checks to see if the matrix 
## inverse has already been calculated. If so, it gets the inverse from the cache 
## and skips the computation. Otherwise, it calculates the inverse of the data 
## and sets the value of the inverse matrix in the cache via the solve function

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'

  invMat <- x$getinverse()
  if(!is.null(invMat)) {
    message("getting cached data")
    return(invMat)
  }
  matrixData <- x$get()
  invMat <- solve(matrixData, ...)
  x$setinverse(invMat)
  invMat
  
}

