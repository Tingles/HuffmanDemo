--file: Huffman/Types.hs
--
--The types used in Huffman coding example


--the interface to the module Types is written out
--explicitly here, after the module name.

module Types ( Tree(Leaf,Node), Bit(L,R),
               HCode, Table )
             where 

--Trees to represent the relative frequencies of characters
--and therefore  the Huffman codes.

data Tree = Leaf Int Char | Node Int Tree Tree
            deriving (Show)

--The types of bits, Huffman codes and tables of Huffman codes.

data Bit = L | R deriving (Eq,Show)

type HCode = [Bit]

type Table = [ (Char, HCode) ]
