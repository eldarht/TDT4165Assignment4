/**
 * @brief      Creates a stream of hammers where a new hammer is added every 1 second if requested
 *
 * @return     Lazy stream of hammers
 */
fun lazy {HammerFactory}
  {Delay 1000}
  if {RandomInt 0 10} == 0 then
    {StringToAtom "defect"}|{HammerFactory}
  else
    {StringToAtom "working"}|{HammerFactory}
  end
end