Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021131.outbound.protection.outlook.com [40.107.51.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB06282F30;
	Fri, 24 Jul 2026 07:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784876487; cv=fail; b=PLbnGyUBNERTz21O3bPZqrSN1ZR8dH4zhAuM4KRLzdsHgRmKcGPRrEbQ1/vk4l4XwfGvyGcX0mL/udkOvZVOs/ooQmHZ2zGS69P2z7E+b7m8V3xOvGkFRbrrkxa//yGB6BvIs4ndZiyLppHElTmuLJmeZhcBMh9R8wLl8n6pNok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784876487; c=relaxed/simple;
	bh=XgHeWRh28r4fNAZ7BC0UB04d4kHUgYTb1Vero85VgCY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g39tL/C3lP+sU2e5OGYgidI1Qsvj8CQMOh0rdDVBhAYFLoelYfINmNHfg/z39W+A+TbDBWoOzBG8UDr4GSetPk+zB+KOxlYOhdmcG06K8nQMcDLtNB6m6NaqxvYKxDgo+h+M+K7ZNINre4CyeLIfG/Fl3uJtloDWn6xJoITwO/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=hmwfXAFP reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="hmwfXAFP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLhbzByBXSpAoHy/SAKlTDQFfnzdYqFxi7DcwXUhZayD5+V6nGbPANzKZycvjgYNWR2jwScyuDtHToRXsH2Q5FoPc/yP2q7DGU+pW1Rb/5k4Eq2jWLPYGUsWVK2Cux9UFFKWwaTHGDOIXCBwI2eRx1X15Inh4ztx/bhwXTHxmPdpBhjY4zysFPSr8U1LfyX8ZTJ4aXQQTftxtMRrI4jHWPydXIaByRxhSOSEbQCfknQRNpUb8cjPtOkpgAd6sRIMKy/X7+f6W47iWSewtRM3/6gNsR98yen0VtUKeh+L/vvoTuK7QgQU+dsCA4QSOilEXfZsb8C757TVHsE54V3m6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftqpt4u3IPMoh7i5dlIl8xyokpJ3t9BXLvMapabKqyc=;
 b=dRKKw0q7ZAvWMoXpkS1h+1pjGq181Ivu6lpabx4mes/BEGw6/3/qPUluXIP3VxgfNU1qhNN/oY+/WZ8PF/8r7fkGtEusveLp7F7TA6ZQaavbD8mxJhnP/RgCt+ctl8vsfs+GYAa3fIq0ykaZR4WYXsihFdxrxLdeq/g8SvJfWE//yU5MiIj5Lj2DypldaRsQHKXSxIwERxyVFLz8pwW1JRIhefmfpa4dyjEh+UqGHXrZB0wyfWImbbqf97GUwKDTcQ26b/Oj2JzWs+Gu3xODYB62X6moURW/zfFjPKBAYWsLw3zgKNP+mXw2RQ3EVyJyQ6TlVAgVW6X+IpwI+2UdAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftqpt4u3IPMoh7i5dlIl8xyokpJ3t9BXLvMapabKqyc=;
 b=hmwfXAFP+Q/NOE6mqb59M5kzSwesPE4N6LYNGzG/axtpRcqIkd2xFywZ6BporuY/IB/HfK3fF5d9vmBc/RRsxE+J5outRd5F+9gFExrXQBtg/0FF7eFJqKFJ+EcRsuPVcR89y6u709bkvaQTzdsLL5BzR3J+A42bJtmwnEmeAb4MhRdGJGSfwP/7c4FFRkkCP2Qm7n4JOyaiq2BLaKEEfjWYUsfj3rmSloEIrFNHP2wwH4QxrzcffuwPEhEpFQfp5grnZDXZqQ21KSx5MxUUWgiYW+ijb12hipAPT0SIdYrb46DmIShVnfEhEZJ3tp01Wr77JNVEFNlM9JqpIXGQKg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNXP287MB4248.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 07:01:18 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 07:01:18 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, "mehdi.djait@linux.intel.com"
	<mehdi.djait@linux.intel.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Himanshu
 Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 06/17] media: i2c: os05b10: Add H/V flip support
Thread-Topic: [PATCH v3 06/17] media: i2c: os05b10: Add H/V flip support
Thread-Index: AQHdFvF32T4t2haUfESFI225kG819bZ5DlSAgAMpJn8=
Date: Fri, 24 Jul 2026 07:01:18 +0000
Message-ID:
 <PN3P287MB18293795276C51E453A8D8E98BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-7-tarang.raval@siliconsignals.io>
 <178469947556.3005206.10100902541399446849@freya>
In-Reply-To: <178469947556.3005206.10100902541399446849@freya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PNXP287MB4248:EE_
x-ms-office365-filtering-correlation-id: 7a491a00-fd0b-4a9d-5c55-08dee9515c82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|10070799003|1800799024|376014|366016|38070700021|10067099003|4143699003|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 IFcpUquT3tK75cS5A99NfZyofTI2L4rgj540GgoXTCaYcCwvVqZGFJpibo8/HSEHVRIi3/1ZG74qP+Rng1hJrPL4QPkEdBVfb5hV5eTIOYD7gnrcPAUUruRBa7nv77vTuLqTjrhA9tQn2FsBkkFumFPonjf7PFvyuzJr5cFlEUprGj1FrXK1lfU1/fb0ssB5+hAVVOUdUrLKgUiZh1LX1HvMZiINvFdS+KVoROgYLQVYyvH2pzrRTcZ+82M/qX4M8p02HP0/p1psX9UFypb070VJzExzyUbHZ22f/sic+wJP3rGkr1IRX3kNA4nTMwukn9Wk2jLa1Sscia1fpuHGBIrsHks2ozf0VagiUduFsQaMPirefKFOrk6Jdp55oL6VEEaUoUrKs93hcsAUEX1mhrU9FeX3xv+i1ZPHV95XHKi+i7JS+68VUo9MvoFgqxpBbAnOWR9Z9tqEFsaZydV5VdHt9T2HtvlPw9sFfpkfl8Ps3ASgxZXMWaU+6Cekd4daS++Qx9fJCuEHwZzqy3d4lOYxdcjYffdebU6bzRn2XeR6c0F5yTVXmBm0jLfuSnKSH3SWYvjwpjSbxeM4vyDrnvCicjTEtnoLj6UlOvqlmoL5cm/mNAdJdmEEXm8ZY/Gl1eMO6DlXmFgsoIPS5Q2N+2tAnB5rg186ky8vCJ1hvyOy6qDqsSliSgxm/1gYgblbdKsSaKRd4Uf7lYDqYXTH1p4wO6yqcLeQhAeGIGzVVrk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(376014)(366016)(38070700021)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IaXB2GRcYF4BAQNUDBRHpD3uLiheZx8o1SX9lBT2zd0bnKE0NOAD8jQOnU?=
 =?iso-8859-1?Q?wetHTA4mCV81Cb9gAbxjt2vIqB3kIbSfbFBjLJ01ZJ+Y/uTdOC4zjcvKPT?=
 =?iso-8859-1?Q?1th6vy9rMLVL+vJHViszSVb2lo5Ar99/j5BkRU7rhASS5ejMRQKJvENZ37?=
 =?iso-8859-1?Q?tmZLe5T59JwniGE7q8cvWSw5kWzabpkJzlu+9giTyqHNFXytV76SqWHt3X?=
 =?iso-8859-1?Q?voNjX9ELrO6r9I2e5/GTzhgGplLTXzUlSWVj8fl4XSDaN0elRqvU9o5DvA?=
 =?iso-8859-1?Q?AVJKDXAPsFcos4eVE7X1ZgwKS8sB8mGAdWOuuODd7poBoG+dgmGMrLk1j2?=
 =?iso-8859-1?Q?cbFcXJk2ff68tUnfQsnqgCjzNjT6TgQMYA4bYae5NYYn+PNIuJlL+Nh7nM?=
 =?iso-8859-1?Q?TXj3pQzqYfTYQ+mcnerAfLQVy53T1j8uZXYPHwk6Aji5nQH5eKhR5PHQO/?=
 =?iso-8859-1?Q?5dABVYyx7GgyhPMJRHeuGPwLHOM3NTOohpLXdUaHs7oRXyBYXL/FgfoFk1?=
 =?iso-8859-1?Q?G1oM5Ed5YkcnGc+npcKt/HGHsTsHowE6hI8sQ3wDBtbgdec2Xp49jD3sJd?=
 =?iso-8859-1?Q?rdrimM0YjKw/9i1nsFyVg76ZmCB6TDRTezU/PHiG5LaidFDR7lariE2VLs?=
 =?iso-8859-1?Q?DjVATLDPsn7FkM21/1slJH5GREB3hAASFr6hkFY+hfVS8TOQ64BXyj8vjH?=
 =?iso-8859-1?Q?4wuCZQpCluURvs2c6rGy/anqzl+RwCm3xvCS197DSlBn6SE7GZLAZIYOg1?=
 =?iso-8859-1?Q?b+kFlV6nFymGd3vVeArTO3rWzxDWrqqxV6aQWLJQC6wge2HwZhKbq5OJtu?=
 =?iso-8859-1?Q?/m8uqBtmYrWT6gMKzzgVvygw0PQofKKj3AB5bQyaVri1m7CTU7O7oxvTrG?=
 =?iso-8859-1?Q?HOsBaOfP8RLLV+FVL7NiMKOzkjSMypD7578Re0ycmC7LsEhgtjGt+VOVYI?=
 =?iso-8859-1?Q?6y0bF3QP5TJ//WVB+JvHN41VEbUqKO0xIQai44BJ4K2FPLpn/MOwh9i1Um?=
 =?iso-8859-1?Q?NdaAIkszlhAYgFr4Ugh8bhirvWKnjCkaz1uDJQWsRIwahjmjITRTgo0jS5?=
 =?iso-8859-1?Q?GhBaspiTVd116YpvHPh0Amz/m2+hdPxS+lan8G5+HHzLNwHWKCVCxI8iem?=
 =?iso-8859-1?Q?DdOMfMQPomE+pUJdYlhtaGJNvA0FGBcj0ry2sqr0XAvQxUX02d3SWfOPou?=
 =?iso-8859-1?Q?OIjllcas6b7c41vps84Hh3Xu3U+4AxFARCyKp985y3Uiio/hAvCCYS8Cw1?=
 =?iso-8859-1?Q?t7qqp+gYFtZxkfJAGcUtmN4uI6/q81QeIO1c4YhWJhKgdgC/JCtK4chyNE?=
 =?iso-8859-1?Q?zods4fFC4g5efXSN982ZE5vbk2bCO2OHstZYbcRLo7m16D7+78SPMfAit7?=
 =?iso-8859-1?Q?qYCK2gUnSCCc0gKJIYEdyPGs0ejpiowcdDriYrdns4B0O1/ipUAUiOyI4u?=
 =?iso-8859-1?Q?xMdfLqQw8B+2i/XiAzLWVIn3qKPKLqkIE24Fbl6E4Q0+QYVAtRdWxBnfm9?=
 =?iso-8859-1?Q?Rt1Z52fQWm6RMUt6TpvRAJG/DvL6wvQ53CdHDZXigfl5RUtbLaCA6Kn0hD?=
 =?iso-8859-1?Q?0353QWlHSjv0J3pPr9OfCC82wsSVvNI4uQhSm/eKG5ah4RIPk0mU95pdTm?=
 =?iso-8859-1?Q?8NEq5OGLZfLffHLtq2Q54MyAyfMeT2SXQUKqcJ5WV0GIQqtsrOQ7CtApE0?=
 =?iso-8859-1?Q?Dx5dRi4YuCvkup5WIdbAZ9Q3eGEfihIbSZmaskrFV7DGYsBcozBKMFQ/kJ?=
 =?iso-8859-1?Q?L/vKbtng5Wkk4rjLmGJTGXiFIVtgcyauBq+3SuKx6tbKw+mUErs5AGNmrQ?=
 =?iso-8859-1?Q?FEvPxZ0CwPV0/1MZSsYWtQ2j4OgYO9g0qAWjzM4A0xeUhmatQFPvDbZgYp?=
 =?iso-8859-1?Q?OB?=
x-ms-exchange-antispam-messagedata-1: 2eeH5K9GdwvzSJVcgN+CSB8OQkA0Qmg0Zyw=
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
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a491a00-fd0b-4a9d-5c55-08dee9515c82
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 07:01:18.6154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K1QtTce9gx52XOiZEe7AChXtmHOZl/YSDxhE4YZWgmPB8KLbkSYaovbSvOGg0oMnISryx78h2g/GKBwb0vrSphxx8nsn+rAMQ1H+GNxsqrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB4248

Hi Jai, Mehdi,=0A=
=0A=
Thanks for the review.=0A=
=0A=
> > +       case V4L2_CID_HFLIP:=0A=
> > +       case V4L2_CID_VFLIP:=0A=
> > +               ret =3D cci_update_bits(os05b10->cci, OS05B10_REG_FORMA=
T1,=0A=
> > +                                     OS05B10_MIRROR | OS05B10_FLIP,=0A=
> > +                                     (!os05b10->hflip->val ?=0A=
> > +                                      OS05B10_MIRROR : 0) |=0A=
> > +                                     (os05b10->vflip->val ?=0A=
> > +                                      OS05B10_FLIP : 0), NULL);=0A=
> > +=0A=
> > +               ret |=3D cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLI=
P,=0A=
> > +                                (os05b10->vflip->val =3D=3D 1) ?=0A=
> > +                                OS05B10_FLIP_ENABLE : OS05B10_FLIP_DIS=
ABLE,=0A=
> > +                                NULL);=0A=
> > +               break;=0A=
> >         default:=0A=
> >                 ret =3D -EINVAL;=0A=
> >                 break;=0A=
>=0A=
> Please update the active state format on HFLIP/VFLIP, so the subsequent=
=0A=
> G_FMT calls show the correct format.=0A=
>=0A=
> Many drivers miss this today, I assume because libcamera usually calls=0A=
> S_FMT on streaming using the output of ENUM_FMT.=0A=
=0A=
Good point. I'll update the active state so subsequent G_FMT calls report=
=0A=
the correct format.=0A=
=0A=
...=0A=
=0A=
> > +=0A=
> > +             ret |=3D cci_write(os05b10->cci, OS05B10_REG_ANALOG_FLIP,=
=0A=
> > +                              (os05b10->vflip->val =3D=3D 1) ?=0A=
> > +                              OS05B10_FLIP_ENABLE : OS05B10_FLIP_DISAB=
LE,=0A=
> > +                              NULL);=0A=
>=0A=
> I don't know about the ret |=3D assignment=0A=
>=0A=
> You can use the last parameter of the cci_*() helpers. That would make=0A=
> this cleaner and not combine two error codes to produce something weird.=
=0A=
>=0A=
> If you pass &ret to cci_write() the helper will check if an error=0A=
> already occured and return it.=0A=
=0A=
Makes sense. I'll update this in v4.=0A=
=0A=
Best Regards,=0A=
Tarang=0A=
