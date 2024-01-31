import Unclassified from "../Collect/Unclassified";
import Folder from "../Collect/Folder";
import Recommendation from '../Collect/Recommendation'

@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  build() {
    Column() {
      Text('创建收藏夹').fontSize(20).margin({ top: 10, bottom: 10 })
      Text('写一个好听的名字吧').fontSize(15).margin({ top: 10, bottom: 10 }).fontColor(Color.Gray)
      TextInput()
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('取消')
          .onClick(() => {
            this.controller.close()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('确认')
          .onClick(() => {
            this.controller.close()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
      }.margin({ bottom: 10 })
    }
  }
}

@Entry
@Component
struct NavigationC {
  @State color1:any=Color.Black
  @State color2:any=Color.Blue
  @State selected:number=0
  dialogController: CustomDialogController = new CustomDialogController({
    //自定义弹窗内容构造器。
    builder: CustomDialogExample(),
    //点击遮障层退出时的回调。
    cancel: ()=>{console.log('点击了遮罩层')},
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
    Column() {
      Text('收藏')
        .fontColor('#182431')
        .fontSize(20)
        .lineHeight(40)
        .fontWeight(700)
    }
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height(50)
  }
  @Builder NavigationMenus() {
    Row() {
      Column(){
        Text('无分类').onClick(()=>{
          this.selected=0;
        })
      }.margin({right:20})
      Column(){
        Text('收藏夹').onClick(()=>{
          this.selected=1;
        })
      }.margin({right:20})
      Column(){
        Text('随机推荐').onClick(()=>{
          this.selected=2;
        }).margin({right:80})
      }
      Column() {
        Button('+').onClick((event: ClickEvent) => {
          //利用自定义控制器的open方法打开
          this.dialogController.open()
        }).fontSize(40).backgroundColor(0xffffff).fontColor(Color.Black)
      }
    }
    .width(360)
    .height(50)
    .offset({x:-180,y:40})
  }

  build(){
        Navigation(){
          if(this.selected==0){
            Unclassified();
          }else if(this.selected==1){
            Folder();
          }else {
            Recommendation();
          }
        }
        .width('100%')
        .height('100%')
        .title(this.NavigationTitle())
        .menus(this.NavigationMenus())
      }
}
export default  NavigationC