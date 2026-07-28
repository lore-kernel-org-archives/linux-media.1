Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020115.outbound.protection.outlook.com [52.101.225.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877DA3C3C10;
	Tue, 28 Jul 2026 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222287; cv=fail; b=WTEVcgIfTYQF7I8PfU1e8MhRIX9zTVs+PHMbMl0TK1ZwvTFEnh7g3f4joT+gewsyN6rv54Asi+rg0J9cR9JBWeVJSGu6PpYRVel+qgGIJ013bLaFR20VdTfxdLdMlbflySclIL6sQwmtreACYtSk2Pja5mAinN8YOlZtsuqvB2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222287; c=relaxed/simple;
	bh=Z9kJUZ9ykAdHpu3MITCC9d7quHEpp2nB9Qy/Z1OAXJg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aiYoASMYn0a+Qf8JTO+pDfd26yuvUJaX5IRAE4A7dfrCB2ZMEglPSpXebT6NZ+r9WYzGJ/6ZTKpE4Yt2CdSDzlJexTWVWAUeJQXrGSn8jHokRLykoZk5un8fpBFhKfiDaaLELDGMXedSLfExsiStbRsg65M8vMsmJa6bzU+oEOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=JIUcH1cU reason="key not found in DNS"; arc=fail smtp.client-ip=52.101.225.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="JIUcH1cU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zqnav+PvVXrr5Gcwl6CeIzdIe1FFrJriVsqtnpnH3XOObkDes8xT9zMGANKeP5mtIUdIsVjmwuoIdy1yw0OgpXHtNdRy1I8vFFTS2F0zL2EQs3BLKP+qxuetKxVHrxjRe6G2BZ5KiWmRKGvniv4BOsY+H5lFdyOJs2vUHIIi1zmxEdJUHeC8S5QYqFsmyNrU+IECh7nExHQTxq0Faq1L1BOxM4WKgVdiOs+7lM7E6WJmEIceIPgi2jIb33HDiQfbjS+d/e6GZixsmwvCplcjMQw8CSq/DM63MfmMkSxVkfUL1PtmK3tAWxrYLd5fGHQbmlhVOL56wqsN3hnIeoqTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjnE/xB6DNMGOLkE68DKCPM0hiSLpfsZH+e0xXfA07w=;
 b=JRYuSOy/D28OZ7Q1J2OCxO78e0zFDYueUyYPboDZQEsdwho/l6iOtW4OfrujoWUHBQzs2mTlObasz+xVk9+Qxu5943mfqTuwcLVKzAxFg9tsnnBLiW9JmJKYCdfwq8lf8ac1b41BX4bNQdiIZlWlldyAhN4n59HbeEYKFpswquUFQ4///lu8968qtHnkexMZwwRkbBoLQFOj4Crs5V48piRT3uMT7eAbCeA8IFAQVBKje3kuEOaGBFfFLbXEP30Fzh5OZpmhRCGyziXJa6Ayt33dc8EoSOphrlCLpLH+wjMTgv1VhmEOo1mxRaaHKNuqc+jjkEniLY59eE6au+h2wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjnE/xB6DNMGOLkE68DKCPM0hiSLpfsZH+e0xXfA07w=;
 b=JIUcH1cUYV+TE5s3VN9u69sYsfjRjxpP86LeM6BxsBQmo/P5z7SSJTlU+Mw8ACvNH65YCOOdHxFktv7LiEOC2pbbUIDfNM/Dsed3COijNoJvJJHytpGqI+XOJfJKqyICTbbuSd0m0BKBuZK19bcYpG22WTCTPsUJbXnA5CifLip/tzksDKAQE0uLBaZeSQSbzZTxMqSyYLvqjis+qS2t8EI/5QXm3Bp2Zn2teqslaoGWAl9B9bd+hx06M7CqoIuDOzH6XnRfpzQiDSig6bVJGB2v5zg79B+T1LVXLUn2FHRCScPP/L/1USDdiffMf836aioInkLOIescdd+RApAA1w==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN2P287MB1229.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:04:41 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 07:04:40 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC: Tarang Raval <tarang.raval@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Hans Verkuil
	<hverkuil+cisco@kernel.org>, Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Walter Werner
 Schneider <contact@schnwalter.eu>, Kate Hsuan <hpa@redhat.com>, Yemike
 Abhilash Chandra <y-abhilashchandra@ti.com>, Svyatoslav Ryhel
	<clamor95@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] media: i2c: Add os02g10 camera sensor driver
Thread-Topic: [PATCH v5 0/2] media: i2c: Add os02g10 camera sensor driver
Thread-Index: AQHdDspl9ppXmum65ESzuXKgK/RNX7aCoL++
Date: Tue, 28 Jul 2026 07:04:40 +0000
Message-ID:
 <MA0P287MB2178B8563D434B18699EFBD188CB2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260708110949.31313-1-elgin.perumbilly@siliconsignals.io>
In-Reply-To: <20260708110949.31313-1-elgin.perumbilly@siliconsignals.io>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN2P287MB1229:EE_
x-ms-office365-filtering-correlation-id: ccc7d136-5f30-4dbc-3805-08deec767ea3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|6133799003|5023799004|56012099006|10067099003|3023799007|18002099003|22082099003;
x-microsoft-antispam-message-info:
 DU6TVhhQUVF9XiV/u13U80vFAdDeoebRU3u3aKtpjRyv8/EhpHztUJCshvM9CXI0oP5QyKKBLDvDPYqplmlqLhe89uy9n0siPQs0DQ2rQYPh2saQee3uirpYsIsTgL+2fF79/cFRs0g5G6plVWOnur7oqU0aNcnLEhuP/QFzRrry5akASGlWJ7lJ74D13Cm3JeU38UQs36PBkX2nekWSqzQrkHKaapDcYeiStYPh5Zhg7ugSTvnBbhgnwYaLPaWVfPiTDmcvHq4ZmAz9gFN/ZWPxOppRw3eFWpeeuUe2MwRB/5coOpjmdSNlbYPmf+J/waJPg0xIoJXuVVJQpW0lXMJFwFi1xUPcqbeBgTaXoln6UTXXdWroBhj58Uwiffa3TxskHvvtIYVRvEwCbkAPtyHlt2CwTIFrQEaI/YEg147WjJwZlgP2smiIW4sJd8wGkTa4ZK3DZx1V2WoTOkOKIY3O1yE/ZcmdtZFLmbmUgU0Mw/89dw0R/kIiBhZnX/mvD0XeZZUyQko8D7oraVLrWafvK/EC7Qn0ItNHa0Q/5p8m19ngtYdKt0A/phPlzOA6YqkQywgTeNNEIPk5jwUo9c5W44ktVhgn4HNtaDPF2nsydF6bXGCO/YTpHAJIQSM/it9sO6maoauMfZvdRtjC26yhFhG8Egycu3T2tklUMWwNXsTiNFOFBzs504Em/CH7+zt1w4KaplFw8/l/9whOuARtv2cWyutATk+Gb4xW5cc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(6133799003)(5023799004)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tG04lsrMCcYwSBCtFgNp0+ksFjjRI/l9gd0YCHHz6d+y4utaGNidw96+/L?=
 =?iso-8859-1?Q?+ovYWfLsTekpywnFcSJLUMVhWe7n4w+2PFvgZQMKeDM/BsnhJTDw5Uks8u?=
 =?iso-8859-1?Q?rVcbnYZXeCqKX1MlU5RRL/b1sX8eGI8Gj5OI0CXe8EX8nAR+/tiM/q6p7i?=
 =?iso-8859-1?Q?ol/LmtagWex5uBGJcnDbS9iptNQ2CDwiNaGqiITJJKfVIfMBNXCqX56ARF?=
 =?iso-8859-1?Q?KCrzNptPDdCi5VuJL+JXseM8A5q2f5haN3uNm06Q7UcbHVHQBwUsX7MOHy?=
 =?iso-8859-1?Q?QFf7AFswTgIaZtiIljM5s5VgRWUYp3i+2L/WeT4I/m38w53QZyhavyo7hW?=
 =?iso-8859-1?Q?wg95A5G87pvTdI0ilwNMt55YH/6JjZWIPxa8jGSATTZiU/hByHiVYFfJY/?=
 =?iso-8859-1?Q?yek81xBvnwKP9uvRC8gUnHggxb+/6F6G5AClsgjxhLn56tM8OI/6eJqhom?=
 =?iso-8859-1?Q?Aq9mBPLP9sUkDo+yzFeEq1p1fRW43kgA7/9oyUCTX7mNeJhAW6DwCRpT+F?=
 =?iso-8859-1?Q?JOon5Aj2yXnsOdP6vd9OZKS188SN9kCTYxLBVXJ2dzSyjxYsGevTAyyK0U?=
 =?iso-8859-1?Q?B+leF+5GIq2EPajt+KmO7Kg4lRzvnsFrYFLwH4xeakcgKtam2rv7taC/tm?=
 =?iso-8859-1?Q?UQ55cgV9WcJ1Hx3jbiV67K4o6r6Tz3gI7XPzoF/WAAMsjKKY9l7w/UwCT9?=
 =?iso-8859-1?Q?IJlapHf7oY8qzJEPHa2USznnv0d2t7EZytrFK96NnfUBfy25rnkd2Hj6Qp?=
 =?iso-8859-1?Q?AOxkAujmUJkeB3onc7Hb4bV3Uk+GMHdzeNyBDR0HRSEmGs1NK6lgUrRXda?=
 =?iso-8859-1?Q?Mw4nx7KCU9KlAFD91E/YHodH7osY0NnoMBeSq8DAYUKkFzz/pBR95I3WpJ?=
 =?iso-8859-1?Q?eZ1K+DDoBvT6tGlUsme6q+4WFQF8Bn8qZz04k8n/nxqYordtrRaLOZ2AhS?=
 =?iso-8859-1?Q?GKUIYDUf+VjEWvtut8cTzyKBob0pAwpMZB7Hh7fGX0dQGHRBF38bzjHssU?=
 =?iso-8859-1?Q?cgpKovL4g9ANnmYvSMq0zg65AAHen6H7sWa+iJyh/CXg5E5tzQIBmOHlrW?=
 =?iso-8859-1?Q?p6aVckZDTwqAD7hpfOs76+RUpOYOvaJRyk30wXYaddu0kgQoyJ3Za6MyEZ?=
 =?iso-8859-1?Q?5Kuy5ItuvwHBA9A+TPYuOL7ecg+QCBaLbj8ECLgyFfVTeD0sgOB9dhx561?=
 =?iso-8859-1?Q?rStPhlS64TKLVjeeexWk7Jsu+xAZEjhAod07DyQc52DP4+iDDMRFqKX9+Y?=
 =?iso-8859-1?Q?9h+TUgjj7zkykad8JPngnz56n2KRQW7r/2w2KXoB4aKhdc+txrcBvZ6lWk?=
 =?iso-8859-1?Q?MMYxsGgv5QK4jNCY+Af7P7+gEmZrG4C30gmyH9R08zibNIdhKxQLCAXmX4?=
 =?iso-8859-1?Q?WC/boba/6X32W/OWoywxernsD2W5cV9ONVs06hXi2dS5z4HU08Q3Wsl91j?=
 =?iso-8859-1?Q?xJ8+LNaytPPmixz+rI2Qn4nJ2AqB+UmOO9YXMOeDklUP0xt6Qo4mDesPHf?=
 =?iso-8859-1?Q?IG1FILtCv8cOQEH+ssUXt3mDpYxOOtisV02TuibFByR4yG9F4eeo/M+BUz?=
 =?iso-8859-1?Q?rcr9mlNfYUeOou9lywJLyuvi1I2tYPCYdI9PB34aQ6bnkgTPdKndv71eMd?=
 =?iso-8859-1?Q?PnQNKrt3hunZTOQV/M7SIArH6IWOZVMCXXLpFzHmZDdfOIdXs1e2t+M7+K?=
 =?iso-8859-1?Q?1XDOsZuOpDKkcshUdrJwdkHyjzuwCNguWBP7xW+k+wegFozY0VWRXcqeWu?=
 =?iso-8859-1?Q?8RcU4qwwSTS5q6UoiR29kNcBKqRiULM0QdDasx2koAKipJjWFyr1thi4lo?=
 =?iso-8859-1?Q?xMIRvvXl4MQESO4WwmHAOZe5C0yimtg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc7d136-5f30-4dbc-3805-08deec767ea3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 07:04:40.7499
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9B9ZVZhmtqHagDiv1YVuuy4uzl7pHD1TW4yxIyKDOoMvd2KudDrKiqA++4AX68Lh6abP592J8R9gemKcAkiijyd7e6h4zUe7UKeccCNi/KR/wjmAMjdNSM0LCxvoakW9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1229

Hi Sakari,=0A=
=0A=
>The following features are supported:=0A=
>- Manual exposure and gain control support.=0A=
>- vblank/hblank control support.=0A=
>- vflip/hflip control support=0A=
>- Test pattern control support.=0A=
>- mode support 1920 x 1080 @ 30 fps, SBGGR10=0A=
>=0A=
>The driver is tested on mainline branch v7.0-rc2 on IMX8MP Debix Model a.=
=0A=
>=0A=
>v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t=0A=
>v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22=0A=
>=0A=
>Compliance test for device /dev/v4l-subdev3:=0A=
>=0A=
>Driver Info:=0A=
>        Driver version   : 7.0.0=0A=
>        Capabilities     : 0x00000000=0A=
>        Client Capabilities: 0x0000000000000002=0A=
>interval-uses-which=0A=
>Required ioctls:=0A=
>        test VIDIOC_SUDBEV_QUERYCAP: OK=0A=
>        test invalid ioctls: OK=0A=
>=0A=
>Allow for multiple opens:=0A=
>        test second /dev/v4l-subdev3 open: OK=0A=
>        test VIDIOC_SUBDEV_QUERYCAP: OK=0A=
>        test for unlimited opens: OK=0A=
>=0A=
>Debug ioctls:=0A=
>        test VIDIOC_LOG_STATUS: OK (Not Supported)=0A=
>=0A=
>Input ioctls:=0A=
>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)=0A=
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)=0A=
>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)=0A=
>        test VIDIOC_ENUMAUDIO: OK (Not Supported)=0A=
>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)=0A=
>        test VIDIOC_G/S_AUDIO: OK (Not Supported)=0A=
>        Inputs: 0 Audio Inputs: 0 Tuners: 0=0A=
>=0A=
>Output ioctls:=0A=
>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)=0A=
>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)=0A=
>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)=0A=
>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)=0A=
>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)=0A=
>        Outputs: 0 Audio Outputs: 0 Modulators: 0=0A=
>=0A=
>Input/Output configuration ioctls:=0A=
>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)=0A=
>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)=0A=
>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)=0A=
>        test VIDIOC_G/S_EDID: OK (Not Supported)=0A=
>=0A=
>Control ioctls:=0A=
>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK=0A=
>        test VIDIOC_QUERYCTRL: OK=0A=
>        test VIDIOC_G/S_CTRL: OK=0A=
>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK=0A=
>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK=0A=
>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)=0A=
>        Standard Controls: 12 Private Controls: 0=0A=
>=0A=
>Format ioctls:=0A=
>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)=
=0A=
>        test VIDIOC_G/S_PARM: OK (Not Supported)=0A=
>        test VIDIOC_G_FBUF: OK (Not Supported)=0A=
>        test VIDIOC_G_FMT: OK (Not Supported)=0A=
>        test VIDIOC_TRY_FMT: OK (Not Supported)=0A=
>        test VIDIOC_S_FMT: OK (Not Supported)=0A=
>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)=0A=
>        test Cropping: OK (Not Supported)=0A=
>        test Composing: OK (Not Supported)=0A=
>        test Scaling: OK (Not Supported)=0A=
>=0A=
>Codec ioctls:=0A=
>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)=0A=
>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)=0A=
>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)=0A=
>=0A=
>Buffer ioctls:=0A=
>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)=0A=
>        test CREATE_BUFS maximum buffers: OK=0A=
>        test VIDIOC_REMOVE_BUFS: OK=0A=
>        test VIDIOC_EXPBUF: OK (Not Supported)=0A=
>        test Requests: OK (Not Supported)=0A=
>        test blocking wait: OK (Not Supported)=0A=
>=0A=
>Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings:=
 0=0A=
=0A=
Could you please have a look at this patch series and let me know your thou=
ghts ?=0A=
=0A=
Best Regards,=0A=
Elgin=0A=
