%%%-------------------------------------------------------------------
%%% @author ostap
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. дек. 2019 15:56
%%%-------------------------------------------------------------------
-module('bs01').
-author("ostap").

%% API
-export([
  first_word/1
]).


first_word(BinText) ->
  first_word(BinText, <<>>).

first_word(<<>>,Word) ->
  Word;
first_word(<<H,T/binary>>, Word) ->
case H of
   32 -> Word;
   _H -> first_word(T,<<Word/binary, H>>)
end.

