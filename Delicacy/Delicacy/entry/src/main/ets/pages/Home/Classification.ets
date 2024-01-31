import router from '@ohos.router'
import  FoodList from '../Home/FoodList'
@Entry
@Component
struct Classification {
  @State data1:any=[
    { src: '/images/67.jpeg', name: '蛋糕1'},
    { src: '/images/67.jpeg', name: '蛋糕2'},
    { src: '/images/67.jpeg', name: '蛋糕3'},
    { src: '/images/67.jpeg', name: '蛋糕4'},
  ]
  @State data2: any[] = [
    { src: '/images/40.jpeg', name: '甜点1'},
    { src: '/images/40.jpeg', name: '甜点2'},
    { src: '/images/40.jpeg', name: '甜点3'},
    { src: '/images/40.jpeg', name: '甜点4'},
  ]

  @State data3: any[] = [
    { src: '/images/shucai1.webp', name: '蔬菜1'},
    { src: '/images/shucai1.webp', name: '蔬菜2'},
    { src: '/images/shucai1.webp', name: '蔬菜3'},
    { src: '/images/shucai1.webp', name: '蔬菜4'},
  ]
  @State data4: any[] = [
    { src: '/images/roushi.webp', name: '肉食1'},
    { src: '/images/roushi.webp', name: '肉食2'},
    { src: '/images/roushi.webp', name: '肉食3'},
    { src: '/images/roushi.webp', name: '肉食4'},
  ]
  @State data5: any[] = [
    { src: '/images/yinpin.jpg', name: '饮品1'},
    { src: '/images/yinpin.jpg', name: '饮品2'},
    { src: '/images/yinpin.jpg', name: '饮品3'},
    { src: '/images/yinpin.jpg', name: '饮品4'},
  ]
  @State data6: any[] = [
    { src: '/images/shuiguo.jpg', name: '水果1'},
    { src: '/images/shuiguo.jpg', name: '水果2'},
    { src: '/images/shuiguo.jpg', name: '水果3'},
    { src: '/images/shuiguo.jpg', name: '水果4'},
  ]
  @Builder NavigationTitle() {
     Row() {
       Image('/images/left.png')
         .width(30)
         .margin({left:-31})
         .onClick(()=>{
           router.back()
         })
       Text('分类')
        .fontColor(Color.Black)
        .fontSize(25)
        .lineHeight(40)
        .fontWeight(500)
        .margin({left:100})
    }.width('100%').alignItems(VerticalAlign.Bottom)
  }
  build() {
    Column() {
      NavDestination(){
      Column() {
        Tabs({ barPosition: BarPosition.Start }) {
          TabContent() {
            Row() {
              Column() {
                Flex({
                  direction: FlexDirection.Row, //横向排列
                  wrap: FlexWrap.Wrap, //换行
                }){
                ForEach(this.data1, (v) => {
                  FoodList(v)
                })
              }.height(600)
              }
              .width('100%')
            }
          }.tabBar('烘焙').backgroundColor(0xffffff)
          // tabBar(new BottomTabBarStyle($r('sys.media.ohos_app_icon'), '甜品'))
          TabContent() {
            Row() {
              Column() {
                Flex({
                  direction: FlexDirection.Row, //横向排列
                  wrap: FlexWrap.Wrap, //换行
                }){
                  ForEach(this.data2, (v) => {
                    FoodList(v)
                  })
                }.height(600)
              }
              .width('100%')
            }
          }.tabBar('甜品').backgroundColor(0xffffff)

          TabContent() {
            Row() {
              Column() {
                Flex({
                  direction: FlexDirection.Row, //横向排列
                  wrap: FlexWrap.Wrap, //换行
                }){
                  ForEach(this.data3, (v) => {
                    FoodList(v)
                  })
                }.height(600)
              }
              .width('100%')
            }
          }.tabBar('蔬菜').backgroundColor(0xffffff)
          TabContent() {
            Row() {
              Column() {
                Flex({
                  direction: FlexDirection.Row, //横向排列
                  wrap: FlexWrap.Wrap, //换行
                }){
                  ForEach(this.data4, (v) => {
                    FoodList(v)
                  })
                }.height(600)
              }
              .width('100%')
            }
          }.tabBar('肉蛋类').backgroundColor(0xffffff)
          TabContent() {
            Row() {
              Column() {
                Flex({
                  direction: FlexDirection.Row, //横向排列
                  wrap: FlexWrap.Wrap, //换行
                }){
                  ForEach(this.data5, (v) => {
                    FoodList(v)
                  })
                }.height(600)
              }
              .width('100%')
            }
          }.tabBar('饮料').backgroundColor(0xffffff)
          TabContent() {
            Row() {
              Column() {
                Flex({
                  direction: FlexDirection.Row, //横向排列
                  wrap: FlexWrap.Wrap, //换行
                }){
                  ForEach(this.data6, (v) => {
                    FoodList(v)
                  })
                }.height(600)
              }
              .width('100%')
            }
          }.tabBar( '水果').backgroundColor(0xffffff)
        }
        .vertical(true)
        .scrollable(true)
        .barMode(BarMode.Fixed)
        .onChange((index: number) => {
          console.info(index.toString())
        })
        .width('100%')
        .backgroundColor(0xF1F3F5)
        .barWidth(100)
      }.width('100%').height('100%')
    }.title(this.NavigationTitle())
  }
  }
}