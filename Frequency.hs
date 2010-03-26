--file: Huffman/Frequency.hs

--Calculate the frequencies of characters in a given sample,
--and finite alphabet.

--Huffman coding.


module Frequency ( calculateFrequencies ) where

import Data.List
--Calculate the frequecies of characters in a list.
--This is done by sorting, then counting the number of
--repetitions. Because sorting is involved we must 
--restrict valid types to those of the Ord Class.

calculateFrequencies :: Ord a => [a] -> [ (a,Int) ]
calculateFrequencies s = map freq groups
                  where 
                    groups = Data.List.group $  Data.List.sort s
                    freq g = (head g, length g)


