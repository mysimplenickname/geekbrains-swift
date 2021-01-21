import Foundation

func isEven(_ number : Int) -> Bool
{
    return number % 2 == 0 ? true : false
}

print(isEven(4), "\n")

//------------------------------------------

func isDividing(_ number : Int) -> Bool
{
    return number % 3 == 0 ? true : false
}

print(isDividing(11), "\n")

//------------------------------------------

var array : [Int] = []
var i = 0
while array.count < 100
{
    array.append(i)
    i += 1
}

print(array, "\n")

//------------------------------------------

i = 0
for elem in array
{
    if isEven(elem) || !isDividing(elem)
    {
        array.remove(at: i)
    }
    else
    {
        i += 1
    }
}

print(array, "\n")

//------------------------------------------

func newFib(_ array : inout [Int])
{
    let ind1 = array.count - 1, ind2 = array.count - 2
    let newElem = array[ind1] + array[ind2]
    array.append(newElem)
}

var fibArray : [Int] = [1, 1]

for _ in 0...54
{
    newFib(&fibArray)
}

print(fibArray, "\n")

//------------------------------------------

var primeArray : [Int] = []
for i in 2...10
{
    primeArray.append(i)
}

print(primeArray)

var p = primeArray[0]

i = 0
while primeArray.count < 10
{
    print("i = \(i)")
    while primeArray.count < 10
    {
        primeArray.append(primeArray.last! + 1)
    }
    
    print("array here = \(primeArray)")
    
    var newPIndx = 0
    
    for elem in primeArray where elem > p
    {
        if elem % p == 0 && elem != p
        {
            primeArray.remove(at: i)
        }
        else
        {
            if newPIndx == 0 && elem != p
            {
                newPIndx = i
            }
            i += 1
        }
    }
    
    print("array there = \(primeArray)")
    
    p = primeArray[newPIndx]
    i = newPIndx
}

print(primeArray)
