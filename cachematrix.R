## The two functions makes it possible to store a value of a function
## and makes it possible to R to check whether the calculation allready have been made before running th ecalculation. 
## Handy witth complex calculations.

## makeCacheMatrix makes a list containing four options: set input matrix, 
##get input matrix, set Inverse output matrix, get inverse output matrix.

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


## Cachesolve returns a matrix that is the inverse of 'x'. If the data is the same the the function gets the cached data
## Else it returns a new calculation of the inverse matrix.

cacheSolve <- function(x, ...) {
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setInverse(m)
        m

        ## Return a matrix that is the inverse of 'x'
}
