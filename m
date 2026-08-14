Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020130.outbound.protection.outlook.com [52.101.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51DD45FFA6;
	Fri, 14 Aug 2026 11:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786707326; cv=fail; b=sTJg4RZ/YpasHqJyb2yD7JZNrf3wulLOWr4c9V39zttWT5BJOF4kUmtwyFFhOuu7GYwtKgshSsGz0Wx92Sa4PQU9jUescYxpFX00Tu9iyAZW5TAytGWSw/U0k/EzlOzHYlASlGTV11UbFiGihCkvZ5ezVjVEQAHYMRBFxj4e2SU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786707326; c=relaxed/simple;
	bh=BvZElXWUZYjpwSzNAD5h7Fo6Hwng9eHBJ2PCjhP74Yw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=urFDnih7Cgou7go9qvBm7YzrH+UUUf5PcBsotO2Ommu2nwD1XxudxKDANLZphYh1Z0d6izQrlkPD2y44voEaxPkPIu6OvTIwx2olPOQquIsadKSxT1uxPg17DP6j/oC6Ihz4BradKuZmITov2LZA8hb35Z3bjaWbeB31v+CAbY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=WshrAl2p reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="WshrAl2p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZ7h+Ag6q9ehYGaz4RpgoYQNz5LtyWb/QKxLwLZEOTtZbsSOTn5fSKwoeaHR7xu2VfSCI37kQ9k6v6MnA5j3xAyPSciC5T/qkgglvhk0GvXHzXvEON0jAWBYeFX43V2lHu882ThShJF070FkDHhNUP95vRl3q/4UscfFD8nqWlE+I0bOFMAwaYoP+sMZsyeNVFvvZEcrHuZy+dYBsWp42jb7wsu6yoKUnmq/1d8YjtCK5Ti1wSeb4rAAy1cFE+W/NVl0pKBDEvQZ2tFgzCcobLxrk2W5sFzCU4EwphRe1/befedlUGCr8FRODSQ9tVThkh7+Sqq7lflDHHviMHdtiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZbM8mqCd/n6ztTJbDEPh11chrJGpfoyay3BZdm9+Hk=;
 b=D5q+R1AsgBa1/+g+jgTBMVBL8AmIOHaWdTnI+/vE370UPBijBdk3ZzCAPiczlVHiOSh3MMZMQen/0FIxsDq+8F1VMtJJwjWK+EHDe28gYpiScew61Nn747QbqB1nrAAiqyHEqADHfc7QAke5rv1d/R+3gHZbEGxYM+XQuhCAVeE1EijCa37AxVUBPT49TIczYUe4W8iGowXK/sRsmJqWx/9VkWoWPXY6BXg9bWhip1WHidsal5di5WVw39d87WTU2uGx5mcloNAEhBEnLsIZi2Z6u2j5qAT1JpDTf9Pa9m6gey2YJ9fOaE2BX3gCdcuvpzOTxDs5eFiNUYKy20M8rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZbM8mqCd/n6ztTJbDEPh11chrJGpfoyay3BZdm9+Hk=;
 b=WshrAl2p+KWZtYnpQyUH/rsFFWG/aPI6vYZiYyasoVsvBqA2YFn0SJGLjbXoMcFPdKvD6NFRjZk95RXlampTB39D2KG5TgeB2Ukv1jmciXHBeLkDmrCACfKmwHCAmh+IsTEsaypPKdHMKY6CFlhM7+0xCdOUytdiVeoLOmvxWZE6sqNeV2oP0+Fm/Ul0dLnaGpvlG46BA+Vq0NGTijHL9I+YuemSxwNAGGGhmOOzcoLABKOwZqAzQvxYj7dRNP6Y0Bwl1VIQyoidxh9pf4MWx6SLt0/t/G9wAIDDsSCK8Wd7ziNb/VnYgtKaOn5lhUYgHBfoVjFzXgh+0SUbsYBwRA==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB0249.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 11:35:13 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 11:35:13 +0000
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
Thread-Index: AQHdJZuI/Y7nmH3ipkS4g472TIaz9raSKcaAgAZub0iAAWDpgIADfT2S
Date: Fri, 14 Aug 2026 11:35:12 +0000
Message-ID:
 <PN0P287MB20192F0F48C2E2A29481DE549ADA2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20260806120216.24145-1-himanshu.bhavani@siliconsignals.io>
 <20260806120216.24145-3-himanshu.bhavani@siliconsignals.io>
 <178608605778.4139729.11308202650136036897@freya>
 <PN0P287MB201968EA50C12E941A58AABE9ADD2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
 <178651541361.128734.17813607544541448526@freya>
In-Reply-To: <178651541361.128734.17813607544541448526@freya>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|MA0P287MB0249:EE_
x-ms-office365-filtering-correlation-id: 47fbf093-6699-423b-e883-08def9f81ac4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|18002099003|22082099003|56012099006|3023799007|38070700021|6133799003|4143699003|10067099003;
x-microsoft-antispam-message-info:
 j1hRbXJdQVg+yy2hu54mIM/xrDtMvEgIhgQbYbYm6SYSJtDRvx1gb+8Hv3aHz5uJaTW5FQxcNOBdIjDFI9iogKX0o2cJn52u1IIGiwjHCJo5stcb3XKO+KVFbCTurAGWmdBNRZzBqhyxl0Lbrjkroi4vcl+KKt13GI1WRdads9KHa0KxFNx3FVUUlM8Yvh7sTx+tsHuBH6dV0fAgU16mQ3v6L9XybqRsWPjqkh1PUeBBBY6R6Z6+MQCSOUBHlaGoUnTxeUnaCkmHGC1yM9Qo40OcZN0+ogBV/pRkWkmUbXS1QBaZtiPXjrsyX+NutuqL/fLEX6hD3I+n3NNiE7fiIhV39PtvPQlu65oHNp8ITgwhj1fFBP3DB7JnJ4nP7+OUOpqGc5FSO6rCfd0vVdI7u2ysMgwtRJEyAQRqUodKzBPBP2Z1M5zGUnx9PRmzjP8HV/h/gSTG7xB6TgQWWWRFW0w9gpRsik3TcwuklW7dsOyNScHXh+TR00+HgcrgLhTa6Bf51IRx71l1mftK8YLF/4nv55eL0tpF0qXHl0PVniOStCqpLbI2vzassYFqYayd8NVlvix4EjhZgg68U4lYPeOrQHiYe5O4dBSfJpZPeBB2Ab9JtYy6T16hBL6euTb1cx0V9zSBxICcRR4ZcqcVmomZJ96Au6xaETlFKhY/PPUVkmXF86jzq1I+seE8Kn/yPF35XcYvQmIS4mNrETxE3WBlIKSEh45ARVQq7qrJM6c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(3023799007)(38070700021)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?T+j49r8Kp5wZnuuPhst44crkaAL0qh13h7jgb35mWO8sotjhc/NgJV+j7P?=
 =?iso-8859-1?Q?oc+swo7y5JTuZVkWKy5UUma0TB8ecsbQnbR60DkjD04A/9C9sKWpn2EkK5?=
 =?iso-8859-1?Q?qLcVmr9J/o9Lv4oeHo89X0O4xZQD7e3ewXqp4Vyr374f2Ovg3IXimm2PXQ?=
 =?iso-8859-1?Q?8RK8vwBkcz+v2UVq5zaKzzu432zAFr1NPoZike4q6qXcTFWQp8RIri4EqB?=
 =?iso-8859-1?Q?MD4JRFpwqLvYFQ9X3bj62Ly5eVbH/T3svd5ONA1Ks/l3PfCNRC/HJQhWs5?=
 =?iso-8859-1?Q?CeGvTCKYQgA2d34WiHJl/J7oySzpSOek2qomKm8GwQWZjaDxnA4HwKc/bY?=
 =?iso-8859-1?Q?WjE8X3n0sxkPhRf14+V7QQ5cpObO2og07p5lcI5OVQYN2SvA+WM9DuTatv?=
 =?iso-8859-1?Q?x/c7WJmYaHIJZMAruMXkEKobOd794NO4mGQr6G4Rf4UELJW1GNZDw7iSlx?=
 =?iso-8859-1?Q?BCRAdix8mxksTIZPzywtU0AXjIkjz7okPcYkIpL82EgJlVJIAaKn4nKzFc?=
 =?iso-8859-1?Q?qlNmzJYKgoqfiOSrHHQPSci+Wkqv/BiXthW2woxsg6Q4XzaOL6ohAM01v6?=
 =?iso-8859-1?Q?sAS9itTUzQ1+NZGm+WZ82/+/P7FKGHOaRBnl6Ou5z3vPUN9ftRp5uz5k3y?=
 =?iso-8859-1?Q?aAhZIXKDa6GMPj1NEDN1PcmycWNBSAL7XcE/Vg1x/70jyQab+WTjSe2sA9?=
 =?iso-8859-1?Q?dK92kRjfBNXreaCUUMxlD6f4cd65Jq53Ovxlok/Ds8H+jUtQXbWT0HVtqq?=
 =?iso-8859-1?Q?9woDr543EETTcWfbjXl92zfQ+n/H1N3BfFB0nh458W/dghrWFZq35cMh2L?=
 =?iso-8859-1?Q?f8JMoeIunxKTQE1I/fns73cYZDYyQDtsmkzXu+uyK86rAopaIgdPyNNhhg?=
 =?iso-8859-1?Q?JfxC0nuScy/PvAmql2qeRSLGjaUd7XbedxMHyoYGMFDvDqoO9EZha6aCNd?=
 =?iso-8859-1?Q?PY+ihKS+wRIY00dD+sEdH3JLsyuquR7dWvCj04XCYqZNzU/ZFj6yQ9+Yq4?=
 =?iso-8859-1?Q?jNjm++VPy6aqLb2xw7IQo/Zpig0Ea58QCig5XfwlIEsdSuu1NmpcTYCk0x?=
 =?iso-8859-1?Q?T9Ox8TnF9wtkbASVKH5fck7yLt0Fau49YsZ/NxEWt5GC8MjvShZcaPeDf6?=
 =?iso-8859-1?Q?T8AIob15GukF79ujlHXn1ay1YZbBNp/qiv6PitlHXqIEmRx5KU4OLL0tQY?=
 =?iso-8859-1?Q?p+EbqBsCz5tCBGUlEf4nd8WxCLQXE5lOrzhfLtD63AA2p3m1+zKT9OkFX2?=
 =?iso-8859-1?Q?qLtpc+Z4q824mmwImGCFXJhCzULX9JXuJfeNiINOsm1NFL/k+xUm7RH0Pp?=
 =?iso-8859-1?Q?ljpSETd/a0jq5PwpMHRqoxOnV6t5dZWDhbFJSOWPlbXIGe7d6AUpr8Gx7g?=
 =?iso-8859-1?Q?im2o7i3AgeerLTFBiftMwYe75+Mh/jdJ5dGO6Y9Sr1jSQ8HH8iVGet+jid?=
 =?iso-8859-1?Q?qWO4E+0wQs9W65Hpk0DKG799LTFuk9GqHduskVuourcCjYEIPgiALSHfnB?=
 =?iso-8859-1?Q?sw+Wzvp9xPlaHKKOp8B6cqLvJ+dQIsfJaQS/MiaHPif2asW/ZuHVj/IsnX?=
 =?iso-8859-1?Q?OqJ8FC5/sIh8O6ajSUo8XDCfbEDVmrInzvxgOodlqIHk3FvJTZkSCuICts?=
 =?iso-8859-1?Q?Hn1k2hBRAffMxdh5JEUeRcBBM23jhCKAbgdvH25LnHFVGEZDq37DaqV2nn?=
 =?iso-8859-1?Q?SQC4GhBhwh6iOoLKRrM4Wk96qM/TR4zRbEbGNbapcT3Kv5pi7zDvn39bjL?=
 =?iso-8859-1?Q?2kiagnt9sp4TyxY90Rlg0/qbwsvL/3Hgq8Gc+f1YO+D2fjrWZCKa2IrrE7?=
 =?iso-8859-1?Q?OtnL6c9r4WkqNlbVGHHvsa2K7iIxi30=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 47fbf093-6699-423b-e883-08def9f81ac4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2026 11:35:12.9112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JvEEtWpxpxJRWxN+bp3VH6WBpvokGtL9i+czsWbFOMslREwBgd0SRW5SntPOmjdbZzns0dy6rUloaqfODr3Ym3fvK9d7kWSf+i/39NPJtVYO0Oq6qVTqZzl+uZNVupRX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0249

Hi Jai,=0A=
=0A=
>Hi Himanshu,=0A=
>=0A=
> Quoting Himanshu Bhavani (2026-08-11 14:44:12)=0A=
> > Hi Jai,=0A=
> >=0A=
> > >Hi Himanshu,=0A=
> > >=0A=
> > >Thanks for the patch.=0A=
> > >=0A=
> > >Not a full review, but just a few comments on the PLL programming.=0A=
> > >=0A=
> > >Quoting Himanshu Bhavani (2026-08-06 17:32:08)=0A=
> > >> Add a v4l2 subdevice driver for the Sony imx576 sensor.=0A=
> > >>=0A=
> > >> The Sony IMX576 image sensor with an active=0A=
> > >> array size of 5760 x 4312=0A=
> > >>=0A=
> > >> The following features are supported:=0A=
> > >> - Manual exposure an gain control support=0A=
> > >> - vblank/hblank control support=0A=
> > >> - Supported resolution: 5760 x 4312 30fps (SRGGB10)=0A=
> > >>=0A=
> > >> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=
=0A=
> > >=0A=
> > >[...]=0A=
> > >=0A=
> > >> +#define IMX576_INCLK_RATE              (24 * HZ_PER_MHZ)=0A=
> > >> +=0A=
> > >> +#define IMX576_REG_CHIP_ID             CCI_REG16(0x0016)=0A=
> > >> +#define IMX576_CHIP_ID                 0x0576=0A=
> > >> +=0A=
> > >> +#define IMX576_REG_MODE_SELECT         CCI_REG8(0x0100)=0A=
> > >> +#define IMX576_MODE_STANDBY            0x00=0A=
> > >> +#define IMX576_MODE_STREAMING          0x01=0A=
> > >> +=0A=
> > >> +#define IMX576_REG_HOLD                        CCI_REG8(0x0104)=0A=
> > >> +=0A=
> > >> +#define IMX576_REG_EXPOSURE            CCI_REG16(0x0202)=0A=
> > >> +#define IMX576_EXPOSURE_MIN            8=0A=
> > >> +#define IMX576_EXPOSURE_OFFSET         22=0A=
> > >> +#define IMX576_EXPOSURE_STEP           1=0A=
> > >> +#define IMX576_EXPOSURE_DEFAULT                0x0648=0A=
> > >> +=0A=
> > >> +#define IMX576_REG_ANALOG_GAIN         CCI_REG16(0x0204)=0A=
> > >> +#define IMX576_ANA_GAIN_MIN            0=0A=
> > >> +#define IMX576_ANA_GAIN_MAX            978=0A=
> > >> +#define IMX576_ANA_GAIN_STEP           1=0A=
> > >> +#define IMX576_ANA_GAIN_DEFAULT                0=0A=
> > >> +=0A=
> > >> +#define IMX576_REG_IVT_PXCK_DIV                CCI_REG8(0x0301)=0A=
> > >> +#define IMX576_REG_IVT_SYCK_DIV                CCI_REG8(0x0303)=0A=
> > >> +#define IMX576_REG_IVT_PREPLLCK_DIV    CCI_REG8(0x0305)=0A=
> > >> +#define IMX576_REG_IVT_PLL_MPY         CCI_REG16(0x0306)=0A=
> > >> +#define IMX576_REG_IOP_SYCK_DIV                CCI_REG8(0x030b)=0A=
> > >> +#define IMX576_REG_IOP_PREPLLCK_DIV    CCI_REG8(0x030d)=0A=
> > >> +#define IMX576_REG_IOP_PLL_MPY         CCI_REG16(0x030e)=0A=
> > >> +#define IMX576_REG_PLL_MULT_DRIV       CCI_REG8(0x0310)=0A=
> > >> +=0A=
> > >> +#define IMX576_REG_FRM_LENGTH_LINES    CCI_REG16(0x0340)=0A=
> > >> +#define IMX576_REG_LINE_LENGTH_PCK     CCI_REG16(0x0342)=0A=
> > >> +#define IMX576_LINE_LENGTH             6144=0A=
> > >> +#define IMX576_VBLANK_DEF              4387=0A=
> > >> +=0A=
> > >> +/* FIXME: Exact VBLANK limit unknown (no datasheet). */=0A=
> > >> +#define IMX576_VBLANK_MAX              32420=0A=
> > >> +=0A=
> > >> +#define IMX576_REG_X_ADD_STA           CCI_REG16(0x0344)=0A=
> > >> +#define IMX576_REG_Y_ADD_STA           CCI_REG16(0x0346)=0A=
> > >> +#define IMX576_REG_X_ADD_END           CCI_REG16(0x0348)=0A=
> > >> +#define IMX576_REG_Y_ADD_END           CCI_REG16(0x034a)=0A=
> > >> +#define IMX576_REG_X_OUTPUT_SIZE       CCI_REG16(0x034c)=0A=
> > >> +#define IMX576_REG_Y_OUTPUT_SIZE       CCI_REG16(0x034e)=0A=
> > >> +=0A=
> > >> +#define IMX576_REG_DIG_CROP_X_OFFSET   CCI_REG16(0x0408)=0A=
> > >> +#define IMX576_REG_DIG_CROP_Y_OFFSET   CCI_REG16(0x040a)=0A=
> > >> +#define IMX576_REG_DIG_CROP_WIDTH      CCI_REG16(0x040c)=0A=
> > >> +#define IMX576_REG_DIG_CROP_HEIGHT     CCI_REG16(0x040e)=0A=
> > >=0A=
> > >This sensor's registers seem quite similar to the MIPI CCS specificati=
on.=0A=
> >=0A=
> > Yes, you are right some registers seems to be similar I will address it=
.=0A=
> >=0A=
>=0A=
> That's good to know. Did you check if the sensor itself advertises itself=
=0A=
> as compliant to a particular version of the CCS standard? You can read th=
e=0A=
> below register:=0A=
>=0A=
> #define CCS_R_MIPI_CCS_VERSION					CCI_REG8(0x0007)=0A=
>=0A=
> In general it might help to take a dump of all the CCS registers to see i=
f=0A=
> the ranges given in datasheet match what the sensor's registers say.=0A=
>=0A=
=0A=
I tried reading CCS_R_MIPI_CCS_VERSION (CCI_REG8(0x0007)), but it returned =
0x00.=0A=
it is expected to return either CCS_MIPI_CCS_VERSION_V1_0 or CCS_MIPI_CCS_V=
ERSION_V1_1 ?=0A=
=0A=
I have shared you the minimal datasheet in personal,=0A=
=0A=
Could you please clarify how you verified the IMX708 ? Is 0x0007 documented=
 as the MIPI CCS Version register?=0A=
=0A=
=0A=
Because I tried applyig the imx576_pll_limits{..} PLL calculation and updat=
ing the corresponding registers, streaming works fine to me.=0A=
readback those pll related registers confirms they are set as expected by t=
he ccs-pll.c calculation.=0A=
=0A=
> >=0A=
> > >Please check if the sensor is CCS compatible. Even if it is not, I thi=
nk=0A=
> > >the PLL programming is compatible, so you can use the helpers from=0A=
> > >ccs-pll.c.=0A=
> >=0A=
> > Most PLL values are derived from the limited IMX576 datasheet informati=
on=0A=
> > available.=0A=
> >=0A=
> > For the unknown values, I referred to out of tree driver and validated=
=0A=
> > and assumed them based on the PLL configuration.=0A=
> >=0A=
> > Should I proceed with the PLL programming as it is, or drop the PLL=0A=
> > approach and retain only the CCS-supported registers?=0A=
> >=0A=
>=0A=
> I'm not sure I fully understand your question.=0A=
>=0A=
> If you can support more than 1 link frequency using the ccs_pll_calculate=
()=0A=
> helper, then my suggestion would be to do that, even if it's just 2=0A=
> well-tested frequencies today.=0A=
>=0A=
> That leaves the driver in much better shape for future (for use with a=0A=
> different input clock or frequency). At least that's what I have done for=
=0A=
> my IMX708 series, which was similar to this sensor.=0A=
>=0A=
> Thanks,=0A=
>     Jai=0A=
>=0A=
> > static const struct ccs_pll_limits imx576_pll_limits =3D {=0A=
> >         .min_ext_clk_freq_hz =3D 6000000,=0A=
> >         .max_ext_clk_freq_hz =3D 27000000,=0A=
> >=0A=
> >         .vt_fr =3D {=0A=
> >                 /* Confirmed values as per datasheet */=0A=
> >=0A=
> >                 .min_pre_pll_clk_div =3D 1,=0A=
> >                 .max_pre_pll_clk_div =3D 4,=0A=
> >                 .min_pll_ip_clk_freq_hz =3D 6000000,=0A=
> >                 .max_pll_ip_clk_freq_hz =3D 12000000,=0A=
> >                 .min_pll_multiplier =3D 87,=0A=
> >                 .max_pll_multiplier =3D 350,=0A=
> >                 .min_pll_op_clk_freq_hz =3D 1050000000,=0A=
> >                 .max_pll_op_clk_freq_hz =3D 2100000000,=0A=
> >         },=0A=
> >=0A=
> >         .vt_bk =3D {=0A=
> >                 /* here the sys_clk_div (IVT_SYCK_DIV -> 0303) value as=
 per out of tree driver they are using div as 2 or 4  */=0A=
> >=0A=
> >                 .min_sys_clk_div =3D 2,=0A=
> >                 .max_sys_clk_div =3D 4,=0A=
> >                 .min_sys_clk_freq_hz =3D 262500000,=0A=
> >                 .max_sys_clk_freq_hz =3D 1050000000,=0A=
> >=0A=
> >                 /* pix_clk_div also being used as an Fixed to 5 */=0A=
> >                 .min_pix_clk_div =3D 5,=0A=
> >                 .max_pix_clk_div =3D 5,=0A=
> >                 .min_pix_clk_freq_hz =3D 52500000,=0A=
> >                 .max_pix_clk_freq_hz =3D 210000000,=0A=
> >         },=0A=
> >         .op_fr =3D {=0A=
> >=0A=
> >                 /* Confirmed values as per datasheet */=0A=
> >=0A=
> >                 .min_pre_pll_clk_div =3D 1,=0A=
> >                 .max_pre_pll_clk_div =3D 15,=0A=
> >                 .min_pll_ip_clk_freq_hz =3D 6000000,=0A=
> >                 .max_pll_ip_clk_freq_hz =3D 12000000,=0A=
> >                 .min_pll_multiplier =3D 47,=0A=
> >                 .max_pll_multiplier =3D 2300,=0A=
> >                 .min_pll_op_clk_freq_hz =3D 1250000000,=0A=
> >                 .max_pll_op_clk_freq_hz =3D 2300000000,=0A=
> >         },=0A=
> >         .op_bk =3D {=0A=
> >=0A=
> >                  /* Similarly here also (OP_SYS_CLK_DIV -> 030b) value =
being used is 1,2,4 in out of tree driver=0A=
> >                   * But as per ccs-limits { CCS_R_MAX_OP_SYS_CLK_DIV =
=3D 2 }=0A=
> >                   */=0A=
> >=0A=
> >                 .min_sys_clk_div =3D 1,=0A=
> >                 .max_sys_clk_div =3D 2,=0A=
> >                 .min_sys_clk_freq_hz =3D 625000000,=0A=
> >                 .max_sys_clk_freq_hz =3D 2300000000,=0A=
> >=0A=
> >                 /* (RAW8 and RAW10) */=0A=
> >                 .min_pix_clk_div =3D 8,=0A=
> >                 .max_pix_clk_div =3D 10,=0A=
> >                 .min_pix_clk_freq_hz =3D 62500000,=0A=
> >                 .max_pix_clk_freq_hz =3D 2300000000,=0A=
> >         },=0A=
> >=0A=
> > >> +=0A=
> > >> +#define IMX576_REG_BINNING_MODE                CCI_REG8(0x0900)=0A=
> > >> +#define IMX576_REG_BINNING_TYPE                CCI_REG8(0x0901)=0A=
> > >> +#define IMX576_REG_BINNING_WEIGHT      CCI_REG8(0x0902)=0A=
> > >> +=0A=
> > >> +#define IMX576_PIXEL_RATE              813600000=0A=
> > >> +#define IMX576_NUM_DATA_LANES          4=0A=
> > >> +=0A=
> > >> +/* IMX576 native and active pixel array size */=0A=
> > >> +static const struct v4l2_rect imx576_native_area =3D {=0A=
> > >> +       .top =3D 0,=0A=
> > >> +       .left =3D 0,=0A=
> > >> +       .width =3D 5792,=0A=
> > >> +       .height =3D 4464,=0A=
> > >> +};=0A=
> > >> +=0A=
> > >> +static const struct v4l2_rect imx576_active_area =3D {=0A=
> > >> +       .top =3D 136,=0A=
> > >> +       .left =3D 16,=0A=
> > >> +       .width =3D 5760,=0A=
> > >> +       .height =3D 4312,=0A=
> > >> +};=0A=
> > >> +=0A=
> > >> +static const char * const imx576_supply_names[] =3D {=0A=
> > >> +       "vana",         /* Analog Power */=0A=
> > >> +       "vif",          /* Interface Power */=0A=
> > >> +       "vdig",         /* Digital Power */=0A=
> > >> +};=0A=
> > >> +=0A=
> > >> +static const struct cci_reg_sequence imx576_common_regs[] =3D {=0A=
> > >=0A=
> > >[...]=0A=
> > >=0A=
> > >> +       { IMX576_REG_IVT_PXCK_DIV, 0x05 },=0A=
> > >> +       { IMX576_REG_IVT_SYCK_DIV, 0x02 },=0A=
> > >> +       { IMX576_REG_IVT_PREPLLCK_DIV, 0x04 },=0A=
> > >> +       { IMX576_REG_IVT_PLL_MPY, 0x0154 },=0A=
> > >> +       { IMX576_REG_IOP_SYCK_DIV, 0x01 },=0A=
> > >> +       { IMX576_REG_IOP_PREPLLCK_DIV, 0x04 },=0A=
> > >> +       { IMX576_REG_PLL_MULT_DRIV, 0x01 },=0A=
> > >=0A=
> > >I think when Laurent asked to make the PLL configurable for different =
link=0A=
> > >frequencies, he meant deriving these and the OP_PLL_MPY value instead =
of=0A=
> > >hardcoding all of them and only supporting one link freq.=0A=
> > >> +       { CCI_REG8(0x0b06), 0x01 },=0A=
> > >> +       { CCI_REG8(0x3620), 0x01 },=0A=
> > >> +       { CCI_REG8(0x3f0c), 0x00 },=0A=
> > >> +};=0A=
> > >> +=0A=
> > >=0A=
> > >Thanks,=0A=
> > >    Jai=0A=
> >=0A=
> >=0A=
> > Best Regards,=0A=
> > Himanshu=0A=
=0A=
Best Regards,=0A=
Himanshu=
