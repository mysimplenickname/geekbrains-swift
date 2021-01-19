import Foundation

var a : Double = 3,
    b : Double = -4,
    c : Double = 1

if a != 0
{
    let d : Double = b * b - 4 * a * c
    if d < 0
    {
        print("There is no solution.\n")
    }
    else
    {
        let D : Double = sqrt(d)
        if D == 0
        {
            let x : Double = (b * -1) / 2 * a
            print("x = \(x).\n")
        }
        else
        {
            let x1 : Double = (b * -1 + D) / 2 * a,
                x2 : Double = (b * -1 - D) / 2 * a
            print("x1 = \(x1), x2 = \(x2).\n")
        }
    }
}
else
{
    print("It is not a quadratic equation.\n")
}

//--------------------------------------------

var side_a : Double = 20,
    side_b : Double = 40,
    side_c : Double = sqrt(side_a * side_a + side_b * side_b),
    area : Double = side_a * side_b * 0.5,
    perimeter : Double = side_a + side_b + side_c

print("Sides of the triangle: \(side_a), \(side_b), \(side_c). Area: \(area). Perimeter: \(perimeter).\n")

//--------------------------------------------

var deposit : Double = 100,
    percent : Double = 10

let years : Int = 5

for _ in 0..<years
{
    deposit += deposit * percent / 100
}

print("Your deposit after \(years) years: \(deposit).\n")
