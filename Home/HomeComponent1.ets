@Entry
@Component
struct HomeComponent1 {
  private controller: SwiperController = new SwiperController()
  private intervalID = 0
  private mIndex = 0
  build(){
    Column() {
      Swiper(this.controller) { // 绑定翻页控制器
        Image('/images/xican.jpg').borderRadius(10)
        Image('/images/shali.jpg').borderRadius(10)
        Image('/images/tiandian.jpg').borderRadius(10)
      }
      .width('100%')
      .height('100%')
      .index(0) // 默认显示第一页
      .indicator(true) // 显示页面指示器
      .onChange((index) => {
        this.mIndex = index
        console.info("TAG：" + this.mIndex)
      })
    }
    .alignItems(HorizontalAlign.Center)
    .width('100%')
    .height('63%')
    .padding({ left: 2, right: 2, top: 10 })
  }

  private startPlay(swiper: SwiperController) {
    console.log("start execute...")
    this.intervalID = setInterval(function () {
      swiper.showNext();
    }, 3000)
  }

  private stopPlay() {
    clearInterval(this.intervalID)
    console.log("stop execute...")
  }

  aboutToAppear() {
    this.startPlay(this.controller)
  }

  aboutToDisappear() {
    this.stopPlay()
  }
}
export default HomeComponent1