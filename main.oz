functor 
import 
  Application 
  System 
  OS
define
  \insert Stream.oz
  \insert Util.oz
  \insert Hammer.oz

  {System.showInfo "========================"}
  {System.showInfo "Task 1"}
  {System.printInfo "\t{GenerateOdd ~3 10}: \t"}
    {System.print {Unlazy {GenerateOdd ~3 10} ~1}}
  {System.showInfo "\n========================"}
  {System.showInfo "Task 2"}
  {System.printInfo "\t{Product [1 2 3 4]}: \t"}
    {System.print {Product [1 2 3 4]}}
  {System.showInfo "\n========================"}
  {System.showInfo "Task 3"}
  local Stream Block in
    thread {System.printInfo "First 3 digits of product of odd numbers between 0 and 1000: \n \t"#
      {GetChars {IntToString {Product Stream} } 3 }}  Block = nil 
    end
    Stream = {GenerateOdd 0 1000}
    if Block == nil then skip end
  end
  {System.showInfo "\n========================"}
  {System.showInfo "Task 4"}
  {System.showInfo "\t Theory is in Readme.md"}
  {System.showInfo "========================"}  
  {System.showInfo "Task 5"}
  {System.showInfo "a)"}
    {System.printInfo "\tThe five next hammers from {Hammer}: \t"}
    {System.print {Unlazy {HammerFactory} 4}}
  {System.showInfo "\nb)"}
  {System.showInfo "\tNot implemented"}
  {System.showInfo "c)"}
  {System.showInfo "\tNot implemented"}
  {Application.exit 0}
end
