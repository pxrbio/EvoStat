:- dynamic web_control/1.
:- multifile web_control/1.

restart(_) :-
    assert(web_control(restart)),
    backgroundImage(BackPlate),
    reply_html_page(
	title(changes),
	body([background(BackPlate)],
	     div(class=change,
		 font([size='+5'],
		      ['Restarting EvoStat',br([]),
		       'use this link to',br([]),
		       a([href='/web/pathe.pl'],
			 'Return to EvoStat')])
		)
	    )
    ).

restart(Request) :-
   errorPage(Request, 'Error restarting EvoStat (still running).').

