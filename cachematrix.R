## Second programming assignment from R Programming course.
## The functions below implement the capacity of taking matrix inverse and caching its results for future computations

## The function below will create the special matrix

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set <- function(y){
		x <<- y
		m <<- NULL
	}
	
	get <- function() x
	setsolve <- function(solve) m <<- solve
	getsolve <- function() m
	list( set = set, get = get, setsolve = setsolve, getsolve = getsolve )
	
}


## This function will take the invert of a special matrix using previously cached data when available

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
        if(!is.null(m)){
        	message("getting cached data");
        	return (m)
    	}
    	data <- x$get()
    	m <- solve(data,...)
    	x$setsolve(m)
    	m
}
