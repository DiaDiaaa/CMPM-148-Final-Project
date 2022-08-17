VAR visited_psy = true
VAR Kindness = 0
VAR Evilness = 0
VAR Sanity = 0
VAR commercial_count = 0

LIST shop_item = scalpel, sheep, justice, painting, tentacle, tooth, writing, toy, disc

-> day_two

=== day_two ===

- 今天，又像往常一样，我又一次来到了我的诊所，今天的病人都非常的友好，大部分人都已经进入愈期。

* "knock knock"(敲门声）

- 突如其来的敲门声让我感到一丝诧异，我记得今天的病人都已经来了，应该没有人还有预约了。
-
*”请进“
-
-只见昨天的女病人又一次出现在了你的面前。

    * “您好，jennifer女士，发生了什么事么” 
        ~ Kindness += 1
        ~ Sanity += 2
    
    * "您好，jennifer女士，我记得今天的你没有预约才对"
        ~ Sanity += 1
    
    * “怎么回事，jennifer女士，我们下次见面是在下周”
        ~ Evilness += 1
        ~ Sanity -= 1


-Jennifer: 医生，又见面了，今天不知道为什么，又想来看看你，让你看看我的情况。

为什么这个女病人又来了，她今天的状态明显不对，我有些害怕，我悄悄的把抽屉里早已准备好的麻醉针放在裤袋里，以防万一。

- 医生：那么， Jennifer女士，那么就让我们开始我们的例行询问。

 * “最近几天晚上，有梦到些什么么”
    
- 昨天晚上，我梦到那个男人身上的锁链似乎断了几条，他已经能站起来了，医生，你说这是什么情况？

- 
 * "Jennifer女士，这是一个不好的sign, 一会我将会给你一些药效更强大的药物，你今天要服用5次才行，每次一粒"
- 好的医生。

-
 * ”昨天吃了些什么？”
- 昨天我似乎在无意识的状态下吃了些生肉，啊，那种味道，真是让人迷醉。

- 
 * ”现在，你握起我手里的这把刀，有什么感觉？”
- 我颤抖的将这把刀交给了她

- 怎么了，医生，你的手怎么在抖呀？你在害怕我么？

    * "是的" 
        ~ Evilness += 1
        ~ Sanity += 1
    * "没有，只是房间有点冷" 
        ~ Kindness += 1
        ~ Sanity -= 1
-

她接过刀，我很紧张，手已经伸到裤袋里，握着我的麻醉针，随时准备麻醉她。

医生，这把刀似乎不太顺手啊，和我之前用的比，差了好多。

* ”看到她没有攻击的倾向，你放心了下来，然而冷汗已经浸湿了你后背。”

- Jennifer女士，你现在的情况非常不好，我现在就给你去拿药。
    * “隐藏的抽屉”
        找到了，强效药被一个红色的瓶子装着
    * “离开”
        就在你准备起身的时候，你感觉到你的肩膀被人按住了，你非常用力的想站起来，但却一动不动，这完全不是一个女性所能拥有的力量。
- Jennifer: 医生啊，你说，这药，不会害死我吧。

* ”完全不会，jennifer女士，这是特效药“
Jennifer: 真的么？医生，你可不要骗我啊？骗我的话，后果，你可能负担不起呀。

-
    * (说实话）这里面的药有比较大的副作用，吃完后可能会呕吐，但是效果非常不错。
        ~ Sanity += 1
        ~ Kindness += 1
    * （说谎）这个药，一点副作用都没有，只是比较强效而已。
        ~ Sanity -= 2
        ~ Evilness += 2
    
    
- Jennifer：我知道了，医生，祝你有个美好的一天，嘻嘻

说完，jennifer便离开了。

我瘫坐在地上，刚刚所发生的事仿佛让我死了一遍，我得赶紧离开这里，以防她再次回来。

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
* [Home] ->day2_home

/*
* "It's getting late. And It's time to go home" -> day2_home
*/

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
I immediately left my clinic and went to the mental hospital. I needed to see the old lady. I needed her inspiration.
-
*[building 44, room 44]
-

The old lady: “Nice to see you again, young man, seems something bad happened to you”

The old lady takes out the tarot cards

The old lady: “I know what you want, young man, let’s get to the point, Come over here young man and we start divination immediately.”


“There are three cards in front of you”

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
