-- file: Huffman/CodeTable.hs
--

module CodeTable ( codeTable,
                   showTree ) where

import Types ( Tree(Node,Leaf), Bit(L,R), HCode, Table)
import MakeTree

--Making a table from a Huffman tree.
codeTable :: Tree -> Table
codeTable t = convert [] t

--helper function convert used in converting a Huffman code tree to a code
--table. Its first argument is the HCode which codes the path in the tree 
--to the current node. 
convert :: HCode -> Tree -> Table
convert path (Leaf _ c) = [(c, path)]
convert path (Node _ t1 t2) =
        (convert (path ++ [L]) t1) ++ (convert (path ++ [R]) t2)





--------------------------------------------------------------------------
showTree :: Tree -> String
showTree t = showTreeIndent 0 t

showTreeIndent :: Int -> Tree -> String
showTreeIndent m (Leaf n c)
  = spaces m ++ show c ++ " " ++ show n ++ "\n"
showTreeIndent m (Node n t1 t2)
  = showTreeIndent (m+4) t1 ++ 
    spaces m ++ "[" ++ show n ++ "]" ++ "\n" ++
    showTreeIndent (m+4) t2

--An offset of spaces.
spaces :: Int -> String
spaces n = replicate n ' '
