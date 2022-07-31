To allow periodically scheduled tasks to produce even load on the system,the symbol `H` (for “hash”) should be used wherever possible.

For example, using `0 0 * * *` for a dozen daily jobs will cause a large spike at midnight.

In contrast, using `H H * * *` would still execute each job once a day,but not all at the same time, better using limited resources.



The `H` symbol can be used with a range. For example, `H H(0-7) * * *` means some time between 12:00 AM (midnight) to 7:59 AM.
You can also use step intervals with `H`, with or without ranges. The `H` symbol can be thought of as a random value over a range, but it actually is a hash of the job name, not a random function, so that the value remains stable for any given project.



Beware that for the day of month field, short cycles such as `*/3` or `H/3` will not work consistently near the end of most months, due to variable month lengths.

For example, `*/3` will run on the 1st, 4th, …31st days of a long month, then again the next day of the next month. Hashes are always chosen in the 1-28 range, so `H/3` will produce a gap between runs of between 3 and 6 days at the end of a month. (Longer cycles will also have inconsistent lengths but the effect may be relatively less noticeable.)



Empty lines and lines that start with `#` will be ignored as comments.

In addition, `@yearly`, `@annually`, `@monthly`, `@weekly`, `@daily`, `@midnight`, and `@hourly` are supported as convenient aliases.



These use the hash system for automatic balancing.



For example, `@hourly` is the same as `H * * * *` and could mean at any time during the hour. `@midnight` actually means some time between 12:00 AM and 2:59 AM.



**Examples:**

```properties
# Every fifteen minutes (perhaps at :07, :22, :37, :52):
H/15 * * * *
# Every ten minutes in the first half of every hour (three times, perhaps at :04, :14, :24):
H(0-29)/10 * * * *
# Once every two hours at 45 minutes past the hour starting at 9:45 AM and finishing at 3:45 PM every weekday:
45 9-16/2 * * 1-5
# Once in every two hour slot between 8 AM and 4 PM every weekday (perhaps at 9:38 AM, 11:38 AM, 1:38 PM, 3:38 PM):
H H(8-15)/2 * * 1-5
# Once a day on the 1st and 15th of every month except December:
H H 1,15 1-11 *
```