%%%-------------------------------------------------------------------
%%% @author ostap
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. дек. 2019 18:53
%%%-------------------------------------------------------------------
-module(bs03).
-author("ostap").

%% API
-export([
split/2
]).

split(BinText, Separator) ->
  split(BinText, Separator, Separator, <<>>, []).

split(<<>>, Separator, _,  Word ,NewList) ->
  Buf = clean(Word, Separator),
  lists:reverse([Buf | NewList]);

split(BinText, Separator, <<>>, Word, NewList) ->
   Buf = clean(Word, Separator),
  split(BinText, Separator, Separator, <<>>, [Buf|NewList]);

split(<<H, T/binary>>, Separator, <<HS, TS/binary>>,  Word, NewList)->
  case H of
      HS -> split(T, Separator, TS, <<Word/binary,H>>, NewList);
      _H -> split(T, Separator, Separator,<<Word/binary,H>>, NewList)
end.

clean(Word, Separator) ->
  Count = byte_size(Word) - byte_size(Separator),
  delete(Word, Count, <<>>).

delete (<<H, T/binary>>, Count, NewWord) ->
  case Count of
      0 -> NewWord;
     _Count -> delete(T, Count -1,<<NewWord/binary, H>> )
end.







