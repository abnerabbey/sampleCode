//
//  InfoViewController.m
//  Eventik
//
//  Created by Abner Castro Aguilar on 19/10/14.
//  Copyright (c) 2014 Abner. All rights reserved.
//

#import "InfoViewController.h"
#import "UIImageEffects.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textAyudaView.text = @"INFORMACIÓN\n\n¿Qué es Eventik?\nEventik es para los aventureros, para la gente que quiere divertirse en grande. Sal a la calle a disfrutar e inspírate con un evento en vivo. Estás a sólo 2 taps de una gran noche!\nCada día salimos a buscar las mejores fiestas y eventos en vivo que están sucediendo en la ciudad. Curamos y agregamos los mejores happenings en la Ciudad de México. Cada día damos el sello EVENTIK de aprobación a sólo unos lugares especiales.\n\n¿Cómo funciona?\nEventik promociona los mejores eventos en vivo que sucederán en el corto plazoy que aún tienen asientos disponibles, por lo general eso es 48 horas antes. Con la app puedes descrubir eventos, comprarlos de manera segura y tener tus tickets: todo directamente desde tu smartphone. Dado que son eventos únicos y que no podrás encontrar en cualquier lado, es importante estar atento a las promociones y deals especiales. En ocasiones, los boletos son VIP o sólo por invitación. Con eventik tu entrada está asegurada.\n\n¿Cómo compro un boleto para un evento?\nSelecciona el evento que te hace cosquillas o que más te interesa, estos los encontrarás directamente en el 'Search Page' de eventos. Compra el boleto seleccionando el número de entradas que quieres comprar (aquí puedes invitar a cuantos amigos quieras y enviarles un mensaje directamente). Si das 'Confirmar reserva' en la parte inferior (añade tus detalles de la tarjeta de crédito de manera segura) y confirma la compra. Eso es todo. Vas esa noche a tu evento sin necesidad de recoger boletos o perder tiempo en el tráfico.\n\n¿Existen cargos adicionales o que no veo?\nDe ninguna manera. Eventik NO oculta comisiones o cargos adicionales. Lo que ves es lo que obtienes y lo que pagas es final. Nunca pagues extra por obtener un ticket.\n\nEventik\nDurango 263. Col. Roma. CP. 065000\nMéxico DF\ninfo@eventik.info\nTel: 5521781115";
    
    //self.backgroundPicture.image = [UIImageEffects imageByApplyingDarkEffectToImage:self.backgroundPicture.image];
    self.backgroundPicture.image = [UIImageEffects imageByApplyingLightEffectToImage:self.backgroundPicture.image];
    //self.backgroundPicture.image = [UIImageEffects imageByApplyingExtraLightEffectToImage:self.backgroundPicture.image];
}

@end
