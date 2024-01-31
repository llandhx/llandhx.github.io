import TabsExample from '../My/Index'
import { WindowMode } from '@ohos.UiTest'
import router from '@ohos.router'

@Entry
@Component

struct Page1 {
    build() {
    Scroll() {
      Column() {
        Row() {
          Text('个人中心').textAlign(TextAlign.Center).fontSize(20).margin({ top: -7 })

        }.margin({ top: 20 })

        Row() {
          Column() {
            Row() {
              Column() {
                Image('/images/touxiang.webp')
                  .onClick(() => {
                    router.pushUrl({ url: 'pages/My/Bighead' })
                  })

                  .width(80)
                  .height(80)
                  .border({ radius: 50 })
                  .offset({ y: -21 })
              }

              Column() {
                Row() {
                  Text('小鸭子嘎嘎嘎')
                    .fontSize(18)
                    .textAlign(TextAlign.Start)
                    .offset({ x: -50, y: 4 })
                }

                Row() {
                  Text('女  2021年加入').fontSize(11)
                }.margin({ top: 8 })
                .offset({ x: -60 })
              }

              Column() {
                Image('/images/shezhi.png')
                  .onClick(() => {
                    router.pushUrl({ url: 'pages/My/shezhi' })
                  })
                  .width(23)
                  .height(23)
                  .offset({ y: 2 })
              }
            }
            .backgroundColor('rgba(100,150,0,0.1)')
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({ left: 30, right: 30 })
            .border({ radius: 12 })

          }
          .justifyContent(FlexAlign.SpaceEvenly)
        }

        .width('100%')
        .height(90)

        Row() {
          Column() {
            Row() {
              Text('关注')
            }

            Row() {
              Text('990').fontSize(10)
            }
          }.onClick(() => {
            router.pushUrl({ url: 'pages/My/guanzhu' })
          })

          Column() {
            Row() {
              Text('粉丝')
            }

            Row() {
              Text('1000').fontSize(10)
            }
          }.onClick(() => {
            router.pushUrl({ url: 'pages/My/guanzhu' })
          })

          Column() {
            Row() {
              Text('收到的赞')
            }

            Row() {
              Text('10000W+').fontSize(10)
            }
          }
          .onClick(() => {
            router.pushUrl({ url: 'pages/My/Zan' })
          })
        }
        .width('100%')
        .height(50)
        .border({ radius: 5 })
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({ left: 30, right: 30 })
        .backgroundColor('rgba(169,169,169,0.3)')
        .margin({ top: 18 })

        Row() {
          Column() {
            Image('/images/huangguan.png')
          }.height(20)
          .width(20)
          .offset({ x: -10, y: 1 })

          Column() {
            Text('恭喜你成功获得我们的vip会员！').fontSize(18).fontColor('#2f2f4f')
          }
        }
        .backgroundColor('#eaeaae')
        .offset({ y: 20 })
        .border({ radius: 5 })
        .width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({ left: 0 })
        .padding({ left: 20, right: 20 })

        TabsExample()
      }
      .height('100%')
    }
  }
}
export default Page1