Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.81
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163426;
	b=2UxPuzdVIRwgVeZFvWzNyNhmKuWl3YBIdkjOET9auAJEPJR3vGSgD6kCdU8Zl+cEoijd
	 k4GXMuPWRe4bdbMT3wDokBrmuh7L5WJyZtNDmuWyKEDwoUnfw3weLuf6amDIkRzlDk/hY
	 8HLG/fcrY1cxk0Xx8cHkjk62rqNle2MEqd+Py5y/VMDCsl4O/aBKD+/Frv2Kn2BObaQNz
	 ur9KonqW7pqcCHNnMIW/XW3BodJEjT7fPqJkL8bPMpXY1X0l3K6MIUw4Kdlj7MQ7dpfDw
	 EiF8RyoJy+Kiz3H9ekyveXx3DIxWnkg06dE1QSvIzMig7YiHipnI2ENmjAuIx+XGbjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163426;
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
	bh=x8z+3zaZ4ztUDzhDD12LYNxcRRBKG2txY9fgrkc54GA=;
	b=TuGxMfIjYeWFcqFI6P4rbEjOmHNyk/sR8pnMwghU7Wp9ARUHPKAavZaHFnGezu1toQAE
	 XGfDzjbJBlfoOGQ92rZBB8kfiMq2PZqK63r2E9qVF0T93TaC9idNa8ANVpLH0pGQsuCWI
	 wSrXPeKfVrkoUsx8GoMwNC6zUhPOpKnI3AIkbUDi2HhNNI327g0rzBeMUpXuMJG9m73iC
	 n8HEVXE5Ckeq4Qa8nBsw5z2ebxiaw2xbCyH2Yedr0CtkxnKc//gqiE4xrSkhF+XMi6CdG
	 rF6etfdo+SGeTKtavTYaHRjjlCBHPF3igmOjId6r2W1Jehq7sM3MlvHKKiPJWUoWiSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siliconsignals.io;
	spf=pass smtp.mailfrom=siliconsignals.io;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.51.81
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021081.outbound.protection.outlook.com [40.107.51.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A249606A320;
	Fri, 20 Nov 2026 08:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A249606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMItFwJpHIFgtyqQDjSU0IB7Rrn6ZCN3OQyj4LbllPZ9Ko6LfEwF7N06OD10IO8HUlpjjoIORTRWgdFOIm2NHpy43P25hUzqNsFpnQMDXwJkgCMt/nKEUTmm+TY/zIoMSIVJdyNL6JqWoe5HClw5ZJ1UTrWSNx8GmI98hFKTEykD76msv/IMxwWhttMoKtKTwRCS5sf+Zrztd8JXzs8P27D09vrRyI1FzZwo7iNtp0O3wb51Jbjt0hcfptZLDgC6NmZONqQUIA9MVBmNDMwFo/tg2RDpFTqlt/sKqN/JH/zZ+7J4Qdv0u5+9tQDdsCiHyvx6gtfHX4JR47uI8AiWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8z+3zaZ4ztUDzhDD12LYNxcRRBKG2txY9fgrkc54GA=;
 b=BtiAv5Q0XvgxY3h+NFwbnA79kmSL9r1ou2deiTsB7ejtxE29s2CG50uI8l2r57eUpMNGLYnkTvEykUFDa880rJtb3sMRO0Z0xslenoCJKnak0zwwdjwHRONmGQsRAqsr0snNcxGguA/iodA2OZGPQDGW87duBZTRGLeji/j0scfqOXi2gJIq8SZHVaXJq5Sq0PHWqOBN2xHc56ZmNmplvfCwpdguO+fZ++TsQHl65kspnG1x6X+COqtKMUrJXSrESpgtzaHHzYyq32V1dfCk4tydcXKxpGdIMm1nMsS5Y/wqvcbQmk3iOgVcBBE8XOg4lmiB4jSlv4K+QlmqtbJvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAUP287MB5859.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1f5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 08:30:21 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 08:30:21 +0000
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
Thread-Index: AQHdaFxD8WzAGIoTaUKi+Hq2WsWPB7cavBoAgBvvXdqAABFSgIAAA7eH
Date: Fri, 20 Nov 2026 08:30:21 +0000
Message-ID:
 <PN3P287MB182975720FFCB48386F1B5878B782@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261030104806.1223991-1-tarang.raval@siliconsignals.io>
 <20261030104806.1223991-10-tarang.raval@siliconsignals.io>
 <auiDLo73gQgslsvL@kekkonen.localdomain>
 <PN3P287MB18299C133C2D2A56237D85828B782@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <awAAtT8qt9RwuCTb@kekkonen.localdomain>
In-Reply-To: <awAAtT8qt9RwuCTb@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAUP287MB5859:EE_
x-ms-office365-filtering-correlation-id: 21b3b86a-1460-4f3d-25c4-08df46e0841d
x-ld-processed: 7ec5089e-a433-4bd1-a638-82ee62e21d37,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|10067099003|261021123027099003|4143699003|56012099006|261022075727099003|261026121527099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Hox4vXSvpwRFCIEBElgBNeqtkWyBE9b8341VQEIhsTy0P/Z3p/GpRfEKSht7JHeU8hmQt1LHIwGfxUe8wfJcUpnABeHci3L3Pb48CM29VEmnIr8F7tv6VASyqlWAnL2gS5q9rHsK4qz59J0Kd8VwJ07sYeIdVESlr2JoUQUQ8Mu2bFXaueZiPpbQNW6si11xaURfzPgc0OzYAd4mepmexJ/2aLlkjnAeDy0en36jZF037cQUXrgQEGVSMPS3DUqvg6BJTNOkdlMoOy9ZhCf83KgZYwaouck0gcpQjpkaCLQKDfWsTj5L3/2kFmpNIpArIlVPZTVKIyR13xPEsqOorKtHHq7BItXc9KNUBJH9YbMHxliL7h0xWR/FHcsWdQhQUfTy+fvWt9nOCnL6jYzoESKfMwPTKKxNeKg0MYSgHHXCo6PGJGmji/d5ZYHKDaZZ2+wpTpiPczDjEXu/TJB/9T0aAJjhsqQU6KLgRoXfhtOS5shIi8IVAmeTiNHfT+EXw3Jr3/lqLhzg/56Ptz+8YCGYUv7EQEkHol2xvoCr9J/NN6ZxwJ9bbwEDpUAH+SYGtJCIwqstmeSIyRISm4UTvoLWEOOxsWDwE8MRVzamLhJM3STjDx+GXUPG9UddwzFF6HQBPdnfzjSESHavLliMFlbHfckH6aD7SpsmTl6tolc2tmhAco+sqrY5ab76nihcpX3qX1AZx0wY4Bcj2yEgqRJpuWV0QmAXXODlyoLFvC8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(10067099003)(261021123027099003)(4143699003)(56012099006)(261022075727099003)(261026121527099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hV5I+9q+9c6iGS2AApdO19tYhc/kqrPHZkK/79Ifr8V/bywCRe/qepALd3?=
 =?iso-8859-1?Q?UF74Wyk2moP2ZptOEM5HQYXNJfgZnkog89+pe9KyvBSL2UBkpRtMx/qawq?=
 =?iso-8859-1?Q?fS/sdJg37I8SZuQ22PdLdJP4HRdije38jSSfITJZa3EbArEyKaqhofqAPg?=
 =?iso-8859-1?Q?7mUCwVDwU5gUn0fjJoi+AVEpNvhTUA5TWceO+3JKckXe84r1nuSzTabhJv?=
 =?iso-8859-1?Q?eTo0On6id+DCwdFzTKysCIHlAs/CLXSRJMx94sgUDCygwnf+kcm4VSkbj+?=
 =?iso-8859-1?Q?JLbqNHN9/Vx3JWCH/QmP3siPv+lnw5dECZeo9ZF9aID8VKwPSTnHNaC2cX?=
 =?iso-8859-1?Q?TkyXlReTwlrtCe+5Aq9cUA+aCedNhtnlH3lnUjbEG88Yxkq1mIHykAvi28?=
 =?iso-8859-1?Q?I7w35VujNFqupOemm3ikizTBLKLLLakSD1HpyjSZuOEqMBWAI4jFfPy5wD?=
 =?iso-8859-1?Q?oSiUGeWLI0i39hovmjsd0VD2boPnsC/iZjYIaAld3vT06psE/lAZXedG+D?=
 =?iso-8859-1?Q?F072G3syvmXP4i0MZVVTgYKM948KUXgjzwIr9TdbRIyNZiVhffAoLkBFCQ?=
 =?iso-8859-1?Q?Nt+fCrf4MRCoDM1yLJ/X57vod0Ukq7305hQPAJy9XCEM+9/NL5539xUZNZ?=
 =?iso-8859-1?Q?HAvn9OSfznXHGCnRQjQN4ATSNlfuCuicG5l4GKr7siRBt0O33WBHpH57wv?=
 =?iso-8859-1?Q?LuVWcY1IM+AKw3BTpp/77ZfpLQsOx9SEwhdY1DuPmG2mViGXc5vakRXq6U?=
 =?iso-8859-1?Q?/Oa/pLfkf9AWSP9nLvpeWydHB/A48i6JLq17d4Tuiqe+0tvBcfe2aGRd4o?=
 =?iso-8859-1?Q?jQ70dJOElj94A2IhM+aPntYXq50w4e8Do9ZQVwNOk6kz0GCc7o/dND2ows?=
 =?iso-8859-1?Q?ut/+Wg/ujqqTHTOi0Dj5lxqk8hxKBMjmwzEMHSn8MQgFOAAudLz66FIWEN?=
 =?iso-8859-1?Q?T96djdl9bpwaVmWu3voinKz9KC8qTphlA8e6w4atYONcfdD+r/51z/un59?=
 =?iso-8859-1?Q?na3zP7S1rZ5rtohb8v7Hi0VU8dBC2y8yNVQrkk4f1iWn8QfIj2licmGSvr?=
 =?iso-8859-1?Q?dUetf9XgBkr37VHVhlS3E0CY7g9L16ZKxdK82AmWZ5KExXOopYg0+y+QCf?=
 =?iso-8859-1?Q?wm8BTR4jZWWXspFfOZgiASTR5KRG/nbbDXx06sRY4LPJIuw+IuGzQY2x7B?=
 =?iso-8859-1?Q?fCUdc3oFkngyh7azGQBzn3W/nPSxJ2BWWON+9UkHp1PVQMABIXtvqyXf0J?=
 =?iso-8859-1?Q?iuHYcHY9PlZEM6at6PsdolP5Fd/hMaMEHH8o3OG9TTj5iB3Nrj0Dc4MYvG?=
 =?iso-8859-1?Q?t5cVMDOKZuc3mEDeRJM0drfuoFxjLoAXFlc98jWn3mpWreBxaiwudpyks5?=
 =?iso-8859-1?Q?ecKoU2ePcrdCzOVeikd68LMvLz034CGqjDxCDXs06WUicUqGpWW71PTLsj?=
 =?iso-8859-1?Q?carPsgr3MIfHRJFjS6DV2R62Mau5w6Z4Yfv0KXN7+AY0te12GrvJnQixqE?=
 =?iso-8859-1?Q?cYL+X/IQwG/Av/xh882wsj04qcpVwA2NYfMfpIV5e5g7UAjg2fovHFMjBf?=
 =?iso-8859-1?Q?qV1guj58OFEkM6pZEG0znSN8xjVN32XrcgPKUjXWjLsw03bB7sa6NasxoO?=
 =?iso-8859-1?Q?70+ZGOxEm6k+1P9vydK/7Ll6Ub7UAfqozkr+3SgAz20nhpTL1aYf9MGYfT?=
 =?iso-8859-1?Q?nmhBtESv0Q3fbD80/HSYlwBe5P21UDVag5eWJ9m3d7pkY4t9VBvAQWCKRX?=
 =?iso-8859-1?Q?2dOD3ajCxmizpcubvrUCrNcEmToaP8UBolm9p4vSrnUeol9oq4TgjrP0j9?=
 =?iso-8859-1?Q?yVnFT8mWirGSrxECnaO3A8TbhQdEv3Y=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 21b3b86a-1460-4f3d-25c4-08df46e0841d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 08:30:21.2400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VwwXxNmgyAsknekEZ3a9U0JnmETm/rBuHK6pob65Rx/fVT0JJQy7IXCLG/thIW9anKYw+E9L00hVIgoxCdO3cYgndAA7/qe1McmxazsgKkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5859

Hi Sakari,=0A=
=0A=
> On Fri, Nov 20, 2026 at 07:47:58AM +0000, Tarang Raval wrote:=0A=
> > Hi Sakari,=0A=
> >=0A=
> > Apologies for the delayed reply. I was on leave during the Diwali holid=
ays.=0A=
> >=0A=
> > > On Fri, Oct 30, 2026 at 04:17:58PM +0530, Tarang Raval wrote:=0A=
> > > > Add HFLIP and VFLIP controls, lock them while streaming, and update=
=0A=
> > > > the reported Bayer format based on the flip state.=0A=
> > > >=0A=
> > > > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > > > ---=0A=
> >=0A=
> > ...=0A=
> >=0A=
> > > > +static u32 os05b10_get_format_code(struct os05b10 *os05b10)=0A=
> > > > +{=0A=
> > > > +     static const u32 codes[2][2] =3D {=0A=
> > > > +             { MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1=
X10, },=0A=
> > > > +             { MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1=
X10, },=0A=
> > > > +     };=0A=
> > > > +=0A=
> > > > +     return codes[os05b10->vflip->val][os05b10->hflip->val];=0A=
> > >=0A=
> > > Note that accessing the control values requires holding the handler's=
 mutex=0A=
> > > here. That's not the case when called from enum_mbus_code() I think.=
=0A=
> >=0A=
> > I checked this, and the handler's mutex is held in all three callers.=
=0A=
> >=0A=
> > The driver sets sd.state_lock =3D handler.lock before calling=0A=
> > v4l2_subdev_init_finalize() (this has been there since the initial driv=
er=0A=
> > patch). With that set, __v4l2_subdev_state_alloc() makes every state=0A=
> > (active and per-file-handle TRY) use the handler's mutex:=0A=
> >=0A=
> >     if (sd->state_lock)=0A=
> >             state->lock =3D sd->state_lock;=0A=
> >=0A=
> > The callers then lock that state:=0A=
> >=0A=
> >  - enum_mbus_code(): subdev_do_ioctl_lock() calls=0A=
> >    v4l2_subdev_lock_state(state) before subdev_do_ioctl(), which calls=
=0A=
> >    the op, and unlocks it afterwards.=0A=
> >  - init_state(): __v4l2_subdev_state_alloc() calls=0A=
> >    v4l2_subdev_lock_state(state) around ->init_state().=0A=
> >  - set_ctrl(): called with the handler's mutex held by the control core=
.=0A=
> >=0A=
> > So the control values are read under the handler's lock and no extra=0A=
> > locking is needed in os05b10_get_format_code(). Please let me know if I=
=0A=
> > missed a path where the state is not locked.=0A=
>=0A=
> Ack, thanks for checking!=0A=
>=0A=
> Can you post a fixup patch to the issue in the second-last patch that I c=
an=0A=
> squash to it? (I'd just print the frequency in Hz, there's no reason to u=
se=0A=
> MHz here.)=0A=
=0A=
I'll send v6 today, including all the requested fixes and the fix for the=
=0A=
Kernel Test Robot error.=0A=
=0A=
Best regards,=0A=
Tarang=
