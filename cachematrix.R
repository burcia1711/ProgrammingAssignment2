## a pair of functions that cache the inverse of a matrix

## the makeCacheMatrix function that creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  invers <- NULL
  set <- function(y){
    x <<- y
    invers <<- NULL
  }
  get <- function() {x}
  setInverse <- function(inverse) {invers <<- inverse}
  getInverse <- function() {invers}
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

}


## The cacheSolve function computes the inverse of the special "matrix" returned by makeCacheMatrix. 
##If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
  invers <- x$getInverse()
  if(!is.null(invers)){
    message("getting cached data")
    return(invers)
  }
  m <- x$get()
  invers <- solve(m, ...)
  x$setInverse(invers)
  invers
}
