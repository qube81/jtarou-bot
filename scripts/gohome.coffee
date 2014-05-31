# Commands:

sprintf = require('sprintf').sprintf
schedule = {
   5 : [9, 23, 31, 37, 44, 51, 58],
   6 : [3, 8, 14, 19, 24, 29, 34, 39, 44, 49, 54, 59],
   7 : [4, 9, 12, 15, 19, 22, 25, 29, 32, 35, 39, 42, 45, 49, 52, 55, 59],
   8 : [2, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 49, 53, 58],
   9 : [2, 7, 12, 16, 20, 24, 28, 32, 37, 42, 47, 52, 56],
  10 : [1, 6, 11, 16, 21, 25, 30, 35, 40, 45, 50, 55, 59],
  11 : [4, 9, 15, 21, 27, 33, 39, 45, 51, 57],
  12 : [3, 9, 15, 21, 27, 33, 39, 45, 51, 57],
  13 : [3, 9, 15, 21, 27, 33, 39, 45, 51, 57],
  14 : [3, 9, 15, 21, 27, 33, 39, 45, 51, 57],
  15 : [3, 9, 15, 21, 27, 33, 39, 45, 51, 57],
  16 : [3, 9, 15, 21, 27, 33, 40, 45, 51, 56],
  17 : [1, 6, 11, 16, 21, 26, 31, 36, 41, 45, 49, 53, 57],
  18 : [1, 5, 9, 13, 17, 21, 25, 29, 33, 37, 41, 45, 59, 53, 57],
  19 : [1, 5, 9, 14, 19, 24, 29, 34, 40, 45, 50, 55],
  20 : [0, 5, 11, 17, 23, 29, 35, 41, 47, 53, 59],
  21 : [5, 11, 18, 25, 31, 38, 45, 51, 58],
  22 : [5, 12, 20, 27, 35, 42, 50, 58],
  23 : [6, 15, 23, 32, 40, 50],
  24 : [0, 7, 18]
}

d = new Date();
d.setTime(d.getTime() + 10*60*1000); # 10分後から
nowHour = if d.getHours() is 0 then 24 else d.getHours();
nowMinute =  d.getMinutes();

result = []

module.exports = (robot) ->

  robot.hear /帰りたい|かえりたい/i, (msg) ->
    
    break_flag = false; 
    for i, val of schedule
      if nowHour > i
        continue
      for j in val
        if nowHour is parseInt(i) and nowMinute > parseInt(j)
          continue
        result.push sprintf '%1$02s:%2$02s', i, j
      
     msg.send ["かえろう！いますぐかえろう！", "今から乗れそうな電車はこちら:train:（平日しか対応してないよ:curly_loop:）", result.slice(0, 5).join("\n")].join("\n")