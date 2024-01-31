import image from '@ohos.multimedia.image'
import router from '@ohos.router'
interface arr2Type{
  image:string,
  text1:string,
  text2:string,
  text3:string
}
@CustomDialog
struct CustomDialogExample {
  @State previewUri: Resource = $r('app.media.a')
  controller: CustomDialogController
  build() {
    Column() {
      Video({
        src:$rawfile('a.mp4'),
        previewUri: this.previewUri,
      }).height(360)
    }.width('80%').height('50%')
  }
}
@Entry
@Component
struct Video2 {
  @State arr1: {src:string}[] = [{ src: '/image/1.jpg' },
    { src: '/images/2.jpeg' },
    { src: '/images/3.jpeg' },
    { src: '/images/4.jpeg' }
  ]
  @State arr2: arr2Type[] = [{ image: '/images/touxiang5.webp', text1: '会做饭的西瓜', text2: '11-20', text3: '哇，看着好好吃的样子' },
    { image: '/images/touxiang5.webp', text1: '会做饭的西瓜', text2: '11-21', text3: '哇，看着好好吃的样子' },
    { image: '/images/touxiang4.webp', text1: '会做饭的西瓜', text2: '11-22', text3: '哇，看着好好吃的样子' },
    { image: '/images/touxiang3.jpg', text1: '会做饭的西瓜', text2: '11-23', text3: '哇，看着好好吃的样子' }
  ]
  private swiperController: SwiperController = new SwiperController()
  dialogController: CustomDialogController = new CustomDialogController({
    //自定义弹窗内容构造器。
    builder: CustomDialogExample(),
    //点击遮障层退出时的回调。
    cancel: () => {
      console.log('点击了遮罩层')
    },
    //是否允许点击遮障层退出。默认值：true
    autoCancel: true,
    //弹窗在竖直方向上的对齐方式。
    alignment: DialogAlignment.Bottom,
    //弹窗相对alignment所在位置的偏移量
    offset: { dx: -20, dy: -180 },
    //弹窗宽度占栅格宽度的个数
    gridCount: 4
  })
  build() {

    Column() {
      Row() {
        Column(){
          Text('课程详情')
            .fontSize(25)
            .textAlign(TextAlign.Center)
        }.margin({top:15,bottom:10})
        Column(){
          Image('/images/left.png').width(20).height(20).offset({x:-200}).onClick(() => {
            router.back()
          })
        }.margin({top:10})

      }

      Stack() {
        Column({ space: 5 }) {
          Swiper(this.swiperController) {
            ForEach(this.arr1, (v) => {
              Image(v.src).width(360).height(180)
            })
          }
          .cachedCount(2)
          .index(1)
          .autoPlay(true)
          .interval(4000)
          .indicator(true)
          .loop(true)
          .duration(3000)
          .itemSpace(0)
          .curve(Curve.Linear)

        }.width('100%')
        .margin({ top: 5 })
      }

      Row() {
        Text('独家经典配方：冰淇淋口感的巧克力千层蛋糕').fontSize(25)
      }.margin({top:15})

      Row() {
        Column() {
          Image('/images/touxiang5.webp').width(30).height(30).border({ radius: 15 }).offset({ x: -160 })
          Text('会做饭的西瓜').offset({ x: -80, y: -20 })
        }
        .width(150).margin({ top: 5, bottom: 5 })
      }

      Row() {
        Text('视频').fontSize(25).width('100%').padding({ left: 10 })
      }.margin({ top: 5, bottom: 10 })

      Row() {
        Image('/images/tubiao.jpg').width(30).height(30).border({ radius: 15 })
        Text('制作混合巧克力奶油')
      }.offset({ x: -80 }).onClick(() => {
        this.dialogController.open()
      })


      Row() {
        Text('课程评价').fontSize(25).offset({ x: -125 })
      }.margin({ top: 20, bottom: 10 })

      //评论区
      Row() {
        Text('大家评论(2)').fontSize(20).margin({ top: 10, right: 230, bottom: 20 })
      }

      Row() {
        Image('/images/touxiang4.webp').width(30).height(30).border({ radius: 15 }).offset({x:-15})
        TextInput({ placeholder: '留下你的精彩评论' }).width(260).offset({x:-15})
      }
      //第一条评论
      Row() {
        Column() {
          Image('/imaged/touxiang2.jpg').width(35).height(35).border({ radius: 15 }).offset({x:-15})
        }

        Column() {
          Text('日落果').fontColor(Color.Gray).offset({x:-15})
          Text('哇，看起来好好吃的样子~').offset({x:-15})
          Text('3小时前').fontColor(Color.Gray).offset({x:-15})
        }.alignItems(HorizontalAlign.Start).margin(10)

        Row() {
          //图标
          Image('/images/74.png').width(20).margin({ left: 10 })
          Text('520').fontColor(Color.Gray)
        }
      }
      //第二条评论
      Row() {
        Column() {
          Image('/images/touxiang3.jpg').width(35).height(35).border({ radius: 15 }).offset({x:-15})
        }

        Column() {
          Text('落落梅').fontColor(Color.Gray).offset({x:-15})
          Text('很简单嘛，简直易如反掌~').offset({x:-15})
          Text('刚刚').fontColor(Color.Gray).offset({x:-15})
        }.alignItems(HorizontalAlign.Start).margin(10)

        Row() {
          //点赞图标
          Image('/images/74.png').width(20).margin({ left: 10 })
          Text('130').fontColor(Color.Gray)
        }
      }
    }
  }
}