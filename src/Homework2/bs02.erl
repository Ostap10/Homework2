%%%-------------------------------------------------------------------
%%% @author ostap
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. дек. 2019 18:08
%%%-------------------------------------------------------------------
-module(bs02).
-author("ostap").

%% API
-export([
  words/1
]).


words(BinText) ->
  words(BinText,<<>>,[]).

words(<<>>, Word ,NewList) ->
  lists:reverse([Word|NewList]);
words(<<H,T/binary>>,Word,NewList) ->
  case H of
      32 ->words(T,<<>>,[Word|NewList]);
      _H ->words(T,<<Word/binary,H>>,NewList)
end.