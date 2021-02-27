## function to create a cache of inversion of matrix


## creates a special vector with a list containing the function to 
# 1. set the value of vector
# 2. get the value of the vector
# 3. set the inverse of the matrix
# 4. get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <-function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
  
}


## Returns the inverse of the given matrix from cache if present else calculates
## its afresh, stores in cache and returns.

cacheSolve <- function(x, ...) {
      
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()
    m <- solve(data)
    x$setinverse(m)
    m
}
