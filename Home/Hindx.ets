import Demo2 from './Demo2'
import router from '@ohos.router'
import Home from './Home'
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
          /*Text(v.text)
            .fontColor('#007DFF')
            .fontSize(10)
            .lineHeight(14)
            .fontWeight(500)
            .margin({ top: 3 })*/
        }
      })
    }.justifyContent(FlexAlign.SpaceEvenly).width('100%')
  }
  build() {
    Navigation() {
      if (this.selected==0){
        Home()
      }else if(this.selected==1){
        Demo2()
      }else if(this.selected==2){
        Demo2()
      }else {
        Demo2()
      }
    }.margin({top:0})
    // .title(this.NavigationTitle())
    .titleMode(NavigationTitleMode.Free)
    .toolBar(this.NavigationToolbar())
    .hideTitleBar(true)
  }
}


