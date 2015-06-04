%% @author Ghassen
%% @Date 26/05/2015
%% Technical Test

-module(game).
-export([calculate_jumps/1]).

%% This is the main function which takes as an argument a List of integer 
calculate_jumps(List) ->
	Length = length(List),
	List_index = 1,
	Nb_jumps = 0,
	jumping_number(List,Length,Nb_jumps,List_index).

jumping_number(List,Length,Nb_jumps,List_index) ->
	Nb_jumps_new = Nb_jumps + 1,
	io:format("************************** Jump number ~w *******************  ~n",[Nb_jumps_new]),
	% we use lists:nth to extract the value associated to the index 
	Element_value = lists:nth(List_index,List),
	io:format("The element is  : ~w ~n",[Element_value ]),
	New_Index = List_index + Element_value,
	io:format("The new index is  : ~w ~n",[New_Index]),
	Test_Never = Length-1,

	% We test if the New index is bigger than the length of the List : in this case it is the last jump
	% If The number of itirations ( Test_Never == 0 ) is bigger than the length of the list : There is an infinit loop in the List
	% Otherwise we call the same function with the new index

	Result = if 	
		(New_Index > length(List)) and (Test_Never > 0) -> 	
			io:format("\e[32m -----------the number of jumps is : ~w -------------  \e[0;37m ~n",[Nb_jumps_new]);
		(Test_Never == 0) 				-> 	
			io:format("\e[32m ----------never : infinit loop -------------- \e[0;37m ~n");
		true 						-> 	
			jumping_number(List,Test_Never,Nb_jumps_new,New_Index)
		 end, Result = ok.
						  
