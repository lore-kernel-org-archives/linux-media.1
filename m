Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021088.outbound.protection.outlook.com [40.107.57.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B19F43CECA;
	Fri, 24 Jul 2026 14:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784903430; cv=fail; b=MDHrePGqfsOua2ICEMOwYQ5rqyfeZHo5r6UexU6IiBlYt4WujLHKHqFYtreQCcNpMGj7X/ptPpPpFm7R0AXgYIbD6G5/cb4xRB1tcoalMQJw7xmWtO+Y5t9BN77/72zE1+6xVrLfMpuGtbKhrqDSbCBCaziEVhl2oLKpcIDyNJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784903430; c=relaxed/simple;
	bh=ii4Ur1GBvFEpJq6CzHXoP96rixgHus8jTR9pxG10OUs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uCNKnVc/k9tartZgdrHRy5LmljMFMIpkuE4v9aei0Zj9vPotd7tg1MQYrH4hlpvSevB8yZQi1Q9NkCYnTZBLmyCnjPGJ6Dtn9D+BX5FGWmiMuVEJkrmeoHgLu+3R0CKnJUZF6rY8d08vrpZCmqDWdPWSM8Job5Fp9OaejqTqISI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Dzs+7Qoa reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Dzs+7Qoa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nO/iN+sCRkNORcIqlzguPkR8F8XrsWtKVEiCFnF3F6sQ6HWvCtc045hRbm+Sauf2pT4QlblpxtqQ2xO5OTpjCBRJAQXDDDUdZDfcgSNJSSFlBxGejN+qVN858I6/UjXKelSFBYLx+4jyd64+8ckSfuCHDNSADiLPxiwe5kdrRLvEHmhYkmAVOPAqcQLD2lYhWjPKxZKz2+palsXAeSuwv3bF2ew8g9wFFU8RDXM9uyKZk8WLBZut2aWMV4ga5ioWc/YIP/G9RIlfhk+vdWHiCibSgY8csi4l8SV9NLkXHsj8rtNmpteVHUydFVIt0M75edHhpgSIpOBPO0LN71glwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgtwGLS7Mh9ZKUXZnfe38jOUmTw+vCrmBoueiSMshkg=;
 b=JyWrbWrlmNzX3dOMYaGKqpv+GCYGtyeSVPFYf7eJgoyTFZT9/jgEzytqf5Z4yY2QIJt3NLME9LNebSkcTpiJ5cBR4urOkhcFFe9utvWQY4McqPUw7pG5SzIFmzEnd+/jKcHzTgLB2A+wtFnPxfHc7/zz7uk/18deIhSP6m5bWSBS8tWqVfKE6N6RgWX9xNU5wLAwQTDXXUAhj7xgg/oPYvJCZN6AH7jtYEnPaO2+UnIx8A13MTbmIvUhC6OkL+ZE7hMQWL/xWYjhKZzWnqA0rauk0+K2VrXpoUtJcara6NghmbxwzTdN8VnMyu0s9BmDoYM5yYjxErrBHXOCRhv1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgtwGLS7Mh9ZKUXZnfe38jOUmTw+vCrmBoueiSMshkg=;
 b=Dzs+7QoaTvLjzmNplhOAGIpAqozW7uMA7I2P8g1coXRvCe3RP017PfFZdhC9TBtlrQwcU8kdxrd3j2PG7qp8W8w4Qg3m+LJmVLWZRF7gENtJOB8znHPnZYoZrXSZ1OiE0kInQpmc44CLfH1leLLvaE5i6YzmGoobLLIZgBLEfLNrQu1qeJntU/PD9VKypmepfh+0BF9dNIKJAjef6hSAjLOG5m+UH5MYFE/SDQIYdP8LJ0tYK2tMMEuD1ew97zwsWHFC4yHq8gOik3oknQ026kLAsGEjZMwHV3bWDGjxPCkm0YpMN/STZuZ2FQ+dzwlSoXsksybqy56jsbanniC+JA==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB0973.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:131::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 14:30:23 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 14:30:23 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 08/17] media: i2c: os05b10: add 12-bit RAW mode support
Thread-Topic: [PATCH v3 08/17] media: i2c: os05b10: add 12-bit RAW mode
 support
Thread-Index: AQHdFvGB4dHEkpHqIU2fXrPHZnutebZ8vfUAgAADIvM=
Date: Fri, 24 Jul 2026 14:30:23 +0000
Message-ID:
 <PN3P287MB18293F9ECF5CB92DEBB6C9E08BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-9-tarang.raval@siliconsignals.io>
 <f9ba3d84-2bda-40ec-8715-fa8d7ca2880b@linaro.org>
In-Reply-To: <f9ba3d84-2bda-40ec-8715-fa8d7ca2880b@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB0973:EE_
x-ms-office365-filtering-correlation-id: d681e79e-9e06-459b-b4b1-08dee99018ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|38070700021|6133799003|3023799007|56012099006|10067099003|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 EObaPDoDkCsxWJO+UMQ5lHZIkkSjKgDapYIuaGGdCruGJqLzsPmee7AIJJZ2BcqyjEIQO1P7YuTbsUN9XaQ05kLhudrfOAGILsi+cd6DMXP8z30itbco6CoeTwOvUas8lME27UeVpcEtJB71wa+E+4sCTdCZ0rVo6C51GavvcGjtLihm4+wsihoT/mRJQBxx7o/C6C0xjsp+ZHaEZLUTEAubeg8/ZayPLQk3Du6vus9BLYXzma1105IJXO9zMfzt9hjXogx4t39F6D5FMIiFQQ3hLLh88h9C21g7ndIDOcIAav4OsqiOhfRLNi+0bh/1rVyxXPiKDDHuIYD6ElqHEDkptPyIkcw7Htg2SX2x5ysXd9xiZy18G/jy2iaYEFQF9uC80VSLR1tvv8/xsqIyXkbmQooGV+uNpMl1fQeoAYTKPFcw1CD6DDwDIXdlCyoBwYJv/LgYpXNRAC8l5jFsgqEGIIOlwhoc0L7cTZlbLlmY5GztBPO34iA0uFN9nRkltCq1PaaW78mXzVi0OdwsEHgKi5Wgp8+V3m/0inNaahjzGWDxHUUHqkl0ZCZb1DnCDdLo7HY795RnISiXTqFMwooFPsPlJEqnu6niaqnSq5hbd5Zgq9/bGQdg2wsFz7/R3EflbYhleUq5Ymhbw6XpalwcuHtiiYU3kd2oqHMXI2A6TbKpDawRp/I4drXpj7FoEsmyuyaO6G3c+XnkkztfE5Dspnc4vOUTIsTaiUeUXt8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(38070700021)(6133799003)(3023799007)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yPgR7//taGSP1SFzD+u227Xsbek7S34XJzud7ngWR31135p0zeHNpPt1Pn?=
 =?iso-8859-1?Q?1UdCji5NgmAYoOPyYt3SqxV1YLJbHUeECJq4f2GhqDNbbYFdeJVXHT9uOR?=
 =?iso-8859-1?Q?RpG9KFI8wdx6+QUdNvYs8kNk6hFWl8PYoEZBzmMrRHZ6rylICuZCC4HyNT?=
 =?iso-8859-1?Q?8dP8k6KQov+aqZoZwy5NQqeUrQiLbsUl2Sfg50yOfVLGzjW2DQqCCy8GyC?=
 =?iso-8859-1?Q?Qml4qhOpBLXj8EdCQ3f364WrlOxb7OovNTR039IONy+uNQvNcTABrE+UED?=
 =?iso-8859-1?Q?j0Gfr1lpTwYkD9+F3/xD874Qt10S/deBTN0hl8xrNP2NSVeEnDXojiBvSk?=
 =?iso-8859-1?Q?Q8ziCk+nqW+OHnqHEi/bbhsZEKzRPMptR0EzL9c/bpAnWWgOGqDC1rIAUa?=
 =?iso-8859-1?Q?d9ZBDasFxqFJdB4hlUdgfXjDI9sS9jZHsihfZz9Lj/YNOFHJOYh0dVwwbw?=
 =?iso-8859-1?Q?oMmc/EFJasNdBw4fcbuSbofRVH0GLnhGPYf5wtwM+yuX3FY7KpMEEWtSDM?=
 =?iso-8859-1?Q?aYdH+zSNowz7setCpKZgVoKBTgT5PHlGZmpxiTIR/NYav1HQEUOmsvROrf?=
 =?iso-8859-1?Q?REMI2at3+yh2FiyUaDfR5EVgq1B0aPufOaJHHNorqE8PqnErYMW5IE1AlW?=
 =?iso-8859-1?Q?m6MSNkRg7YahCKwnsSeaYi3GP3KrTqrvIO7dRztgs2rl5IyNqCwiXwNWXW?=
 =?iso-8859-1?Q?18/lY6jJxSorDNPy2M9EPI3gfpJjpv/RyjltNpaQq0F6w8QeBeNmnqcokD?=
 =?iso-8859-1?Q?1tL8qoa8/xQOmjC/VkPvRdE7JGLUhBBuBZjV/lBp5gZyV6W8n9OyiqXHIm?=
 =?iso-8859-1?Q?fiDKEet6eKdEDBMgQAzFCEoRGbUh1WuHQk7ZzHXUn/qCyrNas3BMSIXKxE?=
 =?iso-8859-1?Q?yfqHoX4FMiiwjuQ5i3vNtnGWrM4kU5x1u0wjTcFiphj3IXpVbNcM4FuW1M?=
 =?iso-8859-1?Q?+d4ADO02W04aloWY6Cg7JPJUWtjxDpLA2GzYhr0+K2Hyc0EtIT4saB32L7?=
 =?iso-8859-1?Q?eF5KxfyFFe8rMOsE0AmXRFuVXIBQ9WIqE/nSp2u9v9K4ONlA7v/UXwh5Kt?=
 =?iso-8859-1?Q?G7eyydXBB9kioe7vzC7MhLGC+aZ+GcEEkW1oGk9jTA+UhQQc3Xe44giIij?=
 =?iso-8859-1?Q?iGw7BZ1b9c3arkwpfDB4LLmowrvH9XONoPAWvuVPUlRMuYcPZ7zUzrVLFO?=
 =?iso-8859-1?Q?1x4Z46lBUGNVkh7ZUjuFk8P3xmsWfRL7+qLEsqL6oB8koeJmp/Y3aGddNk?=
 =?iso-8859-1?Q?x8d0p4YJUysc6RLG9S8aHr07ia9ds1+7p4lpN9lQK6I/fVq7V0JfpgHadW?=
 =?iso-8859-1?Q?62GXF53fC3O1SPLAXA4PcfElxCM7HxltikTtkt6KwaSfB0JSskqBundb0e?=
 =?iso-8859-1?Q?FEuzg+npWwI/UkHL6JvUelXdP7j0AkHoXqTKGBN7s2qdnRIBJAUhbtn/hC?=
 =?iso-8859-1?Q?xea4GExdhHBLPVMU5gWEvA2Raxp4AiB01GbzgEYy9b8yK6RByE6RefZrjQ?=
 =?iso-8859-1?Q?+mwTr402Ndx7RGKoReqdZDmZkUJNDXZLtICkljCds1kcVL0C1CAhVjjPGk?=
 =?iso-8859-1?Q?x+Km1QfbSZRhySVlQEX/lgbJir+jjKuZjndI6mpLiCln+OLx8W701aWng/?=
 =?iso-8859-1?Q?RWCrwgZIabjwz36kGuK2OwMOQIypnSGtCS/LfOO4opeAzC60Oz8AJEFv4Y?=
 =?iso-8859-1?Q?75mBnYtEDsYwiOtpGxzDn6jMKQnlD659qn1sei9wtBb3LC3aMwHTjbL9Gd?=
 =?iso-8859-1?Q?7+rrPZ14aIcTt05nRHzNXez/NBAAqLDcnXZPka9iWikpUzeyDu7DWE/UZI?=
 =?iso-8859-1?Q?X4KbB9picJyRB3rwBsVT6+ckOF+69PLvFSDNDrubQyETYtuOjiyBgm+jNi?=
 =?iso-8859-1?Q?64?=
x-ms-exchange-antispam-messagedata-1: xD5TCjUvTDLlH8buHZrmQGVwzyz6mAgtMsA=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d681e79e-9e06-459b-b4b1-08dee99018ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 14:30:23.3324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0FJVWbzNR+RcQ9NoeNOkZAuyyXdg2RRv+7dEkew5th6d63QPN/Eg2gWXyzTrrwx520Xv/JpKCtcQtEqPNIGxXk28y99Nl+Q+H1ry2uJJodk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0973

Hi Vladimir,=0A=
=0A=
Thanks for the review.=0A=
=0A=
> On 7/18/26 23:08, Tarang Raval wrote:=0A=
> > Expose a 12-bit Bayer output option in the OS05B10 V4L2 sub-device driv=
er.=0A=
> >=0A=
> > Add a 12-bit mode table alongside the existing 10-bit mode, extend the=
=0A=
> > enumerated mbus codes to include RAW12, and select the correct mode tab=
le=0A=
> > based on the requested mbus format in enum_frame_size and stream enable=
.=0A=
> >=0A=
> > Also move OS05B10_REG_MIPI_SC_CTRL_1 programming out of the common regi=
ster=0A=
> > list and program it at stream-on depending on the selected mode bpp (10=
/12).=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > ---=0A=
> >   drivers/media/i2c/os05b10.c | 112 ++++++++++++++++++++++++++++++-----=
-=0A=
> >   1 file changed, 96 insertions(+), 16 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
> > index 4e177eacc815..e11a3c308299 100644=0A=
> > --- a/drivers/media/i2c/os05b10.c=0A=
> > +++ b/drivers/media/i2c/os05b10.c=0A=
> > @@ -146,7 +146,6 @@ static const struct cci_reg_sequence os05b10_common=
_regs[] =3D {=0A=
> >       { CCI_REG8(0x301e), 0xb4 },=0A=
> >       { CCI_REG8(0x301f), 0xd0 },=0A=
> >       { CCI_REG8(0x3021), 0x03 },=0A=
> > -     { OS05B10_REG_MIPI_SC_CTRL_1, 0x01 },=0A=
> >       { CCI_REG8(0x3107), 0xa1 },=0A=
> >       { CCI_REG8(0x3108), 0x7d },=0A=
> >       { CCI_REG8(0x3109), 0xfc },=0A=
> > @@ -500,6 +499,21 @@ struct os05b10_mode {=0A=
> >       struct os05b10_reg_list reg_list;=0A=
> >   };=0A=
> >=0A=
> > +static const struct os05b10_mode supported_modes_12bit[] =3D {=0A=
> > +     {=0A=
> > +             .width =3D 2592,=0A=
> > +             .height =3D 1944,=0A=
> > +             .vts =3D 2007,=0A=
> > +             .hts =3D 1744,=0A=
>=0A=
> It's unusual to see .hts < .width and .vts < .height. Will is cause=0A=
> errors in hblank/vblank computations in os05b10_set_framing_limits()?=0A=
=0A=
Negative hblank is accepted by the framework, so no, I'm not seeing any=0A=
errors from it.=0A=
=0A=
But you're right that it doesn't make logical/physical sense. I got a=0A=
similar comment from Jai on patch 15/17 about this.=0A=
=0A=
I'll update it accordingly, the datasheet doesn't have any information=0A=
about the HTS register's unit/clock domain, so I'm doing some testing on=0A=
hardware first and will update this once I have concrete numbers.=0A=
=0A=
> > +             .exp =3D 1900,=0A=
> > +             .bpp =3D 12,=0A=
> > +             .reg_list =3D {=0A=
> > +                     .num_of_regs =3D ARRAY_SIZE(mode_2592_1944_regs),=
=0A=
> > +                     .regs =3D mode_2592_1944_regs,=0A=
> > +             },=0A=
> > +     },=0A=
> > +};=0A=
> > +=0A=
> >   static const struct os05b10_mode supported_modes_10bit[] =3D {=0A=
> >       {=0A=
> >               .width =3D 2592,=0A=
> > @@ -521,6 +535,7 @@ static const s64 link_frequencies[] =3D {=0A=
> >=0A=
> >   static const u32 os05b10_mbus_codes[] =3D {=0A=
> >       MEDIA_BUS_FMT_SBGGR10_1X10,=0A=
> > +     MEDIA_BUS_FMT_SBGGR12_1X12,=0A=
> >   };=0A=
> >=0A=
> >   static const char * const os05b10_test_pattern_menu[] =3D {=0A=
> > @@ -552,14 +567,20 @@ static inline struct os05b10 *to_os05b10(struct v=
4l2_subdev *sd)=0A=
> >       return container_of_const(sd, struct os05b10, sd);=0A=
> >   };=0A=
> >=0A=
> > -static u32 os05b10_get_format_code(struct os05b10 *os05b10)=0A=
> > +static u32 os05b10_get_format_code(struct os05b10 *os05b10, u8 bpp)=0A=
> >   {=0A=
> > -     static const u32 codes[2][2] =3D {=0A=
> > -             { MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG10_1X10,=
 },=0A=
> > -             { MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB10_1X10,=
 },=0A=
> > +     static const u32 codes[2][2][2] =3D {=0A=
> > +             {       /* 10 bpp */=0A=
> > +                     { MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SGBRG=
10_1X10 },=0A=
> > +                     { MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SRGGB=
10_1X10 },=0A=
> > +             },=0A=
> > +             {       /* 12 bpp */=0A=
> > +                     { MEDIA_BUS_FMT_SBGGR12_1X12, MEDIA_BUS_FMT_SGBRG=
12_1X12 },=0A=
> > +                     { MEDIA_BUS_FMT_SGRBG12_1X12, MEDIA_BUS_FMT_SRGGB=
12_1X12 },=0A=
> > +             },=0A=
> >       };=0A=
> >=0A=
> > -     return codes[os05b10->vflip->val][os05b10->hflip->val];=0A=
> > +     return codes[bpp =3D=3D 12][os05b10->vflip->val][os05b10->hflip->=
val];=0A=
> >   }=0A=
> >=0A=
> >   static int os05b10_update_test_pattern(struct os05b10 *os05b10, u32 p=
attern)=0A=
> > @@ -571,6 +592,34 @@ static int os05b10_update_test_pattern(struct os05=
b10 *os05b10, u32 pattern)=0A=
> >                           os05b10_tp_val[pattern], NULL);=0A=
> >   }=0A=
> >=0A=
> > +static int get_mode_table(struct os05b10 *os05b10, unsigned int code,=
=0A=
> > +                       const struct os05b10_mode **mode_list,=0A=
> > +                       unsigned int *num_modes)=0A=
> > +{=0A=
> > +     switch (code) {=0A=
> > +     case MEDIA_BUS_FMT_SBGGR12_1X12:=0A=
> > +     case MEDIA_BUS_FMT_SGBRG12_1X12:=0A=
> > +     case MEDIA_BUS_FMT_SGRBG12_1X12:=0A=
> > +     case MEDIA_BUS_FMT_SRGGB12_1X12:=0A=
> > +             *mode_list =3D supported_modes_12bit;=0A=
> > +             *num_modes =3D ARRAY_SIZE(supported_modes_12bit);=0A=
> > +             return 0;=0A=
> > +=0A=
> > +     case MEDIA_BUS_FMT_SBGGR10_1X10:=0A=
> > +     case MEDIA_BUS_FMT_SGBRG10_1X10:=0A=
> > +     case MEDIA_BUS_FMT_SGRBG10_1X10:=0A=
> > +     case MEDIA_BUS_FMT_SRGGB10_1X10:=0A=
> > +             *mode_list =3D supported_modes_10bit;=0A=
> > +             *num_modes =3D ARRAY_SIZE(supported_modes_10bit);=0A=
> > +             return 0;=0A=
> > +=0A=
> > +     default:=0A=
> > +             dev_err(os05b10->dev,=0A=
> > +                     "Unsupported media bus format: %#x\n", code);=0A=
> > +             return -EINVAL;=0A=
> > +     }=0A=
> > +}=0A=
> > +=0A=
> >   static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
> >   {=0A=
> >       struct os05b10 *os05b10 =3D container_of_const(ctrl->handler,=0A=
> > @@ -650,8 +699,8 @@ static int os05b10_enum_mbus_code(struct v4l2_subde=
v *sd,=0A=
> >       if (code->index >=3D ARRAY_SIZE(os05b10_mbus_codes))=0A=
> >               return -EINVAL;=0A=
> >=0A=
> > -     code->code =3D os05b10_get_format_code(os05b10);=0A=
> > -=0A=
> > +     code->code =3D os05b10_get_format_code(os05b10,=0A=
> > +                                          (code->index =3D=3D 1) ? 12 =
: 10);=0A=
>=0A=
> os05b10_mbus_codes[code->index] =3D=3D MEDIA_BUS_FMT_SBGGR12_1X12 is more=
=0A=
> verbose, but seems to be a better and more reliable check.=0A=
>=0A=
> Probably a simple inline function to get bpp from code->index can be adde=
d.=0A=
>=0A=
> Another option is to change the second argument of os05b10_get_format_cod=
e()=0A=
> from bpp to just media bus format, so you can write=0A=
>=0A=
>      os05b10_get_format_code(os05b10, os05b10_mbus_codes[code->index]);=
=0A=
=0A=
Okay, I will update the os05b10_get_format_code 2nd argument.=0A=
=0A=
Best Regards,=0A=
Tarang=
