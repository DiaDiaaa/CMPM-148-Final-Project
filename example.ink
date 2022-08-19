LIST test = one, two, three

/*
LIST shop_item = blood_scalpel, sheep, justice, painting, tentacle, tooth, writing, toy, disc
*/

->example

== example 

- 

current list count = {LIST_COUNT(test)}

* add one ->add_one
* add two ->add_two
* add three -> add_three
* {LIST_COUNT(test) == 3} ->example_2

== add_one
    ~test += one
    *[Back] ->example

== add_two
    ~test += two
    *[Back] -> example
    
== add_three
    ~test += three
    *[Back] -> example
    
== example_2
selecting
Only two can be take off
current list count = {LIST_COUNT(test)}
* {LIST_COUNT(test) != 1} select one ->select_one
* {LIST_COUNT(test) != 1} select two ->select_two
* {LIST_COUNT(test) != 1} select three ->select_three
* {LIST_COUNT(test) == 1} going example 3 -> example_3

== select_one
    one has been select, now taking off from the list, will not appear in example 3
    ~test -= one
    *[BACK] -> example_2 

== select_two
    one has been select, now taking off from the list, will not appear in example 3
    ~test -= two
    *[BACK] -> example_2 
    
== select_three
    one has been select, now taking off from the list, will not appear in example 3
    ~test -= three
    *[BACK] -> example_2 

=== example_3
-
{ test !? one:
    one took off from example 2
} * one

{ test !? two:
    two took off from example 2
}

{ test !? three:
    three took off from example 2
}

->DONE