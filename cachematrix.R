
## This function is to create an object to store a matrix and cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv_matrix <- NULL
  set <- function(y){
    x <<- y
    inv_matrix <<- NULL
  }
  
  get <- function()x
  setinversematrix <- function(inv) inv_matrix <<- inv
  getinversematrix <- function() inv_matrix
  list (set=set, get=get, setinversematrix=setinversematrix, getinversematrix=getinversematrix)
}


## This function is to get the inverse of of a matrix.  
## It first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse and sets the value in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv_matrix <- x$getinversematrix()

  if (!is.null(inv_matrix)){
    message("getting cached inverse")
    return (inv_matrix)
  }
  datam <- x$get()
  inv_matrix <- solve(datam,...)
  x$setinveresematrix(inv_matrix)
  inv_matrix
  
}
