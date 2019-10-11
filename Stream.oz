/**
 * @brief      Generates a list of odd numbers in an interval
 *
 * @param      S     Start of the interval
 * @param      E     End of the interval
 *
 * @return     List of odd numbers
 */
fun {GenerateOdd S E}
  fun {GenStream CurrentValue End JumpSize}
    if CurrentValue > End then
      nil
    else
      CurrentValue|{GenStream CurrentValue+JumpSize End JumpSize}
    end
  end in
  if {Or (S mod 2) == 1 (S mod 2) == ~1} then 
    {GenStream S E 2}
  else
    {GenStream S+1 E 2}
  end
end


fun {Product S}
  case S of First|Second|Tail then
    {Product First*Second|Tail}
  else
    S.1
  end
end