import router from '@ohos.router'

//弹窗内容
@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  build() {
    Column() {
      Text('收藏到').fontSize(18).margin({ top: 10, bottom: 10 })
      Divider().strokeWidth(2).color(Color.Gray).opacity(0.3)
      Text('无分类').fontSize(18).margin({ top: 10, bottom: 10 })
      Text('面条').fontSize(18).margin({ top: 10, bottom: 10 })
      Text('蛋糕').fontSize(18).margin({ top: 10, bottom: 10 })
      Text('月饼').fontSize(18).margin({ top: 10, bottom: 10 })
      Divider().strokeWidth(2).color(Color.Gray).opacity(0.3)
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .onClick(() => {
            this.controller.close()
          }).backgroundColor(0xffffff).fontColor(Color.Black).fontSize(18)
      }.margin({ bottom: 10 })
    }
  }
}
@Entry
@Component


struct CookBook {
  //弹窗设置
  dialogController: CustomDialogController = new CustomDialogController({
    //自定义弹窗内容构造器。
    builder: CustomDialogExample(),
    //是否允许点击遮障层退出。默认值：true
    autoCancel: true,
    //弹窗在竖直方向上的对齐方式。
    alignment: DialogAlignment.Bottom,
    //弹窗相对alignment所在位置的偏移量
    offset: { dx: 0, dy: -100 },
    //弹窗宽度占栅格宽度的个数
    gridCount: 4
  })
  list3:any[]=[
    {src1:'肥牛卷',src2:'八卷'},
    {src1:'食用油 ',src2:'2勺'},
    {src1:'金针菇',src2:'适量'},
    {src1:'大蒜',src2:'3个'},
    {src1:'生抽 ',src2:'2勺'},
    {src1:'耗油 ',src2:'2勺'}
  ]
  scroller: Scroller = new Scroller()
  @Builder NavigationTitle() {
    Row() {
      Image('/images/left.png').onClick(() => {
        router.back()
      }).width(30)
      Text('食谱详情')
        .margin({left:100})
        .fontSize(20)
        .lineHeight(40)
        .fontWeight(700)
    }
    .width('100%')
    .height(50)
  }

  build() {
    Navigation() {
      Scroll(this.scroller) {
        Stack({ alignContent: Alignment.Top }) {
          Column() {
            //收藏图标
            Image('/images/shoucang.png')
              .width(50)
              .margin({ top: 30, left: 240 })
              .onClick((event: ClickEvent) => {
                //利用自定义控制器的open方法打开
                this.dialogController.open()
              })
          }.width('100%')
          .height('50%')
          .backgroundImage('/images/67.jpeg')
          .backgroundImageSize(ImageSize.Cover)

          Column() {
            Column() {
              Text('空气炸锅版烤面包，简单易做，快@你的闺蜜做起来~')
                .margin({ left: 20, right: 20, bottom: 10, top: 10 })
                .fontSize(21)
            }

            Row() {
              Image('/images/73.png').width(20)
              Blank(5)
              Text('时间')
              Blank(5)
              Text('约20~30分钟').fontColor(Color.Gray)
              Blank(30)
              Image('/images/75.png').width(20)
              Blank(5)
              Text('难度')
              Blank(5)
              Text('零厨艺').fontColor(Color.Gray)
            }

            Row() {
              Image('/images/74.png').width(19)
              Blank(5)
              Text('收藏')
              Blank(5)
              Text('520人').fontColor(Color.Gray)
            }.margin({ top: 5, right: 185 })

            Divider().strokeWidth(3).color(Color.Gray).opacity(0.3).margin(20)
            Row() {
              Text('用料').fontSize(22)
            }
            Column() {
              ForEach(this.list3, (e) => {
                Divider().strokeWidth(2).color(Color.Gray).opacity(0.3).margin(5)
                Row() {
                  Text(e.src1)
                  Blank(200)
                  Text(e.src2)
                }
              })
            }
            Divider().strokeWidth(3).color(Color.Gray).opacity(0.3).margin(5)
            Column(){
              Text('步骤1').fontSize(20).margin({top:10})
              Image('/images/58.jpeg').width(300).margin({top:10})
              Text('1.肥牛卷解冻，用料酒和披萨酱腌制15分钟;').margin({top:10})
              Text('2.卷饼软化后依次加入肥牛和杂菜，浇上烧烤酱，铺上芝士，卷好卷饼，包上锡纸')
              Text('步骤2').fontSize(20).margin({top:10})
              Image('/images/62.jpg').width(300).margin({top:10})
              Text('3.空气锅200度预热5分钟，放入牛肉卷，200度20分钟,好了就开吃吧').margin({top:10})
              Text('食谱创建于2024-1-29').fontSize(15).fontColor(Color.Gray).margin({top:10,right:200,bottom:20})
            }
            Divider().strokeWidth(3).color(Color.Gray).opacity(0.3).margin(5)
            //评论区
            Row(){
              Text('大家评论(2)').fontSize(20).margin({top:10,right:230,bottom:20})
            }
            Row(){
              Image('/images/78.png').width(40).border({radius:20})
              TextInput({ placeholder: '留下你的精彩评论' }).width(260)
            }
            //第一条评论
            Row(){
              Column(){
                Image('/images/76.jpg').width(40).border({radius:20})
              }
              Column(){
                Text('日落果').fontColor(Color.Gray)
                Text('哇，看起来好好吃的样子~')
                Text('3小时前').fontColor(Color.Gray)
              }.alignItems(HorizontalAlign.Start).margin(10)
              Row(){
                //点赞图标
                Image('/images/74.png').width(20).margin({left:10})
                Text('520').fontColor(Color.Gray)
              }
            }
            //第二条评论
            Row(){
              Column(){
                Image('/images/77.jpg').width(40).border({radius:20})
              }
              Column(){
                Text('落落梅').fontColor(Color.Gray)
                Text('很简单嘛，简直易如反掌~')
                Text('刚刚').fontColor(Color.Gray)
              }.alignItems(HorizontalAlign.Start).margin(10)
              Row(){
                //点赞图标
                Image('/images/74.png').width(20).margin({left:10})
                Text('130').fontColor(Color.Gray)
              }
            }
            Row(){
              Divider().strokeWidth(1).color(Color.Gray).opacity(0.3).width(80)
              Text('我也是有底线的').fontColor(Color.Gray)
              Divider().strokeWidth(1).color(Color.Gray).opacity(0.3).width(80)
            }.margin({top:20})
          }
          .margin({ top: 320 })
          .border({ width: 2 })
          .width('100%')
          .borderRadius(20)
          .backgroundColor(Color.White)
        }
      }
      .margin({top:-50})
      .width('100%')
      .height(720)
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(5) // 滚动条宽度
    }.title(this.NavigationTitle())
  }
}

export default CookBook;