## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        
        #initialize the cached inverse variable
        inverse = NULL
        
        #temporarily store a matrix in cache
        set = function(y){
                x <<- y
                inverse <<- NULL
        }
        
        get = function(){
                x
        }
        
        #store the function call in cache
        setInverse = function(solve){
                inverse <<- solve
        }
        
        #get the cached function call
        getInverse = function(){
                inverse
        }
        
        #return a list of arguments
        list(set = set, get = get, 
             setInverse = setInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        
        #get the valued stored in cache
        inverse = x$getInverse()
        
        #if the value is already in cache, return it
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        
        #if cache is NULL, then get data
        data = x$get()
        
        #solve the inverse and store in cache
        inverse = solve(data, ...)
        
        x$setInverse(inverse)
        
        inverse
        
        ## Return a matrix that is the inverse of 'x'
}



