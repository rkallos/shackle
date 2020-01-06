-module(shackle_tcp).
-include("shackle_internal.hrl").

-behavior(shackle_protocol).
-export([
    close/1,
    connect/3,
    send/2,
    setopts/2
]).

%% callbacks
-spec close(socket()) ->
    ok.

close(Socket) ->
    gen_tcp:close(Socket).

-spec connect(inet_address(), inet_port(), socket_options()) ->
    {ok, socket()} | {error, atom()}.

connect(Address, Port, SocketOptions) ->
    gen_tcp:connect(Address, Port, SocketOptions, ?DEFAULT_CONNECT_TIMEOUT).

-spec send(socket(), iodata()) ->
    ok | {error, atom()}.

send(Socket, Data) ->
    gen_tcp:send(Socket, Data).

-spec setopts(socket(), [gen_tcp:option()]) ->
    ok |
    {error, atom()}.

setopts(Socket, Opts) ->
    inet:setopts(Socket, Opts).
