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

/**
 * @brief      Finds the number of working hammers in the start of a hammerstream
 *
 * @param      HammerStream  The hammer stream
 * @param      N             The number of hammers to check
 *
 * @return     Integer of working hammers
 */
fun {HammerConsumer HammerStream N}
  if N > 0 then
    if HammerStream.1 == working then
      1+{HammerConsumer HammerStream.2 N-1}
    else
      {HammerConsumer HammerStream.2 N-1}
    end
  else
    0
  end
end