## Share Score

Your Share Score (or SS for short) is similar to ratio but is based solely on how good of a seeder you are, not how much data you upload and download. It is a score from 0-15, although with bonus points, it can go up to a score of 20 at max.

Your score is made up of 3 different statistics, each providing 5 points when at or above 100%:

- Seeding / Snatched % (100% = 1:1 ratio) - 2 extra points are possible if you go over 100% by cross-seeding or uploading
- Average Seedtime (100% = 5 months) - 2 extra points are possible if you go over 5 months
- Seeding Size (100% = 1TB) - 1 extra point is possible if you go over a 1TB seed size



Seeding stats are based on what you have been seeding over the past week, not just what you are currently seeding. This ensures your SS will not fluctuate wildly.

In the **Seeding / Snatched** formula, "snatched" is the number of **non-deleted unique snatches** (complete downloads) you have made (so if you snatch a torrent twice, it only counts once, and if it is then deleted, it's not counted at all). "Seeding" is the average number of torrents you've seeded over at least 72 hours in the past week. If you've seeded less than 72 hours in the past week, the "seeding" value will go down (which is bad).

**Average Seedtime** is calculated by taking the sum of seedtimes of all torrents that were downloaded over 1 week ago and dividing that by the count of those torrents. Do note that this includes deleted torrents as well.

Your Share Score can be seen in your profile and next to your ratio in the site-header. There is a link to a breakdown of your Share Score in your profile in the links section.

Your Share Score is used to calculate your required ratio. The higher your Share Score, the lower your required ratio will be. This means that if you are a long-term seeder, you will have low ratio requirements. If you are a short-term seeder, you will need to keep a larger ratio. For more information, see the Ratio Rules.



## Snatch

The following conditions need to be met for the site to consider a torrent snatched:



- The torrent is completed (the client has announced that 100% of the content is present).
- Any amount of data for that torrent has been downloaded from the tracker.
- It's not one of your own uploads.



The site will also automatically add any newly downloaded torrent files to the "Recent Snatches" section in your profile. This is only temporary and any torrents added that way will disappear after a short while if the snatch conditions aren't fulfilled.


For **achievement purposes** only, the following condition apply instead:



- The torrent is completed (the client has announced that 100% of the content is present).
- The torrent is seeded for at least 30 days in total.



## Ratio Rules



#### The Ratio System

Your ratio is the amount you've uploaded divided by the amount you've downloaded.

To maintain leeching privileges, we require that you maintain a ratio above a certain minimum we call **required ratio**. If your upload/download ratio goes below your required ratio, your account will be given a two-week period to improve your ratio before your leeching privileges are disabled. This state is called **ratio watch**.

The required ratio is not the extra amount of ratio you need to gain. It is the minimum ratio you must maintain.

#### Required Ratio Overview

Your required ratio is unique, and is calculated from your [Share Score](https://gazellegames.net/wiki.php?action=article&id=383). As such, it is influenced by how many torrents you are seeding, how large those torrents are, and for how long you have been seeding your torrents. The better these values, the lower your required ratio is.

Initially, your required ratio starts at 0 and rises to its intended value after downloading your first GBs. This gives you the opportunity to increase your Share Score before you have to manage the full required ratio. If you stop seeding temporarily and your Share Score falls, your required ratio will increase accordingly. When you start seeding again and your Share Score rises, your required ratio will go back down again.

It is not necessary to know how the exact ratio is calculated. What you need to know is that downloading makes the required ratio go up (bad) and seeding your snatches makes your required ratio go down (good). You can view your required ratio in the "Personal" tab of your profile, or when hovering over your ratio number. You want a high ratio, and a low required ratio.

#### Required Ratio Calculation

For curious users, the following outlines how the required ratio is calculated. First, the site determines the range your required ratio can fall into by checking how many GBs you've downloaded with the following table:

| Amount downloaded | Required ratio (0 SS) | Required ratio (5 SS) | Required ratio (12 SS) |
| ----------------- | --------------------- | --------------------- | ---------------------- |
| 0-10GB            | 0.00                  | 0.00                  | 0.00  Ratio Free!      |
| 10-25GB           | 0.15                  | 0.00                  |                        |
| 25-50GB           | 0.20                  | 0.00                  |                        |
| 50-75GB           | 0.30                  | 0.05                  |                        |
| 75-100GB          | 0.40                  | 0.10                  |                        |
| 100-140GB         | 0.50                  | 0.20                  |                        |
| 140-180GB         | 0.60                  | 0.30                  |                        |
| 180-220GB         | 0.60                  | 0.40                  |                        |
| 220-260GB         | 0.60                  | 0.50                  |                        |
| 260+GB            | 0.60                  | 0.60                  |                        |

So for example, if you've downloaded 60GB and your Share Score is below 5, your required ratio will be somewhere between 0.30 and 0.05. If your Share Score is above 5, your required ratio will be somewhere between 0.05 and 0.00. Take note how, as your download increases, the 0 SS and 5 SS required ratios begin to taper together. They meet at 260GB of download, meaning that after you've downloaded 260GB, your ratio requirement will always be 0.60 unless your Share Score is over 5.

To calculate the specific required ratio, we use a different formula depending on if your Share Score is less than or equal to 5, or whether it is more than 5.

If your Share Score is less than or equal to 5, we use the formula:

```
(1 - ShareScore / 5) * (SS0 Ratio * SS5 Ratio) + SS5 Ratio
```



If your Share Score is above 5, we use the formula:

```
(1 - (ShareScore - 5) / 7) * SS5 Ratio
```



SS0 Ratio is the ratio in the 2nd column of the above table and SS5 Ratio is the ratio in the 3rd column of the above table.

#### Ratio Watch

Everyone gets to download their first 5 GB before ratio watch eligibility begins. If you've downloaded more than 5 GB and your ratio does not meet or surpass your required ratio, you will be put on ratio watch and have two weeks to raise your ratio above your required ratio.

If you **download 10 GB while on ratio watch**, your leeching privileges will automatically be disabled. If you fail to leave ratio watch within a two week period, you will lose leeching privileges. After losing leeching privileges, you will be unable to download more data. Your account will remain enabled and you will still be able to seed.

**The ratio watch system is automated and cannot be interrupted by staff.**

#### Leaving Ratio Watch

To leave ratio watch, you must either raise your ratio by uploading more, or lower your required ratio by seeding more. Your ratio must be equal to or above your required ratio in order for ratio watch to end.

After losing leeching privileges, you must seed for a combined 72 hours within a week-long period. After 72 hours of seeding occur, the required ratio will update to reflect your current seeding total, just as it would for a leech-enabled user.

Leeching privileges will be restored once your ratio has become greater than or equal to your required ratio. This check happens once a day.

### Hit 'n' Runs

While they may have a playful name, Hit 'n' Runs are an important indicator of your behavior on the site. By behavior we mean your contribution to the long lifespan of our torrents, and your general attitude towards other members of the community.

You must seed every torrent you download for a minimum of 3 days and 8 hours (80 hours in total). Your seed time is detailed [here](https://gazellegames.net/torrents.php?type=viewseed). Note that the time recorded in your torrent history may not completely adhere to what your torrent client lists. If in doubt, use the time listed in your torrent history, not your client. You may accrue this seed time whenever you like: **The tracker will accommodate you turning your computer off overnight.** You should however try to seed this amount as soon as possible, as penalties may be enforced after some time has passed. Of course, we'd love for you to seed even longer! Additionally, you will receive [Gold](https://gazellegames.net/wiki.php?action=article&id=363#_1580599500) for seeding, and the longer you seed for, the more gold you will get.

Essentially, do not Hit 'n' Run (stop torrents the instant they are downloaded) and you will never have an issue.

Once you have [snatched](https://gazellegames.net/wiki.php?action=article&id=491) a torrent or downloaded 50% or more of the size of a torrent, it qualifies as a potential Hit 'n' Run. You must seed it for the required amount of time (80 hours) or it will be considered as a Hit 'n' Run. Leaving a torrent permanently when you are the only seeder or any other form of Hit 'n' Run will result in your Hit 'n' Runs count going up.

You may get rid of Hit 'n' Runs by seeding the offending torrents to the minimum seed time or by purchasing an [HNR Removal item](https://gazellegames.net/shop.php?ItemID=70) from the shop.

Users that are Elite Gamer or in a higher class will not receive Hit 'n' Runs and will not be put on Hit 'n' Run Watch. Torrents that are removed from the site and your own uploads are also not considered Hit 'n' Runs.

#### Hit 'n' Run Watch

If your Hit 'n' Run count goes up to 6, you are entered onto Hit 'n' Run Watch. You may not download any more torrents until you have purged them all. If you go on to download another torrent while you have the 6 Hit 'n' Run's to your name, your leeching privileges will be disabled.

The only way to restore your leeching privileges is to remove your Hit 'n' Runs, either by seeding or through the Hit 'n' Run removal item, or to send a staff PM with a valid and very good excuse.

### Upload Speed Limitations

Limiting your upload speed on the torrents to an unfair speed will result in a warning or permanent ban. This is calculated by your download speed and performed automatically.

