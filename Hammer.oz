/**
 * @brief      Creates a stream of hammers where a new hammer is added every 1 second if requested
 *
 * @return     Lazy stream of hammers
 */
fun lazy {HammerFactory}
  {Delay 1000}
  if {RandomInt 0 10} == 0 then
    defect|{HammerFactory}
  else
    working|{HammerFactory}
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


/**
 * @brief      Creates a buffer of hammers.
 *
 * @param      HammerStream  The hammer stream to make a buffer from
 * @param      N             The number of hammers to have as buffer
 *
 * @return     A buffer
 */
fun {BoundedBuffer HammerStream N} BufferEnd        %BufferEnd is the final position of the buffer
  fun lazy {Loop Stream BufferEnd}                  %Loop returns the requested element, followed by a stream while making HammerFactory generate next hammer 
    case Stream of H|T then                         %H will be evaluated while T ({Loop ...}) is optimized. 
      H|{Loop T thread BufferEnd.2 end}             %The parameters are evaluated so BufferEnd.2 runs the lazy hammerfactory.
    end
  end in
  BufferEnd = thread {List.drop HammerStream N} end %List.drop forces the first N values to be evaluated and BufferEnd is the stream after the N evaluated values
  {Loop HammerStream BufferEnd}                     %Returns the lazy buffer
end