VAR Sanity = 10
VAR Kindness = 0
VAR Evilness = 0

* [Day 1] -> Day1

=== Day1 === 
[Day 1]
As usual, I drove from my house to my clinic.
* [Push the Door open] -> push_the_door_open

=== push_the_door_open ===
As I arrived at the clinic, I pushed open the entrance door and proceeded to the lounge. I made a freshly brewed mug of espresso using the classic coffee maker that usually resided in the lounge. 
I walked inside my office and sat down expertly on a chair.

* [Open medical record] -> open_medical_record


/* medical records */       // has back choice
=== open_medical_record ===
I began flipping through the medical record on my desk. I recently treated a new patient, who will be coming for her visit today. I need to reconfirm the patient's records.

* Patient’s name -> patient_name
* Patient’s age -> patient_age
* Patient’s address -> patient_address
* Diagnose disorder -> diagnose_disorder
* Close medical record -> drink_coffee


== patient_name
: 
Jennifer
* [Back] -> open_medical_record

== patient_age
:
26 years old, born on April 4th, 1996.
* [Back] -> open_medical_record

== patient_address
:
2377, moonlight road, 444 room
* [Back] -> open_medical_record

== diagnose_disorder
:
Dissociative Identity Disorder
* [Back] -> open_medical_record


/* start wait patient */     // has back choice
=== drink_coffee === 
I took a slow sip of coffee and waited for the patient to arrive.
While I waited for the patient, I sipped my espresso gently.
* Check out my awards -> check_out_my_awards
* [Check out the photo on the desk] -> check_out_photo_on_desk
* [Take another sip of espresso.] -> take_another_sip_of_espresso
* [Waiting for the patient] -> wait_for_patient

== check_out_my_awards
:
I dusted the crystal award and Certificates on the shelf with care. Several honors have been bestowed upon me, including best psychologist of 1999 and most compassionate psychologist. I've also earned an Award for Research in Psychiatry, an Award for Research in Schizophrenia, and the trust and esteem of many colleagues.
* [Back] -> drink_coffee

== check_out_photo_on_desk
The photo on the table shows a seemingly perfect family of three. My virtuous wife, my lovely daughter, and I, on my daughter’s birthday. But I was always busy with my job, which led to the division of the family.
* [Back] -> drink_coffee

== take_another_sip_of_espresso
The mellow espresso filled my mouth. This was brought to me by a former patient of mine. I have to say that this espresso is particularly delicious, with a little fruity sweetness swirling on the tip of my tongue.
* [Back] -> drink_coffee


=== wait_for_patient ===
I waited for her while reading the materials. Time passed slowly, and finally.
Knock knock，
Jeff: Please come in.
* [The door is slowly opened] -> door_slowly_opened

=== door_slowly_opened ===
A woman who covered half of her face walked in, her left face was covered by a piece of cloth, and her right face was always a faint smile, but after looking at it for a long time, it would feel a little scary.




- for compile ending
    -> END
