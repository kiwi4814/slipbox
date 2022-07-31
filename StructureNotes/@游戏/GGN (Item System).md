## How the GGn Items System Works



Table of Contents

1. [Overview](https://gazellegames.net/wiki.php?action=article&id=363#_712963159)
2. [Gold](https://gazellegames.net/wiki.php?action=article&id=363#_1580599500)
3. [Basic Items](https://gazellegames.net/wiki.php?action=article&id=363#_4001826820)
4. [Books](https://gazellegames.net/wiki.php?action=article&id=363#_1949655791)
5. [Packs](https://gazellegames.net/wiki.php?action=article&id=363#_1370051845)
6. [Equipment](https://gazellegames.net/wiki.php?action=article&id=363#_3213804081)
7. [Avatars](https://gazellegames.net/wiki.php?action=article&id=363#_3742429455)
8. [Buffs](https://gazellegames.net/wiki.php?action=article&id=363#_752416012)
9. [Item Requirements](https://gazellegames.net/wiki.php?action=article&id=363#_1914503145)
10. [Featured Items](https://gazellegames.net/wiki.php?action=article&id=363#_4320394)
11. [Crafting](https://gazellegames.net/wiki.php?action=article&id=363#_3456226844)
12. [Site & IRC Rewards](https://gazellegames.net/wiki.php?action=article&id=363#_2637324861)
13. [Want something else?](https://gazellegames.net/wiki.php?action=article&id=363#_3660763293)

- Protection:
  - Read: Amateur
  - Edit: VIP+
- Details:
  - Version: r12
  - Last edited by: [RurR](https://gazellegames.net/user.php?id=54590)
  - Last updated: 8 months, 1 week ago
- Aliases:
  - [gold](https://gazellegames.net/wiki.php?action=article&name=gold)
  - [howtheggnitemssystem...](https://gazellegames.net/wiki.php?action=article&name=howtheggnitemssystemworks)
  - [items](https://gazellegames.net/wiki.php?action=article&name=items)
  - [shop](https://gazellegames.net/wiki.php?action=article&name=shop)

As this system is brand new to most of you, you might be wondering what our new items system offers. This overview should help you understand the intent of this new system, as well as how it works.

![https://ptpimg.me/7r0v44.png](https://ptpimg.me/7r0v44.png)



### Overview


The new item's system is modeled off of your average bonus points system found on other sites but taken to a much further degree than most. The point of the system is to increase longevity of torrents and keep them seeded for longer. This is done by providing gold (equivalent to BP) to users for seeding torrents. The longer they seed a torrent, the more gold they get from it. Thus, it is beneficial to users to seed torrents for a long time as they will get more gold out of the system that way. In turn, torrents stay alive longer. With gold users can purchase items that can help them with going further on the site, maintaining their ratio, or simply for fun.

This is how an average BP system works, we use the same framework but take it quite a bit further. While most websites hard-code in 6 or 7 different items users can buy, we have a full items manager that makes it easy to create items with varying effects. In addition, the system is set up for creation of 4 different types of items. These include standard items with one-time effects or permissions, books, packs, and equipment. Due to the mass variety of options possible, 100's of items can be provided for users to purchase and more can be added easily. On top of this, high-level users can use the items manager to propose items adding a community-based aspect to the creation of items. Creating a large variety of items was very important in the creation of this system as where most BP systems fail is in good items for users to purchase. Additionally we wanted the system to have a game-like feel to it to match the theme of the site.

Just over 5 years of planning have gone into this system and over 5 months of heavy dev work so I hope you enjoy it!



### Gold


The main way to get gold is from seeding torrents, although you can also get gold from simply using the site (see site rewards below). Our gold system calculations are rather unique and intended to get users to long-term seed those torrents most likely to die. Every 15 minutes gold gain amounts are calculated on a per torrent basis. Gold is calculated based on 2 stats: Torrent Age and Torrent Size. In other words, bigger torrents provide more gold than smaller torrents and older torrents provide more gold than newer torrents. In addition, we have a multiplier for highly seeded torrents so that on popular torrents there is more of a pool. This amount of gold (including the popular torrent multiplier) is shown on every torrent next to the uploader.

![https://ptpimg.me/fa8eh8.jpg](https://ptpimg.me/fa8eh8.jpg)

The multipliers are as follows:
\> 10 Seeds = 1.5x
\> 20 Seeds = 2x
\> 30 Seeds = 2.5x
You will still likely get more from low seeded torrents, but this ensures that you will receive something from more popular ones. (Due to the way we split the pot, as is discussed next)

Next, the amount of gold provided by each torrent is divvied up between all active seeders based on seed-time percentages. The longer you have seeded that torrent for, the more gold you get from the gold pool it provides. That said, there are max percentages on how much a seeder can get from the pool to make it fair for new seeders joining into that pool to help seed. They are as follows:

Amount of users seeding = max percentage any 1 user can receive:
1 = 100%
2 = 85%
3 = 75%
4 = 60%
5 = 50%
6 and above = 40%

There are also minimum percentages to make sure you get no less than a certain threshold. They are as follows:

Amount of users seeding = minimum percentage any 1 user can receive:
3-5 = 5%
6+ = 2%

Additionally, seedtime for gold gain purposes is capped at 5 months. This ensures that new seeders will get a portion of gold right away and that with time, they can slowly catch up to the user or users that have the most seedtime.

![https://ptpimg.me/576043.jpg](https://ptpimg.me/576043.jpg)

On every users profile page the total gold gain per announce (15 minutes), hour, day, and more can be seen. On [torrent history](https://gazellegames.net/torrents.php?type=viewseed) pages you can view the exact amount of gold you are accruing on a per torrent basis. Of course, any non-active torrents will provide 0 gold.

![https://ptpimg.me/bk1382.png](https://ptpimg.me/bk1382.png)

In addition to gold gained from torrents, every user using [Two-Factor Authentication (2FA)](https://gazellegames.net/wiki.php?action=article&id=322) on GGn will gain an additional 12 gold per day. This is an incentive provided to try and boost the security of our users. This is not increased by Gold buffs. On the other hand, if you are warned, your total gold accrued will be cut in half until your warning expires.

**Example**: [Show](javascript:void(0);)

In short:

- Each torrent provides a pool of gold based on its age, size, and amount of seeders.
- Each pool is divided up between all seeders based on seedtime and you receive a percentage.
- Every 15 minutes gold is given out to all users.
- An extra 12 gold / day for all users using 2FA.
- Gold income is reduced by 50% if you are warned.





### Basic Items



![https://ptpimg.me/k6ss9c.png](https://ptpimg.me/k6ss9c.png)

Once users have accrued gold from seeding, they can buy items! To see what items are currently available, head to the [Items Shop](https://gazellegames.net/shop.php) (found in the navigation menu in place of the Top 10 - Top 10 has been renamed to Highscores and can be found next to your inbox). Here you will find a plethora of items with a wide-variety of effects. Once you buy one, head to your [Inventory](https://gazellegames.net/user.php?action=inventory) (found in the user navigation area next to the Upload link) to try them out! While there are many types of items, this section will focus on the standard items which will likely be the most familiar, and have the most effect on the site. The types of items will generally provide a one-time effect or a permanent permissions change. On use, these items will be removed from your inventory and the effect will be applied.

Note: Most items will cost gold but some may cost you upload GB's or even DL GB's.

![https://ptpimg.me/8amxmi.png](https://ptpimg.me/8amxmi.png)

Many of the standard items will provide a one-time effect, of which many can be seen in other BP systems from other sites. Examples include:

- Upload GB's
- Invites
- Custom Title
- Freeleech Token
- HNR Removal


This also includes less traditional effects such as changing your user profile's background, stickying a torrent or request for a certain number of days at the top of the torrent or request search page, featuring a game on your profile, adding special colors or glows to your username, or creating your very own IRC channel. The various possibilities are numerous.

Not only can these basic items provide one-time effects, but also site permissions (known from here on as attributes). These attributes give you abilities around the site such as top 10 access, posting in locked threads, forum signatures, or the ability to use larger images as your avatar (for gifs). As of writing this there are 17 different attributes available but more will be added with time.

Lastly, these basic items can also provide temporary buffs which is explained below.



### Books


Exactly what they sound like, books can be found scattered throughout the items shop, purchased, and read. While they can be used for GGn-lore and stories just like you'd find in a game of Skyrim, their primary purpose is for providing crafting recipes (explained further on). At first there likely will be few books in the shop but as the items system develops, expect to see lots more!

![https://ptpimg.me/16474u.png](https://ptpimg.me/16474u.png)



### Packs


You will likely find few packs in the items store as their main use is for contests and site rewards. That said, all users will receive a starter pack to assist them when they first join GGn. Packs provide multiple items, this can be a static set of items, or it can be a random set of items out of various choices. A simple pack for example may provide 10GBs of upload and 10 gold. A more complex pack could provide 10GBs of upload or a sword and body armor. An even more complex pack may provide 10GBs of upload or 2 FL tokens or a sword and body armor with a 1 in 2 chance at the gold and a 1 in 3 chance at the FL tokens and a 1 in 6 chance at the body armor and sword. This might sound complicated but all you really need to know is that when you open a pack you will receive multiple items and/or gold, sometimes this will be a known set of items and sometimes the pack will provide one of many options.



### Equipment



![https://ptpimg.me/cf852x.png](https://ptpimg.me/cf852x.png)

The other main item type is equipment. This is a unique feature specific to GGn that will hopefully add a major gamification feel to this system. Equipment can do 1 of 3 things:

- Provide attributes
- Provide buffs (explained further on)
- Modify your avatar (explained next)



Unlike the standard items described above, equipment can be equipped and unequipped in your inventory and only while equipped does that piece of equipment provide it's effects. For example, if you have a piece of body armor that allows you to view the top 10 page, you will only be able to view that page while that piece of equipment is equipped. Or if it provides a buff, that buff will be active while equipped and immediately turned off when you unequip the item.

For equipment, every user has 15 body slots they can equip these items into. For example, these slots include your Head, Upper body, Arms, Legs, etc. Each piece of equipment though will require a different slot, and some may even require multiple slots. If that slot is full, you cannot equip another item that requires that slot unless you unequip whatever is in this slot. This works exactly like any RPG you have played in the past so it should be fairly easy to understand even if this sounds complicated. To make this simpler we have designed a [drag-and-drop equipment system](https://gazellegames.net/user.php?action=equipment) (accessed via your inventory or the shop) that allows you to easily manage what you currently have equipped.

![https://ptpimg.me/lo6628.png](https://ptpimg.me/lo6628.png)

To ensure that powerful equipment cannot be used forever and get out of control, equipment can also have a certain lifetime. This can range from hours to days. While that item is equipped it's life will slowly be reduced and when it runs out, the item will break, and automatically be unequipped. At that point the item will not be equippable but will stay in your inventory as a broken piece of equipment. If there is a crafting recipe for it, that item may be fixable, if not, you can manually trash it.



### Avatars



![https://ptpimg.me/pkx55m.gif](https://ptpimg.me/pkx55m.gif)

One of the most fun and game-like parts of the items system are our new dynamic avatars. On signup you will be assigned a random body for your avatar. From there, as you gain and use equipment it will show up on your avatar. Every time you equip or unequip an item, your avatar will be regenerated dynamically based on whatever is currently equipped. Not all equipment will change your avatar but most will.

In addition to equipment, there are many standard items that provide varying effects on your avatar. These can include backgrounds, animations, or visual effects. Additionally, standard items can be used to modify the base body of your character and change it's face, hair, actual body, ears, etc.

With this system every user can have a unique and exciting avatar tied to the items system and show off their favorite items.

Note: By default your normal avatar will be shown. Go into your [user profile](https://gazellegames.net/user.php?action=edit) and you can change your avatar type to your player avatar which will allow you to show off your equipment.



### Buffs



![https://ptpimg.me/93yf8g.png](https://ptpimg.me/93yf8g.png)

Another unique feature to GGn is our buffs system. These effectively act as multipliers for various stats around the site. As of now there are 13 different buffs. These can act as upload or download multipliers (with download it would likely be a multiplier below 1), gold multipliers, or request bounty multipliers. The forum post and irc line multipliers can assist you in gaining achievements. Another can reduce the cost of items in the shop. There is even a chance buff that can help increase your chances at getting items and gold while using the site, to get more from those random drops, and to get better items from packs. Buffs may or may-not be stackable so check the items info if you plan on stacking.

The 2 methods for receiving buffs are through standard items which will provide a temporary effect for a certain number of hours or days that will automatically expire when the time is up, or through equipment, which will be applied as long as the item is equipped. You can see your active buffs and your current buff in each category on your profile. A link at the bottom will bring you to a page where you can view individual ones and manually expire any you do not wish to be active anymore.

For an in-depth description of each buff and how they work, see the [buffs wiki article](https://gazellegames.net/wiki.php?action=article&id=334).



### Item Requirements


Every item can have one or more of a plethora of requirements. Most basic items will have no requirements but for higher level items with bigger effects, you will want to check the requirements. The requirement could be a simple userclass level, or it could be more complex. For example, an item could require 500 forum posts and 10,000 irc lines. Or that your seeding size is over 100GB's. Or that you have made 100 torrent reviews. This is but a small sample of the over 30 possible requirements accepted by the system.

This allows certain item sets to be tuned to different users. Are you a forum buff? There can be an item set just for those active in the forums. Or maybe uploading's more your thing? An item set can have requirements for that. Or IRC? You get the idea. This allows items to be shaped and tuned to different users with different focuses and specialties, not only to hold items back for those who have been around longer.

Note: To view an item's requirements, in the shop click on the item's image or description to view the extended info which will list any requirements.



### Featured Items



![https://ptpimg.me/tu971d.jpg](https://ptpimg.me/tu971d.jpg)

While users can show off their equipment via avatars, we wanted another way for users to show off those items they are most excited about. In comes featured items. You can purchase featured slots through the items system, up to 8, and show off items on your user profile. This way you can show off all of your best items to the world!



### Crafting



To take this system even further we have added a crafting system to make it more RPG-like. The system works just like Minecraft's crafting system so hopefully it will feel familiar to most people. You simply drag and drop the correct items in, and out comes the resulting item! Drag that into your inventory and you're all set.

![https://ptpimg.me/cvj2zg.png](https://ptpimg.me/cvj2zg.png)

To find crafting recipes, check out the shop. There are books dedicated to various crafting recipes. At first there likely will not be many recipes but as time goes on, expect to see a lot more! Crafting for the most part will be used to create items and equipment out of random drops found while using the site, or to repair equipment.

There are also add-ons for the crafting system that may be required by certain crafting recipes. These include the enchanting ability, needed to enchant gems, and the smithing ability, required to forge metals and craft/repair armor. If you have either of these abilities it will be listed in the left-hand panel. Additionally, any time you use a recipe requiring one of these abilities, it will light-up to show it is in use. With time more abilities may be added.

![https://ptpimg.me/41u655.png](https://ptpimg.me/41u655.png)



### Site & IRC Rewards



![https://ptpimg.me/rl9383.jpg](https://ptpimg.me/rl9383.jpg) ![https://ptpimg.me/439a64.png](https://ptpimg.me/439a64.png)

While users can get gold through seeding, we also wanted to provide small rewards for using the site and IRC. As you explore and use the site you will get small rewards simply for your usage. This can be gold or it could be an item. Most of these items found will be materials for the crafting system but every now and then you may stumble upon a larger, more complete item. When you a receive a reward a popup will show in the bottom right hand side of your screen letting you know you got a reward and what you received.

In IRC, when you are talking there is a chance that you will come upon a random drop and start mining. This will happen without any intervention needed from you. Vertigo will announce that you have started mining and then tell the channel what you received for your efforts.



### Want something else?



So you're familiar with the items system and have found some pretty cool things, but it's not enough! There's this item you know would be awesome but it just doesn't exist yet. Well guess what? You can request or even possibly build your own items! To request a new item, head on over to the [requests thread](https://gazellegames.net/forums.php?action=viewthread&threadid=11305). But it gets even better... if you are an Elite Gamer+, you can make your own items! Simply go to the toolbox and head on over to the [Items Manager](https://gazellegames.net/tools.php?action=items). There you can build an item to your liking and create a 'build string'. Post this string into the [requests thread](https://gazellegames.net/forums.php?action=viewthread&threadid=11305) and staff will be able to load it into the items manager and review it. If we like it, we'll make it happen!

![https://ptpimg.me/z70je3.png](https://ptpimg.me/z70je3.png)
