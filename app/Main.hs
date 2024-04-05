{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import           Data.Text
import           Text.HTML.Scalpel

scraper :: String -> IO (Maybe Text)
scraper url = scrapeURL url heading
  where
    heading :: Scraper Text Text
    heading = text "h1"

main :: IO ()
main = do
  putStrLn "\n\n\n\n"
  putStrLn "Enter a URL:"
  url <- getLine
  result <- scraper url
  case result of
    Just x  -> print x
    Nothing -> print "Didn't find the necessary items."
  main