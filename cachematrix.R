################################################################################
######################### R Programming- Week 3#################################
################################################################################

##Functions that cache the inverse of an matrix

##Creating a special matrix object that can cache its inverse
makeCacheMatrix <- function( x = matrix() ) {
    
##Initializing the inverse property
    ip <- NULL
    
##Set the matrix
    set <- function( matrix ) {
        x <<- matrix
        ip <<- NULL
    }
    
##Get the matrix
    get <- function() {
##Return the matrix
        x
    }
##Set the inverse of the matrix
    setInverse <- function(inverse) {
        ip <<- inverse
    }
    
##Get the inverse of the matrix
    getInverse <- function() {
##Returning the inverse property
        ip
    }
    
##Returning a list of the methods
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


##Calculates the inverse of the special matrix returned by "makeCacheMatrix" shown 
##above. If the inverse has already been calculated (and the matrix has not changed),
##then "cachesolve" must retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    
##Return a matrix that is the inverse of 'x'
    ip <- x$getInverse()
    
##Returns the inverse if it is already defined
    if( !is.null(ip) ) {
        message("getting cached data")
        return(ip)
    }
    
##Get the matrix from our object
    data <- x$get()
    
##Calculates the inverse 
    ip <- solve(data,...) 
    
##Set the inverse to the object
    x$setInverse(ip)
    
##Return the matrix
    ip
}
