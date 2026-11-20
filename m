Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795160883;
	b=I7oMEqwpPoy6kKhHxnFWbrhW9xvISRiXULnH0gIamibWXueNz7qAFU+d15kVDf4Cwa8U
	 0eHSFBTm74zISwJsdVI3FZ6+5cstNJ8Jp/Kd7ik/+KB9Kzfjx0jNrahoka981uIqoMDmQ
	 j0MQ84qUd+YPbu2YtvfjKZQJZV92DgV8ANtgBaEmf0tgft+pkgyi2GtC0vCAetuRX6D3D
	 cVyNvdwiUTSyW4I4kaIZQhZBEk2G0MNNE1KXZrxehpCxvWL73n0+uIOayzSXrgF3GVD0x
	 VUbULgvbwxDtFGCC79GFV5vqvowVhxC0PtrDu0vVeQ+uKffBTnt40RzHmtvPeGRekrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160883;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=MA8q72j1INZzj7hEMnlN/HNwqNMAQTutZorSUYtW5Ww=;
	b=iF5noRU9RdCEPVlzsveqPIEnaoibeb5KyBTNetiW1q0u0bvt3owdbC5TiU0ihPH13csr
	 rNxBkoGhms8FRqBUd2nOh9czrQ8mtclqpMtKVmyJ9tb7Hj4iZeexK5aSbrFc8hYiuYE/T
	 L9psm8y2fvhCw5lDLmV+rtevJTCYKgfMXblo1CicfHaF9oba1PiOuvcpUnzV24Qspvq8l
	 vtsb7TH4OEXfropKRsrpU5fHLAtHo+NIKtveOBKizPLoYFgsrDwwEF5WWlwuJ53if3w1s
	 Agus6eeBl42CIYLCfh9M4so4Q54ERzohfYMU+rhEg9ihWYv7OEv27Bz3Q8VGIfSZm2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.112
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021112.outbound.protection.outlook.com [40.107.57.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC66606A320;
	Fri, 20 Nov 2026 07:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC66606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bjWMg/vwzzIwFNMLNhkumR73sMDXg5kvCpgB6Vl0uhhSoWHPM3rHf2Ixdj5RkkuZqR8UlmnUZPdUbMJv4KTY6phpejAG/Vx7Etxouf69N2uYVXa4VND0BfQtAHUGCl0NwqM50zfAlpXL4pz3c+wDELXobIFYccKYqx9yupowMhL9p+1a0dZXdfggnw+SpETXrVSuTAvi7K4L/gcRW+b6AfUwiWUnh1IwDdScdXzN/F0XgYHpk1exxwug0Wbln6h7au0yd5iuIgrokJPGtT6k5UGlzn/NhlLaXes3udfjndiDywDcYNViWUvKx9TCWVWyJHB55a731YlkKNiDHy+CMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MA8q72j1INZzj7hEMnlN/HNwqNMAQTutZorSUYtW5Ww=;
 b=NshP2sNpidD9SavmMdhvntbTTp2byytzqXOH21xU5WLnKY9MykmKrPkEqlc8Op2kllBM8H8k57ArPy/flwkQMdUcjL+vZVQmMSLymp8BWyvqgEv1/h37HDrx3vq5C3X8X6540orH07ldksNY3PwYHkJ+8MWMagklR+SafeiVAyW9lrdpJHo1Tb/HX/vJTRquJzGMsnPYEWGpHHlb66/6tBZEfB8ol/fXl3GOaTy3C+fZO07QF5MftDC1JqBy2TiUDVFd92bs8xk9pIbgD6fDTfVdxcX/FwUHZ/4IHQl3doJjIIz1Dd3n1oTN5mE+Vixy3gLy4IA5Zi8Dnc10lDdBvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4004.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:284::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:47:58 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 07:47:58 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "jai.luthra" <jai.luthra@ideasonboard.com>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, Vladimir
 Zapolskiy <vladimir.zapolskiy@linaro.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 09/15] media: i2c: os05b10: Add H/V flip support
Thread-Topic: [PATCH v5 09/15] media: i2c: os05b10: Add H/V flip support
Thread-Index: AQHdaFxD8WzAGIoTaUKi+Hq2WsWPB7cavBoAgBvvXdo=
Date: Fri, 20 Nov 2026 07:47:58 +0000
Message-ID:
 <PN3P287MB18299C133C2D2A56237D85828B782@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
 <20261030104806.1223991-10-tarang.raval@siliconsignals.io>
 <auiDLo73gQgslsvL@kekkonen.localdomain>
In-Reply-To: <auiDLo73gQgslsvL@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PNXP287MB4004:EE_
x-ms-office365-filtering-correlation-id: cd0fbf2e-3002-429f-7c39-08df46da9894
x-ld-processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|10067099003|4143699003|261022075727099003|56012099006|261026121527099003|261021123027099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 mdL0yKk6OK0wmVhCzue1U0rux17qUaBnoaQxK9kDY2G8Yz2medI9fazbV1hF+VptTtZlzVSRg3jpZYjaMIR8e1v+bXl+RoNecJG2fdqIdrovJXqpeofS57+y/1+sUww1RQ74UUJVpKWm4qb75TGrqt9tDhLiMrUBZngQ0RHExZDm79g0tuHVewatjEbrFjkgtph9/K7A3WGYbvNJ5sh8r4Wg4v0n53ZQR7EnM1T3OaEi0M3uY1vtvsFXA/UMA2u17GNWBx96bpajXTcixJYvkUxWWeXrwzm35A6AGxzsIwgJrmQwlfaOVTgKokyYRM+qQ2RnjppZJqlEAxEE/wvZ2PXgAgMK3VSSkDa0CvWGEfO5ZxZ2HPWnjiYMUgCB+ga3q3k2ljYR/ZZMKv/X7eIoOMzyjIU/jPGw/4tmkiZTVBQCvuk0E6LKzv9008yrNP+8HBt5NIU4CfZjdhGd2k0chv18DzvLwP/Kb253Lm8aZ4kiyhoA6HnBzzOADy2FB6F7J0rB4O0SPqEtpaRFfuaKCrp8RzaygTTHzBwnM/NCc/h3Czaj78pEp2P6R1KZwuwTKTzuwyrahDFwgPeMyEQjmFwenbdP82WNxZfQuz5eZeaknzOt8oMGxZOsVP8ePWk2j4tocdDg+i+bSx6cTkntrFG4rieTzfWSWDSO95KBveASFq7NEi6AjAz5zq376+xeRr45OmRCel9FInTWgljU25yshS2ainhmTxp0t+7eXZE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(261022075727099003)(56012099006)(261026121527099003)(261021123027099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pVHpeM0v/6B3uMsBYWtub1D7KIUNVWdvjjbUkL17TX/KoZhzld0kp5aUb8?=
 =?iso-8859-1?Q?kvIJUYdgL1v+sMB2ZqI6QNASC39Br5uTPhRsPGh8vXd0U3EDKaY/sy4dlg?=
 =?iso-8859-1?Q?RSHsn56c4UvRNEk8ryJf93JmAaCt9HoKBPthXf6CUrpASmDF71MC3z42Qf?=
 =?iso-8859-1?Q?v6BWe7g8MzOeuue2qhnZcK4y2YzNM1ueoAUuyZkgDvENymA4gmUhOIPgt+?=
 =?iso-8859-1?Q?eIL5vhKrTLZQjKDMOpzCcvfVgnXIlIuPfwJY1AWsjWRP9ASTSASH/nb/r5?=
 =?iso-8859-1?Q?X7U0KtsEUAuBJQmpNP8+Oj9Hd7wbghhJfetOlur5N4xgUOEwJ0VfanVzGL?=
 =?iso-8859-1?Q?z5bFgjjqYGgaSCF0ldO7X7tiRqoDlRGI/TbJQq+gzn5s3jpTXuvxDoJbb/?=
 =?iso-8859-1?Q?SS9DScxjGfBxPEX1uOPtnJPtHj2lKnqgwNDiseuPzGqaT4MCOW3aVYY3dz?=
 =?iso-8859-1?Q?I95qz7vEr8KZb7sDsfxWQpOooVcdcmWNBfL7YNMXQ4zXL1rrx1KWNnnd2+?=
 =?iso-8859-1?Q?36rvtVg6BRY4pFaikTiZ88lw6eiguzb5T7XY9nXEuKZM7GQHYGqKHpBx5N?=
 =?iso-8859-1?Q?kJhBVpPDrzqn1YfL86qLagFX5hd1Pi9FVBFubxucckVjVpUI3taU7qMCAo?=
 =?iso-8859-1?Q?4/tj5zGnieFx1kFc6ie+HhiO/jf8efEBveVa5Jvb6z3v+42XuJ1+TQ4aQV?=
 =?iso-8859-1?Q?DQhmQARoYEHEjnGWMfCxmrRM+SaNXLjP1NP+zFL7wIMQe/wexsYT/4BfoN?=
 =?iso-8859-1?Q?shy1rd6IbK23+ljLcNfZ+AXzql5mV1dRix9G3f5paI2nMjl49LX71V8+Vj?=
 =?iso-8859-1?Q?feOANogb/mGIybSGaiDrOcQh21etPyUZrI17X8r+4vBRA/vm6jUAEtROZm?=
 =?iso-8859-1?Q?YbQJ80ADHRwW92lEe1FLTmIpELCIXZVUqE/pK0c0/6ENQaNrS+hXcE1XTJ?=
 =?iso-8859-1?Q?+svCSzNHvM5SjB9cooYVxotVmh+I35UrxJPOyD0Vz1IStVNLx/KOPtqfaj?=
 =?iso-8859-1?Q?gh1j3HV3oUz9bCmsGmKq22Z6HIKwZO7fjECWkDANOBpc8FiY5anv0a7njf?=
 =?iso-8859-1?Q?ObRSWQLNezHvwp3kdodPkBL6Gx+/U50TieHftI+8fW+qxe1J09gQmemeIx?=
 =?iso-8859-1?Q?H2D7iXnQGpnj69STNZRUgdFqwQac7lopUfcwZ61QssWDXCYR0ndkX5Qwgr?=
 =?iso-8859-1?Q?QEwNRti3mTcjxnqZV/FTJFPirvCOV578BHcXR36LLJ+c0bYSdaq21WGa88?=
 =?iso-8859-1?Q?/SGaB293fNw9QR7gcAYbEdWfc3MXoQ2cxRx05ZTRq6POlotvyuWYJiOI7X?=
 =?iso-8859-1?Q?Wpp1PsAZ5DFotpPjv6gOTCwfq5gqAzNsF6y9UesG0aF4n+D8XoP4rnwr0h?=
 =?iso-8859-1?Q?IdJZukKIhm5skqhrlb66XQfvHTqDSuH6SLMW4s++NyBpRRIwdK3sezQEfD?=
 =?iso-8859-1?Q?nFCgD01C4MPXHNJWut/pdZOlIaqs5cVQxhtM6OKp8pG18yK0jGH16XFEln?=
 =?iso-8859-1?Q?Cy3tWeGspZ9WTJn4CR4LDf1uBHGM6E+9aiJ43sm6fV6uAIvgITgBBoCTuJ?=
 =?iso-8859-1?Q?OJJDGH0gux50/HkBWdoqDrU5UEgUBlLyR8Cr/wZ27ZwpnuezWbwC9WeVz3?=
 =?iso-8859-1?Q?hyutj9rx1f11qvD7KzXpbwQnKP+ddPGXitm7vFff/fJzQ3Bi2oTcpJf5tU?=
 =?iso-8859-1?Q?ihkuR+0InpK0rtLV39k+I+jCdDbAIE4btScA2z+FM1PUt2qH/89RfxTuMW?=
 =?iso-8859-1?Q?1tUOcKC/p3JPnKIaCfu2u3MSAd2fQjO+o5okIHJyDn5ECfUxqSIegmLhfS?=
 =?iso-8859-1?Q?ZDjrvE3UTJw4H8MqZd7TMM5kngHgQ3U=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0fbf2e-3002-429f-7c39-08df46da9894
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 07:47:58.5982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yX7J3l7TMSgWGNq+rL1b63hkMX3LA3Fdq2/N90V/RZ76mgzSk1Jt2shz4UxrCyihv7Ssen1uC5vymLEa2VYh7FO7aXv61WHtqDxkvXl3704=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4004

Hi Sakari,=0A=
=0A=
Apologies for the delayed reply. I was on leave during the Diwali holidays.=
=0A=
=0A=
> On Fri, Oct 30, 2026 at 04:17:58PM +0530, Tarang Raval wrote:=0A=
> > Add HFLIP and VFLIP controls, lock them while streaming, and update=0A=
> > the reported Bayer format based on the flip state.=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
=0A=
...=0A=
=0A=
> > +static u32 os05b10_get_format_code(struct os05b10 *os05b10)=0A=
> > +{=0A=
> > +     static const u32 codes[2][2] =3D {=0A=
> > +             { MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10,=
 },=0A=
> > +             { MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10,=
 },=0A=
> > +     };=0A=
> > +=0A=
> > +     return codes[os05b10->vflip->val][os05b10->hflip->val];=0A=
>=0A=
> Note that accessing the control values requires holding the handler's mut=
ex=0A=
> here. That's not the case when called from enum_mbus_code() I think.=0A=
=0A=
I checked this, and the handler's mutex is held in all three callers.=0A=
=0A=
The driver sets sd.state_lock =3D handler.lock before calling=0A=
v4l2_subdev_init_finalize() (this has been there since the initial driver=
=0A=
patch). With that set, __v4l2_subdev_state_alloc() makes every state=0A=
(active and per-file-handle TRY) use the handler's mutex:=0A=
=0A=
    if (sd->state_lock)=0A=
            state->lock =3D sd->state_lock;=0A=
=0A=
The callers then lock that state:=0A=
=0A=
 - enum_mbus_code(): subdev_do_ioctl_lock() calls=0A=
   v4l2_subdev_lock_state(state) before subdev_do_ioctl(), which calls=0A=
   the op, and unlocks it afterwards.=0A=
 - init_state(): __v4l2_subdev_state_alloc() calls=0A=
   v4l2_subdev_lock_state(state) around ->init_state().=0A=
 - set_ctrl(): called with the handler's mutex held by the control core.=0A=
=0A=
So the control values are read under the handler's lock and no extra=0A=
locking is needed in os05b10_get_format_code(). Please let me know if I=0A=
missed a path where the state is not locked.=0A=
=0A=
Best Regards,=0A=
Tarang=
