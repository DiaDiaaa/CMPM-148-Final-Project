VAR Sanity = 10
VAR Kindness = 0
VAR Evilness = 0

VAR commercial_count = 0


 * [Day 1] -> Day1

=== Day1 === 
[Day 1]
- As usual, I drove from my house to my clinic.
 * Push the Door open

- As I arrived at the clinic, I pushed open the entrance door and proceeded to the lounge. I made a freshly brewed mug of espresso using the classic coffee maker that usually resided in the lounge. 

 I walked inside my office and sat down expertly on a chair.

 * [Open medical record] -> open_medical_record


/* medical records */       // has back choice
== open_medical_record
- I began flipping through the medical record on my desk. I recently treated a new patient, who will be coming for her visit today. I need to reconfirm the patient's records.

 * Patient’s name -> patient_name
 * Patient’s age -> patient_age
 * Patient’s address -> patient_address
 * Diagnose disorder -> diagnose_disorder
 * {patient_name && patient_age && patient_address && diagnose_disorder}Close medical record -> drink_coffee


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
== drink_coffee
- I took a slow sip of coffee and waited for the patient to arrive.

 While I waited for the patient, I sipped my espresso gently.

 * Check out my awards -> check_out_my_awards
 * [Check out the photo on the desk] -> check_out_photo_on_desk
 * [Take another sip of espresso.] -> take_another_sip_of_espresso
 * {check_out_my_awards && check_out_photo_on_desk && take_another_sip_of_espresso}[Waiting for the patient] -> wait_for_patient

== check_out_my_awards
:
I dusted the crystal award and Certificates on the shelf with care. Several honors have been bestowed upon me, including best psychologist of 1999 and most compassionate psychologist. I've also earned an Award for Research in Psychiatry, an Award for Research in Schizophrenia, and the trust and esteem of many colleagues.
* [Back] -> drink_coffee

== check_out_photo_on_desk
- The photo on the table shows a seemingly perfect family of three. My virtuous wife, my lovely daughter, and I, on my daughter’s birthday. But I was always busy with my job, which led to the division of the family.
 * [Back] -> drink_coffee

== take_another_sip_of_espresso
- The mellow espresso filled my mouth. This was brought to me by a former patient of mine. I have to say that this espresso is particularly delicious, with a little fruity sweetness swirling on the tip of my tongue.
 * [Back] -> drink_coffee


== wait_for_patient
- I waited for her while reading the materials. Time passed slowly, and finally.

 Knock knock，
 
 Jeff: Please come in.
 
 * The door is slowly opened


- A woman who covered half of her face walked in, her left face was covered by a piece of cloth, and her right face was always a faint smile, but after looking at it for a long time, it would feel a little scary.
 * Jeff: "Welcome back and nice to see you, Ms. Jennifer. How are you feeling today?"
    ~ Sanity += 1

 * Jeff: "You're late, Ms. Jennifer. How have you been?"
    ~ Evilness += 1
    ~ Sanity -= 1
    
- Jennifer: It's been good recently," he "hasn't been out much recently, and I feel that the medicine you prescribed by the doctor is very effective.

  Jeff: That’s good, Ms. Jennifer. This is a very good treatment result, as long as you take the medicine regularly, "he" will not come out again.

  Jeff: Now I'm going to ask you some questions to determine your state of mind, Ms. Jennifer.
  
 * Jeff: “Have you been dreaming about anything the last few nights?”
 
- Jennifer: I've been having dreams that I'm in a room with two chairs, one of which is sitting on a man who is restrained by five chains. I'm not sure who he is, yet he gives me a familiar vibe.
 * Jeff: "What have you eaten these days?"
 
- Jennifer: I eat a lot of veggies and hardly a little meat. Just as you said last time, I need to eat more vegetables.

 * Jeff: "Now, how do you feel when you take this knife in my hand?"
 
- Jennifer slowly picked up the knife. At this time, I was very nervous. I am the one who knew what had happened to her.

 Jennifer: Nothing Special.
 
 Hearing what she said, I slowly relaxed. Although she didn't know it, my hand was on the alert button all the time.
 
 * Jeff: “Seems that our treatment is working well, which means that’s great! Ms. Jennifer, and "he" should not come out in the near future”
 
- * [Jeff: All right, give me a second, I will give you your medicine for next week.] -> day1_medicine_cabinet

== day1_medicine_cabinet
 Jeff: All right, give me a second, I will give you your medicine for next week.
 
- I went to my medicine cabinet, 
  Where is Jennifer's medicine?
  
  * [Top drawer] -> day1_top_drawer
//   - This is not Jennifer's medicine
  
  * The Middle Drawer -> day1_right_drawer
//   - * [Bingo, Jennifer's medicine in a green bottle] -> day1_right_drawer
  * [The bottom drawer] -> day1_bottom_drawer

== day1_top_drawer
- Top drawer
  This is not Jennifer's medicine

 * [Back] -> day1_medicine_cabinet
 
== day1_bottom_drawer
- The bottom drawer
 There are only some sleeping pills.

* [Back] -> day1_medicine_cabinet
  
== day1_right_drawer
* Bingo, Jennifer's medicine in a green bottle


- * Ms. Jennifer, this is your medicine. The dose can be lowered to two per day, one in the morning and one in the evening, depending on your condition. Keep in mind to take it after meals.
        ~ Kindness += 2
        ~ Sanity += 1
        
    * Here's your medicine, ma'am, with your usual dosage.
        ~ Evilness += 1
        ~ Sanity -= 2 
    
    * Here’s your medicine, ma’am. Keep in mind to take it after meals with your usual dosage.
    

- Jennifer: Alright, thank you. 

  Jeff: Ms.Jennifer, that's all for now; I'll see you again next week at the same time as today. I hope your condition improves.
  
  I opened the door for her once I finished the conversation.
  
 * Jennifer: Sure, but I feel we'll cross paths again soon.

- I trembled as I saw what she said to me with a sneaky smirk on her face.

 * Creak…The door shutted.

- I sat down slowly and carefully at my chair, and the chilly perspiration on my back soaked my clothes. Every meeting I have with her makes me uneasy and afraid, fear has gripped every nerve in my body. Yet I'm a psychologist, and I have to take it all.


/* out of work */
* Jennifer is the only patient with an appointment with me today, where should I go now?

 - * [Park] -> park
   
   * [Commercial Center] -> commercial
   
   * [Psychiatric institution] -> psychiatric_institution

=== park ===
- I left my clinic and went to a nearby park.

  No matter what time it is here, it is so comfortable, and nice for me to relax my mind and body.

 * Looking for a bench

- I found an empty bench at random and sat down, enjoying the sunshine.
    ~ Sanity += 2
    
- It's getting late. And It's time to go home. 
 
 * [Home] -> home


=== commercial ===
- I walked to a nearby commercial center after leaving the clinic. Today is still business as usual. Barely see anyone along the way. Despite the fact that almost every company is closed, several businesses insist on staying open.
 
  I was strolling down the street when I noticed a store called "Home of Soul," and my curiosity compelled me to go inside.
 
 * Enter the store.
 
- I walked into the store and took a look around. The shop is small, but it sells a variety of unusual products such as tributes, sculptures, dream nets, and much more stuff that I cannot name.

  After a bit, an old man with glasses emerged from the entrance.

  Old man: Welcome to “Home of Soul”, what would you like to get? Young man.

 * Jeff: “What can I buy here?”

- Old man: Let me see, you can take two things from my shop today, the usage of which may change your destiny, but you will also pay something with a cost that you cannot see. Will you still be interested in purchasing it?

  The old man's words puzzled me; what does he mean by the cost that I cannot see? I don't understand and am stubbed, yet I choose to buy things nonetheless.

 * Jeff: "I would like to purchase some; what do you have for purchase?"

- Old man: Very well, young man, these are all things you may purchase. Choose two products that interest your curiosity.
 * Commercial List -> commercial_list
 
 
== commercial_list

 * {not blood_scalpel && commercial_count < 2} Blood Scalpel -> blood_scalpel
 * {not adorable_little_sheep && commercial_count < 2} Adorable Little Sheep -> adorable_little_sheep
 * {not a_calligraphy && commercial_count < 2} A calligraphy that says ‘Justice -> a_calligraphy
 * {not distorted_paintings && commercial_count < 2} Distorted Paintings -> distorted_paintings
 * {not small_tentacle && commercial_count < 2} Small Tentacle -> small_tentacle
 * {not animal_tooth && commercial_count < 2} An unknown animal's tooth -> animal_tooth
 * {not nonsensical_writing && commercial_count < 2} A scroll containing nonsensical writing -> nonsensical_writing
 * {not superman_toy && commercial_count < 2} Superman Toy -> superman_toy
 * {not game_disc && commercial_count < 2} 1998 Game Disc -> game_disc

 * {commercial_count == 2} [Old man: “You appear to have decided to carry two items with you.”] -> close_commercial_list
 
== blood_scalpel
    ~ Evilness += 2
    ~ commercial_count += 1
 * [Back] -> commercial_list
 
== adorable_little_sheep
    ~ Kindness += 1
    ~ commercial_count += 1
 * [Back] -> commercial_list

== a_calligraphy
    ~ Kindness += 2
    ~ commercial_count += 1
 * [Back] -> commercial_list

== distorted_paintings
    ~ Sanity -= 5
    ~ commercial_count += 1
 * [Back] -> commercial_list

== small_tentacle
    ~ Sanity -= 3
    ~ commercial_count += 1
 * [Back] -> commercial_list
 
== animal_tooth
    ~ Evilness += 1
    ~ commercial_count += 1
 * [Back] -> commercial_list
 
== nonsensical_writing
    ~ Sanity -= 1 
    ~ commercial_count += 1
 * [Back] -> commercial_list
 
== superman_toy
    ~ Sanity += 2 
    ~ commercial_count += 1
 * [Back] -> commercial_list
 
== game_disc
    ~ Sanity += 5
    ~ commercial_count += 1
 * [Back] -> commercial_list

== close_commercial_list
    ~ commercial_count = 0
- Old man: “You appear to have decided to carry two items with you.”




 * temp -> home
 
 
 
 
=== psychiatric_institution ===
 * temp -> home


=== home ===

- for compile ending
    -> END
