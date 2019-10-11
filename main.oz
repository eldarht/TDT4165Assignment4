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
    thread {System.printInfo "\tFirst 3 digits of product of odd numbers between 0 and 1000: \n \t"#
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
  {System.showInfo "a) (5 sec delay)"}
    {System.printInfo "\tThe five next hammers from {Hammer}: \t"}
    {System.print {Unlazy {HammerFactory} 4}}
  {System.showInfo "\nb) (10 sec delay)"}
  {System.printInfo "\tNumber of working hammers is:\t"}
  local HammerTime Consumer in
    HammerTime = {HammerFactory}
    Consumer = {HammerConsumer HammerTime 10}
    {System.show Consumer}
  end
  {System.showInfo "c)"}
  {System.printInfo "\tWith buffer:\t"}
  local HammerStream Buffer Consumer in
    HammerStream = {HammerFactory}
    Buffer = {BoundedBuffer HammerStream 6}
    {Delay 6000}
    Consumer = {HammerConsumer Buffer 10}
    {System.show Consumer}
  end

  {System.printInfo "\tWithout buffer:\t"}
  local HammerStream Consumer in
    HammerStream = {HammerFactory}
    {Delay 6000}
    Consumer = {HammerConsumer HammerStream 10}
    {System.show Consumer}
  end

  {Application.exit 0}
end
