Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020133.outbound.protection.outlook.com [52.101.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B4535E1A5;
	Fri, 24 Jul 2026 06:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784875457; cv=fail; b=ZICuZKqfamVSibRqxVzkaKnv0Ph6RxGdjYQQgf3y+pjX575epRqWBNc/NP3cyp313mhrLiChV8XTAGvcSBGKFwF6Zm9A+2lBd3B6S1SSQTxlvtdVbCbK/Kbr7wHuHZC9A1Ma/AhGkHxG3KZq2MeHpeOU6ypwKlc/EufmwWM3+YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784875457; c=relaxed/simple;
	bh=TtdPjaEKkXf+mjnLLaB0ioFx5Ivd0BgpnDRys5JJJjU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t/4f9JQ/iCjtNy/Dl87eV/LQjO88JrcxjXDqBQELq5PYydePl0XICJy2dgBLeQ1CwntnVDrrac54BGkYnbpASQZdD7yIBDrtQEfdh+/mRwVMiMeX6fS6xXy17NPamUZgjvIWDvhCUw8DoCV2FYeZxzykXwHJDqbHOHXtTHXW3C4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=RDYtyjd9 reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="RDYtyjd9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twP5DZArZ9uQRVFdwUM0RboN7zL8x1jvEFMHz8iyFMzskRiN5oSuoMx5QxBoh4twJ7n6Knj8ryDvL+lUcr7KQ7pNsP0z7sy6002jIVsK2LWKaqiHod7RYqmcT4QESqtFYmXU/8SK7y9H5Ur5ZgFI+k3TydAJ9aE3uO69YlVcuqgV7c1iiUBIXuiKp2aW2WuPNtvf763Oaah5FxUC5dKreiDOTe/1lZYuNHy2qwrmN6POrgAhPbjg8s/m4uiBmN84bcNODeaEpptRkUClWXJfWRu9/2Fra3130gXrJGQWL9eLoIISCc+1LB4ieHSezFDqXbtVVMKQ4yZ+lEE885uv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpQKfLBbjsoQckBhWxTUWjlZTWm9oM4c/hKOjGqyF7U=;
 b=d8hnGjCJukHQJBEgsFKbMHF2RPDjrTap94q9/zoVdyO3q4oBna8Aj88SQEcN487OlNdDyXsUUOKoei4wzmfUb9Anw7LANhXHzpB/1Ek0Pe/Lp+4+no4l1fy3tEY+0QdjAoFKRfsa38WMvKQev9o+cjWyIyvSFCUkMKB4AFKFBhL5V6DJnP4GaZjWg2sqm3WOtGao9D6a2HoVQ4PEAoZ5Myjx6dhCCUaZZfZMzf1ku8Nmz9/IIseTHFEVeh0EVn4fVKU3Qo6Qvqhtngt7mVfOjUH1B6ZZ0Q4qZHZHZL7K2Zl3IHSw/15GwSspySvDLLbMYORTmFTRG7M6OmXxxI6PVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpQKfLBbjsoQckBhWxTUWjlZTWm9oM4c/hKOjGqyF7U=;
 b=RDYtyjd9tHO2XF3VkTYjIgTIKnRT8YPKQDHL9ItkquCeJ9IWpoznmCDCy+azuF+JO4vSRQwGER3hielWabw2L4jqdy6hjy8CGwOzkVGflaIUbT8WixWhqNE7XieIUH2p7Qht08SOkrTvIsOt751y/LttXSP+z/FpkTNnkslO8h07xsJkPoZr60v73raCY9R7liqajp/idTsY7R6cy0QCJPwzCDrv+DbOQyM/WozowHQmoCWzPvFDUNmxXcgMBTgxrC2q8/baKZozWg6Cy4tHm2jIdAFFPxoC4KaoTfopQfQhNXn5u05UfDGPNuyt0VeLwaQhhUSGtsozA0EAkJn3WA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN1P287MB3680.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 06:44:10 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 06:44:10 +0000
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
Subject: Re: [PATCH v3 10/17] media: i2c: os05b10: Add 1080p and 2x2 binning
 720p modes
Thread-Topic: [PATCH v3 10/17] media: i2c: os05b10: Add 1080p and 2x2 binning
 720p modes
Thread-Index: AQHdFvGMLTjH2Ke3ok+Za/aZBrh3r7Z5EmQAgAMt97c=
Date: Fri, 24 Jul 2026 06:44:10 +0000
Message-ID:
 <PN3P287MB1829DAC0E55D7CE247E63DC08BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-11-tarang.raval@siliconsignals.io>
 <178470034863.3005206.5742979563537645286@freya>
In-Reply-To: <178470034863.3005206.5742979563537645286@freya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN1P287MB3680:EE_
x-ms-office365-filtering-correlation-id: e4959f73-1786-48a1-0759-08dee94ef7c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|56012099006|4143699003|10067099003|3023799007|6133799003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 dy/r21uLV46mCLeICWC3mZ0JmSy4cBKYkdvhcFBuu5Xj2DnSXWFQnvYa57MsVL0ScnbwiSbdXqhMSR+YLXS6E4d6wN0/E8SZmnHI4rUme8ZJ5FDm0Nn7I0iBhkgBISVVuKqesfcs2ZftDdyD2/+VSL+Gg8mGAEPJzXOv1aDVd7u32E9sgE2EVNMmYvkm0cUgWPp/IGLHPAbVdfIH8b9WxsmF+2vhu6f3OtubW+MRT73HjnNXBvy1oj2x/7DYDX641kbm0ahihh04Cn7UsRbZ1EurJ6Uuq2vM6eiVS1RNyuA2Y0BY6NIgdvxrpdUajcKtlRYdHQ96+F3pU3F2expFoMFG2bMXSfbW9bMRKJ6kWi+g7QKUIEsvtIrQTJsD4j6HmxRAE7VGdHh+VI2Xx23eBTWRIhyl1KM2t6flaIACjX3ndUEF1CUBdoBhKmZRJpPQSLNmniq8lThEmN/hJebExJCdcpNbvu41A/iA5rJcOBw1jhKZghkb3XyPkWPRwcw+SDATpHUXeUkNPNTKB/uRhIzgPEXF2kLqBih00x5gM2MXR6K1xV5iWk2D7edz9+c2C9V3RJG/TLGeuXBYe3y5ivmhdceicm9SN3e/JHnJ62xbNMsIcYh6WrBOP2R6ys8tRxFSu/SPXpZr4DgexfTVe6blXAzyy/elFqbFO07+wV6ViFh2r8loxIVnIi9H5UP7YwTgpcUe+q/lIO5yId4SaZtojilcvzFgBqHdURtjl9U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(56012099006)(4143699003)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6sRsCbWW6v7Dd48rYegQaxugv5b419xdy5hTu5Q338Ee9/N17Xhh3ujl1r?=
 =?iso-8859-1?Q?SqNi7JuyUdH8yNsGyB9LtRyk1uJ2aBqCF18YtFd0llO/LkvPMYsG4Zzwqw?=
 =?iso-8859-1?Q?n+WNK7bUvIwo27gwWtgx0Q0knwp/w3DPobof1zroddne2U5wSTGj9Tzk5X?=
 =?iso-8859-1?Q?CP7MtmHJXlPogCIx9DoIscEaFn3RUR7lauAj0SVlsAU5BYTg4i5VpbS9fH?=
 =?iso-8859-1?Q?LHedpKcTjzqV0z/zyqofRx/YqGrkkbVuEO1CevgVn8yWe1lPAn4TeIBWrF?=
 =?iso-8859-1?Q?2wk+nBw+61rV/vlHrz6DfTcThyXcH5yXvcT2wnqJQLuWD6mL6IYGayAS5R?=
 =?iso-8859-1?Q?HA4VAhGaDxzvo07XT6YJswf1ZUFRVW1Qw1Lo5HCOJZ0oeUIp6pF57dztx4?=
 =?iso-8859-1?Q?Jqyt+sqspGp4v+Z2TNhHxTiaeKGhISzZbe0X25FUK98lI6cDpMmOWaAPCj?=
 =?iso-8859-1?Q?9kuhYOoeqpTWFEJEzq989jRwK37cpdZ0t5dEnchKagGYvtPrkcLUKodArg?=
 =?iso-8859-1?Q?4BdDmv1+MZbYStAUwXSEodmn9J8JyGIdzYXpaF6dkIPb37NWNkSiOxSYAE?=
 =?iso-8859-1?Q?FJxroZSlhGlpv5jTjsDPHLc+3KA7H8v7B0RD3jPtRKkrXJx9LeEMR4X2DB?=
 =?iso-8859-1?Q?IND4DEZ4+z5+G2skwsfJGFkRwCwRX6BFTkPY9em6r+a6cm8sv955Gg9KfV?=
 =?iso-8859-1?Q?sTSbkxif+Ja3vZxT3PU19A4qdoL1FvlecVGKIUE2OROUWZIm2TNafqHibb?=
 =?iso-8859-1?Q?rPEAVdVlLeO5RrDu+FwBYKRnDL/LY3tK7o+0q45PGDAHtUJAE719/3B+nD?=
 =?iso-8859-1?Q?6kw/ctMe6YT8vCv3qYN6vOT/fyutaItbHTP5N4OGK8LwgP21PwNeprgyQm?=
 =?iso-8859-1?Q?+8WJUltDMdZ0pMhWJr2/lOtbsG+1wRrdFkY+8uT7eqZSmyZwyzMo/JvlLX?=
 =?iso-8859-1?Q?N4qlPxletUBkzu3wb47Jjo608i9mZD30tfwuST/cHf3yKHVUq3d/XFhg4Q?=
 =?iso-8859-1?Q?rb1tcTvSWUs2YkARRgvUeAb3iac7+s8CompO5j3SuwJYTt2TL2raxWJA4a?=
 =?iso-8859-1?Q?0SVAph4wzvf/7undbxCOQHKIBxMZUo2zlBW7h8YdSBHvSjFMMhKPOHEdgD?=
 =?iso-8859-1?Q?kr30/ln5gdScj5MNDxo94aUwsQ5LTzo2f1CA2i6mcGOkZZ6AKZAxOFeW0x?=
 =?iso-8859-1?Q?Wj1lkN7dFUmzuR6/uQS5x903qDZ5WC+4DEX3m7nOj5l8Ot552APZeO/kNi?=
 =?iso-8859-1?Q?4nCGzvEQqfwzuD3/G5LYxDg9rcqCaZ/dS0alXMUoB7OjJmZAMSzpLaNWUL?=
 =?iso-8859-1?Q?jBTTS174wfmQuV/5wegMWKMOCW3IqKyPANfCpKdKupncLhRWMhgHHZcqQz?=
 =?iso-8859-1?Q?+/5yqSafI0sPHHjozNz973NuXPUqNpnffig3FDZ4P5xf2h4iD/S+X8d3n/?=
 =?iso-8859-1?Q?1W4TBKw8CgI+oKsdv7hqzGEqYqJV2wlV5itUlATrZs+xLuyrglLymjNxus?=
 =?iso-8859-1?Q?kMdVJIvBYSiZxT4AqXc8AOH7zDRD9JBMJFcl/jnhZeW59jndQW1uY7BqBJ?=
 =?iso-8859-1?Q?oflDmpVWnm8c+fKBWizG8xHj/mjzYvyaRtwqb49xwn9rG+6EO8STcQRAce?=
 =?iso-8859-1?Q?2mYuuEPvpbINP1y2YeKgqTjqYA5P/PNyc0QfLp5l9vxCm2HyMQne0p3wGJ?=
 =?iso-8859-1?Q?YwZMn6TJ58ZlgfTUxVDBu/Z7NPvKywv19thWIqsCZgMdc6uO1qH73AfUiH?=
 =?iso-8859-1?Q?exJPFNJv1HEeyFUhuddu24wuLjVV9GDbaJKdL4NNHBnhhoUzmn7HR7wy+x?=
 =?iso-8859-1?Q?998cwfPOTBh7CxOdKPP/270FdoRvJ5AlcRc1wMV+q8Gt4B3aT7Va7YuHWY?=
 =?iso-8859-1?Q?W8?=
x-ms-exchange-antispam-messagedata-1: Ci+47mkCvkhzDa7Cc3gt6r0gqwn6SvBNL7A=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e4959f73-1786-48a1-0759-08dee94ef7c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 06:44:10.6167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2DZWGWfaX0sS2dVXuHYCYntpc8ICYZjlbsD0b/x+XrcAw5RM9oncJT7FudozjfBVTKVbMItBo4BMy9SKnIDyaFjHN91Np++6njIbYoKt81c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3680

Hi Jai,=0A=
=0A=
Thanks for the feedback.=0A=
=0A=
> Quoting Tarang Raval (2026-07-19 01:39:01)=0A=
> > Add support for 1920x1080 and 1280x720 resolutions.=0A=
> > The 1280x720 mode uses 2x2 binning.=0A=
> >=0A=
> > Both 10-bit and 12-bit pixel formats are supported.=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> >  drivers/media/i2c/os05b10.c | 120 ++++++++++++++++++++++++++++++++++++=
=0A=
> >  1 file changed, 120 insertions(+)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
> > index 3fd788bd8b20..c54b466656aa 100644=0A=
> > --- a/drivers/media/i2c/os05b10.c=0A=
> > +++ b/drivers/media/i2c/os05b10.c=0A=
> > @@ -460,6 +460,78 @@ static const struct cci_reg_sequence mode_2592_194=
4_regs[] =3D {=0A=
> >         { CCI_REG8(0x4837), 0x12 },=0A=
> >  };=0A=
> >=0A=
> > +static const struct cci_reg_sequence mode_1920_1080_regs[] =3D {=0A=
> > +       { OS05B10_REG_X_ADDR_START,     0x0280 },=0A=
> > +       { OS05B10_REG_Y_ADDR_START,     0x01b4 },=0A=
> > +       { OS05B10_REG_X_ADDR_END,       0x0a0f },=0A=
> > +       { OS05B10_REG_Y_ADDR_END,       0x05f3 },=0A=
> > +       { OS05B10_REG_X_OUTPUT_SIZE,    0x0780 },=0A=
> > +       { OS05B10_REG_Y_OUTPUT_SIZE,    0x0438 },=0A=
> > +       { OS05B10_REG_HTS,              0x06d0 },=0A=
> > +       { OS05B10_REG_ISP_X_WIN,        0x0008 },=0A=
> > +       { OS05B10_REG_ISP_Y_WIN,        0x0008 },=0A=
> > +       { OS05B10_REG_X_INC_ODD,        0x01 },=0A=
> > +       { OS05B10_REG_X_INC_EVEN,       0x01 },=0A=
> > +       { OS05B10_REG_Y_INC_ODD,        0x01 },=0A=
> > +       { OS05B10_REG_Y_INC_EVEN,       0x01 },=0A=
>=0A=
> Mode-based sensor drivers are the last option, especially if the sensor h=
as=0A=
> known registers for configuring the crop size, which seems to me is=0A=
> possible here?=0A=
>=0A=
> There's the new common raw sensor model in the works too, which can even=
=0A=
> handle separate userspace configuration for analogue and digital crop,=0A=
> subsampling (INC_ODD/INC_EVEN), binning and output size.=0A=
>=0A=
> Could you please explore that? Adding hard-coded modes would make this=0A=
> driver a mess when we move to the new model.=0A=
=0A=
You're right that mode tables aren't a great long term fit here. Looking at=
=0A=
the datasheet again, the analog crop (X/Y_ADDR_START/END), subsampling=0A=
(X/Y_INC_ODD/EVEN), digital crop (ISP_X/Y_WIN) and output size=0A=
(X/Y_OUTPUT_SIZE) are all independent registers, so this sensor should map=
=0A=
onto the new common raw sensor model reasonably well once it's ready.=0A=
=0A=
I've actually started looking into that approach for os05b10, but it's=0A=
going to need its own series to do properly, and I don't want to redesign=
=0A=
the driver against something that's still moving. So my plan is to get this=
=0A=
series in as-is for now, and once the raw sensor model work is finalized,=
=0A=
follow up with a separate series that reworks os05b10 around it and cleans=
=0A=
up the mode handling. Feels like it'll be less churn for everyone that way=
=0A=
than trying to do both at once.=0A=
=0A=
With that said, I'd like to go ahead with the current approach for this=0A=
series, and pick this up separately once that lands.=0A=
=0A=
Best Regards,=0A=
Tarang=
