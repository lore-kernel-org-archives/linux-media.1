Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021090.outbound.protection.outlook.com [40.107.51.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907A7449B2E
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 06:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791527720; cv=fail; b=CCDTsHYvjT3gPDtmRdoqdmJK0BpBu4/JgHjkBhFakNVgdxyVtOsAYaKHDNuymAyl6todrr+19ZpXTKplfYOjTCA7HFmE13nO/jaJv7sVDoQbl2UFD4kobdfNcY8jOyst5310utxlqu1I3zEP+HruLicMeVbJs8Kf6WZGaAN0yqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791527720; c=relaxed/simple;
	bh=RI2fSGHExSXh10jwt3tKbvDGL4TENHiVFJ0uwkNMK4I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m8FqNS6zAR+YNtyLgLLb0foy0S2dv/tbLXC8WlLQmm0uAf0n5RiQbMqBxRCohc7PzUXZfh/5QXcsdWyUtd+NCEsh/KkdudZXujLTfRnDOot9/YsItT7d9XNlM4+ohhKX3ijFni4sosridwqVFmHTFGc0E5/2KKQqYV+TvnOlyHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Vo3jDahr; arc=fail smtp.client-ip=40.107.51.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Vo3jDahr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/CbUcel1yawZOHSx01eYvDmcmz6g8ju5789nLud1SV6pv1J/tpyZKQGaODtnDKF6zAPjKl0zd94R1IBYXRNdpLD7c9SWlJ/sn2+12vW7OQZ60UkWUgx5XtuX801wOMMJtqFUj92Lrp/ae6s4dPVIEz+EKMwz4icQ5f8WUH8Rq1BWjmsv4PS8sZzkLmqLPfu0BY3HRw+qCeNJQkv5NPoFnLidjVFM/+JJHQLW5mLxqr3egZCkQsO3gNe8VpYGvC3dVOWHE/S+zH1cyfu9fqVvEA+lgQdQPWjvYs/hSdrXyttooRGkOhPPfckFwo1dtvImJeN+1R7ubPecAFo6FV1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f30ImJ7yJvKAvzsoOx+m7cs7hWcozOQafCHUf522JJQ=;
 b=OmPo9IKDspZ3AbBCdOe238q3XhOFakhWEjUcnCiboCR9SbDm1iiMjmtRgob62OS3rk3WTrR2w/EnR6AAMCaKrHDuDH6WsiyYyZ+hveqPlzBK1gztpXHD7poORC8yu0z13AXXawCjUTPv2UtWOB7GMudzwOayDdxzNsnBd00f1F1v177+zx0XOIxwChz/tIwkki40mcRXMOA49AGFI4MCIlKlgpsjdbklIB26siX+r1E0arU5XOngLJK9W3JmHfYZ8l632zmYyFLNnz1SaULVaW/LdH8Ie9OaKseD3m/+1XzAQGLANTyj9dBeYBbYI3EcnGFDh1sOrIWTLNjc9fjyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f30ImJ7yJvKAvzsoOx+m7cs7hWcozOQafCHUf522JJQ=;
 b=Vo3jDahrkk5yivzZ4WVfSKGRhIhFGkeXBYDuOfkmBqtoq/qy2dFCNZvgdaLQy3jGb3WQtzsi7xW6M+Ddkh4j37rJK0sMeq9vX6Mp8cZIa39F1uXt+cEy2OrsTea+7Xoqh71HYk7rLP5LK9UCABtBb4hQPNxnk0H+lMay9W7kyQ2kqoKbtwpw/iSrAC7hBYo4oSv+CRJMHQ8r3/2rDXPqJk3SSGUfAHBtrwwvWAc8Rv/vG8+L1J3YExvMbJoFOxfccI4c3R4dvMlfeZhYArbc9UrWRsjwND07MazRa31BbpmiU6ABuhIvGIGcrzgTuyY3zKSMua34/sI5T7Z2QgQYCg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAXP287MB4344.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:35:12 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 06:35:12 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"antti.laakso@linux.intel.com" <antti.laakso@linux.intel.com>,
	"hao.yao@intel.com" <hao.yao@intel.com>, "dongcheng.yan@intel.com"
	<dongcheng.yan@intel.com>, Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v3 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Thread-Topic: [PATCH v3 1/1] media: i2c: Add Omnivision ov05c10 sensor driver
Thread-Index: AQHdUWxJYfLOBUcopEeQ8kMYWt6TzrbyJtAAgAIFCQCAAJVTBA==
Date: Fri, 9 Oct 2026 06:35:12 +0000
Message-ID:
 <PN3P287MB182924D5AF1AA8ABA289006D8B922@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261001061250.37734-1-sakari.ailus@linux.intel.com>
 <PN3P287MB1829F9B24FB03D373358AF358B942@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <asgDQNWy7Vfs8M7x@kekkonen.localdomain>
In-Reply-To: <asgDQNWy7Vfs8M7x@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MAXP287MB4344:EE_
x-ms-office365-filtering-correlation-id: 5f7dd8cf-81ac-4831-5cc4-08df25cf78e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|10067099003|38070700021|4143699003|56012099006;
x-microsoft-antispam-message-info:
 UqR1RZcu+t3HdsMXEcsEFDaJb9ZT+iNtOlMsCaj0Fz3njvgFA3X8Y9wZBOJHYl/WMeBtZajxrJJ0MIQMrU6Xqp+hmUUNvjgStmRDFBFbhUKXL0uZ1mFhqCKFsGqnwB/Q/S34NqmRXatZ7ieiCt4clnrYl8rSHsp1G4+HxJmk3tUWY3B0I8qevFe9yTS6SccqoiSXH+tlyMv9mUHYxeoilzsLL6KYa0VjW/rk/DkuUHgC0W9QS9UNBBz0M/KY2RS+sStr8UY1A6aUD8HGc0/4CwDKgh0KgNqkfVxhtjjxt36jmqyFEcz47rkX7Go42ksc+FuyTWqZ8o4xvWo1ejWEu4RRQGoqOpkDGhBDJrsTpycHxP0prhhJFpi3+ZAFORB91Z0XBj/kGVottynxLhwsX1Rtyt1TKYeDtGnwLhw9xXwLqAtjd5O7EtLgLJ15Vt+Sx6L3qBFBU0yy6jhtbvmXl2kiz8LS12K0R89D4uU00kNg9QcbFS7wEm5rgEptz2R+O+pwuZw6p/w0QUFOmKctV/QWXOtqowAB4od761f3a755Dhvr4rMCzRPZ7KEacSLE/OAtUkhlhJ1xDfNy1TdR1u/K9PdjwqYWjKaZkklRnAZQKl5PIc0HT8yFW0e+86yKAzqg0X5as3QR1q3o87/pBA0j8qmyxdHvdsJcptC1qEWuI1ZSyeNvLOFMMZGr4/qLKwK/vW/19XGEvxNaJAELkeQImP9x6eyPg7EK5bci68E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(10067099003)(38070700021)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Z3V5OhvlxmmpWWokQmB1qJ5wClXsf3zt1Cdzo2sSSHj8cGI52XOTIi2ZOA?=
 =?iso-8859-1?Q?ABJOFZhsHKSZYKJUOrc7nnd4Uk4eS3xALOin8T2uiwkAhTea2jL4K2Zvbu?=
 =?iso-8859-1?Q?ODziAHlMnKh13SN8Xrvtmxb32+iVcfYlfkyyXVroclYchLJnUQUk4smh+9?=
 =?iso-8859-1?Q?oMCTL38C41Pu7325KH2OCBKbcXRRcPCiaYPEYuqI8vCaVEWbrX03pKSHLZ?=
 =?iso-8859-1?Q?WRwMNTDQxDxWn52hJBTFkBNI2Z4cOXv4S5/rEhlwoY1/fJ5ML8nQUN8wd2?=
 =?iso-8859-1?Q?PyfL8ubERD8oD0OOQ5ZhcAH0ndm3KnFl7s3+Pk8WMuOIfozxVkLYbN4PYE?=
 =?iso-8859-1?Q?uXxveou/xEqKTr0MG/9xQPF92eFJ/Kb/O0I3Ix5nB+0lWd0JAfBlt7FVD5?=
 =?iso-8859-1?Q?aayK/XUI2BiDt4paUoiO5fJNKD6xe0TwqfwI0gZox2KkrA/L1eUWHp1Cvm?=
 =?iso-8859-1?Q?8Q8+6h7DulXj40nVdAIvg07x0uMPVQOypYwcIdNKrfXlYy+N8ibfa5P0j0?=
 =?iso-8859-1?Q?cPInAX7j6/la9tqzQrEs8VUAZfhQu4wDQGbwrQhtmw3CacUzGk/Of7i9ct?=
 =?iso-8859-1?Q?+Rdz4fXXwCKNbHUSLeT0n3kimzrmJgr2QMu/HGB/ehg+XqfFwFQrd76SKL?=
 =?iso-8859-1?Q?KHJvBhInKVoNJHjfK9wrCBQtBrkleRHW+3HgyfvVf0lLMG2RafavPw7rhG?=
 =?iso-8859-1?Q?RZ/Ux8reWt7srTjGxWWgKo7+R7shgepkUTXIWbDSvWrVAVRIdIkpWo5Myo?=
 =?iso-8859-1?Q?9gCGr0D8nRdq4rSw7pqARFv5UKYVgSgSrV+K8qxrh6vVdk4vcMGpF0iFXf?=
 =?iso-8859-1?Q?L4eVTCwY5Yt7/l7DC/SmJ8iLhAit4AW8FIhmlSvx2K1Ioua7QCSctivvzQ?=
 =?iso-8859-1?Q?iqI5xyaR9PC+GNO06/5ZSrMHxoH32RdSpFAIN6zx3Nm4bdpJfJd33seXyf?=
 =?iso-8859-1?Q?BOKppp469PWMQiM196lUfq8Eh6Vc0NKVP8emigxlrUmwdFuZZLaBSzzMX0?=
 =?iso-8859-1?Q?0bc2MjbCQ2cSU5CgjVEtI0C/Syy+4anOyS+KKOHc/DEG4+fGu6GSo8Z2sZ?=
 =?iso-8859-1?Q?o9aq4oHI6U/0kCja+PR7vnCMVLDAsNwf8MC8RFvR5IGmMz9QDWP3YO+AIX?=
 =?iso-8859-1?Q?BW38YIXS1T2aNvcb/ezIDpWKnxOTt3P3BNowKzCUqzDrEhgXrs7Owqkjmu?=
 =?iso-8859-1?Q?uFaAPeWr0yeHTiiGQNgN/R32oy2AFLruIAqF2TRC2Xbz2lL4eK0OYLX21i?=
 =?iso-8859-1?Q?y/CiDZjt1YArOWOom2Dk+Tzg87CtjPx8vFp4bFhxOahfrnQ9x7EvqnXv06?=
 =?iso-8859-1?Q?kyWhm8yZiVw50zoy0hs4sY7fwWrRfMTNTXibGTpFn4vu1nNWNjlOEE+FPx?=
 =?iso-8859-1?Q?CFjJwSDxJ5ZLYGZOLA0K/kMWc/DdBNki0HRvG+LGsTIwNmVmDtWqILbYlA?=
 =?iso-8859-1?Q?nje5EXZuL9c2/0mCQRzWwcCmLYvApGJvTXhmWssuMuvujZqjboBxEYQBSf?=
 =?iso-8859-1?Q?GzMwWF1O3IGs7W+LYZd1L+5xCdwkQGEWQ/iTueM72EoZ/q7+YCrTF6RnS3?=
 =?iso-8859-1?Q?QXIjme4rawRtMYabHREVTVsXN/mfn3wVEeoDfnyddLfGwmivLZ3CnPfOcg?=
 =?iso-8859-1?Q?W/yaKNwlL2Rn6OfL5OaLCF5QtorhW69/imJGILV16faHvpWh9LTyKk76Lf?=
 =?iso-8859-1?Q?4AYJdhWoIz9gwx0StPoZ8A9NLp6DkpDLKSsTvp+lab5Q8ZFdEDC3XrNwZP?=
 =?iso-8859-1?Q?DqHTDBA68COAoRyI5Z0r4m7/fYUZlgyRuRVbr7ZjKozrD3aEdfdjoG1G59?=
 =?iso-8859-1?Q?gni5pWGEJtLpUAQoG3Kdkpyy3Br1KHs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7dd8cf-81ac-4831-5cc4-08df25cf78e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 06:35:12.6395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b6NkCVSgDG1Me7BeYPOH8DtOKYdR5ysUfEeHvnkxyAIVSmkVZL4voVaA9LUIrbUBlyph/M0JzziMxWHguw+bV+UUrf5VlkVLSJKS6SDtndA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXP287MB4344

Hi Sakari,=0A=
=0A=
> On Wed, Oct 07, 2026 at 03:39:55PM +0000, Tarang Raval wrote:=0A=
> > > +static const struct cci_reg_sequence mode_2800_1576_30fps[] =3D {=0A=
> > > +       { OV05C10_REG8(0x00, 0x20), 0x00 },=0A=
> > > +       { OV05C10_REG8(0x00, 0x20), 0x0b },=0A=
> > > +       { OV05C10_REG8(0x00, 0xc1), 0x09 },=0A=
> > > +       { OV05C10_REG8(0x00, 0x21), 0x06 },=0A=
> > > +       { OV05C10_REG8(0x00, 0x11), 0x4e },=0A=
> > > +       { OV05C10_REG8(0x00, 0x12), 0x13 },=0A=
> > > +       { OV05C10_REG8(0x00, 0x14), 0x96 },=0A=
> > > +       { OV05C10_REG8(0x00, 0x1b), 0x64 },=0A=
> > > +       { OV05C10_REG8(0x00, 0x1d), 0x02 },=0A=
> > > +       { OV05C10_REG8(0x00, 0x1e), 0x40 },=0A=
> > > +       { OV05C10_REG8(0x00, 0xe7), 0x03 },=0A=
> > > +       { OV05C10_REG8(0x00, 0xe7), 0x00 },=0A=
> >=0A=
> > Multiple entries for the same register value seem unnecessary.=0A=
> > You can keep the last entry only.=0A=
>=0A=
> There seems to be some, but in at least one case this is quite possibly=
=0A=
> required: P0:0x20 is software reset, and this being Omnivision sensor, it=
's=0A=
> hard to say what it actually does. The hardware reset value of the regist=
er=0A=
> is 0xb, and it seems it won't return to 0xb when written 0 nor streaming=
=0A=
> works. So it seems these two writes are needed.=0A=
=0A=
I have tested the OS04D10 and OS02G10 sensors, which are similar to the=0A=
OV05C10, and both work after removing the P0:0x20 reset writes. So the=0A=
OV05C10 may work without them too, but this would need to be verified=0A=
on the actual sensor.=0A=
=0A=
You are right that the purpose of many entries in OmniVision init sequences=
=0A=
is unclear. For repeated writes to the same register, keeping only the last=
=0A=
entry should work, as far as I know.=0A=
=0A=
So, we can keep them as they are for now. If you get some free time later, =
=0A=
you can check this.=0A=
=0A=
Best regards,=0A=
Tarang=
