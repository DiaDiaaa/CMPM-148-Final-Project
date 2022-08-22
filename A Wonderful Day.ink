#theme: dark

@ -1,550 +0,0 @@
VAR Sanity = 10
VAR Kindness = 0
VAR Evilness = 0

VAR current_day = 0

VAR Pendant = 0

VAR commercial_count = 0
VAR card_count = 0

VAR visited_psy = false

LIST shop_item = scalpel, sheep, justice, painting, tentacle, tooth, writing, toy, disc


//  * [Day 1] -> Day1
* [Day 3] -> day3

/* ---------------- DAY 1 ------------------ */
=== Day1 === 
[Day 1]

~ current_day = 1

- As usual, I drove from my house to my clinic.
 * [Open the door]

- As arrived at the clinic, I open the entrance door and proceeded to the lounge. I made a freshly brewed mug of espresso using the classic coffee maker that usually resided in the lounge. 

 I walked inside my office and sat down expertly on a chair.

 * [Open medical record] -> open_medical_record


/* medical records */       // has back choice
== open_medical_record
- I began flipping through the medical record on my desk. I recently treated a new patient, who will be coming for her visit today. I need to reconfirm the patient's records.

 * Patient’s name -> patient_name
 * Patient’s age -> patient_age
 * Patient’s address -> patient_address
 * Diagnose disorder -> diagnose_disorder
 * {patient_name && patient_age && patient_address && diagnose_disorder} [Close medical record] -> drink_coffee


== patient_name
: 
Jennifer
 * {not patient_age} Patient’s age -> patient_age
 * {not patient_address} Patient’s address -> patient_address
 * {not diagnose_disorder} Diagnose disorder -> diagnose_disorder
 * {patient_name && patient_age && patient_address && diagnose_disorder} [Close medical record] -> drink_coffee

== patient_age
:
26 years old, born on April 4th, 1996.
 * {not patient_name} Patient’s name -> patient_name
 * {not patient_address} Patient’s address -> patient_address
 * {not diagnose_disorder} Diagnose disorder -> diagnose_disorder
 * {patient_name && patient_age && patient_address && diagnose_disorder} [Close medical record] -> drink_coffee
 
== patient_address
:
2377, moonlight road, 444 room
 * {not patient_name} Patient’s name -> patient_name
 * {not patient_age} Patient’s age -> patient_age
 * {not diagnose_disorder} Diagnose disorder -> diagnose_disorder
 * {patient_name && patient_age && patient_address && diagnose_disorder} [Close medical record] -> drink_coffee


== diagnose_disorder
:
Dissociative Identity Disorder
 * {not patient_name} Patient’s name -> patient_name
 * {not patient_age} Patient’s age -> patient_age
 * {not patient_address} Patient’s address -> patient_address
 * {patient_name && patient_age && patient_address && diagnose_disorder} [Close medical record] -> drink_coffee


/* start wait patient */     // has back choice
== drink_coffee
- I took a slow sip of coffee and waited for the patient to arrive.

 While I waited for the patient, I sipped my espresso gently.

 * [Check out my awards] -> check_out_my_awards
 * [Check out the photo on the desk] -> check_out_photo_on_desk
 * [Take another sip of espresso.] -> take_another_sip_of_espresso
 * {check_out_my_awards && check_out_photo_on_desk && take_another_sip_of_espresso}[Waiting for the patient] -> wait_for_patient

== check_out_my_awards
I dusted the crystal award and Certificates on the shelf with care. Several honors have been bestowed upon me, including best psychologist of 1999 and most compassionate psychologist. I've also earned an Award for Research in Psychiatry, an Award for Research in Schizophrenia, and the trust and esteem of many colleagues.
 * {not check_out_photo_on_desk} [Check out the photo on the desk] -> check_out_photo_on_desk
 * {not take_another_sip_of_espresso} [Take another sip of espresso.] -> take_another_sip_of_espresso
 * {check_out_my_awards && check_out_photo_on_desk && take_another_sip_of_espresso}[Waiting for the patient] -> wait_for_patient

== check_out_photo_on_desk
- The photo on the table shows a seemingly perfect family of three. My virtuous wife, my lovely daughter, and I, on my daughter’s birthday. But I was always busy with my job, which led to the division of the family.
 * {not check_out_my_awards} [Check out my awards] -> check_out_my_awards
 * {not take_another_sip_of_espresso} [Take another sip of espresso.] -> take_another_sip_of_espresso
 * {check_out_my_awards && check_out_photo_on_desk && take_another_sip_of_espresso}[Waiting for the patient] -> wait_for_patient

== take_another_sip_of_espresso
- The mellow espresso filled my mouth. This was brought to me by a former patient of mine. I have to say that this espresso is particularly delicious, with a little fruity sweetness swirling on the tip of my tongue.
 * {not check_out_my_awards} [Check out my awards] -> check_out_my_awards
 * {not check_out_photo_on_desk} [Check out the photo on the desk] -> check_out_photo_on_desk
 * {check_out_my_awards && check_out_photo_on_desk && take_another_sip_of_espresso}[Waiting for the patient] -> wait_for_patient


== wait_for_patient
- I waited for her while reading the materials. Time passed slowly, and finally.

 Knock knock，
 
 Jeff: Please come in. # CLASS: Jeff
 
 * The door is slowly opened


- A woman who covered half of her face walked in, her left face was covered by a piece of cloth, and her right face was always a faint smile, but after looking at it for a long time, it would feel a little scary.
 * Jeff: "Welcome back and nice to see you, Ms. Jennifer. How are you feeling today?" # CLASS: Jeff
    ~ Sanity += 1

 * Jeff: "You're late, Ms. Jennifer. How have you been?" # CLASS: Jeff
    ~ Evilness += 1
    ~ Sanity -= 1
    
- Jennifer: It's been good recently," he "hasn't been out much recently, and I feel that the medicine you prescribed by the doctor is very effective. # CLASS: Jennifer

  Jeff: That’s good, Ms. Jennifer. This is a very good treatment result, as long as you take the medicine regularly, "he" will not come out again. # CLASS: Jeff

  Jeff: Now I'm going to ask you some questions to determine your state of mind, Ms. Jennifer. # CLASS: Jeff
  
 * Jeff: “Have you been dreaming about anything the last few nights?” # CLASS: Jeff
 
- Jennifer: I've been having dreams that I'm in a room with two chairs, one of which is sitting on a man who is restrained by five chains. I'm not sure who he is, yet he gives me a familiar vibe. # CLASS: Jennifer
 * Jeff: "What have you eaten these days?"# CLASS: Jeff
 
- Jennifer: I eat a lot of veggies and hardly a little meat. Just as you said last time, I need to eat more vegetables. # CLASS: Jennifer

 * Jeff: "Now, how do you feel when you take this knife in my hand?" # CLASS: Jeff
 
- Jennifer slowly picked up the knife. At this time, I was very nervous. I am the one who knew what had happened to her. # CLASS: Jennifer

 Jennifer: Nothing Special. # CLASS: Jennifer
 
 Hearing what she said, I slowly relaxed. Although she didn't know it, my hand was on the alert button all the time.
 
 * Jeff: “Seems that our treatment is working well, which means that’s great! Ms. Jennifer, and "he" should not come out in the near future” # CLASS: Jeff
 
- * [Jeff: All right, give me a second, I will give you your medicine for next week.] -> day1_medicine_cabinet

== day1_medicine_cabinet
 Jeff: All right, give me a second, I will give you your medicine for next week. # CLASS: Jeff
 
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
        
    * Here's your medicine, ma'am, with your usual dosage. # CLASS: Jeff
        ~ Evilness += 1
        ~ Sanity -= 2 
    
    * Here’s your medicine, ma’am. Keep in mind to take it after meals with your usual dosage. # CLASS: Jeff
    

- Jennifer: Alright, thank you. # CLASS: Jennifer

  Jeff: Ms.Jennifer, that's all for now; I'll see you again next week at the same time as today. I hope your condition improves. # CLASS: Jeff
  
  I opened the door for her once I finished the conversation.
  
 * Jennifer: Sure, but I feel we'll cross paths again soon. # CLASS: Jennifer

- I trembled as I saw what she said to me with a sneaky smirk on her face.

 * Creak…The door shutted.

- I sat down slowly and carefully at my chair, and the chilly perspiration on my back soaked my clothes. Every meeting I have with her makes me uneasy and afraid, fear has gripped every nerve in my body. Yet I'm a psychologist, and I have to take it all.


/* out of work */
* Jennifer is the only patient with an appointment with me today, where should I go now?

 - * [Park] -> park
   
   * [Commercial Center] -> commercial
   
   * [Psychiatric Institution] -> day1_psychiatric_institution
   
   * [Go Home] -> go_home

=== park ===
[Park]

- I left my clinic and went to a nearby park.

  No matter what time it is here, it is so comfortable, and nice for me to relax my mind and body.

 * Looking for a bench

- I found an empty bench at random and sat down, enjoying the sunshine.
    ~ Sanity += 2
    
- It's getting late. And It's time to go home. 
 
 * [Home] -> home


=== commercial ===
[Commercial Center]

- I walked to a nearby commercial center after leaving the clinic. Today is still business as usual. Barely see anyone along the way. Despite the fact that almost every company is closed, several businesses insist on staying open.
 
  I was strolling down the street when I noticed a store called "Home of Soul," and my curiosity compelled me to go inside.
 
 * Enter the store.
 
- I walked into the store and took a look around. The shop is small, but it sells a variety of unusual products such as tributes, sculptures, dream nets, and much more stuff that I cannot name.

  After a bit, an old man with glasses emerged from the entrance.

  Old man: Welcome to “Home of Soul”, what would you like to get? Young man. # CLASS: oldMan

 * Jeff: “What can I buy here?” # CLASS: Jeff

- Old man: Let me see, you can take two things from my shop today, the usage of which may change your destiny, but you will also pay something with a cost that you cannot see. Will you still be interested in purchasing it? # CLASS: oldMan

  The old man's words puzzled me; what does he mean by the cost that I cannot see? I don't understand and am stubbed, yet I choose to buy things nonetheless.

 * Jeff: "I would like to purchase some; what do you have for purchase?" # CLASS: Jeff

- Old man: Very well, young man, these are all things you may purchase. Choose two products that interest your curiosity. # CLASS: oldMan
 * Commercial List -> commercial_list
 
== commercial_list
Commercial count: 
{commercial_count}


 * {shop_item !? scalpel && commercial_count < 2} Blood Scalpel -> blood_scalpel
 * {shop_item !? sheep && commercial_count < 2} Adorable Little Sheep -> adorable_little_sheep
 * {shop_item !? justice && commercial_count < 2} A calligraphy that says 'Justice' -> a_calligraphy
 * {shop_item !? painting && commercial_count < 2} Distorted Paintings -> distorted_paintings
 * {shop_item !? tentacle && commercial_count < 2} Small Tentacle -> small_tentacle
 * {shop_item !? tooth && commercial_count < 2} An unknown animal's tooth -> animal_tooth
 * {shop_item !? writing && commercial_count < 2} A scroll containing nonsensical writing -> nonsensical_writing
 * {shop_item !? toy && commercial_count < 2} Superman Toy -> superman_toy
 * {shop_item !? disc && commercial_count < 2} 1998 Game Disc -> game_disc
 
 + {commercial_count <= 2} [Old man: “You appear to have decided to carry two items with you.”] -> close_commercial_list
 
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
    ~ Sanity -= 2 
- Old man: “You appear to have decided to carry two items with you.” # CLASS: oldMan
 
- I left the commercial center with the two items I had purchased, constantly feeling as though something had changed but not knowing what.

 + { current_day == 1} [Back Home] -> home
 + { current_day == 2} [Back Home] ->day2_home
 
 
=== day1_psychiatric_institution ===

~visited_psy = true

[Psychiatric institution]

- I left my clinic and proceeded to the city's largest psychiatric institution.

  I used to work here, but the environment was so dreary that I quit and decided to create my own clinic.

  For some reason, I felt like someone was guiding me here, and I came to this place again.

 * Walk into the Psychiatric institution
 
- The nurse at the front desk recognized me right away.
 
  Nurse: “Hi! Doctor Jeff, What brings you here?” # CLASS: nurse

 * Jeff: "Ohh, Hi! Nothing, I'm just looking around here. What have you been busy with recently? " # CLASS: Jeff

- Nurse: “You are just in time. Recently, we received an elderly lady. She babbles every day. And hope that you can talk to her.” # CLASS: nurse

 * Jeff: "No problem. And where is she? " # CLASS: Jeff

- Nurse: “She's in building 44, room 44. Please, Doctor Jeff.” # CLASS: nurse

 * Go to building 44, room 44.
 
- As I got closer and closer to the enigmatic woman, I could sense a suffocating atmosphere creeping up on me. I was standing in front of the door of Room 44, and the awful atmosphere had totally swallowed me up as if a pair of chilly hands had gripped my throat and taken my breath away.

 * Knock on the door
 
- Jeff: “Good afternoon, I am Dr. Jeff. May I come in?” # CLASS: Jeff

  As I thought, the whole room was separated by a glass wall, so I could have a very safe conversation with her.

 * Jeff: “Ma’am, How have you been?” # CLASS: Jeff

- The old lady: “Aha, what do I smell? It’s the smell of death.” # CLASS: oldLady

  The old lady: “Young man, You're gonna die!” # CLASS: oldLady

 * Jeff: “I have met so many patients, many of them have said these words as you say, but most of them are just to intimidate me.” # CLASS: Jeff

- Jeff: “Ma’am, I wonder to know, why do you say I’m gonna die? And how do you know?“ # CLASS: Jeff

  The old lady: “Reason? You should figure it out by yourself, young man.” # CLASS: oldLady

  A villainous smile on her shriveled face.
  
  The old lady: “Oh yeah, young man” # CLASS: oldLady

  She raised her arm and pointed at me.

  The old lady: “Jeff, right? Come over here! I have something good for you.” # CLASS: oldLady

  She holds a stack of poker and a grin spreads across her face.

  The old lady: “I have a set of Tarot, maybe they will tell you the reason.” # CLASS: oldLady
  
 * "Playing games with mental patients that is not too much is also a good treatment for them."

- Jeff: “Yes, Ma’am. What‘s the rule?” # CLASS: Jeff

  The old lady chuckled.

  The old lady: “I will give you three cards, Jeff. And these three cards represent some revelation, and I'm going to give you some little revelations from the cards.” # CLASS: oldLady
  
 * Jeff: “Okay, Ma’am” # CLASS: Jeff

- The old lady: “And of course, every card you open has a price, so are you ready, young man? " # CLASS: oldLady

 * Yes, I’m good to go now. # CLASS: Jeff
 
- There are three cards in front of you.
 
 * [Choose a card] -> day1_choose_card

== day1_choose_card ==
 
 * [The Star， XVII] -> star_card
 * [The Moon， XVIII] -> moon_card
 * [The Sun， XIX] -> sun_card
 * [Not choose] -> day1_card_not_choose


== star_card
    ~ card_count += 1 

- The Star， XVII: 
  The old lady: “This is a star in a positive position, which represents the hope hidden in the depths. Although it is not big, it may change your destiny. However, this star has dimmed, maybe, under you In a reincarnation, you should choose a way home" # CLASS: oldLady

 * [Back] -> day1_choose_card

== moon_card
    ~ card_count += 1 

- The Moon， XVIII: 
  The old lady: “This is a positive position Moon, representing restlessness, confusion, and deception. Your rudeness or lies in your language will give you a different fate.” # CLASS: oldLady
  
 * [Back] -> day1_choose_card

== sun_card
    ~ card_count += 1

- The Sun， XIX: 
  The old lady: “This is a positive position of the sun, representing an active, full of life, and always friendly you that will reward you handsomely.” # CLASS: oldLady

 * [Back] -> day1_choose_card

// keep track how many cards has already chose
== function card_cal(i) ==
{
- card_count == 1:
    ~ Sanity -= 1 
    // Sanity - 1
        
- card_count == 2:
    ~ Sanity -= 3 
    // Sanity - 3 
    
- card_count == 3:
    ~ Sanity -= 6 
    // Sanity  -6 
}

== day1_card_not_choose ==
{card_cal(0)}

~ card_count = 0

- The old lady: “It seems that you have already made a choice, and I have given you a revelation. I hope to see you next time, Jeff” # CLASS: oldLady
 
 * Leave the Psychiatric institution
    ** [Back Home] -> home




=== go_home ===
- Just as I was about to leave the clinic, I noticed that Ms.Jennifer seem left something on the couch.
 
 * [Check out]
 
- It looks like a pendant.
    ~ Pendant += 1 

 * [Open the pendant]
 
- Inside the pendant was a family portrait of an apparently lovely couple with their children, but the photo of the father has been peeled off.

* [Leave the clinic]
    ** [Back Home] -> home



=== home ===
- As I came home, I stretched and relaxed out on the sofa.

-  But after a time, I stood up and grabbed a book off the shelf.

 * Open DSM-5
 
- I opened DSM-5, which lists several typical forms of mental disorders.

 * [Mental Disorders List] -> mental_disorders_list

== mental_disorders_list ==
 * [Dissociative Identity Disorder (as known as DID)] -> DID
 * [Depression] -> depression
 * [Bipolar Disorder] -> bipolar_disorder
 * [Close DSM-5] -> close_dsm5
 
== DID
- Dissociative Identity Disorder (as known as DID):
  There will most certainly be one or more substantial identities with their own past in the patient's mental world. They can usually speak with their primary identity and gain control of their body, although some patients are not aware of this. There is another personality in their body, resulting in the "missing time" phenomenon.
  
 * [Back] -> mental_disorders_list

== depression
- Depression: 
  Individuals with depression are frequently unpleasant and depressed for a long time, and even severe patients exhibit world-weariness, negativity, and strong suicidal impulses. The majority of patients are depressed as a result of overwhelming external pressure. They must take medicine for an extended period of time and insist on seeing a psychiatrist improve their health.

 * [Back] -> mental_disorders_list
 
== bipolar_disorder
- Bipolar Disorder:
  Patients with bipolar disorder typically encounter both mania and depression. The disorder's etiology is unclear, however, it is frequently associated with external factors such as chronic stress and early trauma. This sort of patient is often hyperactive, sleep duration is severely shortened, and severe individuals have suicidal impulses.

 * [Back] -> mental_disorders_list

== close_dsm5 
- I went to the restroom after reading about mental disorders and glanced at myself through the mirror.

* [Sanity Check] -> day1_ending

=== function sanity_check(s) ===
{
    - Sanity <= -10:
        Sanity : {Sanity} # CLASS: statusCheck
        You've completely lost control of yourself; your left and right faces are distorted and utterly incorrect, your left face's eyes are insane, and your tongue is protruding out of your mouth. Your right face, on the other hand, is terribly depressed. The right eye appears to have recently sobbed, and the corner of the lips is fully down, obviously miserable.

    - Sanity > -10 && Sanity <= 0:
        Sanity : {Sanity} # CLASS: statusCheck
        Something is amiss with you today; your eyes are visibly red, but you are thrilled, and the grin at the corner of your mouth is somewhat evil.

    - Sanity > 0 && Sanity <= 10:
        Sanity : {Sanity} # CLASS: statusCheck
        You appear fatigued today, with black bags under your eyes; you may need to take a break.

    - Sanity > 10 && Sanity <= 20:
        Sanity : {Sanity} # CLASS: statusCheck
        You appeared more energetic today, and despite your beard, you are still fairly refreshing.
        
    - Sanity > 20:
        Sanity : {Sanity} # CLASS: statusCheck
        You are quite confident today, you can handle anything, and you are very spiritual.
}


=== day1_ending ==
{sanity_check(1)}

~ Sanity += 1
- * You cleaned up a bit, ate a quick meal, and went straight to bed. -> day2


/* ---------------- DAY 2 ------------------ */
=== day2 ===
~ current_day = 2

- Day 2

- I returned to my clinic today, as normal. Along the way, several folks approached me and said hi. Everyone was pleasant, and the majority of them had already begun their recuperation process.

* [knock knock]

- The sudden knock on the door made me feel a little surprised. I remember that all the patients have come today, and no one should have an appointment.
-
* "Come in" # CLASS: Jeff
-
- The patient from yesterday appeared in front of you again.

    * Hello, Ms. Jennifer, what happened? # CLASS: Jeff
        ~ Kindness += 1
        ~ Sanity += 2
    
    * Hello, Ms. Jennifer, I recall that you didn't have an appointment today. # CLASS: Jeff
        ~ Sanity += 1
    
    * What's the matter, Ms. Jennifer? Our next meeting is next week. # CLASS: Jeff
        ~ Evilness += 1
        ~ Sanity -= 1


- Jennifer: "Hi dr.Jeff, nice to see you, something brought me here, and want me to see you again, to let you know more about me." # CLASS: Jennifer

- I have no idea that she will come to see me again, but I have a bad feeling about her state. 
- My hands start to sweat, I feel nervous, and I already put my hand on the button of the alarm. I'm glad I had the Anesthesia needle ready in advance and put it in my pocket, just in case.


- Jeff: “Nice to see you, Ms.Jennifer, now let's start our routine inquiry.” # CLASS: Jeff

 * Jeff: "Did you dream about something last night?" # CLASS: Jeff
     
- Jennifer: "Last night, I had a dream that several of the chains on the man seemed to be broken, and he could stand up. What is the meaning behind it? I wonder know." # CLASS: Jennifer

- 
 * Jeff: "Ms. Jennifer, seems this is a bad sign. I will give you some stronger medicines. You need to take 5 times today, one pill each time" # CLASS: Jeff
- Jennifer: Okay, thank you, Dr. Jeff. # CLASS: Jennifer

-
 * Jeff: “What did you eat yesterday?” # CLASS: Jeff
- Jennifer: I ate some raw meat yesterday, seemingly without realizing it. Ah, the taste, it was intoxicating. # CLASS: Jennifer

- 
 * Jeff: "How do you feel now that you have this knife in your hand?" # CLASS: Jeff

- I trembled as I handed her the knife.

    * Yes. 
        ~ Evilness += 1
        ~ Sanity += 1
    * Nope, it's just that the room is a bit chilly. 
        ~ Kindness += 1
        ~ Sanity -= 1
- 

- Every nerve in my body got tightened as she took over the knife. My hand was already in my trouser pocket, clutching my anesthetic needle, ready to sedate her at any moment.

- This knife does not look to be very comfortable. It is considerably weaker to the one I previously used.

* You're slightly relieved that she has no tendency to hurt anyone, but the chilly perspiration has soaked your back.

- Jeff: Ms. Jennifer, your current condition is critical; I will provide you with medication right now. # CLASS: Jeff
    * The Hidden drawer 
        Found a strong medicine in a red bottle
    * Leave
        Just as you were about to stand up, you felt your shoulders being held down, and you tried so hard to stand up, but didn't move. This is not a strength a woman can have.
- Jennifer: Tell me, Dr. Jeff, this drug won't kill me, will it? # CLASS: Jennifer

* "Not at all, Ms. Jennifer. It's just a wonder drug." # CLASS: Jeff

- Jennifer: “Ohh, really? Dr. Jeff, you better not deceive me, cause no one in this world can be able to afford the consequences, including you.” # CLASS: Jennifer

-
    * Tell her the truth: The medicine here has significant adverse effects, and you may vomit after taking it, but the impact is excellent. # CLASS: Jeff
        ~ Sanity += 1
        ~ Kindness += 1
    * Lie: This medicine has no negative side effects; it is simply more potent. # CLASS: Jeff
        ~ Sanity -= 2
        ~ Evilness += 2
    
    
- Jennifer: “Got it, thank you. Wish you have a great rest of your day! Hehe” # CLASS: Jennifer

- Then, Jennifer leaves the room.

- I slumped to the ground, and what had just happened seemed to suffocate me over and over again. I wanted to get out of here before she came back.
 It's time to leave the clinic; where should I go next?

* Park ->Park
* Commercial Center -> day2_commercial_center
* Psychiatric institution -> check_visited
* Return home -> day2_go_home

=== Park 
I left my clinic and went to a nearby park.
No matter what time it is here, it is so comfortable, and nice for me to relax my mind and body.
-
* [Looking for a bench]
- I found an empty bench at random and sat down, enjoying the sunshine.
~ Sanity += 3

* [It's getting late. And It's time to go home] -> day2_home

=== day2_commercial_center
You return to the commercial center and enter the "Home of Soul" store.

- 
 *[Go into the store]
-

Old man: Welcome, dear visitor. Are you going to my store today? Please select two products from my store today. # CLASS: oldMan

* [Begin] -> commercial_list

=== check_visited
{ - visited_psy == false:
    ->day1_psychiatric_institution
  - else:
    ->day2_psychiatric_institution
}

=== day2_psychiatric_institution
- I immediately left my clinic and went to the mental hospital. I needed to see the old lady. I needed her inspiration.
-
*[building 44, room 44]
-

- The old lady: “Nice to see you again, young man, seems something bad happened to you” # CLASS: oldLady

- The old lady takes out the tarot cards

- The old lady: “I know what you want, young man, let’s get to the point, Come over here young man and we start divination immediately.” # CLASS: oldLady


- There are three cards in front of you

* [Choose a card] -> day2_card

=== day2_card
* [Strength，VIII] -> Strength
* [Judgement，XX] -> Judgement
* [The Hermit，IX] -> Hermit

* [Not choose] -> day2_card_finish

=== Strength 
- Strength, VIII: 
- The old lady: “This is a positive force. Meaning that tomorrow, something very bad may happen to you, but your inner courage will be very important. Only by facing your fears can things turn around.” # CLASS: oldLady

~ Sanity -= 1

*[Back] ->day2_card

=== Judgement
- Judgement，XX: 
- The old lady: “This approval looks very strange. Although it represents resurrection, in a sense, you will not die tomorrow, but in the future, it may be resurrected in another way.” # CLASS: oldLady

~ Sanity -= 2

*[Back] -> day2_card

=== Hermit
- The Hermit，IX: 
- The old lady: “This is a hermit in an upright position. He represents slow progress in the dark. From the orientation of this card, walking to the left may lead to a seemingly better place.” # CLASS: oldLady

~ Sanity -= 3

*[Back] -> day2_card

=== day2_card_finish

~ commercial_count = 0

- The old lady: “It seems that you have already chosen and understood it. Remember, tomorrow will be a disaster for you. Be sure to remember the revelation of the tarot cards!” # CLASS: oldLady

- “Thank you, Ma’am” # CLASS: Jeff

- After that, you hurried home.

* [Home] -> day2_home

=== day2_go_home
- I decided to go home right away, and nothing occurred on the way.

~ Sanity += 1

* [Home] -> day2_home

=== day2_home

- When you get home, you immediately undress, head straight to the bathroom, turn on the shower, and turn the temperature down so that only cold water can temporarily calm your mind.

- You then gaze at yourself in the mirror. 

* [Sanity Check]

{sanity_check(1)}

~ Sanity += 1
- * You cleaned up a bit, ate a quick meal, and went straight to bed. -> day3

/* ---------------- DAY 3 ------------------ */
==== day3 ====
    ~ current_day = 3
    
- [Day 3]

- I awoke drowsily from my bed and struggled to get out of it. Today's condition isn't great, but my head is swollen like a balloon, it hurts somewhat, and my entire body is incredibly weak. It might have been somewhat due to the woman from yesterday, but I still have to go to the clinic today.

 * Take a few bites of breakfast and head to work
 
 - As usual, when you arrive at the clinic, you make yourself a cup of freshly brewed espresso. You're sitting on your chair, quietly staring at Newton's balance balls in front of you. Praying that patient does not appear today.

 * “Tic-tac-tic-tac…”

- You've met all of the patients by approximately two o'clock in the afternoon. Jennifer does not appear to be arriving today. Thinking about this makes me feel relieved, and I swiftly pack my belongings.

- Today, I don't want to go anywhere; I have a nagging feeling that something dreadful will happen, and all I want to do is get home as quickly as possible.

 * [Leave the clinic]
 
- On the walk home, I constantly had the feeling that something was wrong. I was continuously aware of a chill behind my back as if someone was watching me.

 * [Walk faster]

- You quicken your footsteps, but the sound of footsteps behind you gradually grows louder and louder as it chases after me.

- You decide to go back and find out who the individual is! You come to a halt, turn around fast, and shout at the person who is following.

 * Who are you? Why are you following me! # CLASS: Jeff
 
- I only saw the other party wearing a scarlet raincoat and seeing the person clearly clutching a corroded kitchen knife in her hand.

- Meanwhile, the individual in the scarlet raincoat gradually removed his hat. A familiar face stood in front of you, but her eyes does not look the same as usual.

 * Jennifer! What are you doing here! # CLASS: Jeff
 
- She smiled contemptuously.

- Jennifer: What am I doing here? Of course, my lovely doctor, I am here for you. # CLASS: Jennifer

- She raised her hand, clutching the rusty knife in her hand, and took a glance at it with a smile. She exuded a bloodthirsty vibe all over her.

- Jennifer: I've been waiting and preparing for so long to dismember you flawlessly!  # CLASS: Jennifer

 * [Run!]
 
- You run desperately, and the woman behind you does the same. You plead for help the entire route, but the road appears desolate. You quickly get your phone from your jacket pocket, but there is no signal around here.

 * You fled to a neighboring commercial center in a hurry.
 
- You flee to the nearest commercial center. However, the center was deserted, and all of the stores were shuttered. You knocked on every shop's door, but no one replied no matter how hard you banged.

- The woman behind you is drawing closer and closer. There are only two paths in front of you. Which one should I choose?

* [Go to the left] -> day3_left_route
* [Go to the right] -> day3_right_route

/* left */
=== day3_left_route

- You didn't give it much thought and dashed to the road on the left. This path leads to the second floor of the commercial center. 

- You reach the second floor, where practically all of the stores are closed.
  However, you discover that the entrance to a furniture store is still open, leaving you with only one option.
  
 * Go to the bedding store
 
- Jennifer: “Stop running, You are running too fast, I can't catch up with you!” # CLASS: Jennifer

- Jennifer: “Uh Oh! I can see you. Now, you have nowhere to escape~” # CLASS: Jennifer

 * You entered the store, but there are not much places for you can hide. Where would you hide?
    
    - * [Hide under the bed] -> day3_under_bed
      * [Hide under the counter] -> day3_hide_under_counter
      * [Hide inside the bed] -> day3_inside_bed
 
/* under bed */    
== day3_under_bed
- You hastily hide under the bed. The suffocating atmosphere makes your every nerve full of vigilance. The sound of footsteps accompanied by the rapid beating of the heart is terrifying as if the scythe of the Thanatos had been placed on the neck, and it felt like the scythe would take away your life in the next second.

- * Jennifer: "Where are you, Doctor? Ha, you want to play Peek-a-boo, right? Ho! You're not going to conceal yourself behind the quilt, aren’t you?" # CLASS: Jennifer

- Woosh, She stabbed the bed next to her fiercely as soon as she finished speaking.

- * Jennifer: “Aha, how about the counter? You’re hiding under the counter, aren’t you?” # CLASS: Jennifer

- When you hear her words, your heart stops and dread takes over. A scarlet raincoat came near, she stooped down, looking at you with an evilly smile.

- * Jennifer: “What a pity! Where are you? Uh Ah~! That's only the last option left, Dr.Jeff!  You're under the bed!!!” # CLASS: Jeff

- A person emerged in front of you the following second. A face emerged in front of you after a time. You stare in astonishment at her desperate expression. You were shaking with terror, unable to move, and unable to control your heart's anxiety. You are yanked out of bed by a force.

- Jennifer's eyes sharpened and she grabbed you by the neck, forcing you against the wall and clutching a half-rusted knife. You struggle to get free, but her power is extraordinary, and she soon stops you.

- * Jeffiner: "Hey, doctor, peek-a-boo is a lot of fun, but I'm bored of it, so it's time for execution!" # CLASS: Jennifer

- You shut your eyes closed and refuse to face death. As the knife was about to penetrate your chest, the hand that was clutching your neck gradually loosen. I slowly opened my eyes and tried to breathe again and saw Jennifer clutching her head in her hands, as if in anguish.

- * Jennifer: “Run! I'm not going to last long!” # CLASS: Jennifer

- * Jennifer: "It's you again, why are you obstructing me, you bastard, get off here!" # CLASS: Jennifer

- * Jennifer: “Run!!!” # CLASS: Jennifer

- As you look at the woman in front of you seems to be in great pain! And you have no other choices. However, this is your only chance to run. What will you do?

 * [Run away] -> day3_run_away
 * [Stay with her, try to awaken a woman's main personality] -> day3_stay
 

/* under counter */
== day3_hide_under_counter
- You hastily duck under the counter. The suffocating atmosphere makes your every nerve full of vigilance. The sound of footsteps accompanied by the rapid beating of the heart is terrifying as if the scythe of the Thanatos had been placed on the neck, and it felt like the scythe would take away your life in the next second.

 * Jennifer: "Where are you, Doctor? Ha, you want to play Peek-a-boo, right? Ho! You're not going to conceal yourself behind the quilt, aren’t you?" # CLASS: Jennifer
 
 - Woosh, She stabbed the bed next to her fiercely as soon as she finished speaking.

 * Jennifer: "Ah, you won't hide under the bed, will you?" # CLASS: Jennifer
 
- She didn't say anything else, but her silence worried you more. 

 * Jennifer: "How come I can't find you anywhere, doctor.” # CLASS: Jennifer
 
- The phone fell to the ground unexpectedly. She seemed to have sensed sound and halted her footsteps.

 * Jennifer: “Aha, here you are!" # CLASS: Jennifer
 
- When you hear her words, your heart stops and dread takes over. A scarlet raincoat came near, she stooped down, looking at you with an evilly smile.
 
 * Jennifer: “I found you, Doctor” # CLASS: Jennifer
 
- Jennifer's eyes sharpened and she grabbed you by the neck, forcing you against the wall and clutching a half-rusted knife. You struggle to get free, but her power is extraordinary, and she soon stops you.

 * Jennifer: "Hey, doctor, peek-a-boo is a lot of fun, but I'm bored of it, so it's time for execution!" # CLASS: Jennifer
 
- You shut your eyes closed and refuse to face death. As the knife was about to penetrate your chest, the hand that was clutching your neck gradually loosen. I slowly opened my eyes and tried to breathe again and saw Jennifer clutching her head in her hands, as if in anguish.

 * Jennifer: “Run! I'm not going to last long!” # CLASS: Jennifer
 
- * Jennifer: "It's you again, why are you obstructing me, you bastard, get off here!" # CLASS: Jennifer

- * Jennifer: “Run!!!” # CLASS: Jennifer

- As you look at the woman in front of you seems to be in great pain! And you have no other choices. However, this is your only chance to run. What will you do?

 * [Run away] -> day3_run_away
 * [Stay with her, try to awaken a woman's main personality] -> day3_stay


/* inside bed */
== day3_inside_bed
- You choose to hide under the quilt on the bed. The suffocating atmosphere makes your every nerve full of vigilance. The sound of footsteps accompanied by the rapid beating of the heart is terrifying as if the scythe of the Thanatos had been placed on the neck, and it felt like the scythe would take away your life in the next second.

 * Jennifer: "Where are you, Doctor? Ha, you want to play Peek-a-boo, right? Ho! you won't hide under the bed, will you??" # CLASS: Jennifer
 
- Jennifer: "Ah, you aren't there, then where are you?" # CLASS: Jennifer

 * Jennifer: “Aha, how about the counter? You’re hiding under the counter, aren’t you?”

- * Jennifer: "Aha! Not here either, then I know where you are, lovely doctor!!!!" # CLASS: Jennifer

- When you hear her words, your heart stops and dread takes over. The quilt on your body was pulled, and a scarlet raincoat stand right next to you. She starts to bend down, looking at you with an evilly smile.

 * Jennifer: "Hello there, lovely doctor. What a lovely spot to hide." # CLASS: Jennifer
 
- * Jennifer: "Hey, doctor, peek-a-boo is a lot of fun, but I'm bored of it, so it's time for execution!" # CLASS: Jennifer

- You shut your eyes closed and refuse to face death. As the knife was about to penetrate your chest, the hand that was clutching your neck gradually loosen. I slowly opened my eyes and tried to breathe again and saw Jennifer clutching her head in her hands, as if in anguish.

 * Jennifer: “Run! I'm not going to last long!” # CLASS: Jennifer
 
- * Jennifer: "It's you again, why are you obstructing me, you bastard, get off here!" # CLASS: Jennifer

- * Jennifer: “Run!!!” # CLASS: Jennifer

- As you look at the woman in front of you seems to be in great pain! And you have no other choices. However, this is your only chance to run. What will you do?

 * [Run away] -> day3_run_away
 * [Stay with her, try to awaken a woman's main personality] -> day3_stay


/* run away OR stay */
== day3_run_away
    ~ Sanity -= 2
    ~ Evilness += 1
    
- You still opted to flee, leaving the lady wailing alone; you know you can't do anything but rush home and lock the door.

 *[Go Home] -> day3_back_home

== day3_stay
    ~ Sanity -= 1 
    ~ Kindness += 2

- You chose to stay and approached the woman carefully and softly. You had a firm grasp on her shoulders.

 * Jeff: "I'm not leaving, Ms. Jennifer; think of the most valuable person or object in your life!" Don't allow 'her' take over you or your thinking!" # CLASS: Jeff
 
 - Jennifer: “Shut up! Dr.Jeff! You don’t know anything! After I take control of this body, I will definitely not kill you easily this time. I will torment you slowly. until you feel death is the real detachment!” # CLASS: Jennifer
 
 - Jennifer:  “My son! Justin, I miss him. He is in the orphanage, I haven’t seen him this week, I miss him so much! Dr.Jeff, Justin is my most precious one. I can’t let you, I can't let you take control of my body, not even a little bit, I want to see my Justin.” # CLASS: Jennifer
 
 * Jeff: “Jennifer! You can do it! Justin, he misses you too. Now hurry up and think about the best things between you and your son, and that is the only way to temporarily seal ‘her’." # CLASS: Jeff
 
- Jennifer finally stopped screaming as the minutes passed, and she grew silent. She had successfully kept "her" under control for the time being.

- You gently put her to bed, watched her sleep peacefully, and then departed to go home.

 *[Go Home] -> day3_back_home

/* right */
=== day3_right_route
- After some consideration, you pick the right path.
  
  The path to the right leads to the commercial's center subterranean garage.
  
  You have a lot of options right now because there are so many cars in the basement garage; you may hide in numerous areas to try to avoid the chase.

 * [Pick a car and hide under it.] -> day3_under_car
 * [Randomly pick a car and hide behind it.] -> day3_behind_car
 * [Find a pillar and hide.] -> day3_pillar
 
 
== day3_under_car 
- You pick a car with a slightly higher bottom, so it's better for you to get in and hide.
  
  After a time, you heard audible footsteps coming from the stairs, which made you quite worried, but it appears that the other party went because he noticed too many cars there and thought it was bothersome.



 *[Although it was temporarily safe, you still had great care and dared not make any noise, then you left the mall and returned home.] -> day3_back_home
 
== day3_behind_car
- You picked a big truck and you hid in the back of the truck.

  After a time, you heard audible footsteps coming from the stairs, which made you quite worried, but it appears that the other party went because he noticed too many cars there and thought it was bothersome.

 *[Although it was temporarily safe, you still had great care and dared not make any noise, then you left the mall and returned home.] -> day3_back_home

== day3_pillar
- You find a pillar very far from the stairs and hide.

  After a long time, you find that nothing seems to happen, you don't hear any sound, and you feel temporarily safe.
  
  
 *[Although it was temporarily safe, you still had great care and dared not make any noise, then you left the mall and returned home.] -> day3_back_home
 
 
/* back home */
=== day3_back_home
- When you get home, you immediately undress, head straight to the bathroom, turn on the shower, and turn the temperature down so that only cold water can temporarily calm your mind.

 * You then gaze at yourself in the mirror.
 
- * [Sanity Check]

{sanity_check(1)}

- * [Leave the bathroom]

- You've just narrowly escaped today, and you're feeling uneasy and collapsed. Because you don't exercise much, your legs are painful and feeble.

 ~ Sanity += 1
 
* [It is time to go to bed] -> day4

/* ---------------- DAY 3 ------------------ */
=== day4    
Placeholder
-> END

    -> END
