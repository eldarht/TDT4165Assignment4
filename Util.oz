
/**
 * @brief      Gets the first characters of a string.
 *
 * @param      String          The string
 * @param      CharacterCount  The character count to retrieve
 *
 * @return     The substring of the those characters.
 */
fun {GetChars String CharacterCount}
  if CharacterCount > 0 then
    String.1|{GetChars String.2 CharacterCount-1}
  else
    ""
  end
end

/**
 * @brief      Makes a list from a lazy list by pretending to use it
 *
 * @param      LazyList  The lazy list
 * @param      Count     How Many elements to create, Negative number to get all
 *
 * @return     List eqvivalent to the lazylist.
 */
fun {Unlazy LazyList Count}
  if Count \= 0 then
    case LazyList of H|T then
      H|{Unlazy T Count-1}
    else
      nil
    end
  else
    LazyList
  end
end

/**
 * @brief      Generates a random integer in an interval
 *
 * @param      Min   The minimum
 * @param      Max   The maximum
 *
 * @return     Random integer
 */
fun {RandomInt Min Max} X ?MinOS ?MaxOS in
  X = {OS.rand}
  {OS.randLimits MinOS MaxOS}
  Min+ X*(Max-Min) div (MaxOS - MinOS)
end