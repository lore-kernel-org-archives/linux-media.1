Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021124.outbound.protection.outlook.com [40.107.51.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7944D400995;
	Tue, 11 Aug 2026 09:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786439661; cv=fail; b=klLFTpBcC7URmyzs8OV5lsyfBbAdDvNyQ9X4SzmuKBgMEYvAz0VzxMO3CVQtr3pb91PlzQ1Y/ON+9f4LfsHKqePJEqB/vUv0e/rCtRQFfY1CM4kX6TPub+k9fc4HAw8q8mFsSj0UZCGL3WOXnrn5Nz8P5Z16ZOnowCMoeSI8yPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786439661; c=relaxed/simple;
	bh=5YYJDfWrdZPVHrIPmY8kROcNvSyT/5mOaXMTtzjOeZc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hsoP6WVXkG+PdoEbM/L3bkra2WPputYIIxh3BSBoFEkxKyDUaibrssgZGptcMQwiOOjaBU4nN+F2BZ1yU/tqVzt+iHqcAkuEg20RyDoRJg/DQJL4/cruX16uKKKqQPmyw9Zw8VzpD8eZqRioVm2ge/9AUy+vDcDoVU5guXcUhPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=ZI2DUDZJ reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="ZI2DUDZJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EA1iyXBMoZYTXnqPoRGCDeulvq2p7FBPOTVitnib2jrw7eeepUPlms6GOD1B9JY29+VwU7zhop4LmYOYrhLqaR6Vlvx7Vc4PSbckUKpBw1vV1IHoSI4fGVUD7uo1YslakABcL9zRSrIuh8rUg9wlLaSXerG5cb9sm5arcikXvSyH4vwSUxoPY0cV7eij4kV67uh8vWRpUxIJhYx7A0GNlX6DZ4BqwSYIhd5+JaTflrsk9nsM2QK+mtDD54RWaeS5IcpF+BOc4G7OHNi57zAAI9fqItI6tsbh+dz0NSuDioPLtA8nLWkZRkBk1Gl5mIJb4zvH2qqEvxpBvevB1lb9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f1nBRZzV0mFpmpiwPEyPAoJloEE5HWgJ6QwBC6E9ew=;
 b=sywCqnbOqc3ijkJIqkFojAncEBeb7U6tgmsLnVQePEZz8R12036Qw7TQb5JWgn1JIPkbqMAVzcXA87rHJ1XrZyGfMlaLMX36tIfnZZCo4Y61lPAy3EbOQJZXf1JB8crWSQUsg+hsIKclSvqSA43acpYvLXaHYGmxTGoCVXPmWi/Tk/g8QUqEhPj3Nm7UU0tulvgNG2ZmM/xqGVY2kf7tAwQiFjul86914cXO53Q7JL7gO3MioYdZth7SR8wQiVRqwef+shoFT48QW0Vt6gWZb6VuW1VMU2y6f8G4U30V9R3W+SfODtbzYyUHfwkJAL3D0GQrvk6ShoWhcMq1wUjpKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2f1nBRZzV0mFpmpiwPEyPAoJloEE5HWgJ6QwBC6E9ew=;
 b=ZI2DUDZJMGpqRLpgJFFvNtGaGP0QWHQGcqNuD9ccqRgpY81y4MDUcYNcs3z0+0gus+E5KCaX3KaURGJT4EVBAAawMUwvIIgua53RxmKmFS+P6nQSXLn4vXeya4JlakuKssA33P4/3b/AmUTLh9BmDQrAV3eH/m2ElmPXw+ex77oMvUH52sKz2yJQ0GWML5vclzmxNnTtFBGk4yW2wye9j69vlacU1xQXtgDfuyNQKX5ozWDDeLhYVxePiKsyCWp4z+L7aqS2ZBgszUReDP5XgdDnnnqQrJl6/OqEJtskaCaASGHSCj5MpIq3dqR0hE0E6fLk2+atGCqPu7G4VXTsog==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA5P287MB5316.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 09:14:12 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 09:14:12 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
CC: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Hans de
 Goede <johannes.goede@oss.qualcomm.com>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Xiaolei Wang
	<xiaolei.wang@windriver.com>, Kate Hsuan <hpa@redhat.com>, Walter Werner
 Schneider <contact@schnwalter.eu>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] media: i2c: add imx576 image sensor driver
Thread-Topic: [PATCH v3 2/3] media: i2c: add imx576 image sensor driver
Thread-Index: AQHdJZuI/Y7nmH3ipkS4g472TIaz9raSKcaAgAZub0g=
Date: Tue, 11 Aug 2026 09:14:12 +0000
Message-ID:
 <PN0P287MB201968EA50C12E941A58AABE9ADD2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
 <20260806120216.24145-3-himanshu.bhavani@siliconsignals.io>
 <178608605778.4139729.11308202650136036897@freya>
In-Reply-To: <178608605778.4139729.11308202650136036897@freya>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|MA5P287MB5316:EE_
x-ms-office365-filtering-correlation-id: 96319ca7-b77c-4710-d689-08def788e8ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|18002099003|22082099003|4143699003|56012099006|10067099003|6133799003|38070700021|3023799007;
x-microsoft-antispam-message-info:
 AD0PiUl8OwG7AlG79Q5dtbJ2pjGiSJ+XkXv+pGIAhLUok/AULTRkg2n67HCghLiYZEnLZCxPP1vc7vtF76nzUvDLg1i8UXLX1wfJTmWUKNvqkp9hxYYN0NPS8hngSrhcXs5fHfCn6ysDalGiXEpWdxeES0XjjT3jg9ky2eNkxebnWGrMpWQvaZobUK7EWbOxQeBpzeJ829GpSHykrc2jrQzxhgNSNIf3zlhUQ9MgJpgcIK5Gnf7VhTwv2eL2MWcPZZZ6uz8Ju85b6t8I6gUjTWW/bJ13uLJ0s4i/O5WzuS5oNKLYVihhMhU/o0Uc6BEEAvYF6T8eLdHHML6L2U6e+/BDjHamTce/xF223pnmIEn+0cxZ78drL+lGjEAEl9M5v8BcvVPKCKD9lSWWbhRsichi9IaIyT+N/oHc6dF1tte4RyGIuvlj6XCGfwcBQdeaDBu2JIMjUZlOsv7iExnuOPudkyR2tf9dTCroD9k1iKR18Nl7XyB0Et0KZ1H8CukxH4C8Vm34/fDfjddjdwG0ZhhhdAr7Jpq0CIKqBTxA/034xxUZ7GUuQbZpliOLjaw9fxdTxJ/EwY6VoXM581ce509S/+KF8jXisAhHhwB4Wn5K708kMAx+8hfsDerY/sEDxhd5z1dAI+xnG/bGTGthlbLA3w+fDhQBI+AAPxPtKIT1PHw1P4krRtH2YXFs/U7RY9XnQaFsR7G5RtPDLRlg90aHI2fMo9MsJ8DHvzo5+38=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(10067099003)(6133799003)(38070700021)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?FdxnjfQiY8JZMp7VWiq040FnwFoffCXTJdCcSziEh+kjPLf3IsBGbpgNY+?=
 =?iso-8859-1?Q?TH1lY0v1ONllUYFeeYH6PJJe0CoXeD8nxS8FHVkWw7UYcKT59JHeQOq0J8?=
 =?iso-8859-1?Q?yWfQqd0e0aDQU74mw/HJjIZO+I/TVlqA+H+C6WdTvNQHCmJY/ftC83Ndl8?=
 =?iso-8859-1?Q?3W6LdjHjk/XOLFRd7t+4o+LUqzi9vNUG6oFwmQxmx/dfMuzqh5RubqNJBb?=
 =?iso-8859-1?Q?Rm2NW6rsiopDbk6Bl3iHiJ8iR6kp2ZE+5THPFBVQDh4gActpxvYqCj3O2l?=
 =?iso-8859-1?Q?iQHvSAZLqF4FFkEyndyoy4WvaDemepGTVANozGi7kf6Psw6pmpzT31My5k?=
 =?iso-8859-1?Q?+t5wmdw9x2Exjw8j4NcI16k1l+dtackjTL1VZrNDAfq61vy6nXB8l/PtnM?=
 =?iso-8859-1?Q?jE4JGMeElNIelaTUY5IUyxlo4kdACWPM/GOP7DlhUzA622767uzHzuwnPP?=
 =?iso-8859-1?Q?PbNAjgN2Fmqd0Q/mconpm2HWSmFIlhK92a/9LKzPpJgLRBL1ltGmmQhDim?=
 =?iso-8859-1?Q?onryPBQhrMk+wFcO1MMgH/8XgfFo/073Xxmo9+4xdW5+8oxd9CZmOwiEan?=
 =?iso-8859-1?Q?cXDPsoqrb317RW0ah2lL+Ozg2T/CM73qmGTqviASwbut9B8XuVapoKl890?=
 =?iso-8859-1?Q?F/bQ0JotM3NwCN+7elG9mu5uDxUrlMdaclOh44YXJX/KTvwgytgnwghGfw?=
 =?iso-8859-1?Q?PF4IVxn4jAsxI90cNVgg5nucMvHYNYXCObtJKmf9mkrna8NSBeNdJqxH2F?=
 =?iso-8859-1?Q?iUDXTMEQvegZNYIJXm32jEAT+maku/pi9ERrFqtiY9nzkRvmbr4im9Chti?=
 =?iso-8859-1?Q?rVxnkgjVrvnTzs90aTmcirUH/XW9AgDGkB1UqpFSyHk/cxUxH8U2oO0yA0?=
 =?iso-8859-1?Q?VHcwd+YF9n9l9t15jrojv2PtdIuhTBTR9mu9npWI1yGB9PE9G37yImG2ww?=
 =?iso-8859-1?Q?AljegrzNB35UEl2NMa0QxJ1uBlaVIi6l3WIXRl6VpYuObs7UM3aqZCNAW1?=
 =?iso-8859-1?Q?JZqfcbcMkgAriIT6OpEYXhm7nhXadkyiHtawu2niBLqqpnGCSvBXUX5raU?=
 =?iso-8859-1?Q?u0J88AXW0lbmFEJube30xHB6G0egU1oizpcnqiUFmO+cRE25EewAgecVY2?=
 =?iso-8859-1?Q?tetG8+w5pQlCRFB4WFAxEklz2EcKhdYYQWMnQpy6KHeQYvPHLF+2qNuVKd?=
 =?iso-8859-1?Q?Rkzp6yhaclG81OoWNdKDnmt+FenAZAOGhL0+DnkdPYiyxnGPBkgK05IEd1?=
 =?iso-8859-1?Q?Mh+mYTnwBx1VlGRJqZo8gw2ajIkkbuvjRn6ILvEE/ehNy+f9RwCTzpn6mJ?=
 =?iso-8859-1?Q?laQGZOfegxd+bKEGQ6zgFjqf6ttwnnHIt2QNCp+HpMSijmqYZiyrcBgEVn?=
 =?iso-8859-1?Q?GVHa+r879Pq8vG6GNaf5teKQ21/HBHxTaV/dIjw6g3UMnNoxIa3Bl0N+q9?=
 =?iso-8859-1?Q?ITmRmq85CnJoBn4gxVf3VGDrXOlXAynGx14ejV0tQ3fdBFMafN4bKTd/NW?=
 =?iso-8859-1?Q?1fqKEBKzVsfEAvVHJ63jwNuT3j6p6bkRgj2+3z/snDkNcRZ2LMjuIye+Jd?=
 =?iso-8859-1?Q?CGa+aACTwtY6wgMAr0i1ORieoERyOqj7o6MsZijmRmTtZ+wWTj3ZkhkIgE?=
 =?iso-8859-1?Q?cxVi22e/GyDjJ/f3u+AQkovFvjjVedIxaks72AY6AWpmWGZwT6UDtbr8tK?=
 =?iso-8859-1?Q?UHBxZQnA0irXuUw/3hZdCyF862rCMgGc7rf/E/1AbNcy1LoTcuZQ4tyEUw?=
 =?iso-8859-1?Q?3aOS4vEZGisQrl2a9pFLtws/i4vsC+SS5DvsRzSOZFxTCCKk/HVoZH+Cb8?=
 =?iso-8859-1?Q?kFotDXKwk7X95nPZkKkV04nI3lWv738=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 96319ca7-b77c-4710-d689-08def788e8ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 09:14:12.4191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6sisCWEEXvMm+W2EW7RqAZA8lOTW+SKNGPF0W9sp6CblhZZQF0zKe7sKBnnZPADq1iPyY7h/J2wAmbuYkac0F2LU4RBM2AlLtEIMWunQm0bXI0Pkl8SkhNfajcgmxCDX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5316

Hi Jai,=0A=
=0A=
>Hi Himanshu,=0A=
>=0A=
>Thanks for the patch.=0A=
>=0A=
>Not a full review, but just a few comments on the PLL programming.=0A=
>=0A=
>Quoting Himanshu Bhavani (2026-08-06 17:32:08)=0A=
>> Add a v4l2 subdevice driver for the Sony imx576 sensor.=0A=
>>=0A=
>> The Sony IMX576 image sensor with an active=0A=
>> array size of 5760 x 4312=0A=
>>=0A=
>> The following features are supported:=0A=
>> - Manual exposure an gain control support=0A=
>> - vblank/hblank control support=0A=
>> - Supported resolution: 5760 x 4312 30fps (SRGGB10)=0A=
>>=0A=
>> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
>=0A=
>[...]=0A=
>=0A=
>> +#define IMX576_INCLK_RATE              (24 * HZ_PER_MHZ)=0A=
>> +=0A=
>> +#define IMX576_REG_CHIP_ID             CCI_REG16(0x0016)=0A=
>> +#define IMX576_CHIP_ID                 0x0576=0A=
>> +=0A=
>> +#define IMX576_REG_MODE_SELECT         CCI_REG8(0x0100)=0A=
>> +#define IMX576_MODE_STANDBY            0x00=0A=
>> +#define IMX576_MODE_STREAMING          0x01=0A=
>> +=0A=
>> +#define IMX576_REG_HOLD                        CCI_REG8(0x0104)=0A=
>> +=0A=
>> +#define IMX576_REG_EXPOSURE            CCI_REG16(0x0202)=0A=
>> +#define IMX576_EXPOSURE_MIN            8=0A=
>> +#define IMX576_EXPOSURE_OFFSET         22=0A=
>> +#define IMX576_EXPOSURE_STEP           1=0A=
>> +#define IMX576_EXPOSURE_DEFAULT                0x0648=0A=
>> +=0A=
>> +#define IMX576_REG_ANALOG_GAIN         CCI_REG16(0x0204)=0A=
>> +#define IMX576_ANA_GAIN_MIN            0=0A=
>> +#define IMX576_ANA_GAIN_MAX            978=0A=
>> +#define IMX576_ANA_GAIN_STEP           1=0A=
>> +#define IMX576_ANA_GAIN_DEFAULT                0=0A=
>> +=0A=
>> +#define IMX576_REG_IVT_PXCK_DIV                CCI_REG8(0x0301)=0A=
>> +#define IMX576_REG_IVT_SYCK_DIV                CCI_REG8(0x0303)=0A=
>> +#define IMX576_REG_IVT_PREPLLCK_DIV    CCI_REG8(0x0305)=0A=
>> +#define IMX576_REG_IVT_PLL_MPY         CCI_REG16(0x0306)=0A=
>> +#define IMX576_REG_IOP_SYCK_DIV                CCI_REG8(0x030b)=0A=
>> +#define IMX576_REG_IOP_PREPLLCK_DIV    CCI_REG8(0x030d)=0A=
>> +#define IMX576_REG_IOP_PLL_MPY         CCI_REG16(0x030e)=0A=
>> +#define IMX576_REG_PLL_MULT_DRIV       CCI_REG8(0x0310)=0A=
>> +=0A=
>> +#define IMX576_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)=0A=
>> +#define IMX576_REG_LINE_LENGTH_PCK     CCI_REG16(0x0342)=0A=
>> +#define IMX576_LINE_LENGTH             6144=0A=
>> +#define IMX576_VBLANK_DEF              4387=0A=
>> +=0A=
>> +/* FIXME: Exact VBLANK limit unknown (no datasheet). */=0A=
>> +#define IMX576_VBLANK_MAX              32420=0A=
>> +=0A=
>> +#define IMX576_REG_X_ADD_STA           CCI_REG16(0x0344)=0A=
>> +#define IMX576_REG_Y_ADD_STA           CCI_REG16(0x0346)=0A=
>> +#define IMX576_REG_X_ADD_END           CCI_REG16(0x0348)=0A=
>> +#define IMX576_REG_Y_ADD_END           CCI_REG16(0x034a)=0A=
>> +#define IMX576_REG_X_OUTPUT_SIZE       CCI_REG16(0x034c)=0A=
>> +#define IMX576_REG_Y_OUTPUT_SIZE       CCI_REG16(0x034e)=0A=
>> +=0A=
>> +#define IMX576_REG_DIG_CROP_X_OFFSET   CCI_REG16(0x0408)=0A=
>> +#define IMX576_REG_DIG_CROP_Y_OFFSET   CCI_REG16(0x040a)=0A=
>> +#define IMX576_REG_DIG_CROP_WIDTH      CCI_REG16(0x040c)=0A=
>> +#define IMX576_REG_DIG_CROP_HEIGHT     CCI_REG16(0x040e)=0A=
>=0A=
>This sensor's registers seem quite similar to the MIPI CCS specification.=
=0A=
=0A=
Yes, you are right some registers seems to be similar I will address it.=0A=
=0A=
=0A=
>Please check if the sensor is CCS compatible. Even if it is not, I think=
=0A=
>the PLL programming is compatible, so you can use the helpers from=0A=
>ccs-pll.c.=0A=
=0A=
Most PLL values are derived from the limited IMX576 datasheet information a=
vailable.=0A=
=0A=
For the unknown values, I referred to out of tree driver and validated and =
assumed them based on the PLL configuration.=0A=
=0A=
Should I proceed with the PLL programming as it is, or drop the PLL approac=
h and retain only the CCS-supported registers?=0A=
=0A=
static const struct ccs_pll_limits imx576_pll_limits =3D {=0A=
	.min_ext_clk_freq_hz =3D 6000000,=0A=
	.max_ext_clk_freq_hz =3D 27000000,=0A=
=0A=
	.vt_fr =3D {=0A=
		/* Confirmed values as per datasheet */=0A=
=0A=
		.min_pre_pll_clk_div =3D 1,=0A=
		.max_pre_pll_clk_div =3D 4,=0A=
		.min_pll_ip_clk_freq_hz =3D 6000000,=0A=
		.max_pll_ip_clk_freq_hz =3D 12000000,=0A=
		.min_pll_multiplier =3D 87,=0A=
		.max_pll_multiplier =3D 350,=0A=
		.min_pll_op_clk_freq_hz =3D 1050000000,=0A=
		.max_pll_op_clk_freq_hz =3D 2100000000,=0A=
	},=0A=
=0A=
	.vt_bk =3D {=0A=
		/* here the sys_clk_div (IVT_SYCK_DIV -> 0303) value as per out of tree d=
river they are using div as 2 or 4  */=0A=
=0A=
		.min_sys_clk_div =3D 2,=0A=
		.max_sys_clk_div =3D 4,=0A=
		.min_sys_clk_freq_hz =3D 262500000,=0A=
		.max_sys_clk_freq_hz =3D 1050000000,=0A=
=0A=
		/* pix_clk_div also being used as an Fixed to 5 */=0A=
		.min_pix_clk_div =3D 5,=0A=
		.max_pix_clk_div =3D 5,=0A=
		.min_pix_clk_freq_hz =3D 52500000,=0A=
		.max_pix_clk_freq_hz =3D 210000000,=0A=
	},=0A=
	.op_fr =3D {=0A=
=0A=
		/* Confirmed values as per datasheet */=0A=
=0A=
		.min_pre_pll_clk_div =3D 1,=0A=
		.max_pre_pll_clk_div =3D 15,=0A=
		.min_pll_ip_clk_freq_hz =3D 6000000,=0A=
		.max_pll_ip_clk_freq_hz =3D 12000000,=0A=
		.min_pll_multiplier =3D 47,=0A=
		.max_pll_multiplier =3D 2300,=0A=
		.min_pll_op_clk_freq_hz =3D 1250000000,=0A=
		.max_pll_op_clk_freq_hz =3D 2300000000,=0A=
	},=0A=
	.op_bk =3D {=0A=
=0A=
		 /* Similarly here also (OP_SYS_CLK_DIV -> 030b) value being used is 1,2,=
4 in out of tree driver=0A=
		  * But as per ccs-limits { CCS_R_MAX_OP_SYS_CLK_DIV =3D 2 }=0A=
		  */=0A=
=0A=
		.min_sys_clk_div =3D 1,=0A=
		.max_sys_clk_div =3D 2,=0A=
		.min_sys_clk_freq_hz =3D 625000000,=0A=
		.max_sys_clk_freq_hz =3D 2300000000,=0A=
=0A=
		/* (RAW8 and RAW10) */=0A=
		.min_pix_clk_div =3D 8,=0A=
		.max_pix_clk_div =3D 10,=0A=
		.min_pix_clk_freq_hz =3D 62500000,=0A=
		.max_pix_clk_freq_hz =3D 2300000000,=0A=
	},=0A=
=0A=
>> +=0A=
>> +#define IMX576_REG_BINNING_MODE                CCI_REG8(0x0900)=0A=
>> +#define IMX576_REG_BINNING_TYPE                CCI_REG8(0x0901)=0A=
>> +#define IMX576_REG_BINNING_WEIGHT      CCI_REG8(0x0902)=0A=
>> +=0A=
>> +#define IMX576_PIXEL_RATE              813600000=0A=
>> +#define IMX576_NUM_DATA_LANES          4=0A=
>> +=0A=
>> +/* IMX576 native and active pixel array size */=0A=
>> +static const struct v4l2_rect imx576_native_area =3D {=0A=
>> +       .top =3D 0,=0A=
>> +       .left =3D 0,=0A=
>> +       .width =3D 5792,=0A=
>> +       .height =3D 4464,=0A=
>> +};=0A=
>> +=0A=
>> +static const struct v4l2_rect imx576_active_area =3D {=0A=
>> +       .top =3D 136,=0A=
>> +       .left =3D 16,=0A=
>> +       .width =3D 5760,=0A=
>> +       .height =3D 4312,=0A=
>> +};=0A=
>> +=0A=
>> +static const char * const imx576_supply_names[] =3D {=0A=
>> +       "vana",         /* Analog Power */=0A=
>> +       "vif",          /* Interface Power */=0A=
>> +       "vdig",         /* Digital Power */=0A=
>> +};=0A=
>> +=0A=
>> +static const struct cci_reg_sequence imx576_common_regs[] =3D {=0A=
>=0A=
>[...]=0A=
>=0A=
>> +       { IMX576_REG_IVT_PXCK_DIV, 0x05 },=0A=
>> +       { IMX576_REG_IVT_SYCK_DIV, 0x02 },=0A=
>> +       { IMX576_REG_IVT_PREPLLCK_DIV, 0x04 },=0A=
>> +       { IMX576_REG_IVT_PLL_MPY, 0x0154 },=0A=
>> +       { IMX576_REG_IOP_SYCK_DIV, 0x01 },=0A=
>> +       { IMX576_REG_IOP_PREPLLCK_DIV, 0x04 },=0A=
>> +       { IMX576_REG_PLL_MULT_DRIV, 0x01 },=0A=
>=0A=
>I think when Laurent asked to make the PLL configurable for different link=
=0A=
>frequencies, he meant deriving these and the OP_PLL_MPY value instead of=
=0A=
>hardcoding all of them and only supporting one link freq.=0A=
>> +       { CCI_REG8(0x0b06), 0x01 },=0A=
>> +       { CCI_REG8(0x3620), 0x01 },=0A=
>> +       { CCI_REG8(0x3f0c), 0x00 },=0A=
>> +};=0A=
>> +=0A=
>=0A=
>Thanks,=0A=
>    Jai=0A=
=0A=
=0A=
Best Regards,=0A=
Himanshu=
