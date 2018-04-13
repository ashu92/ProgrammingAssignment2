## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#makeCacheMatrix is a function that returns a list of functions
# Its puspose is to store a martix and a cached value of the inverse of the 
  # matrix. Contains the following functions:
  # * setMatrix      set the value of a matrix
  # * getMatrix      get the value of a matrix
  # * cacheInverse   get the cahced value (inverse of the matrix)
  # * getInverse     get the cahced value (inverse of the matrix)


makeCacheMatrix <- function(x = matrix()) {
  # holds the cached value or NULL if nothing is cached
           # initially nothing is cached so set it to NULL
             cache <- NULL
             
               # store a matrix
               setMatrix <- function(newValue) {
                         x <<- newValue
                         # since the matrix is assigned a new value, flush the cache
                           cache <<- NULL
                   }
       
                 # returns the stored matrix
                 getMatrix <- function() {
                           x
                   }
         
                   # cache the given argument 
                   cacheInverse <- function(solve) {
                             cache <<- solve
                     }
           
                     # get the cached value
                     getInverse <- function() {
                               cache
                       }
                     
                       # return a list. Each named element of the list is a function
                      list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  # get the cached value
           inverse <- x$getInverse()
           # if a cached value exists return it
             if(!is.null(inverse)) {
                       message("getting cached data")
                       return(inverse)
               }
           # otherwise get the matrix, caclulate the inverse and store it in
             # the cache
             data <- x$getMatrix()
             inverse <- solve(data)
             x$cacheInverse(inverse)
             
               # return the inverse
               inverse
}
