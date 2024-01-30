@CustomDialog
struct CustomDialogExample {
  @State arr:any=[
    {text:'菜谱'},
    {text:'用户'},
    {text:'菜单'}
  ]
  controller: CustomDialogController
  build() {
    Column() {
      ForEach(this.arr, (e) =>{
        Text(e.text)
          .fontSize(20)
          .margin({ top: 18, bottom: 8})
          .onClick(() => {
            this.controller.close()
          })
          .backgroundColor(0xffffff)
          .fontColor(Color.Black)
      })
    }.width(70).height(150).backgroundColor(0xffffff)
  }
}


import router from '@ohos.router'
@Entry
@Component
struct Hindex {
  @State selected: number=0
  scroller: Scroller = new Scroller()
  @State arr: any[] = [
    { src: '/images/50.jpeg', name: '酱汁烤鸭', writer: '爱吃小丸子' ,image:'/images/touxiang.webp'},
    { src: '/images/niupai.jpg', name: '牛排', writer: '爱吃小丸子',image:'/images/touxiang.webp' },
    { src: '/images/24.jpeg', name: '下午茶', writer: '爱吃小丸子' ,image:'/images/touxiang.webp'},
    { src: '/images/lamian.webp', name: '拉面', writer: '爱吃小丸子' ,image:'/images/touxiang.webp'},
    { src: '/images/shali.jpg', name: '沙拉', writer: '爱吃小丸子' ,image:'/images/touxiang.webp'},
    { src: '/images/tangguo.webp', name: '菌汤锅', writer: '超级大力士',image:'/images/touxiang2.webp' },
    { src: '/images/pisa.webp', name: '披萨', writer: '超级大力士' ,image:'/images/touxiang2.webp'},
    { src: '/images/huoguo.webp', name: '中式火锅', writer: '超级大力士' ,image:'/images/touxiang2.webp'}
  ]
  dialogController: CustomDialogController = new CustomDialogController({
    //自定义弹窗内容构造器。
    builder: CustomDialogExample(),
    //点击遮障层退出时的回调。
    cancel: ()=>{console.log('点击了遮罩层')},
    //是否允许点击遮障层退出。默认值：true
    autoCancel: true,
    //弹窗在竖直方向上的对齐方式。
    alignment: DialogAlignment.TopEnd,
    //弹窗相对alignment所在位置的偏移量
    offset: { dx: -30, dy: 110 },
    //弹窗宽度占栅格宽度的个数
    gridCount: 1.5,
    customStyle:true
  })
  @Builder NavigationTitle() {
    Column(){
      Row() {
        Image('/images/left.png').height(30).width(30)
          .onClick(()=>{
            router.back()
          })
          .padding({left:10})
        Text('菜谱搜索').padding({top:10,bottom:0}).fontColor(Color.Black)
          .fontSize(23)
          .lineHeight(40)
          .fontWeight(500)
          .margin({left:85})
      }.width('100%').height(60).padding({left:10,right:10}).alignItems(VerticalAlign.Bottom)
      Row() {
        Search({ value: '', placeholder: '搜索美食' })
          .searchButton('搜索')
          .placeholderFont({ size: 15 })
          .textFont({ size: 20, weight: FontWeight.Bold })
          .textAlign(TextAlign.Start)
          .width('80%')
        Image('/images/more.png').height(35).width(35).onClick((event: ClickEvent) => {
          //利用自定义控制器的open方法打开
          this.dialogController.open()})
      }
    }.width('100%')
  }
  build() {
    Navigation() {
      Stack() {
        Scroll(this.scroller) {
          Row() {
            Column() {
              Flex({
                direction:FlexDirection.Row,//横向排列
                wrap:FlexWrap.Wrap,//换行
                //justifyContent:FlexAlign.SpaceAround
              }) {
                ForEach(this.arr, (e) => {
                  Column() {
                    Image(e.src).width(140).height(140).borderRadius(10)
                    Text(e.name).fontSize(30)
                    // Text(e.writer)
                    Row(){
                      Image(e.image).width(15).border({radius:20})
                      Text(e.writer).textAlign(TextAlign.End)
                    }
                  }.width('50%').height(200).justifyContent(FlexAlign.Center)
                })
              }.height(600)
            }.height(1000)
          }
        }
        .scrollable(ScrollDirection.Vertical)
        .scrollBar(BarState.Off)  // 滚动条常驻显示
        /* .scrollBarColor(Color.Gray)  // 滚动条颜色
         .scrollBarWidth(10) // 滚动条宽度*/
        .edgeEffect(EdgeEffect.None)
        .onScroll((xOffset: number, yOffset: number) => {
          console.info(xOffset + ' ' + yOffset)
        })
        .onScrollEdge((side: Edge) => {
          console.info('To the edge')
        })
      }.width('100%').height('100%')
    }.margin({top:0})
    .title(this.NavigationTitle())
    .titleMode(NavigationTitleMode.Free)
    .backgroundColor(0xffffff)
  }
}


