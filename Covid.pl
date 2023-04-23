%Shanice Facey - 1701438
%Kevin Campbell - 1900390
%Mario Cross - 1901901
%Sabrina Johnson - 1901165

:-use_module(library(pce)).
:-dynamic statistics/6.

statistics(0,0,0,0,0,0).

infection(covid).

infection_type(covid,regular).
infection_type(covid,kraken).
infection_type(covid,omicron).

covid_symptoms(regular,cough).
covid_symptoms(regular,fever).
covid_symptoms(regular,headache).
covid_symptoms(regular, fatigue).
covid_symptoms(regular,'loss of tatse').
covid_symptoms(regular,'elevated temperature').

covid_symptoms(kraken,cough).
covid_symptoms(kraken,'sore throat').
covid_symptoms(kraken,headache).
covid_symptoms(kraken, fatigue).
covid_symptoms(kraken, diarrhea).

covid_symptoms(omicron,sneezing).
covid_symptoms(omicron,'sore throat').
covid_symptoms(omicron,headache).
covid_symptoms(omicron, fatigue).
covid_symptoms(omicron,'runny nose').

underlying_conditions(omicron,stroke) :-
assertz(statistics(0,0,0,0,0,1)).
underlying_conditions(omicron,cancer) :-
assertz(statistics(0,0,0,0,0,1)).
underlying_conditions(omicron,dementia) :-
assertz(statistics(0,0,0,0,0,1)).
underlying_conditions(omicron,diabetes) :-
assertz(statistics(0,0,0,0,0,1)).
underlying_conditions(omicron,'heart conditions') :-
assertz(statistics(0,0,0,0,0,1)).
underlying_conditions(omicron,'chronic liver disease') :-
assertz(statistics(0,0,0,0,0,1)).

%Underlying Conditions
cond_list :-
    write('Variant'), write('          '), write('Condition'), nl, print_conditions, fail.

print_conditions :-
    underlying_conditions(Type, Condition),
    write(Type), write('          '), write(Condition), nl, fail.

%main function
menu:-
    new(M,dialog('Health Diagnosis System -  Main Menu')),send(M,append,new(label)),
    send(M,append,new(Empty,text('COVID-19 affects different people in different ways. Most infected people will develop mild to
    moderate illness and recover without hospitalization.'))),
    send(Empty,alignment,center),
    send(M,append,new(label)),
    send(M,append,button(diagnose_patient, message(@prolog, mainmenu))),
    send(M,append,button(statistics, message(@prolog,displaystats))),
    send(M,append,button(underlying_Conditions, message(@prolog,unconditions))),
    send(M,append,button(covid_facts, message(@prolog,coviddetails))),
    send(M,append,new(label)),
    send(M, append, button(exit, message(M, destroy))),
    send(M,open).

coviddetails:-
    new(F, dialog('Facts about Covid-19')),
    send(F,append,new(Empty2,text('Health Information'))),
    send(Empty2,alignment,center), send(Empty2,font,bold),
    send(F,append,new(Empty1,text('Covid-19 Symtomps'))),
    send(Empty1,alignment,center), send(Empty1,font,bold),
    send(F,append,new(label)),
    send(F,append,new(Covid,text('Most common symptoms:
        * fever
        * cough
        * tiredness
        * loss of taste or smell

    Less common symptoms:
        * sore throat
        * headache
        * aches and pains
        * diarrhoea
        * a rash on skin, or discolouration of fingers or toes
        * red or irritated eyes'))),
    send(F,append,new(label)),
    send(F,append,new(Prev,text('Prevention'))),
    send(Prev,alignment,center), send(Prev,font,bold),
    send(F,append,new(label)),
    send(F,append,new(Prev1,text('Protect yourself and others around you by knowing the facts and taking appropriate precautions.
    Follow advice provided by your local health authority.'))),
    send(F,append,new(label)),
    send(F,append,new(Prev2,text('To prevent the spread of COVID-19:
* Maintain a safe distance from others (at least 1 metre), even if they do not appear to be sick.
* Wear a mask in public, especially indoors or when physical distancing is not possible.
* Choose open, well-ventilated spaces over closed ones. Open a window if indoors.
* Clean your hands often. Use soap and water, or an alcohol-based hand rub.
* Get vaccinated when it is your turn. Follow local guidance about vaccination.
* Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.
* Stay home if you feel unwell.

If you have a fever, cough and difficulty breathing, seek medical attention. Call in advance so your healthcare provider can direct
you to the right health facility. This protects you, and prevents the spread of viruses and other infections.

Masks

Properly fitted masks can help prevent the spread of the virus from the person wearing the mask to others. Masks alone do not
protect against COVID-19, and should be combined with physical distancing and hand hygiene. Follow the advice provided by your
local health authority.'))),
send(F,append,new(label)),
send(F,append,new(Treat,text('Treatment'))),
send(Treat,alignment,center), send(Treat,font,bold),
send(F,append,new(label)),
send(F,append,new(Treat1,text('Self care
* After exposure to someone who has COVID-19, do the following:
* Call your health care provider or COVID-19 hotline to find out where and when to get a test.
* Cooperate with contact-tracing procedures to stop the spread of the virus.
* If testing is not available, stay home and away from others for 14 days.
* While you are in quarantine, do not go to work, to school or to public places. Ask someone to bring you supplies.
* Keep at least a 1-metre distance from others, even from your family members.
* Wear a medical mask to protect others, including if/when you need to seek medical care.
* Clean your hands frequently.
* Stay in a separate room from other family members, and if not possible, wear a medical mask.
* Keep the room well-ventilated.
* If you share a room, place beds at least 1 metre apart.
* Monitor yourself for any symptoms for 14 days.
* Call your health care provider immediately if you have any of these danger signs: difficulty breathing, loss of speech or mobility,
  confusion or chest pain.
* Stay positive by keeping in touch with loved ones by phone or online, and by exercising at home.

Medical treatments

* Scientists around the world are working to find and develop treatments for COVID-19.
  Optimal supportive care includes oxygen for severely ill patients and those who are at risk for severe disease and more advanced
  respiratory support such as ventilation for patients who are critically ill.
* Dexamethasone is a corticosteroid that can help reduce the length of time on a ventilator and save lives of patients with severe
  and critical illness'))),
    send(F,append,button(add_facts, message(@prolog, layoutdemo1))),
    send(F, scrollbars, vertical),
send(F,open).


unconditions:-
    new(S,dialog('Underlying Conditions')),
    send(S,append,new(Lbl143,label)),send(Lbl143,append,'Underlying Conditions:'),
    send(S,append,button(show_conditions, message(@prolog, cond_list))),
    send(S,open).

layoutdemo1 :-
        new(D, dialog('Layout Demo 1')),
        send(D, append,
             new(BTS, dialog_group(buttons, group))),
        send(BTS, gap, size(0, 30)),
        send(BTS, append, button(add_covid_fact, message(@prolog,addfacts))),
        send(BTS, append, button(add_omicron_fact, message(@prolog,addfacts))),
        send(BTS, append, button(add_kraken_fact, message(@prolog,addfacts))),
        send(BTS, alignment, center),
        send(D, open).

addfacts:-
        new(X,dialog('Enter Fact')),send(X,append,new(label)),
        send(X,append, new(TI, text_item(enter_fact, ''))),
        send(X,append,button(accept,message(@prolog,save_fact, TI?selection))),
        send(X,open).

save_fact(TI):-
    new(C, dialog('Update Knowledgebase')),
    send(C,append,new(Lbl1,label)),   send(Lbl1,append,TI),
    send(C,append, new(TI, text('Added to knowledgebase'))),
    send(C,open).

%Diagnosis dialog
 mainmenu:-
 new(D,dialog('Health Diagnosis System')),
    send(D,append,new(Name, text_item(name))),
    send(D,append,new(Age, text_item(age))),
    send(D,append,new(Sex, menu(sex,marked))),
    send(D,append,new(Fahrenheit, text_item(fahrenheit))),
    send(D,append,new(Systolic, text_item(systolic))),
    send(D,append,new(Diastolic, text_item(diastolic))),
    send(D,append,new(Fever,menu('Do you have fever',marked))),
    send(D,append,new(Cough,menu('Do you have Dry cough',marked))),
    send(D,append,new(Fatigue,menu('Do you get tired easy',marked))),
    send(D,append,new(Loss_of_taste,menu('Do you loss of taste',marked))),
    send(D,append,new(Headache,menu('Do you have a headache',marked))),
    send(D,append,new(Sore_throat,menu('Do you have a sore throat',marked))),
    send(D,append,new(Runny_nose,menu('Do you have a Runny nose',marked))),
    send(D,append,new(Diarrhea,menu('Do you have Diarrhea',marked))),
    send(D,append,new(Sneezing,menu('Do you have a Sneeze',marked))),
    send(D,append,new(label)),
    send(D,append,new(Empty2,text('Underlying Conditions'))),
    send(Empty2,alignment,center), send(Empty2,font,bold),
    send(D,append,new(Stroke,menu('Do you suffer from Stroke',marked))),
    send(D,append,new(Cancer,menu('Do you have Cancer',marked))),
    send(D,append,new(Dementia,menu('Do you suffer from Dementia',marked))),
    send(D,append,new(Diabetes,menu('Do you suffer from Diabetes',marked))),
    send(D,append,new(Heart_conditions,menu('Do you suffer from Heart Conditions',marked))),
    send(D,append,new(Chronic_liver_disease,menu('Do you suffer from chronic Liver Disease',marked))),

    send(Sex, append, female),              send(Sex, append, male),
    send(Fever, append, yes),               send(Fever, append, no),
    send(Cough, append, yes),               send(Cough, append, no),
    send(Fatigue, append, yes),             send(Fatigue, append, no),
    send(Loss_of_taste, append, yes),       send(Loss_of_taste, append, no),
    send(Headache, append, yes),            send(Headache, append, no),
    send(Sore_throat, append, yes),         send(Sore_throat, append,no),
    send(Runny_nose,append, yes),           send(Runny_nose,append, no),
    send(Diarrhea, append, yes),            send(Diarrhea, append, no),
    send(Sneezing,append, yes),             send(Sneezing,append, no),
    send(Stroke,append,yes),                send(Stroke,append,no),
    send(Cancer,append,yes),                send(Cancer,append,no),
    send(Dementia,append,yes),              send(Dementia,append,no),
    send(Diabetes,append,yes),              send(Diabetes,append,no),
    send(Heart_conditions,append,yes),      send(Heart_conditions,append,no),
    send(Chronic_liver_disease,append,yes), send(Chronic_liver_disease,append,no),

    send(Age, type, int),
    send(Fahrenheit, type, int),
    send(Systolic, type, int),
    send(Diastolic, type, int),

    send(D,append,button(accept,message(@prolog,save_main,   Name?selection, Fever?selection, Cough?selection,
                                        Fatigue?selection, Loss_of_taste?selection,
                                        Headache?selection , Sex?selection, Fahrenheit?selection, Sore_throat?selection,
                                        Runny_nose?selection,Diarrhea?selection, Sneezing?selection,Systolic?selection,Diastolic?selection))),

    send(D,open).

    save_main(Name,Fever,Cough,Fatigue,Loss_of_taste,Headache,Sex,Fahrenheit,Sore_throat,Runny_nose,Diarrhea,Sneezing,Systolic,Diastolic):-

        new(A,dialog('Diagnosis of Results')),
        send(A,append,new(Lbl1234,label)),send(Lbl1234,append,'Name :'),
        send(A,append,new(Lbl1,label)),   send(Lbl1,append,Name),

        send(A,append,new(Lbl41,label)),send(Lbl41,append,'Gender :'),
        send(A,append,new(Lbl4,label)), send(Lbl4,append,Sex),

        Temperature is (Fahrenheit - 32) * 5/9,
        (Temperature >=100.4 -> Tempval is 1; Tempval is 0),
        send(A,append,new(Lbl511,label)), send(Lbl511,append,'Your temperature in celsius is : '),
        send(A,append,new(Lbl512,label)), send(Lbl512,append,Temperature),

        (Fever == 'yes' -> Feval is 1;Feval is 0),

        (Cough == 'yes' -> Dryval is 1;Dryval is 0),

        (Fatigue==  'yes' -> Tiredval is 1;Tiredval is 0),

        (Loss_of_taste == 'yes' -> Shortval is 1; Shortval is 0),

        (Headache == 'yes' -> Pressval is 1; Pressval is 0),

        (Sore_throat == 'yes' -> Sval is 1; Sval is 0),

        (Runny_nose == 'yes' -> Runval is 1; Runval is 0),

        (Diarrhea == 'yes' -> Dihval is 1; Dihval is 0),

        (Sneezing == 'yes' -> Sneeval is 1; Sneeval is 0),


         %Add risk values
        Infect is Feval+Dryval+Tiredval+Shortval+Pressval+Tempval+Sval+Runval+Dihval+Sneeval,

        %If total risk value >= 3 patient at risk
        send(A,append,new(Lbl15,label)),

        ((Infect >=3, Sneeval = 1) ->
        send(Lbl15,append,'You are at risk for COVID (Omicron)'),Tval is 1, Oval is 1,Sevval is 1;

        (Infect >=3, Sval = 1 , Dihval = 1) ->
            send(Lbl15,append,'You are at risk for COVID (kraken)'),Tval is 1, Kval is 1, Mval is 1;

        (Infect =< 3) ->
            (send(Lbl15,append,'You are not at risk for COVID'), Tval is 0, Kval is 0, Oval is 0, Mval is 0, Sevval is 0);

        (send(Lbl15,append,'You are at risk for COVID'),Tval is 1, Mval is 1)),
        send(A,open),

        has_high_blood_pressure(Systolic, Diastolic).

        updatestats(Tval, Kval, Oval, Mval, Sevval).


        updatestats(Tval, Kval, Oval, Mval, Sevval) :-
        statistics(Total, Krakvar, Omivar, Mildsymp, Sevsymp, Count),
        Newtotal is Total + Tval,
        Newkrakvar is Krakvar + Kval,
        Newomivar is Omivar + Oval,
        Newmildsymp is Mildsymp + Mval,
        Newsevsymp is Sevsymp + Sevval,
        Newcount is Count + 1,
        retractall(statistics(_, _, _, _, _, _)),
        asserta(statistics(Newtotal, Newkrakvar, Newomivar, Newmildsymp, Newsevsymp, Newcount)).


    displaystats:-
    (statistics(_, _, _, _, _, _) ->
        statistics(Newtotal,Newkrakvar, Newomivar,Newmildsymp,Newsevsymp,Newcount),
        nl,write('The Total number of people with Covid-19 is: '), write(Newtotal),
        (Newtotal =:= 0 ->
            write(', no statistics to display')
        ;
            Krakpercent is Newkrakvar/Newtotal * 100,
            nl,nl,write('The percentage of Kraken variant recorded: '), write(Krakpercent),write('%'),

            Omipercent is Newomivar/Newtotal * 100,
            nl,nl,write('The percentage of Omicron variant recorded: '), write(Omipercent),write('%'),

            Mildpercent is Newmildsymp/Newtotal * 100,
            nl,write('The percentage of Mild Symptoms recorded: '), write(Mildpercent),write('%'),

            Sevpercent is Newsevsymp/Newtotal * 100,
            nl,write('The percentage of Severe Symptoms recorded: '), write(Sevpercent),write('%')
        )
    );
    write('').

    % Calculate percentage of people with underlying conditions
    percentage_underlying_conditions(P) :-
    statistics(_,_,_,_,_,Total),
    statistics(_,_,_,_,_,Underlying),
    P is (Underlying / Total) * 100.

    %The top three underlying conditions of affected persons
    top_conditions(TopThree) :-
    findall(Count-Condition, (statistics(0,0,0,0,Count), underlying_conditions(_, Condition)), Counts),
    keysort(Counts, SortedCounts),
    reverse(SortedCounts, Reversed),
    take(3, Reversed, TopThree).

    take(N, List, SubList) :-
    length(SubList, N),
    append(SubList, _, List).

%Function to give advice to MOH and alert authorities
    covid_advice(Symptoms) :-
    assert(reports(Symptoms)),
    count_reports(Symptoms, Count),
    (   Count > 5
    ->  alert_authorities(Symptoms, Count),
        writeln('There is a spike in reports of persons with '), write(Symptoms), nl,
        writeln('The authorities have been alerted.'), nl
    ;   writeln('There are '), write(Count), write(' reports of persons with '), write(Symptoms), nl
    ).

    count_reports(Symptoms, Count) :-
        findall(1, reports(Symptoms), List),
        length(List, Count).

    alert_authorities(Symptoms, Count) :-
        % Check if the count of symptoms is above a certain threshold
    Count >= 3,
    % Construct a message with the symptoms and the count
    format('Alert!! Patient has ~w symptoms: ~w', [Count, Symptoms]),
    % Send the message to the authorities (printing to the console)
    nl, writeln('Message sent to authorities.'),
    % Return true to indicate success
    true.

%Checks if the patient has high/low blood pressure
check_blood_pressure(Systolic, Diastolic, "Has high blood pressure") :- Systolic > 129, !.
check_blood_pressure(Systolic, Diastolic,"Has high blood pressure") :- Diastolic > 79, !.
check_blood_pressure(Systolic, Diastolic, "Has normal blood pressure") :- Systolic =< 129, Diastolic =< 79, !.
check_blood_pressure(Systolic, Diastolic, "Has low blood pressure") :- Systolic < 90, Diastolic < 60.

%
has_high_blood_pressure(Systolic, Diastolic) :-
    (Systolic > 129 ; Diastolic > 79),
    write('You have high blood pressure.').

has_high_blood_pressure(Systolic, Diastolic) :-
    (Systolic < 90 ; Diastolic < 60),
    write('You have low blood pressure.').

has_high_blood_pressure(Systolic, Diastolic) :-
    Systolic >= 90, Systolic =< 129,
    Diastolic >= 60, Diastolic =< 79,
    write('Your blood pressure is normal.').
