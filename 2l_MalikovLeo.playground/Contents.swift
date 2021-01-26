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

func isPrime(_ number : Int, _ primeArray : inout [Int]) -> Bool
{
    var i : Int = 0
    while i < primeArray.count
    {
        if number % primeArray[i] == 0
        {
            return false
        }
        i += 1
    }
    return true
}

var primeArray : [Int] = [2]

var number = 3

while primeArray.count < 100
{
    if isPrime(number, &primeArray)
    {
        primeArray.append(number)
    }
    number += 1
}

print(primeArray)
