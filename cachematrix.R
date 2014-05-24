

## Creates a matrix object to cache its inverse 

makeCacheMatrix <- function( m = matrix() ) {


    i <- NULL

## Set the matrix
    set <- function( matrix ) {
            m <<- matrix
            i <<- NULL
    }

## Get the matrix
    get <- function() {
     ## Return the matrix
     m
    }

## Set the inverse of the matrix
    setInverse <- function(inverse) {
        i <<- inverse
    }

## Get the inverse of the matrix
    getInverse <- function() {
        ## Return the inverse property
        i
    }

## List of the methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Compute the inverse of the matrix returned 
## Retrieves the inverse from the cache if the inverse has already been calculated and there is no changes

cacheSolve <- function(x, ...) {

## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()

## Return the inverse if its already set
    if( !is.null(m) ) {
            message("getting cached data")
            return(m)
    }

## Get the matrix from our object
    data <- x$get()

## Calculate the inverse using matrix multiplication
    m <- solve(data) %*% data

## Set the inverse to the object
    x$setInverse(m)

    ## Return the matrix
    m
}