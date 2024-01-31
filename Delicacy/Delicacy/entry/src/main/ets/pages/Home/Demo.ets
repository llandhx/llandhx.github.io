@CustomDialog
struct CustomDialogExample {
  controller: CustomDialogController
  build() {
    Column() {
      Row(){
        Image('/images/yudingnianyefan.png').width(20).height(20).margin({right:5})
        Text('Delicacy 申请').fontSize(19)
      }.offset({x:-80,y:10}).height('10%')
      Text('获取你的用户信息').fontSize(20).margin({ top: 18,}).offset({x:-70,y:0}).fontWeight(600)
      Text('你的用户信息将会用于个人主页信息展示').fontSize(16).margin ({ top: 10, bottom: 70 ,left:-15}).fontWeight(300)
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('拒绝')
          .fontSize(25)
          .onClick(() => {
            this.controller.close()
          }).backgroundColor(0xffffff).fontColor(Color.Black)
        Button('接受')
          .fontSize(25)
          .onClick(() => {
            this.controller.close()
          }).backgroundColor(0xffffff).fontColor(Color.Red)
      }.margin({ bottom: 10 }).offset({x:0,y:-30})
    }.backgroundColor(0xffffff).offset({x:0,y:20})
  }
}

@Entry
@Component
struct Demo  {
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
    offset: { dx: 0, dy: -20 },
    //弹窗宽度占栅格宽度的个数
    gridCount: 4,
    customStyle:true
  })
  onPageShow(){
    this.dialogController.open()
  }
  build() {
    Column() {
    }
  }
}
export default CustomDialogExample