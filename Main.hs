--file: Huffman/Main.hs
--
--The Main module of Huffman example.

module Main where

import Types(
             Tree(Leaf,Node),
             Bit,
             HCode, 
             Table
            )
import System.Environment(getArgs)
import System.Console.GetOpt
import IO
-- load a file into memory whos contents which will be used as 
type FilePath           = String --Filesystem paths.

data Opts = Opts { verbose, version :: Bool }



main :: IO()
main = do args     <- getArgs
          myHandle <- openFile (head $ args) ReadMode
          h        <- hGetContents myHandle 
          putStrLn . show $  h
