import Video1 from '../pages/Video/Video1'
import Home from '../pages/Home/Home'
import NavigationC from '../pages/Collect/NavigationC'
import Page1 from '../pages/My/Page1'

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
struct Hindex {
  @State selected: number=0
  scroller: Scroller = new Scroller()
  @State bottomNavigation:any[]=[
    {image:'/images/home.png',text:'home'},
    {image:'/images/camera.png',text:'video'},
    {image:'/images/heart.png',text:'collect'},
    {image:'/images/user.png',text:'my'}
  ]

  @Builder NavigationToolbar() {
    Row() {
      ForEach(this.bottomNavigation,(v,i)=>{
        Column() {
          Image(v.image)
            .width(24)
            .height(24)
            .onClick((e)=>{
              this.selected=i
            }).width(28)
        }
      })
    }.justifyContent(FlexAlign.SpaceEvenly).width('100%')
  }
  build() {
    Navigation() {
      if (this.selected==0){
        Home()
      }else if(this.selected==1){
        Video1()
      }else if(this.selected==2){
        NavigationC()
      }else {
        Page1()
      }
    }.margin({top:0})
    // .title(this.NavigationTitle())
    .titleMode(NavigationTitleMode.Free)
    .toolBar(this.NavigationToolbar())
    .hideTitleBar(true)
  }
}


