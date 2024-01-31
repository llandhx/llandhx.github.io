import Video1 from '../Video/Video1'
import Home from '../Home/Home'
import NavigationC from '../Collect/NavigationC'
import Page1 from '../My/Page1'
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


