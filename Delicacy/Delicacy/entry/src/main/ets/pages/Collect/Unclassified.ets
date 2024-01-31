import router from '@ohos.router'
@Entry
@Component
struct Unclassified {
  scroller: Scroller = new Scroller()
   list1:any[]=[
    {scr:"/images/1.jpg",text:"杏仁豆腐"},
    {scr:"/images/2.jpeg",text:"炸鱼薯条"},
    {scr:"/images/3.jpeg",text:"枫丹洋葱汤"},
    {scr:"/images/12.jpeg",text:"镀金锅"},
    {scr:"/images/59.jpeg",text:"枣椰蜜糖"},
    {scr:"/images/41.jpeg",text:"假日果酿"},
    {scr:"/images/51.jpeg",text:"啊如拌饭"},
    {scr:"/images/10.jpeg",text:"兽米香香"}
  ]
   list2:any[]=[
    {scr:"/images/57.jpeg",text:"蒙德土豆"},
    {scr:"/images/14.jpeg",text:"风神杂烩菜"},
    {scr:"/images/25.jpg",text:"堆高高"},
    {scr:"/images/36.png",text:"烤吃虎鱼"},
    {scr:"/images/38.jpeg",text:"中原杂碎"},
    {scr:"/images/67.jpeg",text:"来来菜"},
    {scr:"/images/49.jpeg",text:"渔人土司"},
    {scr:"/images/28.jpg",text:"蒙德烤鱼"}
  ]
  build() {
    Scroll(this.scroller){
      Row(){
        //左半
        Column(){
          ForEach(this.list1,(e)=>{
            Column(){
              Blank(10)
              Image(e.scr).height(180).borderRadius(10).width(150).onClick(()=>{
                router.pushUrl({
                  url: 'pages/Collect/CookBook'
                })
              })
              Blank(10)
              Text(e.text)
              Row(){
                Image('/images/78.png').width(15).border({radius:20})
                Blank(5)
                Text('跟我做饭不会饿').fontSize(10)
              }
              Blank(30)
            }
          })
        }
        .width('50%')
        //右半
        Column(){
          ForEach(this.list2,(e)=>{
            Column(){
              Blank(10)
              Image(e.scr).width(150).height(180).borderRadius(10).onClick(()=>{
                router.pushUrl({
                  url: 'pages/Collect/CookBook'
                })
              })
              Blank(10)
              Text(e.text)
              Row(){
                Image('/images/78.png').width(15).border({radius:20})
                Blank(5)
                Text('跟我做饭不会饿').fontSize(10)
              }
              Blank(30)
            }
          })
        }
        .width('50%')
      }
    }
    .width('100%')
    .height('100%')
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.On)  // 滚动条常驻显示
    .scrollBarColor(Color.Gray)  // 滚动条颜色
    .scrollBarWidth(5) // 滚动条宽度
  }
}
export default Unclassified;