import router from '@ohos.router';
@Entry 
@Component 
/* Colores:
 * Color de fondo: 0d1321
 * Color de letras: f0ebd8
 * Color de botones: 3e5c76
 * */

struct Index {

  
  message: string = 'Escáner Seis' 
  portScannerButtonMessage: string = 'Escanear Puertos'
  portScannerURL: string = 'pages/portScanner'
  hostDiscoverButtonMessage: string = 'Descubrir Hosts'
  hostDiscoverURL: string = 'pages/hostDiscover'
  vulnAnalizerButtonMessage: string = 'Analizar Vulnerabilidades'
  vulnAnalizerURL: string = 'pages/vulnAnalizer'
  reportGeneratorButtonMessage: string = 'Generar Reportes'
  reportGeneratorURL: string = 'pages/reportGenerator'
  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'
  buttonColor: string = '#3e5c76'
  buttonImagesBgColor: string = '#ffeddf'

  build() {

    Column(){    
      Row(){     
        Text(this.message)
          .fontSize(50) 
          .fontColor(this.textColor)
          .fontWeight(FontWeight.Bold)
      } .margin({top:'10%'}) 
      Grid(){ 

        
        GridItem(){   
          Button() { 
            Text(this.portScannerButtonMessage)
              .fontSize(25)
              .fontColor(this.textColor)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .padding('6%')  
              .maxLines(2)  
              .lineHeight(30)
          }
          .type(ButtonType.Capsule)
          .backgroundColor(this.buttonColor)
          .height('35%')
          .onClick(()=>{ 
            router.push({ url: this.portScannerURL })
          })
          } .height('50%')

  
        GridItem(){
          Button() { 
            Text(this.hostDiscoverButtonMessage)
              .fontSize(25)
              .fontColor(this.textColor)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .padding('6%')
              .maxLines(2)
              .lineHeight(30)
          }
          .type(ButtonType.Capsule) 
          .backgroundColor(this.buttonColor)
          .height('35%')
          .onClick(()=>{
            router.push({ url: this.hostDiscoverURL })
          })
        } .height('50%')

       
        GridItem(){
          Button() { 
            Text(this.vulnAnalizerButtonMessage)
              .fontSize(25)
              .fontColor(this.textColor)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .padding('6%')
              .maxLines(2)
              .lineHeight(30)
          }
          .type(ButtonType.Capsule) 
          .backgroundColor(this.buttonColor)
          .height('35%')
          .onClick(()=>{
            router.push({ url: this.vulnAnalizerURL })
          })
        }.height('80%')

   
        GridItem(){
          Button() { 
            Text(this.reportGeneratorButtonMessage)
              .fontSize(25)
              .fontColor(this.textColor)
              .fontWeight(FontWeight.Bold)
              .textAlign(TextAlign.Center)
              .padding('6%')
              .maxLines(2)
              .lineHeight(30)
          }
          .type(ButtonType.Capsule) 
          .backgroundColor(this.buttonColor)
          .height('35%')
          .onClick(()=>{
            router.push({ url: this.reportGeneratorURL })
          })
        } .height('50%')

        //Imágen de escaner de puertos
        GridItem(){
          Image($r('app.media.portScanner'))
            .width(120)
            .height(120)
        }
        .align(Alignment.Top) .height('100%')

        
        GridItem(){
          Image($r('app.media.hostAlive'))
            .width(120)
            .height(120)
        }
        .align(Alignment.Top) .height('100%')

        
        GridItem(){
          Image($r('app.media.vulnScan'))
            .width(120)
            .height(120)
        }
        .align(Alignment.Top) .height('100%')

    
        GridItem(){
          Image($r('app.media.reportGen'))
            .width(120)
            .height(120)
        }
        .align(Alignment.Top) .height('100%')
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')  
      .width('100%')    
      .height('80%')   
    }
    .width('100%') 
    .height('100%') 
    .backgroundColor(this.backgroundColor)
  }
}
