import router from '@ohos.router'
import CookBook from '../Collect/CookBook'
@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  build() {
    Column() {
      Text('编辑名称').fontSize(18).margin({ top: 10, bottom: 10 })
      Text('删除文件夹').fontSize(18).margin({ top: 10, bottom: 10 })
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
struct FolderInside {
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
    offset: { dx: 0, dy: -300 },
    //弹窗宽度占栅格宽度的个数
    gridCount: 4
  })

  @Builder NavigationTitle() {
    Row() {
      Image('/images/left.png').onClick(() => {
        router.back()
      }).width(30)
      Text('面条')
        .margin({left:130})
        .fontSize(20)
        .lineHeight(40)
        .fontWeight(700)
    }
    .width('100%')
    .height(50)
  }
  build() {
    Navigation(){
      //标题下面内容
      Column(){
        Row(){
          Text('面条(3)').fontSize(20)
          Blank()
          Button('编辑').onClick((event: ClickEvent) => {
            //利用自定义控制器的open方法打开
            this.dialogController.open()
          }).fontSize(20).backgroundColor(0xffffff).fontColor(Color.Black)

        }.width('100%').margin({bottom:10})
        //第一个食谱
        Row(){
          Column(){
            Image('/images/3.jpeg').width(100).height(100).borderRadius(10).onClick(()=>{
              router.pushUrl({
                url: 'pages/Collect/CookBook'
              })
            })
          }.margin(10)
          Column(){
            Row(){
              Text('新手必学阳春面')
            }.margin({bottom:25})
            Row(){
              Image('/images/78.png').width(20).border({radius:20})
              Text('跟我做饭不会饿').fontColor(Color.Gray).fontSize(10)
            }
          }
       }.justifyContent(FlexAlign.Start).width('100%')
        //第二个食谱
        Row(){
          Column(){
            Image('/images/34.jpg').width(100).height(100).borderRadius(10).onClick(()=>{
              router.pushUrl({
                url: 'pages/Collect/CookBook'
              })
            })
          }.margin(10)
          Column(){
            Row(){
              Text('好吃的重庆小面')
            }.margin({bottom:25})
            Row(){
              Image('/images/78.png').width(20).border({radius:20})
              Text('跟我做饭不会饿').fontColor(Color.Gray).fontSize(10)
            }
          }
        }.justifyContent(FlexAlign.Start).width('100%')
        //第三个食谱
        Row(){
          Column(){
            Image('/images/5.jpeg').width(100).height(100).borderRadius(10).onClick(()=>{
              router.pushUrl({
                url: 'pages/Collect/CookBook'
              })
            })
          }.margin(10)
          Column(){
            Row(){
              Text('豪华版兰州拉面')
            }.margin({bottom:25})
            Row(){
              Image('/images/78.png').width(20).border({radius:20})
              Text('跟我做饭不会饿').fontColor(Color.Gray).fontSize(10)
            }
          }
        }.justifyContent(FlexAlign.Start).width('100%')
      }
      .height('100%')
      .margin({top:-50})
    }
    .title(this.NavigationTitle())
    .height('100%')

  }
}
export default FolderInside;