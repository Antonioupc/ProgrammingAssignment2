## The following two fuctions are used to cache the inverse of a matrix

## makeCacheMatrix function creates a special "matrix" object that can cache its inverse
## 1. set the value of the vector
## 2. get the value of the vector
## 3. set the value of the mean
## 4. get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
                }
                get <- function() x
                setinverse <- function(inverse) inv <<- inverse
                getinverse <- function() inv
                list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

## cacheSolve function computes the inverse of the special "matrix" returned by makeCacheMatrix 
## It returns a matrix which is the inverse of x
## 1. check if the inverse has been calculated
## 2. if it has the inverse, the cachesolve retrieve the inverse from the cache.
## 3. If the inverse has not been calculated it will return the inverse    
cacheSolve <- function(x, ...) {
 inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
data <- x$get() 
        inv <- solve(data, ...) 
        x$setinverse(inv) 
        inv 
        }




