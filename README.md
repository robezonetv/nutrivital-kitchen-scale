## About The Project

I wanted to measure how much water/coffee/tea drink during online streaming on twitch.tv/robezonetv

I didn't find how possible to connect and gather values from scale, so I prepared this project.

## Known issue

Not implemented detection if number is negative or positive.

## Prerequisites

1. You need allow BLE communication on your system and have working Bluetooth.

## How To Use

1. Clone repository
2. Run command `bluetoothctl`
3. Run `scan on`
4. You need find MAC of your scale called like `ETA Vital`
5. Update `_MAC` variable in script `gather-data.sh`
6. Start as background daemon (or in screen/tmux) process `.gather-data.sh`
7. Check if in your directory if you have log file `scale.log`
8. You can run script `process-data.sh` and you will see live something like that:

```text
# ./process-data.sh
Weight 356 grams
Weight 853 grams
Weight 855 grams
Weight 857 grams
Weight 862 grams
Weight 862 grams
Weight 422 grams
Weight 423 grams
```

## Contact

robezonetv - [@robezonetv](https://robe.zone/)

## Support

<a href="https://www.buymeacoffee.com/robezonetv" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/purple_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
