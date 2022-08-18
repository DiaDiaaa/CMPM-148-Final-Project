VAR Sanity = 10
VAR Kindness = 0
VAR Evilness = 0

VAR Pendant = 0

VAR commercial_count = 0
VAR card_count = 0


 * [Day 1] -> Day1

=== Day1 === 
[Day 1]
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

  Old man: Welcome to “Home of Soul”, what would you like to get? Young man.

 * Jeff: “What can I buy here?”

- Old man: Let me see, you can take two things from my shop today, the usage of which may change your destiny, but you will also pay something with a cost that you cannot see. Will you still be interested in purchasing it?

  The old man's words puzzled me; what does he mean by the cost that I cannot see? I don't understand and am stubbed, yet I choose to buy things nonetheless.

 * Jeff: "I would like to purchase some; what do you have for purchase?"

- Old man: Very well, young man, these are all things you may purchase. Choose two products that interest your curiosity.
 * Commercial List -> commercial_list
 
 
== commercial_list ==

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
    ~ Sanity -= 2 
- Old man: “You appear to have decided to carry two items with you.”
 
 I left the commercial center with the two items I had purchased, constantly feeling as though something had changed but not knowing what.

 * [Back Home] -> home
 
 
 
=== day1_psychiatric_institution ===
[Psychiatric institution]

- I left my clinic and proceeded to the city's largest psychiatric institution.

  I used to work here, but the environment was so dreary that I quit and decided to create my own clinic.

  For some reason, I felt like someone was guiding me here, and I came to this place again.

 * Walk into the Psychiatric institution
 
- The nurse at the front desk recognized me right away.
 
  Nurse: “Hi! Doctor Jeff, What brings you here?” 

 * Jeff: "Ohh, Hi! Nothing, I'm just looking around here. What have you been busy with recently? "

- Nurse: “You are just in time. Recently, we received an elderly lady. She babbles every day. And hope that you can talk to her.”

 * Jeff: "No problem. And where is she? "

- Nurse: “She's in building 44, room 44. Please, Doctor Jeff.”

 * Go to building 44, room 44.
 
- As I got closer and closer to the enigmatic woman, I could sense a suffocating atmosphere creeping up on me. I was standing in front of the door of Room 44, and the awful atmosphere had totally swallowed me up as if a pair of chilly hands had gripped my throat and taken my breath away.

 * Knock on the door
 
- Jeff: “Good afternoon, I am Dr. Jeff. May I come in?”

  As I thought, the whole room was separated by a glass wall, so I could have a very safe conversation with her.

 * Jeff: “Ma’am, How have you been?”

- The old lady: “Aha, what do I smell? It’s the smell of death.” 

  The old lady: “Young man, You're gonna die!”

 * Jeff: “I have met so many patients, many of them have said these words as you say, but most of them are just to intimidate me.”

- Jeff: “Ma’am, I wonder to know, why do you say I’m gonna die? And how do you know?“

  The old lady: “Reason? You should figure it out by yourself, young man.” 

  A villainous smile on her shriveled face
  
  The old lady: “Oh yeah, young man”

  She raised her arm and pointed at me.

  The old lady: “Jeff, right? Come over here! I have something good for you.”

  She holds a stack of poker and a grin spreads across her face

  The old lady: “I have a set of Tarot, maybe they will tell you the reason.”
  
 * "Playing games with mental patients that is not too much is also a good treatment for them"

- Jeff: “Yes, Ma’am. What‘s the rule?”

  The old lady chuckled.

  The old lady: “I will give you three cards, Jeff. And these three cards represent some revelation, and I'm going to give you some little revelations from the cards.”
  
 * Jeff: “Okay, Ma’am”

- The old lady: “And of course, every card you open has a price, so are you ready, young man? "

 * Yes, I’m good to go now.
 
- There are three cards in front of you
 
 * [Choose a card] -> day1_choose_card

== day1_choose_card ==
 
 * [The Star， XVII] -> star_card
 * [The Moon， XVIII] -> moon_card
 * [The Sun， XIX] -> sun_card
 * [Not choose] -> day1_card_not_choose


== star_card
    ~ card_count += 1 

- The Star， XVII: 
  The old lady: “This is a star in a positive position, which represents the hope hidden in the depths. Although it is not big, it may change your destiny. However, this star has dimmed, maybe, under you In a reincarnation, you should choose a way home"

 * [Back] -> day1_choose_card

== moon_card
    ~ card_count += 1 

- The Moon， XVIII: 
  The old lady: “This is a positive position Moon, representing restlessness, confusion, and deception. Your rudeness or lies in your language will give you a different fate.”
  
 * [Back] -> day1_choose_card

== sun_card
    ~ card_count += 1

- The Sun， XIX: 
  The old lady: “This is a positive position of the sun, representing an active, full of life, and always friendly you that will reward you handsomely.”

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

- The old lady: “It seems that you have already made a choice, and I have given you a revelation. I hope to see you next time, Jeff”
 
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

  But after a time, I stood up and grabbed a book off the shelf.

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

* Sanity Check -> day1_ending

=== function day1_sanity_check(s) ===
{
    - Sanity <= -10:
        : {Sanity}
        You've completely lost control of yourself; your left and right faces are distorted and utterly incorrect, your left face's eyes are insane, and your tongue is protruding out of your mouth. Your right face, on the other hand, is terribly depressed. The right eye appears to have recently sobbed, and the corner of the lips is fully down, obviously miserable.

    - Sanity > -10 && Sanity <= 0:
        : {Sanity}
        Something is amiss with you today; your eyes are visibly red, but you are thrilled, and the grin at the corner of your mouth is somewhat evil.

    - Sanity > 0 && Sanity <= 10:
        : {Sanity}
        You appear fatigued today, with black bags under your eyes; you may need to take a break.

    - Sanity > 10 && Sanity <= 20:
        : {Sanity}
        You appeared more energetic today, and despite your beard, you are still fairly refreshing.
        
    - Sanity > 20:
        : {Sanity}
        You are quite confident today, you can handle anything, and you are very spiritual.
}


=== day1_ending ==
{day1_sanity_check(1)}

~ Sanity += 1
- * You cleaned up a bit, ate a quick meal, and went straight to bed. -> day2



=== day2 ===
- [[for compile ending]]
    -> END
