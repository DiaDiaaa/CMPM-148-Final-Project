#theme: dark

// @ -1,550 +0,0 @@
VAR Sanity = 10
VAR Kindness = 5
VAR Evilness = 0

VAR current_day = 0

VAR Pendant = 0

VAR commercial_count = 0
VAR commercial_max = 2
VAR card_count = 0

VAR visited_psy = false
VAR visited_shop = false

LIST shop_item = scalpel, sheep, justice, painting, tentacle, tooth, writing, toy, disc


- There are many stories hidden in this small town. Mermaid Song, Death Ballad, Inheriting Personality. Many people may feel that their life is perfect, with a wonderful family and a wonderful job. Or maybe some people feel that their lives are terrible, being betrayed, or families split. But what they don't know is that the whole of this world is just a script in the hands of others.

 * [Day 1] -> day1
// * [Day 2] -> day1

/* ---------------- DAY 1 ------------------ */
=== day1 === 
[Day 1]

~ current_day = 1 

- As usual, you drove from your house to your clinic.
 * [Open the door]

- As arrived at the clinic, you open the entrance door and proceeded to the lounge. You made a freshly brewed mug of espresso using the classic coffee maker that usually resided in the lounge. 

 You walked inside to your office and sat down expertly on a chair.

 * [Open medical record] -> open_medical_record


/* medical records */       // has back choice
== open_medical_record
- You began flipping through the medical record on your desk. You recently treated a new patient, who will be coming for her visit today. You need to reconfirm the patient's records.

 * Patient's name -> patient_name
 * Patient's age -> patient_age
 * Patient's address -> patient_address
 * Diagnose disorder -> diagnose_disorder
 * {patient_name && patient_age && patient_address && diagnose_disorder} [Close medical record] -> drink_coffee


== patient_name
: 
Jennifer
 * {not patient_age} Patient's age -> patient_age
 * {not patient_address} Patient's address -> patient_address
 * {not diagnose_disorder} Diagnose disorder -> diagnose_disorder
 * {patient_name && patient_age && patient_address && diagnose_disorder} [Close medical record] -> drink_coffee

== patient_age
:
26 years old, born on April 4th, 1996
 * {not patient_name} Patient's name -> patient_name
 * {not patient_address} Patient's address -> patient_address
 * {not diagnose_disorder} Diagnose disorder -> diagnose_disorder
 * {patient_name && patient_age && patient_address && diagnose_disorder} [Close medical record] -> drink_coffee
 
== patient_address
:
2377, moonlight road, 444 room
 * {not patient_name} Patient's name -> patient_name
 * {not patient_age} Patient's age -> patient_age
 * {not diagnose_disorder} Diagnose disorder -> diagnose_disorder
 * {patient_name && patient_age && patient_address && diagnose_disorder} [Close medical record] -> drink_coffee


== diagnose_disorder
:
Dissociative Identity Disorder
 * {not patient_name} Patient's name -> patient_name
 * {not patient_age} Patient's age -> patient_age
 * {not patient_address} Patient's address -> patient_address
 * {patient_name && patient_age && patient_address && diagnose_disorder} [Close medical record] -> drink_coffee


/* start wait patient */     // has back choice
== drink_coffee
- You took a slow sip of coffee and waited for the patient to arrive.

 While waited for the patient, you sipped your espresso gently.

 * [Check out your awards] -> check_out_my_awards
 * [Check out the photo on the desk] -> check_out_photo_on_desk
 * [Take another sip of espresso] -> take_another_sip_of_espresso
 * {check_out_my_awards && check_out_photo_on_desk && take_another_sip_of_espresso}[Waiting for the patient] -> wait_for_patient

== check_out_my_awards
You dusted the crystal award and certificates on the shelf with care. Several honors have been bestowed upon you, including best psychologist of 1999 and most compassionate psychologist. You have also earned an Award for Research in Psychiatry, an Award for Research in Schizophrenia, and the trust and esteem of many colleagues.
 * {not check_out_photo_on_desk} [Check out the photo on the desk] -> check_out_photo_on_desk
 * {not take_another_sip_of_espresso} [Take another sip of espresso] -> take_another_sip_of_espresso
 * {check_out_my_awards && check_out_photo_on_desk && take_another_sip_of_espresso}[Waiting for the patient] -> wait_for_patient

== check_out_photo_on_desk
- The photo on the table shows a seemingly perfect family of three. Your virtuous wife, your lovely daughter, and you on your daughter's birthday. But you was always busy with the job, which led to the division of the family.
 * {not check_out_my_awards} [Check out your awards] -> check_out_my_awards
 * {not take_another_sip_of_espresso} [Take another sip of espresso] -> take_another_sip_of_espresso
 * {check_out_my_awards && check_out_photo_on_desk && take_another_sip_of_espresso}[Waiting for the patient] -> wait_for_patient

== take_another_sip_of_espresso
- The mellow espresso filled your mouth. This was brought to you by a former patient. You have to say that this espresso is particularly delicious, with a little fruity sweetness swirling on the tip of your tongue.
 * {not check_out_my_awards} [Check out your awards] -> check_out_my_awards
 * {not check_out_photo_on_desk} [Check out the photo on the desk] -> check_out_photo_on_desk
 * {check_out_my_awards && check_out_photo_on_desk && take_another_sip_of_espresso}[Waiting for the patient] -> wait_for_patient


== wait_for_patient
- You waited for her while reading the materials. Time passed slowly, and finally.

 Knock knock,
 
 Jeff: Please come in. # CLASS: Jeff
 
 * The door is slowly opened


- A woman who covered half of her face walked in, her left face was covered by a piece of cloth, and her right face was always a faint smile, but after looking at it for a long time, it would feel a little scary.
 * Jeff: Welcome back and nice to see you, Ms. Jennifer. How are you feeling today? # CLASS: Jeff
    ~ Sanity += 1

 * Jeff: You're late, Ms. Jennifer. How have you been? # CLASS: Jeff
    ~ Evilness += 1
    ~ Sanity -= 1
    
- Jennifer: It's been good recently,"he" hasn't been out much recently, and I feel that the medicine you prescribed by the doctor is very effective. # CLASS: Jennifer

  Jeff: That's good, Ms. Jennifer. This is a very good treatment result, as long as you take the medicine regularly, "he" will not come out again. # CLASS: Jeff

  Jeff: Now I'm going to ask you some questions to determine your state of mind, Ms. Jennifer. # CLASS: Jeff
  
 * Jeff: Have you been dreaming about anything the last few nights? # CLASS: Jeff
 
- Jennifer: I've been having dreams that I'm in a room with two chairs, one of which is sitting on a man who is restrained by five chains. I'm not sure who he is, yet he gives me a familiar vibe. # CLASS: Jennifer
 * Jeff: What have you eaten these days? # CLASS: Jeff
 
- Jennifer: I eat a lot of veggies and hardly a little meat. Just as you said last time, I need to eat more vegetables. # CLASS: Jennifer

 * Jeff: Now, how do you feel when you take this knife in my hand? # CLASS: Jeff
 
- Jennifer slowly picked up the knife. At this time, you was very nervous. You are the one who knew what had happened to her. # CLASS: Jennifer

 Jennifer: Nothing special. # CLASS: Jennifer
 
 Hearing what she said, you slowly relaxed. Although she didn't know it, your hand was on the alert button all the time.
 
 * Jeff: Seems that our treatment is working well, which means that's great! Ms. Jennifer, and "he" should not come out in the near future. # CLASS: Jeff
 
- * [Jeff: All right, give me a second, I will give you your medicine for next week.] -> day1_medicine_cabinet

== day1_medicine_cabinet
 Jeff: All right, give me a second, I will give you your medicine for next week. # CLASS: Jeff
 
- You went to your medicine cabinet. 
  Where is Jennifer's medicine? -> choose_drawer
 
== choose_drawer
  * [Top drawer] -> day1_top_drawer
//   - This is not Jennifer's medicine
  
  * [The Middle Drawer] -> day1_right_drawer
//   - * [Bingo, Jennifer's medicine in a green bottle] -> day1_right_drawer
  * [The bottom drawer] -> day1_bottom_drawer

== day1_top_drawer
  This is not Jennifer's medicine.

 * [Back] -> choose_drawer
 
== day1_bottom_drawer
 There are only some sleeping pills.

* [Back] -> choose_drawer
  
== day1_right_drawer
* Bingo, Jennifer's medicine in a green bottle.


- * Ms. Jennifer, this is your medicine. The dose can be lowered to two per day, one in the morning and one in the evening, depending on your condition. Keep in mind to take it after meals. # CLASS: Jeff
        ~ Kindness += 2
        ~ Sanity += 1
        
    * Here's your medicine, ma'am, with your usual dosage. # CLASS: Jeff
        ~ Evilness += 1
        ~ Sanity -= 2 
    
    * Here's your medicine, ma'am. Keep in mind to take it after meals with your usual dosage. # CLASS: Jeff
    

- Jennifer: Alright, thank you. # CLASS: Jennifer

  Jeff: Ms. Jennifer, that's all for now. I'll see you again next week at the same time as today. I hope your condition improves. # CLASS: Jeff
  
  You opened the door for her once I finished the conversation.
  
 * Jennifer: Sure, but I feel we'll cross paths again soon. # CLASS: Jennifer

- You are tremble when you saw her with a sneaky smirk on her face.

 * Creak… The door shutted.

- You sat down slowly and carefully at the chair, and the chilly perspiration on your back soaked your clothes. Every meeting you have with her makes you uneasy and afraid, fear has gripped every nerve in your body. Yet you are a psychologist, and you have to take it all.


/* out of work */
* Jennifer is the only patient with an appointment with me today, where should I go now?

 - * [Park] -> park
   
   * [Commercial Center] -> commercial
   
   * [Psychiatric Institution] -> day1_psychiatric_institution
   
   * [Go Home] -> go_home

=== park ===
[Park]

- You left your clinic and went to a nearby park.

  No matter what time it is here, it is so comfortable, and nice for you to relax your mind and body.

 * [Looking for a bench]

- You found an empty bench at random and sat down, enjoying the sunshine.
    ~ Sanity += 2
    
- It's getting late. And it's time to go home. 
 
 * [Home] -> home


=== commercial ===

~visited_shop  = true


[Commercial Center]

- You walked to a nearby commercial center after leaving the clinic. Today is still business as usual. Barely see anyone along the way. Despite the fact that almost every company is closed, several businesses insist on staying open.
 
  You was strolling down the street when You noticed a store called "Home of Soul," and your curiosity compelled you to go inside.
 
 * [Enter the store]
 
- You walked into the store and took a look around. The shop is small, but it sells a variety of unusual products such as tributes, sculptures, dream nets, and much more stuff that you cannot name.

  After a bit, an old man with glasses emerged from the entrance.

  Old man: Welcome to Home of Soul. What would you like to get? Young man. # CLASS: oldMan

 * Jeff: What can I buy here? # CLASS: Jeff

- Old man: Let me see, you can take two things from my shop today, the usage of which may change your destiny, but you will also pay something with a cost that you cannot see. Will you still be interested in purchasing it? # CLASS: oldMan

  The old man's words puzzled me. What does he mean by the cost that I cannot see? I don't understand and am stubbed. Yet I choose to buy things nonetheless.

 * Jeff: I would like to purchase some. What do you have for purchase? # CLASS: Jeff

- Old man: Very well, young man, these are all things you may purchase. Choose two products that interest your curiosity. # CLASS: oldMan
 * Commercial List -> commercial_list
 
== commercial_list
// Commercial count: 
// {commercial_count}


 * {shop_item !? scalpel && commercial_count < commercial_max} Blood Scalpel -> blood_scalpel
 * {shop_item !? sheep && commercial_count < commercial_max} Adorable Little Sheep -> adorable_little_sheep
 * {shop_item !? justice && commercial_count < commercial_max} A calligraphy that says 'Justice' -> a_calligraphy
 * {shop_item !? painting && commercial_count < commercial_max} Distorted Paintings -> distorted_paintings
 * {shop_item !? tentacle && commercial_count < commercial_max} Small Tentacle -> small_tentacle
 * {shop_item !? tooth && commercial_count < commercial_max} An unknown animal's tooth -> animal_tooth
 * {shop_item !? writing && commercial_count < commercial_max} A scroll containing nonsensical writing -> nonsensical_writing
 * {shop_item !? toy && commercial_count < commercial_max} Superman Toy -> superman_toy
 * {shop_item !? disc && commercial_count < commercial_max} 1998 Game Disc -> game_disc
 
 + {commercial_count == commercial_max} [Old man: You appear to have decided to carry {commercial_max} items with you.] -> close_commercial_list
 
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
- Old man: You appear to have decided to carry {commercial_max} items with you. # CLASS: oldMan
 
- You left the commercial center with the {commercial_max} items you had purchased, constantly feeling as though something had changed but not knowing what.

 + { current_day == 1} [Back Home] -> home
 + { current_day == 2} [Back Home] ->day2_home
 + { current_day == 4} [Back Home] ->day4_home
 
=== day1_psychiatric_institution ===

~visited_psy = true

[Psychiatric institution]

- You left your clinic and proceeded to the city's largest psychiatric institution.

  You used to work here, but the environment was so dreary that You quit and decided to create your own clinic.

  For some reason, you felt like someone was guiding you here, and you came to this place again.

 * [Walk into the Psychiatric institution]
 
- The nurse at the front desk recognized you right away.
 
  Nurse: Hi! Doctor Jeff, What brings you here? # CLASS: nurse

 * Jeff: Ohh, Hi! Nothing. I'm just looking around here. What have you been busy with recently?  # CLASS: Jeff

- Nurse: You are just in time. Recently, we received an elderly lady. She babbles every day. And hope that you can talk to her. # CLASS: nurse

 * Jeff: No problem. And where is she?  # CLASS: Jeff

- Nurse: She's in building 44, room 44. Please, Doctor Jeff. # CLASS: nurse

 * [Go to building 44, room 44]
 
- As You got closer and closer to the enigmatic woman, you could sense a suffocating atmosphere creeping up on me. You was standing in front of the door of Room 44, and the awful atmosphere had totally swallowed me up as if a pair of chilly hands had gripped your throat and taken your breath away.

 * [Knock on the door]
 
- Jeff: Good afternoon, I am Dr. Jeff. May I come in? # CLASS: Jeff

  As You thought, the whole room was separated by a glass wall, so You could have a very safe conversation with her.

 * Jeff: Ma'am, How have you been? # CLASS: Jeff

- The old lady: Aha, what do I smell? It's the smell of death. # CLASS: oldLady

  The old lady: Young man, you're gonna die! # CLASS: oldLady

 * Jeff: I have met so many patients, many of them have said these words as you say, but most of them are just to intimidate me. # CLASS: Jeff

- Jeff: Ma'am, I wonder to know, why do you say I'm gonna die? And how do you know? # CLASS: Jeff

  The old lady: Reason? You should figure it out by yourself, young man. # CLASS: oldLady

  A villainous smile on her shriveled face.
  
  The old lady: Oh yes, young man. # CLASS: oldLady

  She raised her arm and pointed at me.

  The old lady: Jeff, right? Come over here! I have something good for you. # CLASS: oldLady

  She holds a stack of poker and a grin spreads across her face.

  The old lady: I have a set of Tarot, maybe they will tell you the reason. # CLASS: oldLady
  
 * Playing games with mental patients that is not too much is also a good treatment for them.

- Jeff: Yes, Ma'am. What's the rule? # CLASS: Jeff

  The old lady chuckled.

  The old lady: I will give you three cards, Jeff. And these three cards represent some revelation, and I'm going to give you some little revelations from the cards. # CLASS: oldLady
  
 * Jeff: Okay, Ma'am. # CLASS: Jeff

- The old lady: And of course, every card you open has a price, so are you ready, young man?  # CLASS: oldLady

 * Yes, I'm good to go now. # CLASS: Jeff
 
- There are three cards in front of you.
 
 * [Choose a card] -> date_of_card

=== date_of_card
{
- current_day == 1:
    -> day1_choose_card
    
- current_day == 2:
    ->day2_card
    
- current_day == 4:
    ->day4_card
}


== day1_choose_card ==
 
 * [The Star, XVII] -> star_card
 * [The Moon, XVIII] -> moon_card
 * [The Sun, XIX] -> sun_card
 * [Not choose] -> day1_card_not_choose


== star_card
    ~ card_count += 1 

- The Star, XVII: 
  The old lady: This is a star in a positive position, which represents the hope hidden in the depths. Although it is not big, it may change your destiny. However, this star has dimmed, maybe, under you in a reincarnation, you should choose a way home. # CLASS: oldLady

 * [Back] -> day1_choose_card

== moon_card
    ~ card_count += 1 

- The Moon, XVIII: 
  The old lady: This is a positive position Moon, representing restlessness, confusion, and deception. Your rudeness or lies in your language will give you a different fate. # CLASS: oldLady
  
 * [Back] -> day1_choose_card

== sun_card
    ~ card_count += 1

- The Sun, XIX: 
  The old lady: This is a positive position of the sun, representing an active, full of life, and always friendly you that will reward you handsomely. # CLASS: oldLady

 * [Back] -> day1_choose_card

// keep track how many cards has already chose
== function card_cal(i) ==
// card count: {card_count}

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

- The old lady: It seems that you have already made a choice, and I have given you a revelation. I hope to see you next time, Jeff. # CLASS: oldLady
 
 * Leave the Psychiatric institution
    ** [Back Home] -> home




=== go_home ===
- Just as you was about to leave the clinic, I noticed that Ms. Jennifer seem left something on the couch.
 
 * [Check out]
 
- It looks like a pendant.
    ~ Pendant += 1 

 * [Open the pendant]
 
- Inside the pendant was a family portrait of an apparently lovely couple with their children, but the photo of the father has been peeled off.

* [Leave the clinic]
    ** [Back Home] -> home



=== home ===
- As you came home, you stretched and relaxed out on the sofa.

-  But after a time, you stood up and grabbed a book off the shelf.

 * [Open DSM-5]
 
- You opened the DSM-5, which lists several typical forms of mental disorders.

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
        You've completely lost control of yourself. Your left and right faces are distorted and utterly incorrect, your left face's eyes are insane, and your tongue is protruding out of your mouth. Your right face, on the other hand, is terribly depressed. The right eye appears to have recently sobbed, and the corner of the lips is fully down, obviously miserable.

    - Sanity > -10 && Sanity <= 0:
        Sanity : {Sanity} # CLASS: statusCheck
        Something is amiss with you today. Your eyes are visibly red, but you are thrilled, and the grin at the corner of your mouth is somewhat evil.

    - Sanity > 0 && Sanity <= 10:
        Sanity : {Sanity} # CLASS: statusCheck
        You appear fatigued today, with black bags under your eyes. You may need to take a break.

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

- * [Day 2]

- [Day 2]

- You returned to your clinic today, as normal. Along the way, several folks approached you and said hi. Everyone was pleasant, and the majority of them had already begun their recuperation process.

* [knock knock]

- The sudden knock on the door made me feel a little surprised. You remember that all the patients have come today, and no one should have an appointment.
-
* Come in. # CLASS: Jeff
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


- Jennifer: Hi Dr.Jeff, nice to see you, something brought me here, and want me to see you again, to let you know more about me. # CLASS: Jennifer

- You have no idea that she will come to see me again, but you have a bad feeling about her state. 
- Your hands start to sweat, you feel nervous, and you already put your hand on the button of the alarm. You are glad that you had the Anesthesia needle ready in advance and put it in your pocket, just in case.


- Jeff: Nice to see you, Ms. Jennifer, now let's start our routine inquiry. # CLASS: Jeff

 * Jeff: Did you dream about something last night? # CLASS: Jeff
     
- Jennifer: Last night, I had a dream that several of the chains on the man seemed to be broken, and he could stand up. What is the meaning behind it? I wonder know. # CLASS: Jennifer

- 
 * Jeff: Ms. Jennifer, seems this is a bad sign. I will give you some stronger medicines. You need to take 5 times today, one pill each time. # CLASS: Jeff
- Jennifer: Okay, thank you, Dr. Jeff. # CLASS: Jennifer

-
 * Jeff: What did you eat yesterday? # CLASS: Jeff
- Jennifer: I ate some raw meat yesterday, seemingly without realizing it. Ah, the taste, it was intoxicating. # CLASS: Jennifer

- 
 * Jeff: How do you feel now that you have this knife in your hand? # CLASS: Jeff

- You are trembled when you handed her the knife.

- Jennifer: What's the matter, and why are your hands shaking? Are you scared of me? # CLASS: Jennifer

    * Yes. # CLASS: Jeff
        ~ Evilness += 1
        ~ Sanity += 1
    * Nope, it's just that the room is a bit chilly. # CLASS: Jeff
        ~ Kindness += 1
        ~ Sanity -= 1
- 

- Every nerve in your body got tightened as she took over the knife. Your hand was already in the trouser pocket, clutching your anesthetic needle, ready to sedate her at any moment.

- Jennifer: This knife does not look to be very comfortable. It is considerably weaker to the one I previously used. # CLASS: Jennifer

* You're slightly relieved that she has no tendency to hurt anyone, but the chilly perspiration has soaked your back.

- Jeff: Ms. Jennifer, your current condition is critical. I will provide you with medication right now. # CLASS: Jeff

 * [The Hidden drawer] 
 
-  Found a strong medicine in a red bottle.

 * [Leave]
 
- Just as you were about to stand up, you felt your shoulders being held down, and you tried so hard to stand up, but didn't move. This is not a strength a woman can have.

- Jennifer: Tell me, Dr. Jeff, this drug won't kill me, will it? # CLASS: Jennifer

* Not at all, Ms. Jennifer. It's just a wonder drug. # CLASS: Jeff

- Jennifer: Ohh, really? Dr. Jeff, you better not deceive me, cause no one in this world can be able to afford the consequences, including you. # CLASS: Jennifer

-
    * Tell her the truth: The medicine here has significant adverse effects, and you may vomit after taking it, but the impact is excellent. # CLASS: Jeff
        ~ Sanity += 1
        ~ Kindness += 1
    * Lie: This medicine has no negative side effects. It is simply more potent. # CLASS: Jeff
        ~ Sanity -= 2
        ~ Evilness += 2
    
    
- Jennifer: Got it, thank you. Wish you have a great rest of your day! Hehe. # CLASS: Jennifer

- Then, Jennifer leaves the room.

- You slumped to the ground, and what had just happened seemed to suffocate me over and over again. You wanted to get out of here before she came back.
 It's time to leave the clinic. Where should you go next?

* [Park] ->Park
* [Commercial Center] -> check_visited_shop
* [Psychiatric institution] -> check_visited
* [Return home] -> day2_go_home

=== Park 
You left your clinic and went to a nearby park.
No matter what time it is here, it is so comfortable, and nice for you to relax your mind and body.
-
* [Looking for a bench]
- You found an empty bench at random and sat down, enjoying the sunshine.
~ Sanity += 3

* [It's getting late. And It's time to go home.] -> day2_home

=== day2_commercial_center
You return to the commercial center and enter the "Home of Soul" store.

- 
 *[Go into the store]
-

Old man: Welcome, dear visitor. You come to my store again! Please select two products from my store today. # CLASS: oldMan

* [Commercial List] -> commercial_list

=== check_visited
{ 
- visited_psy == false:
    ->day1_psychiatric_institution

- visited_psy == true && current_day == 2:
    ->day2_psychiatric_institution

- visited_psy == true && current_day == 4:
    ->day4_psy

}

=== check_visited_shop
{ 
- visited_shop == false:
    ->commercial

- visited_shop == true && current_day == 2:
    ->day2_commercial_center

- visited_shop == true && current_day == 4:
    ->day4_commercial

}

=== day2_psychiatric_institution
- You immediately left your clinic and went to the mental hospital. You needed to see the old lady. You needed her inspiration.
-
*[Building 44, Room 44]
-

- The old lady: Nice to see you again, young man, seems something bad happened to you. # CLASS: oldLady

- The old lady takes out the tarot cards.

- The old lady: I know what you want, young man, let's get to the point, come over here young man and we start divination immediately. # CLASS: oldLady


- There are three cards in front of you.

* [Choose a card] -> date_of_card

=== day2_card
* [Strength, VIII] -> Strength
* [Judgement, XX] -> Judgement
* [The Hermit, IX] -> Hermit

* [Not Choose] -> day2_card_finish

=== Strength 
~ card_count += 1

- Strength, VIII: 
- The old lady: This is a positive force. Meaning that tomorrow, something very bad may happen to you, but your inner courage will be very important. Only by facing your fears can things turn around. # CLASS: oldLady


*[Back] ->day2_card

=== Judgement
~ card_count += 1

- Judgement, XX: 
- The old lady: This approval looks very strange. Although it represents resurrection, in a sense, you will not die tomorrow, but in the future, it may be resurrected in another way. # CLASS: oldLady


*[Back] -> day2_card

=== Hermit
~ card_count += 1

- The Hermit, IX: 
- The old lady: This is a hermit in an upright position. He represents slow progress in the dark. From the orientation of this card, walking to the left may lead to a seemingly better place. # CLASS: oldLady

*[Back] -> day2_card

=== day2_card_finish
{card_cal(1)}
~ card_count = 0

- The old lady: It seems that you have already chosen and understood it. Remember, tomorrow will be a disaster for you. Be sure to remember the revelation of the tarot cards! # CLASS: oldLady

- Thank you, Ma'am. # CLASS: Jeff

- After that, you hurried home.

* [Home] -> day2_home

=== day2_go_home
- You decided to go home right away, and nothing occurred on the way.

~ Sanity += 1

* [Home] -> day2_home

=== day2_home

- When you get home, you immediately undress, head straight to the bathroom, turn on the shower, and turn the temperature down so that only cold water can temporarily calm your mind.

- You then gaze at yourself in the mirror. 

* [Sanity Check]

{sanity_check(1)}

-
 * [Leave the bathroom]
-

- You wander into the living room, desperate for some way to unwind.

* [Turn on the computer] 
     You powered on your computer, activated sbeam, and spent a long time playing RPG games. 
    ~ Sanity += 2

* [Read]
     You find an old yellow book named "Enjoy Life" and read it slowly. Seem learned something new.
    ~ Sanity += 1

* [Watch horror movie]
     You turn on the smart TV and quickly discovered a high-rated horror film on the Internet. Then, you turn off the light and start to watch it. After watching it, you felt even more uneasy.
    ~ Sanity -= 1

~ Sanity += 1
- Then you simply eat something for dinner and retire to bed. -> day3

/* ---------------- DAY 3 ------------------ */
==== day3 ====
    ~ current_day = 3
    
- *[Day 3]
- [Day 3]

- You awoke drowsily from your bed and struggled to get out of it. Today's condition isn't great, but your head is swollen like a balloon, it hurts somewhat, and your entire body is incredibly weak. It might have been somewhat due to the woman from yesterday, but you still have to go to the clinic today.

 * [Take a few bites of breakfast and head to work]
 
 - As usual, when you arrive at the clinic, you make yourself a cup of freshly brewed espresso. You're sitting on your chair, quietly staring at Newton's balance balls in front of you. Praying that patient does not appear today.

 * Tic-tac-tic-tac…

- You've met all of the patients by approximately two o'clock in the afternoon. Jennifer does not appear to be arriving today. Thinking about this makes me feel relieved, and you swiftly pack your belongings.

- Today, you don't want to go anywhere. You have a nagging feeling that something dreadful will happen, and all you want to do is get home as quickly as possible.

 * [Leave the clinic]
 
- On the way home, you constantly had the feeling that something was wrong. You was continuously aware of a chill behind your back as if someone was watching me.

 * [Walk faster]

- You quicken your footsteps, but the sound of footsteps behind you gradually grows louder and louder as it chases after me.

- You decide to go back and find out who the individual is! You come to a halt, turn around fast, and shout at the person who is following.

 * Who are you? Why are you following me! # CLASS: Jeff
 
- You only saw the other party wearing a scarlet raincoat and seeing the person clearly clutching a corroded kitchen knife in her hand.

- Meanwhile, the individual in the scarlet raincoat gradually removed his hat. A familiar face stood in front of you, but her eyes does not look the same as usual.

 * Jennifer! What are you doing here! # CLASS: Jeff
 
- She smiled contemptuously.

- Jennifer: What am I doing here? Of course, my Dear Doctor, I am here for you. # CLASS: bojue

- She raised her hand, clutching the rusty knife in her hand, and took a glance at it with a smile. She exuded a bloodthirsty vibe all over her.

- Jennifer: I've been waiting and preparing for so long to dismember you flawlessly!  # CLASS: bojue

 * [Run!]
 
- You run desperately, and the woman behind you does the same. You plead for help the entire route, but the road appears desolate. You quickly get your phone from your jacket pocket, but there is no signal around here.

 * You fled to a neighboring commercial center in a hurry.
 
- You flee to the nearest commercial center. However, the center was deserted, and all of the stores were shuttered. You knocked on every shop's door, but no one replied no matter how hard you banged.

- The woman behind you is drawing closer and closer. There are only two paths in front of you. Which one should you choose?

* [Go to the left] -> day3_left_route
* [Go to the right] -> day3_right_route

/* left */
=== day3_left_route

- You didn't give it much thought and dashed to the road on the left. This path leads to the second floor of the commercial center. 

- You reach the second floor, where practically all of the stores are closed.
  However, you discover that the entrance to a furniture store is still open, leaving you with only one option.
  
 * [Go to the bedding store]
 
- Jennifer: Stop running, you are running too fast, I can't catch up with you! # CLASS: bojue

- Jennifer: Uh Oh! I can see you. Now, you have nowhere to escape~ # CLASS: bojue

 * You entered the store, but there are not much places for you can hide. Where would you hide?
    
    - * [Hide under the bed] -> day3_under_bed
      * [Hide under the counter] -> day3_hide_under_counter
      * [Hide inside the bed] -> day3_inside_bed
 
/* under bed */    
== day3_under_bed
- You hastily hide under the bed. The suffocating atmosphere makes your every nerve full of vigilance. The sound of footsteps accompanied by the rapid beating of the heart is terrifying as if the scythe of the Thanatos had been placed on the neck, and it felt like the scythe would take away your life in the next second.

- * Jennifer: Where are you, Doctor? Ha, you want to play Peek-a-boo, right? Ho! You're not going to conceal yourself behind the quilt, aren't you? # CLASS: bojue

- Woosh. She stabbed the bed next to her fiercely as soon as she finished speaking.

- * Jennifer: Aha, how about the counter? You're hiding under the counter, aren't you? # CLASS: bojue

- When you hear her words, your heart stops and dread takes over. A scarlet raincoat came near, she stooped down, looking at you with an evilly smile.

- * Jennifer: What a pity! Where are you? Uh Ah~! That's only the last option left, Dr. Jeff!  You're under the bed!!! # CLASS: bojue

- A person emerged in front of you the following second. A face emerged in front of you after a time. You stare in astonishment at her desperate expression. You were shaking with terror, unable to move, and unable to control your heart's anxiety. You are yanked out of bed by a force.

- Jennifer's eyes sharpened and she grabbed you by the neck, forcing you against the wall and clutching a half-rusted knife. You struggle to get free, but her power is extraordinary, and she soon stops you.

- * Jeffiner: Hey, doctor, peek-a-boo is a lot of fun, but I'm bored of it, so it's time for execution! # CLASS: bojue

- You shut your eyes closed and refuse to face death. As the knife was about to penetrate your chest, the hand that was clutching your neck gradually loosen. You slowly opened your eyes and tried to breathe again and saw Jennifer clutching her head in her hands, as if in anguish.

- * Jennifer: Run! I'm not going to last long! # CLASS: Jennifer

- * Jennifer: It's you again, why are you obstructing me, you bastard, get off here! # CLASS: bojue

- * Jennifer: Run!!! # CLASS: Jennifer

- As you look at the woman in front of you seems to be in great pain! And you have no other choices. However, this is your only chance to run. What will you do?

 * [Run away] -> day3_run_away
 * [Stay with her, try to awaken a woman's main personality] -> day3_stay
 

/* under counter */
== day3_hide_under_counter
- You hastily duck under the counter. The suffocating atmosphere makes your every nerve full of vigilance. The sound of footsteps accompanied by the rapid beating of the heart is terrifying as if the scythe of the Thanatos had been placed on the neck, and it felt like the scythe would take away your life in the next second.

 * Jennifer: Where are you, Doctor? Ha, you want to play Peek-a-boo, right? Ho! You're not going to conceal yourself behind the quilt, aren't you? # CLASS: bojue
 
 - Woosh. She stabbed the bed next to her fiercely as soon as she finished speaking.

 * Jennifer: Ah, you won't hide under the bed, will you? # CLASS: bojue
 
- She didn't say anything else, but her silence worried you more. 

 * Jennifer: How come I can't find you anywhere, Doctor. # CLASS: bojue
 
- The phone fell to the ground unexpectedly. She seemed to have sensed sound and halted her footsteps.

 * Jennifer: Aha, here you are! # CLASS: bojue
 
- When you hear her words, your heart stops and dread takes over. A scarlet raincoat came near, she stooped down, looking at you with an evilly smile.
 
 * Jennifer: I found you, Doctor # CLASS: bojue
 
- Jennifer's eyes sharpened and she grabbed you by the neck, forcing you against the wall and clutching a half-rusted knife. You struggle to get free, but her power is extraordinary, and she soon stops you.

 * Jennifer: Hey, doctor, peek-a-boo is a lot of fun, but I'm bored of it, so it's time for execution! # CLASS: bojue
 
- You shut your eyes closed and refuse to face death. As the knife was about to penetrate your chest, the hand that was clutching your neck gradually loosen. You slowly opened your eyes and tried to breathe again and saw Jennifer clutching her head in her hands, as if in anguish.

 * Jennifer: Run! I'm not going to last long! # CLASS: Jennifer
 
- * Jennifer: It's you again, why are you obstructing me, you bastard, get off here! # CLASS: bojue

- * Jennifer: Run!!! # CLASS: Jennifer

- As you look at the woman in front of you seems to be in great pain! And you have no other choices. However, this is your only chance to run. What will you do?

 * [Run away] -> day3_run_away
 * [Stay with her, try to awaken a woman's main personality] -> day3_stay


/* inside bed */
== day3_inside_bed
- You choose to hide under the quilt on the bed. The suffocating atmosphere makes your every nerve full of vigilance. The sound of footsteps accompanied by the rapid beating of the heart is terrifying as if the scythe of the Thanatos had been placed on the neck, and it felt like the scythe would take away your life in the next second.

 * Jennifer: Where are you, Doctor? Ha, you want to play Peek-a-boo, right? Ho! you won't hide under the bed, will you?? # CLASS: bojue
 
- Jennifer: Ah, you aren't there, then where are you? # CLASS: bojue

 * Jennifer: Aha, how about the counter? You're hiding under the counter, aren' you? # CLASS: bojue

- * Jennifer: Aha! Not here either, then I know where you are, Dear Doctor!!!! # CLASS: bojue

- When you hear her words, your heart stops and dread takes over. The quilt on your body was pulled, and a scarlet raincoat stand right next to you. She starts to bend down, looking at you with an evilly smile.

 * Jennifer: Hello there, Dear Doctor. What a lovely spot to hide. # CLASS: bojue
 
- * Jennifer: Hey, Doctor, peek-a-boo is a lot of fun, but I'm bored of it, so it's time for execution! # CLASS: bojue

- You shut your eyes closed and refuse to face death. As the knife was about to penetrate your chest, the hand that was clutching your neck gradually loosen. You slowly opened your eyes and tried to breathe again and saw Jennifer clutching her head in her hands, as if in anguish.

 * Jennifer: Run! I'm not going to last long! # CLASS: Jennifer
 
- * Jennifer: It's you again, why are you obstructing me, you bastard, get off here! # CLASS: bojue

- * Jennifer: Run!!! # CLASS: Jennifer

- As you look at the woman in front of you seems to be in great pain! And you have no other choices. However, this is your only chance to run. What will you do?

 * [Run away] -> day3_run_away
 * [Stay with her, try to awaken a woman's main personality] -> day3_stay


/* run away OR stay */
== day3_run_away
    ~ Sanity -= 2
    ~ Evilness += 1
    
- You still opted to flee, leaving the lady wailing alone. You know you can't do anything but rush home and lock the door.

 *[Go Home] -> day3_back_home

== day3_stay
    ~ Sanity -= 1 
    ~ Kindness += 2

- You chose to stay and approached the woman carefully and softly. You had a firm grasp on her shoulders.

 * Jeff: I'm not leaving, Ms. Jennifer. Think of the most valuable person or object in your life! Don't allow 'he' take over you or your thinking! # CLASS: Jeff
 
 - Jennifer: Shut up! Dr.Jeff! You don't know anything! After I take control of this body, I will definitely not kill you easily this time. I will torment you slowly until you feel death is the real detachment! # CLASS: bojue
 
 - Jennifer:  My son! Justin, I miss him. He is in the orphanage, I haven't seen him this week, I miss him so much! Dr. Jeff, Justin is my most precious one. I can't let you, I can't let you take control of my body, not even a little bit, I want to see my Justin. # CLASS: Jennifer
 
 * Jeff: Jennifer! You can do it! Justin, he misses you too. Now hurry up and think about the best things between you and your son, and that is the only way to temporarily seal 'he'. # CLASS: Jeff
 
- Jennifer finally stopped screaming as the minutes passed, and she grew silent. She had successfully kept her under control for the time being.

- You gently put her to bed, watched her sleep peacefully, and then departed to go home.

 *[Go Home] -> day3_back_home

/* right */
=== day3_right_route
- After some consideration, you pick the right path.
  
  The path to the right leads to the commercial's center subterranean garage.
  
  You have a lot of options right now because there are so many cars in the basement garage. You may hide in numerous areas to try to avoid the chase.

 * [Pick a car and hide under it] -> day3_under_car
 * [Randomly pick a car and hide behind it] -> day3_behind_car
 * [Find a pillar and hide] -> day3_pillar
 
 
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
 
* It is time to go to bed.

- Achieve [Narrow Escape] # CLASS: chengjiu

- * [Day 4] -> day4






/* ---------------- DAY 4 ------------------ */
=== day4 ===
[Day 4]
~current_day = 4

{ Pendant == 1: 
    -> Orphanage
  -else:
    -> jennifer_house
}


=== Orphanage
- You awoke after a deep slumber with a buzzing sound in your ears and your eyes appear to be a bit confused about what is in front of you. The scenario from yesterday's chase is still playing in your head, making you feel terrified and apprehensive.

- Since you are not feeling well today, you called the clinic and asked for a day off to adjust your mood and recollect yourself.

- You clutched your forehead, a necklace loomed in your mind, as if Jennifer had left it on the sofa.

- You get out of bed, stroll over to the desk, and get Jennifer's jewelry from the drawer. You recalled that Jennifer mentioned yesterday that she has a son who is in an orphanage.

* [Investigation]

- You find Jennifer's profile on one of the shelves. You quickly flip through the profile and notice that the name of her child is Justin, and he is currently at the largest orphanage in this city, "Windows of Hope Orphanage".

- You choose to take a look into her child.

* [Windows of Hope Orphanage] -> inside_orphanage


=== inside_orphanage
- Since you have done a study and research with your team at Windows of Hope Orphanage, you have had a lot of communication with the orphanage director. So you contacted the orphanage director, who was eager to assist me in resolving the issue.

- Orphanage director: Hey, long time no see, Dr. Jeff, what brought you here? # CLASS: whoever

* Jeff: Long time no see. To be honest, I am looking for a kid called Justin, about 7 years old. He might be the child of one of my patients. I am here to see if there is any way to help my patient. May I see the child? # CLASS: Jeff

- Orphanage director: Justin? We have so many children with this name. Give me a second, I'll look into it, and I'll get back to you later. You may feel free to visit our orphanage on your own if you want. # CLASS: whoever

* [Visit]

- Where would you want to go now?

* [First Floor] ->first_floor_orphanage

* [Second Floor] ->second_floor_orphanage

=== first_floor_orphanage
- You choose to take a look at the first floor.
- You enter the first floor and have a look around. Right adjacent to the building, you discovered a restaurant, classrooms, an amusement park, and even a swimming pool.
- You recall searching for information on the orphanage on the Internet. As this orphanage was created with charitable funding by affluent individuals, many of the facilities inside are pretty well done, and there is even an emergency operating room on the first floor in case a kid gets an emergency illness unexpectedly.

* [Take a look around]

- You entered the cafeteria, went to the dining table, and looked at what the kids were eating today.

* [Cafeteria Menu]

- You take a closer look at the menu, which just has a few options:

- Sandwich, milk, and a peach.

- Pizza, apple juice, and salad.

- Cheese, orange juice, and salad.

* [Leave the cafeteria]

- After seeing practically everything on the first floor, you decide to visit the second floor.

* [Second Floor] ->second_floor_orphanage

=== second_floor_orphanage

- You came to the second floor.

- As you proceed down the long hallway, you notice the playroom, the lounge, and the dormitories. The second floor appears to be a play and relaxation area for youngsters.

- On the second floor, there are even rows of computers where kids may play games or study.

- As you're walking around on the second floor. A little girl appears in front of you and walks towards you.

* [Walk Forward]

- The girl looks at you with a little doubt.

- ???: Sir, I have never seen you before, who are you? # CLASS: ke

- You knelt down and looked at the little girl and responded with a smile.

* Jeff: Hi sweetie, I'm looking for a child, called Justin, do you know him? # CLASS: Jeff

- The little girl thought for a moment and replied. 

- ???: Justin? There are so many Justin here, I'm not sure which Justin you are looking for. By the way, my name is Katherine. # CLASS: ke

* Jeff: Nice to meet you, Katherine, I'm Jeff. # CLASS: Jeff

- Katherine: Nice to meet you, uncle Jeff. I have something for you! # CLASS: ke

- Katharine smiled as she pulled out candy from her pocket and handed it to you. 

* Jeff: Thank you, Katherine! # CLASS: Jeff
    ~Sanity += 1

- Katherine: You are welcome, Jeff. One of my friends told me that candy is the sign of our friendship, so now we are friends. # CLASS: ke

-
 * Jeff: Oh yeah! We are friends now~ # CLASS: Jeff
-

* You placed candy inside your pocket and patted Katherine's head.

- Katherine: Ohh, Jeff, I think the director is looking for you! # CLASS: ke

- Orphanage director: Ohh, Dr. Jeff, here you are with Katherine. I was looking for you. Here you go, I think he might be the child you that are looking for. He now is in the playroom, do you want me to take you to see him? # CLASS: whoever

-
 * Jeff: Oh, sure, thank you, sir. # CLASS: Jeff
-

-
 * Jeff: And see you later, Katherine. # CLASS: Jeff
-

- Katherine: See you later, Uncle Jeff. # CLASS: ke

* [Playroom] ->Playroom

=== Playroom
- You enter the playroom, which is crammed with toys and appears to be in disarray.

- You noticed a little boy playing with building blocks alone in a corner, while the other children seem to be isolating him.

- Orphanage director: Justin is the child in the corner. He's not an orphan. His mother left him at the door of the orphanage. His mother comes to see him once or twice a week. I'm not sure why I haven't been here this week. # CLASS: whoever

- Looking back on what happened this week, you can see why she didn't visit her son.

* Jeff: He looks lonely in the corner. # CLASS: Jeff

- Orphanage director: In fact, most of the children are fear to play with him because he appears to have a powerful aura, which makes most of us feel oppressed. # CLASS: whoever
 
- He shook his head and continued.

- Orphanage director: Once, a child was fighting with him for a toy. Justin was mad at that child and pushed the other child down without saying any word, and smashed the other's head with the toy he grabbed. When I got to the scene, Justin was already back in the corner with his toy, and he looked calm as if nothing had happened. Therefore, most of the children are very afraid to get close to Justin.  # CLASS: whoever

- You are nervous because you see Jennifer's shadow in Justin. Perhaps this is the reason that Jennifer chose to send Justin here as a way of protection.

- While you're thinking about the relationship between Justin and Jennifer, Katherine walks to Justin's corner and plays with Justin's blocks.

- Katherine took out candy from her pocket and put it right next to Justin.

- You're wondering if you should remind the orphanage director to keep an eye on Justin in order to prevent him from committing any other violent acts.

* Remind the director -> remind

* Keep Slient ->slient

=== remind
- Jeff: Sir, keep an eye on him when you have time. If he still has a violent problem, please call me immediately. I am his mother's attending physician, so please contact me! # CLASS: Jeff

- Orphanage director: Sure, no problem. # CLASS: whoever

* You take a second look at Justin before you leave, and hope Justin won't be influenced by his mother.
    ~Evilness += 3

- And just out of sight, there's a pair of eyes staring at you.

*[Leave Orphanage] -> day4_choose


=== slient

- You choose to keep silent, and you believe that his friendship or love from a friend can truly protect him.

* After a few words with the director, you left the orphanage.
    ~Kindness += 3

- And just out of sight, you felt that there were a pair of eyes staring at you.

*[Leave Orphanage] -> day4_choose


=== jennifer_house
- You awoke after a deep slumber with a buzzing sound in your ears and your eyes appear to be a bit confused about what is in front of you. The scenario from yesterday's chase is still playing in your head, making you feel terrified and apprehensive.

- Since you are not feeling well today, you called the clinic and asked for a day off to adjust your mood and recollect yourself.

- You decide to go to Jennifer's house to check if there are any clues about her, in the hopes of improving her health.

* [Jennifer's house]

- You arrive to Jennifer's house and knock on her door respectfully. You waited for a while and didn't receive a response.

- Then you softly twisted the doorknob and discovered that the door was not locked. Creak, the door was pushed open a little crack.

- Even if you are aware that entering another person's house is rude and disrespectful, especially when it comes to a patient's privacy. Your inner curiosity, on the other hand, draws you in since everything that happened this week frustrated you.


* [Enter the house] -> inside_house

=== inside_house
- Jennifer's house is not as messy as you expected, but it is a touch too neat, and the whole layout style is radically different from the aggressive Jennifer you remember from yesterday.

* [Checkout the kitchen] ->kitchen

* [Checkout the bathroom] ->bathroom

* [Second floor] ->jennifer_second_floor


=== kitchen 
- When you walk into the kitchen, you discover that everything is exceptionally clean and neat, with no indication of dust throughout.

    ~Sanity -= 1

->kitchen_list

=== kitchen_list
* [Open the fridge] ->fridge

* [Check the closet] ->closet

* [Check the teapot] ->teapot

* [Leave the kitchen] ->inside_house

=== fridge
- You pulled open the fridge. Inside, raw meat is precisely placed, and there are even a few frozen-to-death animals on the top rack. You shudder when you see this.

* [Back] ->kitchen_list

=== closet

- There was nothing in the closet other than a few perfectly arranged plates and glasses.

* [Back] ->kitchen_list

=== teapot

- In one corner, you see a peculiar circular ceramic teapot. You stepped over to the teapot, gently lifted it up, and shook it. It was empty. You opened the teapot and smelled a faint odor of blood rising from it.

* [Back] ->kitchen_list


=== bathroom
- You arrive at the toilet.
- The toilet is very clean, but there is something that makes you feel a slight sense of strangeness.

    ~Sanity -= 1

    ->bathroom_list

=== bathroom_list

* [Check the sink] -> jennifer_sink

* [Checkout the bathtub] ->jennifer_bathtub

* [Check the drawer] ->jennifer_drawer

* [Leave the bathroom] -> inside_house

=== jennifer_sink
- You see two toothbrushes, one red and one white, in the cup on the sink. But, as far as you know, Jennifer is living alone in the house so far. So, who is this other toothbrush, you're puzzled.

* [Back] ->bathroom_list

=== jennifer_bathtub
- There are two very distinct shampoos and body creams next to the tub, one for men and one for ladies.

* [Back] ->bathroom_list

=== jennifer_drawer
- There are several pairs of red gloves in the drawer. You instantly feel suffocated, and the scene of being hunted and slain the day before returns to your thoughts. That day, she appeared to be wearing red gloves.

* [Back] ->bathroom_list

=== jennifer_second_floor
- Second floor

- You move ahead to the second floor and enter the bedroom.

- The furnishings in the room make you shudder.

-The bedroom is completely separated into two halves, the left area has a red bed, and the left wall is also dyed red. However, you scalp was numb because there were many knife marks on the walls, and some new scratches were buried in the old scratches. It's similar to a great work of art that was created over a long time.

- However, the right space is totally white, with white walls, a white bed and comforter, and even white table and chairs, which contrasts sharply with the red area next to it. -> area_check


== area_check
* [Checkout the 'red' area] -> red_area
* [Checkout the 'white' area] -> white_area
* [Leave] -> leave_jennifer

=== red_area
    ~ Sanity -= 1
- You reach the red area and find a red journal on the ground.

* [Checkout the journal]



- Monday

- She went to the doctor today. Although she appeared normal, my chains were loosening, and I would soon be able to fully possess her body. I gradually regained all of the time and memories I had lost. # CLASS: bojue

* [Next Page]



- Tuesday

- The feeling of being able to control this body is great. I went to the doctor early in the morning, hahahaha, I was so excited to see the doctor's horrified expression and shaking hands. # CLASS: bojue

- What if the doctor is no longer alive, maybe I can completely occupy this body. # CLASS: bojue

- Rest in peace, Ms. Jennifer. # CLASS: bojue

- What belongs to me must be mine sooner or later. # CLASS: bojue

* [Next Page]



- Wednesday

- Damn it! The coward flee and didn't even get to murder him today. I wouldn't have let him go away if it hadn't been for that jerk! # CLASS: bojue

* [Next Page]

- The page is empty, it seems to be the end of the journal.

* [Close the journal] ->close_journal

=== white_area
- You enter the "white" area and find a pristine white journal on the desk.

* [Checkout the journal]



- Monday

- I saw the doctor Jeff today, and he said my condition is in remission. I'm pleased since it appears that I'll be able to get a nice night's sleep today. Oh, and don't forget to pay Justin a visit at the orphanage on Thursday. I haven't seen him in a week and I miss him very terribly. # CLASS: Jennifer

* [Next Page]



- Tuesday

- Today, I feel as if I've been in a trance, and my memory is on and off. The body is becoming increasingly out of control, and every time I wake up strangely, my body is throbbing and I appear to have been battered. This is not good. I will have to increase the dose somewhat. # CLASS: Jennifer

* [Next Page]



- Wednesday

- What did I do today? I awoke in an unusual location and injured my doctor with a knife. Oh my God, what have I done? My control over my body is eroding. I can't keep on like this. I have to stop him! # CLASS: Jennifer

* [Next Page]

- The page is empty, it seems to be the end of the journal.

* [Close the journal] ->close_journal


=== close_journal
    ~ Sanity -= 1
- Reading Jennifer's journal also reveals that she appears to struggle with bodily control.

+ [Leave the area] -> area_check

=== leave_jennifer
- You left Jennifer's room, and the clock struck twelve. It's time for me to depart. It will be hazardous if 'he' returns if you do not leave.

- And as you're leaving, you see what appears to be a basement door in Jennifer's backyard, but there's no time to investigate. You hurry away.

-> day4_choose


=== day4_choose
- It's noon, it's still early, do you want to go somewhere?

* [Park] ->day4_park

* [Commercial Center] -> check_visited_shop

* [Psychiatric institution] -> check_visited

* [Return Home] -> day4_return_home

=== day4_park
- You went to a nearby park.

- No matter what time it is here, it is so comfortable, and nice for you to relax your mind and body.

*[Looking for a bench]

- You found a quiet place at random, walked toward an empty bench, and sat down. You lean your back against the bench, feel the wind breeze through your figure tips and close your eyes enjoying the sunlight.

- Time passed quickly. The sky is painted a beautiful golden color. It seems to be dusk.

* [It's getting late. And it's time to go home.] ->day4_home

=== day4_commercial
    ~ commercial_max = 1

- You return to the commercial center and enter the "Home of Soul" store.

- Old man: Welcome, dear visitor. You are coming to my store again! Please select one product from my store today. # CLASS: oldMan

*[Begin] -> commercial_list

=== day4_psy
- You arrive at the psychiatric institution, you need to meet the old lady straight away, and you need her to reveal herself.

* [Building 44, Room 44]

- The old lady: Ah, young man, you seem to have barely survived, but the deadness within you is growing rapidly heavier and heavier, therefore let's start divination right now. # CLASS: oldLady

- There are three cards in front of you.

-> day4_card


=== day4_card

* [The Fool, 0] ->Fool

* [Death, XIII] ->Death

* [The Hanged Man, XII] -> Hanged_Man

* [Not choose] -> day4_card_finish


=== Fool
    ~ card_count += 1
- The Fool, 0:

- The old lady: This is The Fool. It marks the beginning or end of everything. You're going to meet someone who will drastically change your life. You have no choice except to confront him. # CLASS: oldLady

*[Back] ->day4_card

=== Death
    ~ card_count += 1
- Death, XIII:

- The old lady: This is a reversal, the death represents a silver lining in this reversal. Only kindness will keep you alive. If you chose evil, your journey to misery has just begun. # CLASS: oldLady

*[Back] ->day4_card

=== Hanged_Man
    ~ card_count += 1
- The Hanged Man, XII:

- Old lady: This is the Hanged Man, which represents the process of self-sacrifice. Perhaps sacrifice is the only way to survival. # CLASS: oldLady

*[Back] ->day4_card

=== day4_card_finish
    {card_cal(1)}
    ~ card_count = 0

- The old lady: It seems that you have already made a choice, and I have given you a revelation. I hope to see you next time, Jeff. # CLASS: oldLady

- Jeff: Thank you, Ma'am. # CLASS: Jeff

- After that, you hurried.

* [Home] -> day4_home

=== day4_return_home

- I decided to go home right away, and nothing occurred on the way.

    ~ Sanity += 1

->day4_home

=== day4_home

- You hurriedly ate something and went to the restroom as you got home.

* You then gaze at yourself in the mirror.

- * [Sanity Check]

    {sanity_check(1)}

- * [Leave the bathroom]

    ~ Sanity += 1

- *It is time to go to bed. -> day5


=== function sanity_check_ending(s) ===
{
    - Sanity <= -10:
        Sanity : {Sanity} # CLASS: statusCheck
        Even though you appear to be peaceful on the surface, your inner hunger for slaughter and blood has utterly deceived you. Even if you try to deny it, you are indeed the second Erebos the moment you pick up the butcher knife.

    - Sanity > -10 && Sanity <= 0:
        Sanity : {Sanity} # CLASS: statusCheck
        Although there is no difficulty on the outside, you are already on the verge of going insane on the inside.

    - Sanity > 0 && Sanity <= 20:
        Sanity : {Sanity} # CLASS: statusCheck
        You appear fatigued today, with black bags under your eyes. You may need to take a break.
        
    - Sanity > 20:
        Sanity : {Sanity} # CLASS: statusCheck
        Despite your outward demeanor, you are a very peaceful, spiritual, and cheerful person on the inside.
}


/* ---------------- DAY 5 ------------------ */
=== day5
- *[Day 5]
- [Day 5]

- Friday morning, you wake up feeling great and decide to go to work.

* [Go to work]

- You arrive at the clinic, you open the door and find a very delicate letter on your desk.

* [Checkout the letter] 

Dear Dr. Jeff, # CLASS: bojue

I heartily invited you to come to my homes. I also request that you arrive to my place on schedule at one o'clock in the afternoon. If you do not attend, I will surely "invite" you in person. # CLASS: bojue

Sincerely, # CLASS: bojue
Nicolas Erebos # CLASS: bojue

-
 * It's him. He was not about to let me go. # CLASS: Jeff
-

- You become increasingly restless as time passes and it is time to leave work. 

- You recheck the letter and can't believe it's happening to you.

-
 * "Cuckoo, cuckoo" 
-

-
 * It's time to get off work, and it's time to end it.
-

* [Jennifer's house] ->day5_jennifer

=== day5_jennifer

- You showed there on time at Jennifer's house. At this time, a woman dressed formally stood in front of the door, seemingly for a long time.

- Lord Erebos: Welcome, my dearest doctor. I've been anticipating this moment for quite some time. I've prepared a modest welcoming ceremony for you down below. Despite its simplicity, I hope you enjoy it. # CLASS: bojue

- Lord Erebos: Please follow me. # CLASS: bojue

* You follow him down to the basement. You could sense a faint aroma only a few steps away.

- Lord Erebos: This way please. Oh, I also made you a wonderful little gift. # CLASS: bojue

* [Continue following]

- This never-ending staircase perplexes you. Why is the underground space so vast and frightening? You have no idea why there is such a vast underground space. He appeared to read my mind the next second.

- Lord Erebos: You may be wondering why the subterranean is so vast. Allow me to tell you a story. # CLASS: bojue

- Lord Erebos: An ancestor lived here hundreds of years ago, buying all land in the area and establishing his own murder empire. This kingdom and intelligence network were built by a top assassination family over many years, but it didn't take long for the kingdom to suffer a major mishap. # CLASS: bojue

- Lord Erebos: An ancestor lived here hundreds of years ago, buying all land in the area and establishing his own murder empire. This kingdom and intelligence network were built by a top assassination family over many years, but it didn't take long for the kingdom to suffer a major mishap. # CLASS: bojue

- Lord Erebos: The daughter of a sheriff on the ground fell in love with the oldest son in the family. Love put him in a trance, and in order to protect himself, he revealed all the secrets from the ground to the sheriff, leading the family to be slaughtered overnight. Women, children, and the senior in family were not spared and were mutilated horrifically. # CLASS: bojue

* You noticed the hatred in his eyes when he said those words.

- Lord Erebos: The lone remaining enraged patriarch recognized the traitor and gave his life to the ancient gods, who cursed the family and ensured that they would never escape their fate. # CLASS: bojue

- Jeff: So you were created. # CLASS: Jeff

- He nodded.

* So how long have you been alive? # CLASS: Jeff

- Lord Erebos: Of course, I've been alive for 437 years. Whenever a member of this family dies, I am passed on to their next kid, and due to the curse, they will always have offspring. # CLASS: bojue

- Jeff: That doesn't make sense. # CLASS: Jeff

- Lord Erebos: That doesn't make sense? Indeed, my existence cannot be explained by common reason, just as if there is faith, if you believe in the presence of gods, it exists, and if you do not believe, it does not exist. # CLASS: bojue

 * Jeff: Then how come you wanted to murder me before? # CLASS: Jeff

- Lord Erebos: You had already endangered my life by then. But now you're a partner who can help me the most. # CLASS: bojue

- Jeff: Partner? Why partner? # CLASS: Jeff

- Lord Erebos: I'm aware of what you done in the past. Since you're a doctor, as long as you're there, I can manage this body and do anything I want. And as long as you're there, I won't even go to a psychiatric institution. # CLASS: bojue

- Lord Erebos: So, now that we've covered a lot of ground, let's look at the small gift I've prepared for you. # CLASS: bojue

* From his arms, he grabbed a pretty small mirror.

- Lord Erebos: This mirror is a small gift from me to you. Although it appears to be pointless, it can determine the shape of your heart. Come try it out. # CLASS: bojue

* [Take the mirror and take a look] 

    - {sanity_check_ending(1)}

* [Ending Check] -> ending_check

=== ending_check
- Sanity: {Sanity} # CLASS: statusCheck
- Evilness: {Evilness} # CLASS: statusCheck
- Kindness: {Kindness} # CLASS: statusCheck

{ 
    - Sanity >= 20 && Kindness >= 10:
        ->Sacrifices_ending
    
    - Sanity <= 0 && Sanity >= -10 && Evilness >= 2:
        ->join

    - Sanity < -10 && Evilness >= 5:  
        ->Substitution
        
    - else:
        -> Seal
}

=== Sacrifices_ending
- Lord Erebos: Hmph~ It appears that you are rather cheerful, but so what? Would you want to join my squad, doctor? As long as you are here, one act under cover while the other is in the open, then we will obtain all we desire. # CLASS: bojue

* [You noted that his right hand appeared to be pointing in a certain direction at this point. You sneaked a peek there and discovered a very hidden letter.]

- Jeff: I think I require some thought time. # CLASS: Jeff

* [You move towards that place as you speak, but you dare not go too fast.]

- Lord Erebos: No worries, my Dear Doctor. I'll give you 10 minutes, and because I've been talking for so long, please allow me to grab something to drink. By the way, don't even think of running away. The entire underground has been locked off, and you can't get out. # CLASS: bojue

* [Lord Erebos left]

- This is a fantastic chance for you. You rush over to the message.

* [Open the message]

- Doctor, This is Jennifer, and I've hidden this message here. The only way to get rid of him is described here, but it comes at a high price. Doctor, in order to completely free yourself of him, you must first gain his trust and enable his personality to infiltrate your body. I don't have a better solution for you right now, so I'll have to rely on your doctor. # CLASS: Jennifer

- Then there's a knife called "Paradise" beneath your feet. You need to use this knife to stab into your heart when he enters your body which can trapping him. He'll never live beyond his death in this knife! # CLASS: Jennifer

- I know the price is high, and you must exchange your life, but if you do not do so, you must find a way to wake me up and seal him. # CLASS: Jennifer

* You dig up the dirt beneath your feet and, indeed, conceal a pale knife.

- You gently place it in your pocket, and then it's time to make the decision!

* [Sacrifices] -> sacrifice

* [Not Sacrifices] -> not_sacrifice

=== sacrifice
- You have taken a quiet decision in your heart.

- At the same moment, Lord Erebos returned with a cup of tea in his hand.

- Lord Erebos: So what is the decision? # CLASS: bojue
 
- Jeff: I'd would like to join you, but there is one request. # CLASS: Jeff

- Lord Erebos: What request? # CLASS: bojue

-
 * You know what you're about to do next is going to be extremely hazardous, but you're willing to try. 
-

- Jeff: Lord Erebos, don't you think it's uncomfortable for you to be in this woman's body? You're plainly a male, but you have to share a woman's body. # CLASS: Jeff

- Lord Erebos: What do you mean? # CLASS: bojue

- Jeff: Why not you want to enter my body? I control it during the day, and you control it at night. So that we may genuinely become one is acting behind the scenes while the other is out in the open. # CLASS: Jeff

* When Lord Erebos heard what you said, he laughed.

- Lord Erebos: My dear doctor, you definitely match my hunger. I know you and I are the same! # CLASS: bojue

- Jeff: So, would you want to come in? # CLASS: Jeff

- Lord Erebos: Of course, I can't wait anymore, and you may begin whenever you're ready! # CLASS: bojue

- Jeff: I'm fully ready! # CLASS: Jeff

* [You witness Jennifer's body collapse instantly, and a foreign soul squeezes into your mind, giving you a searing headache, but you know, the opportunity is here!]

- You pulled the knife from your arms, the pale hue of a death scythe waiting to harvest life.

- You thrust the knife into your own heart, causing terrible agony, and the earl in your body realized this as well, roaring in pain.

- Lord Erebos: How dare you deceive me! I can, believe it or not, make your life worse than death! # CLASS: bojue

- Jeff: If only you could! # CLASS: Jeff

* [The knife in your hand emits a faint glow, and you can feel the alien spirit filling your head being drawn slowly into the knife.]

- He is no longer there, yet your life is passing you by.

- Drip, drip, drip. It's incredible because there's no blood flowing out of your wound, yet you can hear blood trickling to the ground. However, you can feel your eyelids closing and a grin forming at the corner of your mouth.

- Ah, it's over.

* [A year later]
- [A Year Later]

- A mother and a kid approached a gravestone.

- They were dressed in black and placed a bouquet of flowers in front of the gravestone, as if to say hello and farewell.

- Because of your sacrifice, the centuries-old curse has been lifted, and your soul is making its way to paradise.

- Step by step, you ascend the lengthy stairwell. Just as you were ready to enter paradise, a vortex erupted in front of your eyes, radiating a brilliant light and eventually engulfing you and you vanished.

- Achieve [Sacrifice] # CLASS: chengjiu

-> ending_chapter

// ->END

=== not_sacrifice

- You have taken a quiet decision in your heart.

- At the same moment, Lord Erebos returned with a cup of espresso in his hand.

- Lord Erebos: So what is the decision? # CLASS: bojue

- -> seal_soul


=== seal_soul

- Jeff: I refused! # CLASS: Jeff

- 
 * When he heard your refusal, the Lord Erebos paused for a time in his drinking. He then drank his drink and flung it to the ground.
-

- Lord Erebos: Refuse? Hahahhah, Then there is only one option for those who reject me is death! # CLASS: bojue

- 
 * You saw the him get a knife from his arms.
-

- Lord Erebos: Did you see the doctor? This knife is known as 'Hell'. # CLASS: bojue

- He looked at the knife, placed his finger in front of his lip, and struck a quiet posture.

- Lord Erebos: Shhh, pay attention, this knife is screaming all the time. There are over 100 individuals imprisoned here, each of which I killed personally, and you, doctor, will be the next! # CLASS: bojue

* When he finished speaking, he held it out toward your direction.

- It scrapes a lot of scars no matter how successfully you dodge.

- You know you have no chance of win, so the only thing you can do now is wake up Jennifer!

- Jeff: Jennifer! Don't allow this evil take control of your head! Consider your children! He still requires your assistance. He cannot survive without his mother! # CLASS: Jeff

 * [Inside Jennifer's mind] 

- Jennifer: Doctor, I think I heard what the doctor said. # CLASS: Jennifer

- Jennifer: My son, Justin, he needs me, I shouldn't be sunk in sleep any more, I have to wake up. # CLASS: Jennifer

- Achieve [Mother's Love] # CLASS: chengjiu

- * [Outside Jennifer's mind]

- Jeff: Wake up, Jennifer! # CLASS: Jeff

- Lord Erebos: Why are you still awake! I should have obliterated your existence! # CLASS: bojue

- Jennifer: Grab his knife right now! And pierce my body! # CLASS: Jennifer

- Lord Erebos: Don't even consider it! # CLASS: bojue

* When you saw Lord Erebos screaming on the ground, you grabbed the knife from his fingers and stabbed him and her body hard.

- Lord Erebos: Nooooooooo! # CLASS: bojue

* The soul in the knife flowed into this body, and all the souls within became chains, trapping the Lord Erebos in the depths of consciousness.

- You sank on the ground and drew a big breath after all of this. You had never witnessed such a fantastic spectacle before, but you did it.

- Jennifer passed out on the ground at this time, you found the key to the door on her body, and then carried her out of the basement.

- The warm sunlight fell on you and Jennifer the instant you opened the cellar door, like a heavenly light descending, extremely sacred.

* [A Year Later] 
- [A Year Later]

- You arrived at the clinic as usual. Jennifer's follow-up appointment is today. It's been a year since our previous visit.

- Many things happened this year, but you perfectly sealed him, and Jennifer was never controlled again, and she also brought back her kid since she was in good form.

- However, as soon as you go into the clinic, you see a note on your desk.

* [ Open the Letter ]

- This letter has just five words, yet it gives you the shivers.

- I miss you, Dear Doctor. # CLASS: bojue

- Achieve [Sealed] # CLASS: chengjiu

-> ending_chapter


=== Seal

- Lord Erebos: Oh, it appears that you haven't yet been fully eroded by madness, but it appears that you will be soon. So, do you want to come along with me? Doctor? # CLASS: bojue

-> seal_soul

=== join 
- Lord Erebos: It appears that the craziness is progressively disintegrating you, which is excellent, doctor. It demonstrates that you and I are a wonderful match! # CLASS: bojue

- Lord Erebos: So would you like to join me? # CLASS: bojue

- Jeff: What advantage I could get to be your partner? # CLASS: Jeff

* Your eyes are going wild. You don't care if Jennifer can be spared. All you want to do is follow your heart.

- Lord Erebos: Advantage! Of course there are advantages! As long as you join me, I can offer you whatever you desire, glory, fortune, women, power, and I can teach you our family's top assassination method, at least in this world. People do not survive more than 5 days. # CLASS: bojue

- Jeff: I have no enemies, but I am obsessed with money and beauty. # CLASS: Jeff

- Lord Erebos: You are free to obtain it whenever you want! Allow me to arrange the ceremony props. # CLASS: bojue

* With that, Lord Erebos went, but he returned after a while.

- You noticed that he was carrying five candles and a jug of crimson liquid.

- He moved gently to the circular platform, poured the liquid into an upside-down five-pointed star, and lighted the five candles in the five corners.

- Lord Erebos slowly walk toward you with two cups in his hands.

- He put a cup infront of you.

* [Pick up the cup]

- Lord Erebos: We shall conduct the exchange ritual under the careful eye of the devil now that the ceremony has begun. # CLASS: bojue

- He moved gently to the circular platform, poured the liquid into an upside-down five-pointed star, and lighted the five candles in the five corners.

- Lord Erebos: You must, like I did, slit your hand and allow the blood to run into my cup. # CLASS: bojue

* [Take over the knife]

- Lord Erebos: You must, like me, cut your palm and allow the blood to flow into my cup. # CLASS: bojue

- You swiped your palm over the table without hesitation. You frowned, but you did not cry out in agony. The glass quickly filled up.

- Lord Erebos: Then, when the ritual concludes, drink the blood that belongs to both of us, and the pact is accomplished. In the future, there will be no treachery between the two of us. Anyone who wishes to betray will be punished in hell. # CLASS: bojue

- You didn't say anything, but you drank the cup in one gulp. Your tongue was filled with a strong crimson stench, and the hint of sweetness made you feel a bit delectable.

* He also finished drinking in front of you.

- You instantly sensed a connection between your spirit and the count. You could sense it even if it wasn't very powerful.

- Lord Erebos: Then, let us alter the world and become true lords of it in the future! # CLASS: bojue

- You simply nodded without saying anything. You understand that your life has progressed to the point where you can no longer turn back.

 - Achieve [Dances With Wolves] # CLASS: chengjiu

-> ending_chapter

=== Substitution

- Lord Erebos: You appear to have gone utterly insane! You and I are identical! # CLASS: bojue

- Lord Erebos: So do you want to join me? # CLASS: bojue

- Jeff: What advantage I could get to be your partner? # CLASS: Jeff

* You are insane. You don't give a damn what happens to Jennifer, and you even have a plan in your head.

- Lord Erebos: Advantage! Of course there are advantages! As long as you join me, I can offer you whatever you desire, glory, fortune, women, power, and I can teach you our family's top assassination method, at least in this world. People do not survive more than 5 days. # CLASS: bojue

- Jeff: I have no enemies, but I am obsessed with money and beauty. # CLASS: Jeff

- Lord Erebos: You are free to obtain it whenever you want! Allow me to arrange the ceremony props. # CLASS: bojue

* With that, Lord Erebos went, but he returned after a while.

- You noticed he was carrying five candles and a jug of crimson liquid.

- He moved gently to the circular platform, poured the liquid into an upside-down five-pointed star, and lighted the five candles in the five corners.

- Lord Erebos slowly walk toward you with two cups in his hands.

- He put a cup infront of you.

* [Pick up the cup]

- Lord Erebos: We shall conduct the exchange ritual under the careful eye of the devil now that the ceremony has begun. # CLASS: bojue

- Lord Erebos removed the knife from his arms and sliced his hand, allowing the blood to gently drip into the cup you were holding. In no time, it becomes full.

- The knife is then handed to you.

- Take over the knife.

- Lord Erebos: You must, like I did, slit your hand and allow the blood to run into my cup. # CLASS: bojue

- You took the knife, but instead of swiping it towards your palm, you stabbed Lord Erebos. The knife penetrated the heart precisely.

- He looks at you in bewilderment, unable to comprehend what you're doing right now.

- Lord Erebos: Why? # CLASS: bojue

- Jeff: Why? The rationale is straightforward. It's too dull for me to be with you. It's better to let me take your place and become a new demon. Think about it, I'm a doctor by day and a devil at night, what a fantastic idea. # CLASS: Jeff

- Lord Erebos: Hmph, hum, hum, I honestly misjudged you, doctor. It was my negligence that placed it in your hands, but I won't die. I will be back at any moment as long as there is a possibility. # CLASS: bojue

* You have a creepy grin, but it's a really dismal smile.

- Jeff: Will you be back? Hahaha. No No. You will never get the opportunity. My dearest, Erebos. # CLASS: Jeff

- You slowly kneel on the ground and read the words towards the inverted pentagram that is in front of you.

- My dear demon, I will sacrifice this body and two souls of the sinner in front of me to you, and I hope to get a little attention from you, as long as you look at me, I will be satisfied! # CLASS: Jeff

- Your eyes are filled with lunacy at this point, and the magical circle in front of you is slowly glowing. Jennifer's body vanishes in front of you in a moment, and your head is filled with insane ravings.

* Y' admit ymg', shuggoth. s'uhn reached (I admit you, human. Contract reached.) # CLASS: emo

- When you heard the Crusoe response, your whole body trembled, and the yellow brains flowed out of your seven orifices. You know, you have obtained His approval.

- At this moment, your life is going in a completely different direction.

- Achieve [Heir] # CLASS: chengjiu


->ending_chapter

=== ending_chapter

- * [The End?]

- A yellow tentacle gently closed the book, wearing a yellow cloak and carrying a book and a pen, writing and sketching in the air.

- ???: This seems to be his end. Yet, it is not the ending I desire, therefore let him reincarnate. # CLASS: hasita

- ???: Hm? Who's there? Hm…a human? # CLASS: hasita

- ???: I didn't anticipate a human to dare to look at this deity, and while the bravery is sufficient, having a human sent to the door is not a terrible thing. Then you've been chosen as the protagonist of the next tale!! # CLASS: hasita

- THE END # CLASS: middle

->END
