import router from '@ohos.router';
import fetch from '@system.fetch';
import socket from '@ohos.net.socket';

@Entry
@Component

struct PortScan {

  private objetivo: string = router.getParams()['objetivo'] 
  private puertoI: string = router.getParams()['puertoI']    
  private puertoF: string = router.getParams()['puertoF']   
  private velocidad: number = router.getParams()['velocidad'] 
                                                              



  private tituloErrorIP: string = 'Error al resolver IP'
  private mensajeErrorIP: string = 'Hubo un error al resolver la IP del dominio, revisar sintaxis o si el dominio está activo'


  private rutaGUIScanner: string = 'pages/portScanner'

  backgroundColor: string = '#0d1321'
  textColor: string = '#f0ebd8'


  @State isLoading: boolean = false;
  @State ip: string = '' 
  @State puertosAbiertos: Array<number> = []  os


  reverseURL(){
    const that = this; 

    if (/[a-zA-Z]/.test(that.objetivo)) {

      fetch.fetch({

        url: `https://dns.google/resolve?name=${that.objetivo}&type=A`,


        method: 'GET', 
        responseType: 'json',
        success: function (response) { 
          try {
            let responseData; 
            if (typeof response.data === 'string') { 
              responseData = JSON.parse(response.data);
            } else {
              responseData = response.data; 
            }
            const ip = responseData.Answer?.[0]?.data; 

            if (ip) { 
              console.info(ip);
             that.ip = ip;
            } else {
              console.warn('No se encontró la IP en la respuesta'); 
            }
          } catch (error) {
            console.error('Error presentado:', error); 

          }
        },
        fail: function () { 
          console.error('Petición fallida');
        },
        complete: function () {
          console.info('Petición completada con éxito');
        },
      });
    } else {
      console.info('El objetivo ya es una dirección IP:', that.objetivo);
      
    }
  }

    const endPort = parseInt(this.puertoF);

      this.isLoading = true 
      let tcpSocket = socket.constructTCPSocketInstance(); 
      let bindPromise = tcpSocket.bind({address: '0.0.0.0', port: 0, family: 1}); 
      bindPromise.then(() => { 
        console.info('Bind exitoso') 
        let connectPromise = tcpSocket.connect({ address: {address: this.ip, port:port, family: 1} , timeout: this.velocidad*2500});
        connectPromise.then(()=>{
          console.info('Conexión exitosa'); 
          this.puertosAbiertos.push(port) 
          if (port === endPort) {  
            this.isLoading = false 
          }
        }).catch(err2 =>{ 
          console.error('Conexión rechazada'); 
          if (port === endPort) { 
            this.isLoading = false 
          }
        })
      }) .catch(bindError => { 
        console.error('Error en el bind') 
      })
      console.info('Escaneo completo') 
  }


  async escanearPuertos(){ 
    let puertoInicial = parseInt(this.puertoI); 
    const puertoFinal = parseInt(this.puertoF); 
    for (let port = puertoInicial; port <= puertoFinal; port++) { 
      await this.logicaEscaneo.call(this, port);
    }
  }


 onPageShow(){
   this.reverseURL()
   setTimeout(()=>{ 
     if (this.ip) { 
       console.info('La IP ha sido resuelta') 
       this.escanearPuertos() 
     }
     else { 

       AlertDialog.show({ 
         title: this.tituloErrorIP,
         message: this.mensajeErrorIP,
         autoCancel:false,
         alignment: DialogAlignment.Center,
         confirm: {
           value:'Volver',
           action: () => {
             router.push({ url: this.rutaGUIScanner }) 
           }
         }
       })
       console.error('La IP no se pudo resolver, el escaneo de puertos no será realizado')
     }
   },1000) 

 }

  
  build() {
    Column() {
         Text(`Objetivo: ${this.objetivo}`) 
           .fontSize(20)
           .margin(10)
           .fontColor(this.textColor)

         if (/[a-zA-Z]/.test(this.objetivo)) { 
           Text(`Dirección IP: ${this.ip}`)
             .fontSize(20)
             .margin(10)
             .fontColor(this.textColor)
         }

         Text(`Puerto Inicial: ${this.puertoI}`)
           .fontSize(20)
           .margin(10)
           .fontColor(this.textColor)

         Text(`Puerto Final: ${this.puertoF}`)
           .fontSize(20)
           .margin(10)
           .fontColor(this.textColor)

         Text(`Velocidad: ${this.velocidad}`)
           .fontSize(20)
           .margin(10)
           .fontColor(this.backgroundColor)

         Text(`Lista de puertos abiertos: ${[...this.puertosAbiertos].sort((a, b) => a - b).join(', ')}`) 
           .fontSize(20)
           .margin(5)
           .fontColor(this.textColor)

        if (this.isLoading){ 
          LoadingProgress() 
            .color(this.textColor) 
            .width('20%')
            .margin({bottom:'60%'})
        }
        else if (!this.isLoading && this.puertosAbiertos.length > 0){ 
          Text(`Escaneo Completo`)
            .fontSize(20)
            .margin(10)
            .fontColor(this.textColor)
        }
      Text(`Cantidad de puertos abiertos: ${this.puertosAbiertos.length} de ${(parseInt(this.puertoF)-parseInt(this.puertoI))+1} puertos escaneados`)
        .fontSize(20)
        .margin(10)
        .fontColor(this.textColor)
    }
    .height('100%')
    .width('100%')
    .backgroundColor(this.backgroundColor)
  }
}
