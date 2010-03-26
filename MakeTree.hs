--file: Huffman/MakeTree.hs
--
--Turn a frequency table into a Huffman Tree

module MakeTree (makeTree, makeForrest, weight, mergeTree, insertTree, joinT) where

import Types( Tree( Leaf, Node), Bit( L, R), HCode, Table)
import Frequency


--Construct a forrest of (element,Int) singletons.
--Once we have a forrest we can combine the two trees
--of lowest weight untill only 1 tree remains, that 
--tree will be the huffman decodeing tree.

makeTree :: [(Char,Int)] -> Tree
makeTree = createCodes . makeForrest     --createCodes :: [Tree] -> Tree
                                         --makeForrest :: [(a,Int)] -> [Tree]
                                         --

makeForrest :: [(Char,Int)] -> [Tree]
makeForrest freqTable = [ Leaf n c | (c,n) <- freqTable ]


--deconstructing a Node to access its weight.
weight :: Tree -> Int
weight (Leaf n _)       = n
weight (Node n _ _)     = n


mergeTree :: Tree -> Tree -> Tree
mergeTree t1 t2 = Node (weight t1 + weight t2) t1 t2


insertTree :: Tree -> [Tree] -> [Tree]
insertTree t [] = [t]
insertTree t (x:xs) 
  | (weight t <= weight x) = t:x:xs
  | otherwise = x : insertTree t xs


joinT :: [Tree] -> [Tree]
-- | merges two trees and inserts the result in the proper location
-- | in the remaining list.
joinT (t1:t2:ts) = insertTree (mergeTree t1 t2) ts


createCodes :: [Tree] -> Tree
-- | case of a single item in a list, is just that item.
-- | case of multiple items, join the two of lowest weight via joinT
--        and call createCodes recursivly.
createCodes [t] = t
createCodes ts = createCodes (joinT ts)
