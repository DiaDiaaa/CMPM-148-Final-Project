VAR visited_psy = true
VAR Kindness = 0
VAR Evilness = 0
VAR Sanity = 0
VAR commercial_count = 0

LIST shop_item = scalpel, sheep, justice, painting, tentacle, tooth, writing, toy, disc

-> day_two

=== day_two ===

- I returned to my clinic today, as normal. Along the way, several folks approached me and said hi. Everyone was pleasant, and the majority of them had already begun their recuperation process.

* [knock knock]

- The sudden knock on the door made me feel a little surprised. I remember that all the patients have come today, and no one should have an appointment.
-
* "Come in"
-
- The patient from yesterday appeared in front of you again.

    * Hello, Ms. Jennifer, what happened? 
        ~ Kindness += 1
        ~ Sanity += 2
    
    * Hello, Ms. Jennifer, I recall that you didn't have an appointment today
        ~ Sanity += 1
    
    * What's the matter, Ms. Jennifer? Our next meeting is next week.
        ~ Evilness += 1
        ~ Sanity -= 1


- Jennifer: "Hi Dr.Jeff, nice to see you, something brought me here, and want me to see you again, to let you know more about me."

- I have no idea that she will come to see me again, but I have a bad feeling about her state. 
- My hands start to sweat, I feel nervous, and I already put my hand on the button of the alarm. I'm glad I had the Anesthesia needle ready in advance and put it in my pocket, just in case.


- Jeff: “Nice to see you, Ms.Jennifer, now let's start our routine inquiry.”

 * Jeff: "Did you dream about something last night?"
    
- Jennifer: "Last night, I had a dream that several of the chains on the man seemed to be broken, and he could stand up. What is the meaning behind it? I wonder know."

- 
 * Jeff: "Ms. Jennifer, seems this is a bad sign. I will give you some stronger medicines. You need to take 5 times today, one pill each time"
- Jennifer: Okay, thank you, Dr. Jeff.

-
 * Jeff: “What did you eat yesterday?”
- Jennifer: I ate some raw meat yesterday, seemingly without realizing it. Ah, the taste, it was intoxicating.

- 
 * Jeff: "How do you feel now that you have this knife in your hand?"

- I trembled as I handed her the knife.

    * Yes 
        ~ Evilness += 1
        ~ Sanity += 1
    * Nope, it's just that the room is a bit chilly. 
        ~ Kindness += 1
        ~ Sanity -= 1
-

- Every nerve in my body got tightened as she took over the knife. My hand was already in my trouser pocket, clutching my anesthetic needle, ready to sedate her at any moment.

- This knife does not look to be very comfortable. It is considerably weaker to the one I previously used.

* You're slightly relieved that she has no tendency to hurt anyone, but the chilly perspiration has soaked your back.

- Jeff: Ms. Jennifer, your current condition is critical; I will provide you with medication right now.
    * The Hidden drawer
        Found a strong medicine in a red bottle
    * Leave
        Just as you were about to stand up, you felt your shoulders being held down, and you tried so hard to stand up, but didn't move. This is not a strength a woman can have.
- Jennifer: Tell me, Dr. Jeff, this drug won't kill me, will it?

* "Not at all, Ms. Jennifer. It's just a wonder drug."

- Jennifer: “Ohh, really? Dr. Jeff, you better not deceive me, cause no one in this world can be able to afford the consequences, including you.”

-
    * Tell her the truth: The medicine here has significant adverse effects, and you may vomit after taking it, but the impact is excellent.
        ~ Sanity += 1
        ~ Kindness += 1
    * Lie: This medicine has no negative side effects; it is simply more potent.
        ~ Sanity -= 2
        ~ Evilness += 2
    
    
- Jennifer: “Got it, thank you. Wish you have a great rest of your day! Hehe”

- Then, Jennifer leaves the room.

- I slumped to the ground, and what had just happened seemed to suffocate me over and over again. I wanted to get out of here before she came back.
"It's time to leave the clinic; where should I go next?"

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

Old man: Welcome, dear visitor. Are you going to my store today? Please select two products from my store today. 

* [Begin] -> commercial_list

== commercial_list
 * {shop_item !? scalpel && commercial_count < 2} Blood Scalpel -> blood_scalpel
 * {shop_item !? sheep && commercial_count < 2} Adorable Little Sheep -> adorable_little_sheep
 * {shop_item !? justice && commercial_count < 2} A calligraphy that says ‘Justice -> a_calligraphy
 * {shop_item !? painting && commercial_count < 2} Distorted Paintings -> distorted_paintings
 * {shop_item !? tentacle && commercial_count < 2} Small Tentacle -> small_tentacle
 * {shop_item !? tooth && commercial_count < 2} An unknown animal's tooth -> animal_tooth
 * {shop_item !? writing && commercial_count < 2} A scroll containing nonsensical writing -> nonsensical_writing
 * {shop_item !? toy && commercial_count < 2} Superman Toy -> superman_toy
 * {shop_item !? disc && commercial_count < 2} 1998 Game Disc -> game_disc

*{ commercial_count == 2 } [Old man: “You appear to have decided to carry two items with you.”] -> close_commercial_list

== blood_scalpel
    ~ Evilness += 2
    ~ commercial_count += 1
    ~ shop_item += scalpel
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
    * Home ->day2_home

=== check_visited
{ - visited_psy == false:
    ->day1_psychiatric_institution
  - else:
    ->day2_psychiatric_institution
}

=== day1_psychiatric_institution
/* placeholder */
day 1
* [Home] -> day2_home
    
=== day2_psychiatric_institution
- I immediately left my clinic and went to the mental hospital. I needed to see the old lady. I needed her inspiration.
-
*[building 44, room 44]
-

- The old lady: “Nice to see you again, young man, seems something bad happened to you”

- The old lady takes out the tarot cards

- The old lady: “I know what you want, young man, let’s get to the point, Come over here young man and we start divination immediately.”


- There are three cards in front of you

* [Choose a card] -> day2_card

=== day2_card
* [Strength，VIII] -> Strength
* [Judgement，XX] -> Judgement
* [The Hermit，IX] -> Hermit

* [Not choose] -> day2_card_finish

=== Strength 
- You choose Strength, VIII
- The old lady: “This is a positive force. Meaning that tomorrow, something very bad may happen to you, but your inner courage will be very important. Only by facing your fears can things turn around.”

~ Sanity -= 1

*[Back] ->day2_card

=== Judgement
- You choose Judgement，XX
- The old lady: “This approval looks very strange. Although it represents resurrection, in a sense, you will not die tomorrow, but in the future, it may be resurrected in another way.”

~ Sanity -= 2

*[Back] -> day2_card

=== Hermit
- You choose The Hermit，IX
- The old lady: “This is a hermit in an upright position. He represents slow progress in the dark. From the orientation of this card, walking to the left may lead to a seemingly better place.”

~ Sanity -= 3

*[Back] -> day2_card

=== day2_card_finish
- The old lady: “It seems that you have already chosen and understood it. Remember, tomorrow will be a disaster for you. Be sure to remember the revelation of the tarot cards!”

- “Thank you, Ma’am”

- After that, you hurried home.

* [Home] -> day2_home

=== day2_go_home
- I decided to go home right away, and nothing occurred on the way.
~ Sanity += 1
* [Home] -> day2_home

=== function sanity_check() ===
{
    - Sanity <= -10:
        Sanity : {Sanity}
        You've completely lost control of yourself; your left and right faces are distorted and utterly incorrect, your left face's eyes are insane, and your tongue is protruding out of your mouth. Your right face, on the other hand, is terribly depressed. The right eye appears to have recently sobbed, and the corner of the lips is fully down, obviously miserable.

    - Sanity > -10 && Sanity <= 0:
        Sanity : {Sanity}
        Something is amiss with you today; your eyes are visibly red, but you are thrilled, and the grin at the corner of your mouth is somewhat evil.

    - Sanity > 0 && Sanity <= 10:
        Sanity : {Sanity}
        You appear fatigued today, with black bags under your eyes; you may need to take a break.

    - Sanity > 10 && Sanity <= 20:
        Sanity : {Sanity}
        You appeared more energetic today, and despite your beard, you are still fairly refreshing.
        
    - Sanity > 20:
        Sanity : {Sanity}
        You are quite confident today, you can handle anything, and you are very spiritual.
}


=== day2_home
- When you get home, you immediately undress, head straight to the bathroom, turn on the shower, and turn the temperature down so that only cold water can temporarily calm your mind.

- You then gaze at yourself in the mirror. 

* [Sanity Check]

{sanity_check()}

~ Sanity += 1
- * You cleaned up a bit, ate a quick meal, and went straight to bed. -> day3


=== day3
Placeholder
-> END
