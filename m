Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021083.outbound.protection.outlook.com [40.107.57.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BD843A81E;
	Fri, 24 Jul 2026 14:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784902533; cv=fail; b=Zq2ZZgR/bXo7MHttmayPF6F8l0VeO4LJLqGfezthwST+OtEZAuy9K6Qpg0GoTmzSk2B8Klqlj2YVV0jK5yeQWyu/K32rLRwom46E3MofAbKCTwQOZDAeu52lux2I6g8rzkW2d8Z2zjEwr7mhEbZIwdjH1SyoYt7BeNOgL6qGFOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784902533; c=relaxed/simple;
	bh=e1sBzIX+J28ISISQF9y6o/1x6Vl75L7r3jRtt5Zpf9M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GdqZzuYKYEYmvXkyGXebVLc4BhHa8WZs4ZjFUPCBxFMgqyYxL81nYgpp1YHNZWr0yupStlxpHH3CJUPt9ASrnO9eDwVIrsmSKuCUpmJCejIadaGBEMnJBVpsLwKlY9ZcEJQONJ/+FpvBPi55s8B62WVAOVGlJvpz2kcJ3Bdqfqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=j7vVBYV6 reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="j7vVBYV6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyrOv88j0J13cNE8ZWyD2lLtqRcxdNjCrPNEMwnM62SpJ1S6yfpHT3OETUX9M2pBxt0l30Tb7TXJ4WQNYFMa1CXw7C9B5Y1nCPB9wShu19uonsd+t4G3S/OTRpV5GfcNqDzgVEtwY+5zQCN78NwMw5mtifaOvHOtEajLx8jKzMQEq/gLN4HYpGIJiMJLFW3uPW1LV65Lx29ZHYVI2l6738T8wPyLwSpP1V05xfH84FCkQELfm/wtD89jHeEJoHv0ixUuKvWf4R8IzJzDQuUXERFFdQ5hd4O69Tj7A/Pbh4XIO/EGVIgm+utig5NdZ0vSJOS8ochnDbqOUJD+cuWAzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWEzSobf61IGHRoJb0+5CJmLGZBRwXuRx08hgM+4J88=;
 b=q+JDFHmsoRZJl6Yw3oMRHi/YrRQfNGGnL2WMJa9XAjXv7YnIn2/1rPLCvAcF8sdSAlUWtMZ37oofj0nyKqUp5kfnTvWgaqr7Fcmu+oVUhTV1Ml1byasp0J0pLqxbFz6ZL1b/QzDCPgt/AS15uV/XbaclzxNAYxbY/+QHcM29tHpnbBSFvaDBYF2F5QEED5+Tka6/r6swsEKg3xgg2A+FgqOjAIR+edFJXTHLfDjGmxFpea6izN1Drk2m493d5l7mOJ8YI0946wiSCUnOyu9gK3KiRhRrgIHVi1uqzEAYKCjueYx3wtFvg6Ojc9c4/RM/UpvVz2C7LucdMuaro7kS4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWEzSobf61IGHRoJb0+5CJmLGZBRwXuRx08hgM+4J88=;
 b=j7vVBYV6+Aitg6YQgLILcnv6ApbYGtM04mpDU798047khP2929iptyx++1K7YO34PkU8jkahAsg+Rl7ec3HprI06QG5Q0TmedhdrEO4gZO6GU3Ji0xgo+KRIf+BkBXNAMPf35QkcWDEXsiZiaepN4V/B+Kf82Mv5P3acamX2/lMK1xSgkdv5UN01pXbMKMTBz4Ww4ODDFTb9B+UIfnL0Ufq34RFLS0yguqlP3d2/eYVE9pooAIlEFtcX/icUzgt+4Qs0/jS3IqVgO+q0VVQ4cs8xaNrBKcYQqinSZEB1C4ANIIYMJIprgD6N+/9FRHSXGI77VTyoviO5F/up8eD1yg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1126.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:135::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 14:15:25 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 14:15:25 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
	"mehdi.djait@linux.intel.com" <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH v3 05/17] media: i2c: os05b10: add V4L2 digital gain
 control
Thread-Topic: [PATCH v3 05/17] media: i2c: os05b10: add V4L2 digital gain
 control
Thread-Index: AQHdFvFyr5EnG2fLdUu163jI7nRrwrZ8sBkAgAAPTGc=
Date: Fri, 24 Jul 2026 14:15:25 +0000
Message-ID:
 <PN3P287MB1829D0FDACBC9DC64DD866458BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-6-tarang.raval@siliconsignals.io>
 <fb9b5132-e5b6-405f-b930-8d2b44c3740c@linaro.org>
In-Reply-To: <fb9b5132-e5b6-405f-b930-8d2b44c3740c@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB1126:EE_
x-ms-office365-filtering-correlation-id: 06c6ce6b-55ba-42cd-a8d4-08dee98e0166
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|38070700021|22082099003|18002099003|6133799003|4143699003|56012099006|10067099003;
x-microsoft-antispam-message-info:
 dLw4yowcTuKtAI6n7WfUI27mRw9tHbxn1xs5lVhYE30fR72PDSB/m4Dosjp2caRFobCJH0k978olBAEoJPXBDL/ellmeYmbT9W0aUjvOTblzaT6lsCJNFSTv/WQ43NHNKtwODjxbjYJT6oJ+mR65NbRDiizyicc1dRMJQtTiBFEkc0qPvCmc08/vigfP9+zFhwR3brcGpsI3yUnvAVjSK5lnZeJbjfHERusCWnxYkbz11gPvRo6AZDZa1gv7r/PSdiLcZGCH30elRnYJw/sxrbdw/9TApLJO4uAANGVVzHsNXVm4K51rws4BE7Vt9iTkWii4MxeiNB8pzTnfO/xDLrTQ59l622n7XvcGL+d5984o6y69Ng3BQCzuA6cxlYMT1TsmvswrIPtKkjRLCvesviihnat/sta4OEUcX8QvSDi0GSpsmYdKxueuO/c0TQa/ljeAZ2tT1ZsXB6UvIpwGUKSIkRILgc/+naA04YTAKXX4H+9Y2xR8g2caiSLjNzVRZT/zyFpaFH2QpbJn3qiZKd/O1sIb07QuthWXljdoD3gFlpiQLUk/Gx057PfSiig+z66H3LhpKv9mImu7mdboo/6At/ZULQ0iDEvb4oVw5UwB1bz5ubrq6nDuHTqVJqOU0SIjRWmBj+x6GkbalioNfz+IU4++Be74QiErUxp6RJKXFOdp2NsArnIPQo6k/tSOxDm1Q9TePwWVZRpZO/9p3a1lHVj7VeiLe6oaB9uxL4Q=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(38070700021)(22082099003)(18002099003)(6133799003)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HufKiaMMziDJ/Dw3S0dKXM7Lb2SuqPlLLn0rvatAqCENdwFm54FZqGiieD?=
 =?iso-8859-1?Q?ym2tYnE7Ruuc9Lz89ca5JgtKaOjDWxbXUxWQskHQLtrAUfHzlcSvaBwb/j?=
 =?iso-8859-1?Q?BCMMcMMRfHHidams5Ne1Ud1XAN7aJ95XHKp5za4NdqMMRzPbMBGxjghwPX?=
 =?iso-8859-1?Q?Lhnjkd1bEPV5zxcRs8Y3sf/gbRcovKDuOep52EZaIg2wwIaMd9FOtlMig0?=
 =?iso-8859-1?Q?mtgNdhadGOKAKiy9c9NxGD0aRA/6WiuF0SYgDkFDzaLlLX3Pv9Vv3g8pkL?=
 =?iso-8859-1?Q?t8fjbCrSATBeVIRXpJev35tRZTtAMLbUTiGo/uaZ+E0B4AONUw82STFQ2P?=
 =?iso-8859-1?Q?HukQEAeT7QGL6yshs5aErdtqpFL7XYJnk1AZfzoBUqJsAc+IJkDEZ1NWgq?=
 =?iso-8859-1?Q?GDFtG6kP6HljkT/N0/w+udp4ebKnyOGpuo2XtUWFySxBh6fBMRP9FJAmNN?=
 =?iso-8859-1?Q?twKa4jKbE3QQI4pqtIjMV4vuF2VIVzlTQmD/7VFi+87hW0MOnbXFjd6fyw?=
 =?iso-8859-1?Q?TiGtUGCn5YW9zwJ9Z0YGZzTDFdfQ2siTnWj8PV+keOdlfnCgJloemc48Pm?=
 =?iso-8859-1?Q?ct3yBpmXLlCL5k40UDDpJr80CTXPIkKnc8nyLpcekkmkYg7gKCvEZyfF8Q?=
 =?iso-8859-1?Q?KNlsb4W7D1yOcrP0b2yNalU7eKjM/+wlv+i14HiCug4I6u5ceNh1gNBnbz?=
 =?iso-8859-1?Q?Tqgk1Iaj3ltIFug9Nc+wO2AQPUbor/eG+PgK54TvIFkspBEqdjG29oJdrf?=
 =?iso-8859-1?Q?8f1QAQjAXwolEDUwiZ+4xdDHg86x5jJCrGe/Gq3holZO0LOY5/BAbbARMQ?=
 =?iso-8859-1?Q?IiqPlOHSYx3wVdGgBx8ShMiVppTD3t4MzNdQAxo231+enomo9k8xjET18i?=
 =?iso-8859-1?Q?vMtV0U4+cyREsrD7DzBLFWxw3hXbjhy7nFgSyRvfuksF5TST001DvXq365?=
 =?iso-8859-1?Q?Sm4VEDD5qAwqPtjNZ/eXgRTV6b2FzIlAZUtF3orzGnt0QvXDvHKZMil7mu?=
 =?iso-8859-1?Q?PZupE1EA3/LtFaaGfBqGQmV/ehafugEIk+rGs5wjosBYNU7DjtQ71O81sF?=
 =?iso-8859-1?Q?1df++f9qNsfdGdd1wK8uE3tUb5hPHCXj7LNQCjzMjxdAZCU4IFOu9ri17p?=
 =?iso-8859-1?Q?YJ98rgQKKQjj0/Z30hLQ8kouShsNzn/Bt1b933y3fKUFhKYUc4vAinIXFx?=
 =?iso-8859-1?Q?8wkPSWuYhih7KtDOj93msEM/RNZtVJYku9j4HGptPSTOGTENQ3Bg1z+sWU?=
 =?iso-8859-1?Q?RypkDBGQWm72UJ/spFWrS7rz/aeMl6fwYi5Rnhk4MxU5JmnkmZwoPMiRTG?=
 =?iso-8859-1?Q?DlVnCEe4OTqMXGVjO+33MOVqj7zHs+IL5idWNq7tcXr0FsfbhxTnqVFkEx?=
 =?iso-8859-1?Q?AmNwFvwdS/L5DH34jBTNpzKF7L0hJZrcBv4/jVJ4WmLZ/SgjJ28vl1Jiq3?=
 =?iso-8859-1?Q?YjgvqodgAD9r4UFzCEenqpmos3XmJvnSFTrKFhGKZS+WYXUlKFUKexer6B?=
 =?iso-8859-1?Q?UdbRleawUdklkfEEqwyOakTqNFCdWCPAdKPoL6DH4K1xjWCn0AJ9cTp+Nt?=
 =?iso-8859-1?Q?wW8I927Vxk6WBDBFLb1aiU7f+S7pdjG7++F3e4dJADAv0aIhlrLfVSAAig?=
 =?iso-8859-1?Q?k9E3u/Xu0EKcBa8RqyPJQzNfoBqHqeHmhynqE1aXE43tR/773qE27trUuM?=
 =?iso-8859-1?Q?P2AbbOuijK1COBpjbPGnZIx4NNqfmikxO8I6RE07EWsavK9ppTfUuoKicE?=
 =?iso-8859-1?Q?ir8qPkvRj+D4UAgi+9AT1w9DFozl9/LtNRzsBoJ1rlJ3bSa7A3gRByBc4Q?=
 =?iso-8859-1?Q?4ZKno10gRbHnJ/9p89AoD2nourqhBGjyfnrC9i/mAJGd1QotS16xafgrye?=
 =?iso-8859-1?Q?8D?=
x-ms-exchange-antispam-messagedata-1: j6e+aur0D4HojH2IE/1cF9oO0wXISyO8+iY=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c6ce6b-55ba-42cd-a8d4-08dee98e0166
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 14:15:25.1301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yh00wzyf8pBRCZEFWcUxR7YD+d2IP+jYSM+aUeOzQxkBSdtJdLP+4+xMiWCeB3JNvlsc9PKA3Xspm1Q+n7ZmpqmFROx6PXRu9dHsWT/VS6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1126

Hi Vladimir,=0A=
=0A=
Thanks for the review.=0A=
=0A=
> On 7/18/26 23:08, Tarang Raval wrote:=0A=
> > Stop programming digital gain in the common register sequence and expos=
e it as=0A=
> > a V4L2_CID_DIGITAL_GAIN control. Initialize the new control and handle =
writes=0A=
> > in the ctrl callback.=0A=
> >=0A=
> > Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
> > Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>=0A=
> > ---=0A=
> >   drivers/media/i2c/os05b10.c | 11 +++++++++--=0A=
> >   1 file changed, 9 insertions(+), 2 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c=
=0A=
> > index 12c4e2610d6f..abf3d2970900 100644=0A=
> > --- a/drivers/media/i2c/os05b10.c=0A=
> > +++ b/drivers/media/i2c/os05b10.c=0A=
> > @@ -138,7 +138,6 @@ static const struct cci_reg_sequence os05b10_common=
_regs[] =3D {=0A=
> >       { CCI_REG8(0x3503), 0x88 },=0A=
> >       { OS05B10_REG_DIGITAL_GAIN, 0x0400 },=0A=
> >       { OS05B10_REG_ANALOG_GAIN_SHORT, 0x0080 },=0A=
> > -     { OS05B10_REG_DIGITAL_GAIN_SHORT, OS05B10_DIGITAL_GAIN_DEFAULT },=
=0A=
> >       { OS05B10_REG_EXPOSURE_SHORT, 0x000020 },=0A=
> >       { CCI_REG8(0x3600), 0x4d },=0A=
> >       { CCI_REG8(0x3601), 0x08 },=0A=
> > @@ -549,6 +548,10 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl=
)=0A=
> >               ret =3D cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,=
=0A=
> >                               ctrl->val, NULL);=0A=
> >               break;=0A=
> > +     case V4L2_CID_DIGITAL_GAIN:=0A=
> > +             ret =3D cci_write(os05b10->cci, OS05B10_REG_DIGITAL_GAIN,=
=0A=
> > +                             ctrl->val, NULL);=0A=
>=0A=
> OS05B10_REG_DIGITAL_GAIN_SHORT control is removed, but=0A=
> OS05B10_REG_DIGITAL_GAIN is left in the long sequence and rewritten here.=
=0A=
>=0A=
> If OS05B10_REG_DIGITAL_GAIN_SHORT control is just not needed, please=0A=
> remove it from the long sequence in advance, and then this change will=0A=
> touch the remaining OS05B10_REG_DIGITAL_GAIN control only.=0A=
=0A=
I made a mistake here. I intended to remove { OS05B10_REG_DIGITAL_GAIN, 0x0=
400 },=0A=
But I accidentally removed the wrong digital gain entry. I'll correct=0A=
this in the next revision.=0A=
=0A=
Best Regards,=0A=
Tarang=
