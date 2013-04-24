-module(fix_engine_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================


%% This is called when the OTP system whants to start this application, and return
%% the process ID of the root supervisor as {ok, Pid}. It's possible to include here
%% other startup taskes, such as read a confg file, initialize an ETS table, and so on.
%% [Type is usually normal, but can be failover, etc... and StartArgs is whatever arguments
%% we specify in the 'mod' parameter in the .app file]
start(_StartType, _StartArgs) ->
	case fix_engine_sup:start_link() of
		{ok, Pid} ->
			{ok, Pid};
		Other ->
			{error, "pau"}
	end.


stop(_State) ->
    ok.
