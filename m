Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021122.outbound.protection.outlook.com [40.107.51.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1387C2DF719
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536928; cv=fail; b=GH9d8AeN3KKKL8OLpWPH5aMT7ysgNE4bqXkQWqWDsgVpRk2Nn+HXoLF86GawUFk5PbHoSXAoYbrVSk+onklxN8UaAuzDZQqrxwqjn5ScoGeL/nEaaWEfhhGRxtDhxYaO0sBn7HcVmENaDxf0uKgxz5TItju934kIb2iGs554f9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536928; c=relaxed/simple;
	bh=xptAwlBqeNJwPtY1Qkz6rpKABSTQiqigKIp5ro1MQbY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R4tmhSZSmJUZLJqXy4EKaiNgDZmP51h13Z6XqeRiL7881rShY2u+6SfvVEXuSWFD6Tye+AqhzW4jDmX72v+cxKR/hngkg7sGf90+g8R9AmmHfMp5KFFUIIkDXA2a75xz6edKoO027ejlkelwHtVvKl3xGqN/CODp/aB2cs1ijOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=A3MKisaL; arc=fail smtp.client-ip=40.107.51.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="A3MKisaL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uil6qQeHVFnOBT+Xo7NLFRHYQT4oKH+5gozqi6cU+GbKxCGELQf0bSPS2jX4P4DH3HygtmQ19hZ6YVRkJZQzxIz3eSi+K5sUY77l14yrdcFgnc2pRiY+DFSSUoyLoHzV4B95rBjdwLQ2vQOz/MTbi6ew9iA0P6fVC4gJOlB+XvrBSzNgPAWUd0/UoSZexUiq6Ea+Wto7G1zEV0G1G/zPJ0l6VeFsvK+hSUjcQErrVaJ+nQMoN9BK59E/EJHgqsH0Ko2SEUw5EY6d7ebjA6z9pFbNgLhlF8uFgCmg57T/2OZEerxMwaxT7wIG8Ob3jkQ0ir62nt4290wVn/BF+zpg8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mP/hPOTcLsTnd9Bu+aTfIElORqyTfr0XA6YoYUW8wYQ=;
 b=Z8AcGhlT29PooqLs6Uu7v4TafFnK7/zyhZB4RjmEiVwEed5xJH17YwwrgkqSIQf+MVJt18EHvCeCl2j+Jiik9EfVORNQg3TLMvPCE9KetAaYaaXfEpqlieaAYyhuqrJyhnH/ILssrlyUQ2VU8VobkJlxZzt+9WEUpj91U0aU3yFrJecwDPFyBNCihrvKyjnQJxHuF3QnDtuch1wOxmCbtAehSC7OpHVQl5GJwmPoiO5Na7yOhJtoLcBnSimYihPVjirsdA+NpZ7grRqhE2i/qDF4NqzlPeAAvGWTVSgMjUFYoVair8apnYih62D9IC86EhBgSuTDCiYTQj065bpu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mP/hPOTcLsTnd9Bu+aTfIElORqyTfr0XA6YoYUW8wYQ=;
 b=A3MKisaLhVkFtD7GexB/46poIgbTmIYh+J515aC6XBR1e7IaK/4rJ1WbRxg4tqwP/a38BIvJigJAek0nMXHrBQpp729r6vZv5zfklH9gCXUQbFCPMbQjj7+qdNxNrBUrcISoC8sJE+9k61GETA99UStgcWb1XbdjKrowIoq+j1onnKvO7s7ZBDrZv2EicSFLrT50pA2UjYKlyXFU9601oM5YK7PUpp4fJ6nTR+HaF4g4IoDUB5oI3RRNYnRWYaEe8FXoCwry4eqE5tdKdgXmwhe9/DxY5At/8NrKusqaeF7YSk/Ea90ZICfoWbfaPwVrsCfl2AZ+eD6o1ZAvRCmYuw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAUP287MB4787.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:17e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 09:08:43 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 09:08:43 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"antti.laakso@linux.intel.com" <antti.laakso@linux.intel.com>,
	"hao.yao@intel.com" <hao.yao@intel.com>, "dongcheng.yan@intel.com"
	<dongcheng.yan@intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v3 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Thread-Topic: [PATCH v3 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Thread-Index: AQHdUWxJYfLOBUcopEeQ8kMYWt6TzrbyJtAAgAIFCQCAAJVTBIAAJ2WAgAAPavs=
Date: Fri, 9 Oct 2026 09:08:42 +0000
Message-ID:
 <PN3P287MB182973BAB0D0DABEFF2DA1578B922@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261001061250.37734-1-sakari.ailus@linux.intel.com>
 <PN3P287MB1829F9B24FB03D373358AF358B942@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <asgDQNWy7Vfs8M7x@kekkonen.localdomain>
 <PN3P287MB182924D5AF1AA8ABA289006D8B922@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <asihjx_WKqeKwmz4@kekkonen.localdomain>
In-Reply-To: <asihjx_WKqeKwmz4@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAUP287MB4787:EE_
x-ms-office365-filtering-correlation-id: 14cd8d96-de1e-454d-7860-08df25e4eaa7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|38070700021|4143699003|56012099006;
x-microsoft-antispam-message-info:
 75R7xJrfqrxDC3VuSEbMygSFhRTVLFYDnlV1y2ml76gV61c7SYra5zYcGrWe3p4FoAtSXAdCOZyifZGjM+8QbAdKTktTqQC9QMWE62etSnmAZx7/n+6u6z3WOAwS9P5zt6KjYOCLRVPC6yL/C7ueaR5KlkEoHxVR66oBZcABK1RIKEHr0f4BPebT1r1WphTgRMkWon8GWvM1UN81WI7aZG7SgroP2gcomdD0ZhHg/3CugMXujuZootjIlrnUT/+uN/QJikOtgsjqH1E8A0PD4PuZ60aatLVZe3I8+Ids6flm1uT6b693Cnlgj7UIzmvmdFcSr5rQvgPe06GZbAQfAgDwxiO7ioSGAOacwgj2A5Pt7psz8yUxQiOBTA4y/zTHnJBB22pUOaWIaHXft0YOT5pxACJdQw+bDNq1YA/nrheMwDsestQPyGozEtNLIcF2hYICE0YL8UAvE3wbPfWEV8zrWfL46y/nmp+K4nGkcZqYdo/dT2bZwZJnbSljl5QHIGQlc2EuiaGEuqcCR14F31C5dXQfjKnQ4RoG0zgMONsMUsTqZ9Fj2fs7dvpluP11+AVmu0LVRNbB4GNCuWYItI8ISl+zeH3vLX/gD4i+JenKf5XK33+wyaNizJc+JCIg4OviFWKTkg3nYYiY9jBeECN8yFpMZJEnGwZP4vV5HgQd2GhveamalTW4218Jb+mAsPq+4RimmEpHj0VttQz0U6uHAu7NgqyNRtHyUZndwPw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(38070700021)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?uEb5e+iRCiCPLayzl1bDjuJIK20uiqAU3ipyIJjXyRS01sCVDZOU81ROXL?=
 =?iso-8859-1?Q?vrIwR7/zKCHQe4Sf4ZMDz5/dQtlyzEuk+/B8oKcPwUyV/4S0Br1m/SRAq/?=
 =?iso-8859-1?Q?oSz76Xsdys/tTJf8dFJxha+VFn75PFq5gcOGv6iikqDSKppqZsLBIJOa9A?=
 =?iso-8859-1?Q?OIow9Z1teK59CFgCkNCygKv2IOqdfTpmgjvp9EQuOksdw31BGCHSYk8jZi?=
 =?iso-8859-1?Q?/8plWL+cKsk9tIdUy4fQSYZe51lMJp4W9m6nIWKwuWvBTFwqn7Om5Q+PEX?=
 =?iso-8859-1?Q?OPIifBt1BuhLGiPAf5Y0WZl3ounaXXaSee9lq+U2E/iAa4qfoUUcbmzO0E?=
 =?iso-8859-1?Q?EGrxS7s2fg/liK40RHkcSN31mZ5Ym2R0HdIkUu5DKFmm52HQfvOchEhzS1?=
 =?iso-8859-1?Q?ge29V/Gt5VV5Y7XiSRQjLaFv3zKCoiJq4JgxuY919U0SeZ0RGEsw0NSrim?=
 =?iso-8859-1?Q?eenQFX+1AvXelnb/DNBpcPAwgzypQGQ36LreH54jp67tecTSjSO/k2hYcH?=
 =?iso-8859-1?Q?VKKzQ+vJCEXbrEi9E16lk83tfOq4v8yPpeJRdfzZIIpcRH+ZvsA/MpgyzT?=
 =?iso-8859-1?Q?z7eo4oRNz8nBxvLtfrCup8vt036gWXG/0bP1gl87e27YZ+HXrcxUFs12GT?=
 =?iso-8859-1?Q?XqgNQa/flXbOvUaf9TXA0yb8lJljyVlCM84M3QZUWMB0VBDhurXX/tx+m8?=
 =?iso-8859-1?Q?HgpD8Xas3x8pQMwOyfT/xeiW/aIh0lZbUXcQA97kYQJ6jmsbhzS2xHF7Py?=
 =?iso-8859-1?Q?kveQn6/SCDv6KQ0yFUp/bwalnQ+YpBCF//+OOcUT44Dt0fBh5JdBhvscCD?=
 =?iso-8859-1?Q?xR6k7ZfqMjIYC9n9paWCQhzYSdM0K7VJL9zkrMhMfVlooA15Rw58OOUPaQ?=
 =?iso-8859-1?Q?ybN+C/gqtSsiB+ymV0UIi0GJCyQt/925qLdW/2F1PR8rTytq7FQTNn9MVY?=
 =?iso-8859-1?Q?IrYhXO74uAvlQK8LrO7+0jcx99x/6//gdlyHhzDF+MfSSs134gDTsprW3v?=
 =?iso-8859-1?Q?i3OWnKqNJ4w6KgktFjoETiFe5bZOXGkcLTYyTgah7P5nbOcIVz3v1+4nIM?=
 =?iso-8859-1?Q?GGm1usR6tE0eIi1cYO4TyGYEmC2DjyO0B28cFIcmxV9wi6HsvdaCp4Zv8E?=
 =?iso-8859-1?Q?hzyeaqKOqjoiXCjG79cHABXI5V77WY1H9ejXP6LUXiBSjMmOBr0iuuMK4H?=
 =?iso-8859-1?Q?J+NkF7S50tfLpeZ8rWH8IIarCXspPh/gc+ZvQErncU5+Y9RiZsn9M/E3r/?=
 =?iso-8859-1?Q?okLvnXBdbP4SOt+QtHEjc83KEceVVPIowzoLixZLI87mc45SCtIJhy7sZr?=
 =?iso-8859-1?Q?8qQlzpSAUtfIXEJc0bX+YFJ+iGeNR6OurQHSm4Cz96CyLQsAMzgPFctn2O?=
 =?iso-8859-1?Q?Zo11942RwQT85r2TZIqo6fcFkxUJ8s/craGm0fHUJrL3HevUaiMeEs9bkK?=
 =?iso-8859-1?Q?/6N8laq9qpUQ8JP5S1THF6WvwH2jfVxFgciZl8lqjIPKpz7P7Y4EuNxRVa?=
 =?iso-8859-1?Q?kxIEkb892UcMdDrhT1WLUfXSbOpQBXp7V+v6Qo4QbvT1WSIhGfDtzNUQhk?=
 =?iso-8859-1?Q?dwpyqKuf7egWwQUgoPNN/wvOGPeoelDLgjj1k25U7SgWatUvbn1yUGHmZI?=
 =?iso-8859-1?Q?nAGK4XY095A7mekjm+VxGKwxJc9aNyg240MWfrdYD+C+rPW6GWS9wzcmL0?=
 =?iso-8859-1?Q?GFpU1aNg4Tum4yrIPzZweloInPVIK+bstlKxJAW5LOJQs+WCfu/rXrC1Qi?=
 =?iso-8859-1?Q?/eqDFdj3uyksBrrQ4NAMLftsgK60JdYf6BlwWwGwqIMfY4oa6I4E+HLynn?=
 =?iso-8859-1?Q?XI927zx1harEqREmRqWTWi63nBmPR/s=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 14cd8d96-de1e-454d-7860-08df25e4eaa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 09:08:42.9211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2meo1R5d25J/j8F7Ob/Lf6SBfaTSYtWJ7nAv6dYtHmUOqqiXWON5H0rLQaGktda4mosfyBSMNFQnw4yhfJtmmzSGyiMqPWmvs4bct3sS8GE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4787

Hi Sakari,=0A=
=0A=
> On Fri, Oct 09, 2026 at 06:35:12AM +0000, Tarang Raval wrote:=0A=
> > Hi Sakari,=0A=
> >=0A=
> > > On Wed, Oct 07, 2026 at 03:39:55PM +0000, Tarang Raval wrote:=0A=
> > > > > +static const struct cci_reg_sequence mode_2800_1576_30fps[] =3D =
{=0A=
> > > > > +       { OV05C10_REG8(0x00, 0x20), 0x00 },=0A=
> > > > > +       { OV05C10_REG8(0x00, 0x20), 0x0b },=0A=
> > > > > +       { OV05C10_REG8(0x00, 0xc1), 0x09 },=0A=
> > > > > +       { OV05C10_REG8(0x00, 0x21), 0x06 },=0A=
> > > > > +       { OV05C10_REG8(0x00, 0x11), 0x4e },=0A=
> > > > > +       { OV05C10_REG8(0x00, 0x12), 0x13 },=0A=
> > > > > +       { OV05C10_REG8(0x00, 0x14), 0x96 },=0A=
> > > > > +       { OV05C10_REG8(0x00, 0x1b), 0x64 },=0A=
> > > > > +       { OV05C10_REG8(0x00, 0x1d), 0x02 },=0A=
> > > > > +       { OV05C10_REG8(0x00, 0x1e), 0x40 },=0A=
> > > > > +       { OV05C10_REG8(0x00, 0xe7), 0x03 },=0A=
> > > > > +       { OV05C10_REG8(0x00, 0xe7), 0x00 },=0A=
> > > >=0A=
> > > > Multiple entries for the same register value seem unnecessary.=0A=
> > > > You can keep the last entry only.=0A=
> > >=0A=
> > > There seems to be some, but in at least one case this is quite possib=
ly=0A=
> > > required: P0:0x20 is software reset, and this being Omnivision sensor=
, it's=0A=
> > > hard to say what it actually does. The hardware reset value of the re=
gister=0A=
> > > is 0xb, and it seems it won't return to 0xb when written 0 nor stream=
ing=0A=
> > > works. So it seems these two writes are needed.=0A=
> >=0A=
> > I have tested the OS04D10 and OS02G10 sensors, which are similar to the=
=0A=
> > OV05C10, and both work after removing the P0:0x20 reset writes. So the=
=0A=
> > OV05C10 may work without them too, but this would need to be verified=
=0A=
> > on the actual sensor.=0A=
>=0A=
> I'm not saying it wouldn't work, at least if you have hardware reset GPIO=
,=0A=
> but if you don't, then removing software reset could have implications.=
=0A=
>=0A=
> Software reset here indeed appears to require two writes to the register.=
=0A=
=0A=
That makes sense. I didn't consider boards without a hardware reset GPIO.=
=0A=
=0A=
Best regards,=0A=
Tarang=0A=
