The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
set the value of the matrix
get the value of the matrix
set the value of the inverse matrix
get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
m<-NULL
set<-function(y){
x<<-y
m<<-NULL
}
get<-function()x
setsolve<-function(solve)m<<-solve
getsolve<-function()m
list(set=set,get=get,setsolve=setsolve,getsolve=getsolve)
}


The following function calculates the inverse matrix of the special "matrix" created in the above function

cacheSolve <- function(x, ...) {
 m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m      ## Return a matrix that is the inverse of 'x'
}
