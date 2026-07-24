Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021078.outbound.protection.outlook.com [40.107.57.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F9A3CB555;
	Fri, 24 Jul 2026 08:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784880863; cv=fail; b=rTSC1V8j8iZtwfF8sqF69IyFqMEo24iTRqlxPWHdCSREiU0qvpljEvYmH8MCEJHwBoti2KlUAF9XjXlddDUOMOfz7uwTEbPV3nn7uPHHPqWyriDhWCZW9YirIDHhGbMre45Bmab4MZ/Qu8KsxOh5smaHZM6jonMf+/rPYtIfmUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784880863; c=relaxed/simple;
	bh=ZpyrfJVpI+4wvidoxJinuf5L2oEuDqbedt4epmSDiYU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uv3M4s8x7FqoJYKKnT5a0FdwaRRm27jem7NLU/1mNjozs3boX8Fi7rPznULEXKdFWyKlaE0KnCUh1nppsgN5tvpjswbCFpv02+bMnDMYhLoPzLvkUKkS/E/f7gsKOG5AxvYSl3Q0hsXRgzk5X9PgBpOxvZkzBRGEYIUZvBQ7GIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Afkd30yc reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Afkd30yc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ln67Htm1RHSf1+o6iyUHLKpwGfpQlNzICMLc0dvhi+yjV5EG7Gmd8BzlsCQfDCzQCxMx8ernzbRlD59VJyUD+4K7eCaD44W0yNVpBlzGvBnF+Zy6M2aoh7SpL5MbyOXR/s6raQnNz1+PRkuoTwAXzL/WRZAwQ1CR6Bx2LVK7gDUt8OgtF8SSgwZkAIMJtZzDSgpaZDuBzHXHM8KtLzjtCV1+hlOHHWGgdw1t5+KSpnPcupxFS52CMm0b3J9Kgj8ZWVDoRZhKDIz4BII2AJz6gFDvalJxP4FBtqGudnRcvbxAZ4jY24L8Sso3jNj34+4Loww4TdON+R+d0hXOwScV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GY1+F3Qg7Hg6CcKSLFRzwSd84vIjm8H+qHuEadtkpQ=;
 b=IfABbfPtqrwAV0p/+V7/GlHPqK4GcnCyuUV8pD/7tfUCg1rd/5o5CEVwkkiONX30u8jAO3EDhYZPPzf348vXkPN3OE9TQDsGYEDaWB+cE/3L7puZGRZUKhkef65VYcTcH6YccZOAGtfqcdOfDFB87P2sEUb9XFU0KrTIfmOQ8JeuGLj3chudJnAxi2QIU+ghjIofsI2YK/eN3gP7XfGvJrFAiNhvc4he5QJAOjVyenFSOIY6j71KC/cxDrOm7wbirvf+ZQqgnpiBAtjxmBV1h5Kf+DgBysI+v1Z/bP1EUps7knD5F1Tfx1oZZw2pwQFxXy0miv7AY0fKXsNfvRDcHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GY1+F3Qg7Hg6CcKSLFRzwSd84vIjm8H+qHuEadtkpQ=;
 b=Afkd30ycjyaRKCrC8XGlD2XMvHfwNf0ZIQOQ6PkNVnsvE4sf4Jpzoxc38s8XWzjzQj4XCJaWA6K0RzSCwnPjaUcWLKhX25pcPKq0WL5I6T4UtmUv5LIaAlr5uMY6B3qCyAtvQLfguzJHkVE43CmnG4IqomPBz15mlR+Mt0X36pjbopYHpCKw8yjePweGCXUIycpDnx6ybWEdEqYsB5KASeRaxwzn/jiD/VlmVj32qZx/7Ay6/UMBTsM8vXsHQzNS0t6bXW9QV/10ONI0T9DhC3aILlNhlYWjwGpYKeH9qn0s1iCUinth8bBP+5z4IzAHvAYUCkkY/x1XvaYu93GIoQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB4800.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:181::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 08:14:16 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 08:14:15 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>, Himanshu Bhavani
	<himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 15/17] media: i2c: os05b10: fix negative hblank
 calculation
Thread-Topic: [PATCH v3 15/17] media: i2c: os05b10: fix negative hblank
 calculation
Thread-Index: AQHdFvGjuU8HH43GR02FGep0S5H0ebZ5FMIAgAMyaeU=
Date: Fri, 24 Jul 2026 08:14:15 +0000
Message-ID:
 <PN3P287MB182958D3F8AF1B3980B863CF8BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-16-tarang.raval@siliconsignals.io>
 <178470085696.3005206.11254594678743972885@freya>
In-Reply-To: <178470085696.3005206.11254594678743972885@freya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA5P287MB4800:EE_
x-ms-office365-filtering-correlation-id: ba020cf5-c185-4ff6-fc3b-08dee95b8d8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|366016|23010399003|1800799024|38070700021|22082099003|18002099003|3023799007|6133799003|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info:
 NB7Zei+7dJfOYblZgdjK7D/eHoQgZUYPgrqUCES1TdIKD6EnPv4zRHfAeMQd0ig7OjgnV3Bvgn4t3HAHWrPXb4lqFPG7fUdxGJtmk1LiOwUVqz/oO5dMMdfvIVrTP3mzv9m7ooTUjEPEvBrMSft1xELNDRR8v4zY+nOfDkzHPF6a8q3qRARoE8EA5DCHDWbDFA9DKw6oXqB5o+WJ9XUdt5i5vEaB8JtOwPat2b2dahX9OuNipuMjrfFD7sv1g01WfH0IVoOgnjfHI5vTWr/IvaBhxeUiTXXf+FygPy04qXYRSSaKNi9tfTF1wYJOrj8J4l25QZZkJIDfvixGDXokG2F2xwuczmrDEthn++aH7Ze1J8eLX/UaBfQbRVYDwfiWR7PKLC7qZGfhISGzBdOqBEydBdA/01mE+CUF0LIp8GctPUrVjCLKXppCRmd9BueNGp70cbSeYtxiD+35gwu9DNnQSYXZIzJk7MBhHAW34o3fBNf4GXYIH0Seb4yWbNEETZMIgVq5b1Hx5qNqH9j+FcO0d/Y9b/jK849gr1jHZ0B9wsGef0DmNFO1MEmt6vweN63IKI5L6ACi0DXPKdk4/Qn1u2Up802LuOKn/u2GGrm6PJE9v0DX30ZwbBStnExPGz9Xm4gY85e/0/JGiol3DciQWYRJj/kwRO8rD+aS5bcOrn/oF6It7s59kt/l8INIFvhZUXq1FipBqfV2pYQdaEC/MVUeVdCQWDGqgo1IpdI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(23010399003)(1800799024)(38070700021)(22082099003)(18002099003)(3023799007)(6133799003)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?NM737wfYW3hQ+tqyveYl7fMcGSw6ipXlNAwWCUH0GJRjvt9QdUoVc55x9e?=
 =?iso-8859-1?Q?3JeEKwzplXPAvvfak4bb9x2EDeqv1dNJrurHmF7QYYNzHxAKiF5l0TEgd+?=
 =?iso-8859-1?Q?HbzalkgnEeRgz0hE6nFQAicO7eiAcktIa9sHegCR3lBwbN5QSSWNLMhRDa?=
 =?iso-8859-1?Q?iwIu7/dx+vCCeEeacvnZgmdH3d6Xv9wt68LRzSpfPjJvLtwNz8gfb53/k/?=
 =?iso-8859-1?Q?v7sVgJTe098L3TgotI+Ul1XpaewHwKaENth3Vad222fXOLxlQFvhxl7JDk?=
 =?iso-8859-1?Q?2yZxLlizar7JTWCh1b7e/ZkjYELKb4FZ52vZ2iOcUtXC4EIndbiCE05D4J?=
 =?iso-8859-1?Q?4sVtDgsKc5KaR8PUCetloZ0plre6t5wR84SdbskG0WO3YvaLwRnCAusGxd?=
 =?iso-8859-1?Q?M/E1x5yjAjKEHwP0Dc2QrMN07RtQ498iYYIKv/c7AUynKhGrcpwLm06Igz?=
 =?iso-8859-1?Q?jDqOUC7W8QkY4NY4XxY2O507OTI/7DvQuqWkVBWc+n5FG9IAK71GCP+77k?=
 =?iso-8859-1?Q?HWGOtmu1Qi6vYDdSceTTKV8jDjy+KQLtPdtuqshWcbqUrm9qbgLYZGoGn6?=
 =?iso-8859-1?Q?2apVwWaV7lAWmtX3dLfbRQW+OsBUJFLhXwo8EHH4F/hzCrsm8FrG8gPZq9?=
 =?iso-8859-1?Q?216zBt7RJBovS90HY1KS4KgyVcF5jb99YiBJvdBkpBsNvXYKeL4oOwjyw4?=
 =?iso-8859-1?Q?LEgwejYWT1+UjrLJ+NFhB90fT6TxtD1xVkjPbMl4IZLrlJMIybHEEnRdfz?=
 =?iso-8859-1?Q?jtXKZLiCqnKmMjIo4Q7a4uuSANytu8saKV+N2jN69U+NkfGU+I4FVNE8Uu?=
 =?iso-8859-1?Q?lhcwto/VaROer39UtUgwgdU9D8A4MudYW47GzCNPGrOXrv1Lwev6I48TDD?=
 =?iso-8859-1?Q?Dd5LtlZwGIyjnn3KSFBnDrsV2+7ELoIMe8KchroY16Y4GrEJ/9FTOgkslq?=
 =?iso-8859-1?Q?+eQGQr6tVCf7HuiSwP6qcn3RSuM3krC7d5O4MhuSM+9/STGrWBds3IEVid?=
 =?iso-8859-1?Q?Q+af0lwiUw/Zyacs4XjUKApVZiJABQxX2C7Zg+PsXyLA8TcweqQdqcURwT?=
 =?iso-8859-1?Q?vYwIDrxQ6jOfARZgorGxVuHB7xTVWwtcEioSRBSMLKoN3d8+FH7ec6FLmj?=
 =?iso-8859-1?Q?YxH4o4kMqbfcpp1mxM0DvBxoFa782PQdTPRR3D4Aq+0mx/JX8Hd9+IK1ds?=
 =?iso-8859-1?Q?s33Vj4vQRq+23S5DL9HG+IMR1peR8PZmJN2h6XEb02xFAuM+vFg4cu42i3?=
 =?iso-8859-1?Q?wEUdz8IXBs/QeKEUqqEixr1QM/2j6lTGCyXhnV0N/lxHMaoPpEhtXglDsn?=
 =?iso-8859-1?Q?l3ylRK0rGSuJIs957XUEsJipId8RrjH2gsvn1ZCX/2pz1ypmYp6DJ4arG5?=
 =?iso-8859-1?Q?vvfie+BdJtsGJbSgWoWE9XHfeuWBb8n86ebaLYUTP4fjAabrTx1jgNc0Bo?=
 =?iso-8859-1?Q?o2wg/GM4TjiGGlYKBcq/LVs2qgDR4JS51JVzsUbrrlt1DF6+0v4r5I/Fqx?=
 =?iso-8859-1?Q?4WeuFnfZdp3AUgsDEZJteJ+6KS8P1+y6ndc2rlZFMvH/0duNxdWfJ9FgMH?=
 =?iso-8859-1?Q?ME6p6hlMHxzfebWFotip/UHSNn82OkfjfYrRknqRKLEsMnoqJ9WqCkUaEA?=
 =?iso-8859-1?Q?539pUz5D4HPdriXkmkky1tb3/uCpUO1MzaMX2lCkUfivI+IU0v52adjZDS?=
 =?iso-8859-1?Q?B7kPhZa8FBg3AKldxkznsKiledlFSE5wzF04YzLrexVUlLxWt5aM2/DQlN?=
 =?iso-8859-1?Q?er6GTxS0b6iF4Vlz8e70W0cAyV19MZuT0EsfM2VeoClR/HAE5yDAV2Busd?=
 =?iso-8859-1?Q?sFQBlHwdmVeUZeR1TEh7WjxVClhCc9UpSKm0nQmkv/Ji/KOep04o2a/jMw?=
 =?iso-8859-1?Q?3q?=
x-ms-exchange-antispam-messagedata-1: dBFiI73EfClbDkeyfflqVptK2cDFNcg0cq0=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ba020cf5-c185-4ff6-fc3b-08dee95b8d8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 08:14:15.9047
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OmsVt46wGHopbNp8bj2uuGQF/vCOtsWgsORXkfBeHxciDkmRcJEUU5+nVjHoQMqRm62QLlsL/A0caRJ91kipTMnyMOO5gjc+hzQmdpAes+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4800

Hi Jai,=0A=
=0A=
Thanks for the review.=0A=
=0A=
> Quoting Tarang Raval (2026-07-19 01:39:06)=0A=
> > hblank is computed as "mode->hts - mode->width", but both are u32.=0A=
> > For every mode hts < width (e.g. 1744 vs 2592 for 2592x1944), so the=0A=
> > subtraction wraps in unsigned 32-bit arithmetic instead of going=0A=
> > negative. That wrapped value ends up in the control's s64 min/max,=0A=
> > which v4l2-compliance flags as out of range:=0A=
> >=0A=
> >     fail: v4l2-test-controls.cpp(413): returned control value out of ra=
nge=0A=
> >     fail: v4l2-test-controls.cpp(476): invalid control 009e0902=0A=
> >=0A=
> > and v4l2-ctl shows:=0A=
> >=0A=
> >     horizontal_blanking 0x009e0902 (int): min=3D4294966448 max=3D429496=
6448=0A=
> >     step=3D1 default=3D4294966448 value=3D-848 flags=3Dread-only, has-m=
in-max=0A=
> >=0A=
> > The same bug exists in os05b10_init_controls(), which sets the=0A=
> > control's default before os05b10_set_framing_limits() runs.=0A=
> >=0A=
> > Fix both sites by casting to a signed type before subtracting, so the=
=0A=
> > real (possibly negative) value is computed directly.=0A=
> >=0A=
>=0A=
> While the framework accepts negative blankings, IMHO they physically don'=
t=0A=
> make much sense.=0A=
>=0A=
> Many sensors scale their HTS register by some constant factor, so increme=
nt=0A=
> of 1 in HTS does not mean 1 pixel on a line, but 4 or 8 or n pixels.=0A=
> This also affects the internal "pixel rate" for framerate calculation.=0A=
>=0A=
> Please look at imx283, imx678 etc.=0A=
=0A=
Sure, I'll look into this properly.=0A=
=0A=
Before that, I want to flag something, I went through the OS05B10 datasheet=
=0A=
carefully, and it doesn't explicitly state what clock domain HTS is=0A=
counted in, or what its actual unit is relative to the output pixel clock.=
=0A=
The register description just says "Total horizontal timing size" with no=
=0A=
further detail.=0A=
=0A=
That said, looking at the clock scheme section (PLL1 driving separate SCLK=
=0A=
and PCLK dividers) and the register defaults themselves (default output=0A=
width is larger than the default HTS value), it does look like HTS isn't=0A=
counted in output-pixel units directly, so there's likely a scale factor=0A=
between the two, similar to imx283 or imx678's HMAX.=0A=
=0A=
I don't have vendor support to get the exact PLL divider table to confirm=
=0A=
this precisely, so I'll try to derive the real value empirically on=0A=
hardware and cross-check it across the supported resolutions before=0A=
sending a proper fix.=0A=
=0A=
Best Regards,=0A=
Tarang=
