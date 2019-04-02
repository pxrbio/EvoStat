:- dynamic web_control/1.
:- multifile web_control/1.

change_parameter(Req) :-
    backgroundImage(BackPlate),
    memberchk(search(S),Req),
    memberchk(submit=_, S),
    retractall(web_control(parameterRequest(_))),
    assert(web_control(parameterRequest(S))),
    plog(asserted(parameterRequest)),
    reply_html_page(
	title(changes),
	body([background(BackPlate)],
	     div(class=change,
		 font([size='+5'],
		      ['Changes will take place',br([]),
		       'during next update',br([]),
		       a([href='/web/pathe.pl'],
			 'Return to EvoStat')])
		)
	    )
    ).

change_parameter(Request) :-
      errorPage(Request, 'Error processing Parameter').