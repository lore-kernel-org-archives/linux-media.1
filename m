Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021087.outbound.protection.outlook.com [40.107.51.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C3F19D074;
	Tue,  4 Aug 2026 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849839; cv=fail; b=M6jeDdEzN3bKQeOdHDApP9oEQ+TbOITqKKnUWQENkYF3FR2ryOShdhzQQScXM56acnMoZDr+dnWH7gt6x+P2bvhEIOcM0cYmVouLXYmFd2iMMWF7UNzbBridqz4npo8soO5WWt/d/ItqUSKxpoDyO5tWso7QpHDGKZnp8MvglfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849839; c=relaxed/simple;
	bh=CzXkf/fmhYqqKcczABC6hPwO5xJeohSj4dJaW7vtTJs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BkZZfl7jFMNUu3YGArRxqBNygolPFwHEICli9UNTE00JL91fQ23bqaE7JI6Jjy7MTqkwX2s3M/3sy+I6kQgjuSzxj/PHbxsVDHWdSf9/Oky6L2krUGATERdp4sJD6Pjo014CjkOqdwpRRKId0bX13HrapUo5jkXp9wtbgVw3QIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Y9kfazUL reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Y9kfazUL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cz0GMrV/UlC1Ytr8XRqC7jlMg9yrEX5QMQflfjBKa7ytzHzy8juGBheDYOk39cEFeYmSFh2zGIWl78GPnK1B+hKxrPLQVpUiTcO9Pb9iP2oh9WsM9mvqy9fVUiGwJVvLnz37fYrBW84P8P7m1Bdq0EoIXb1XB1DAxLFxmQCcGcAvu54NaIAsLuUuSX1fh1jMvwEmj+dLGUb2U6b3x6BCV+QnVEBaRImSNEWIZowrc1GwxHuN3k3WG1ZB4q1CSm39Jwk3OpHLsS2gSWVzv5o4zeq+kHTHnrrYDmP/rcTtdPkzNjQqfy6wruLCBMrA5kuXqIX0gc7nyMqM8Q36hHA2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0d1oxO51lapISOHE/EoIonYRLkGcJTu5YCHYiZitsqk=;
 b=iPhfSjW2Brgx3huD0e2qE7g6N36Gu+jW+InERltdnE8OOHzdXjEOAlUs5c0Bzg+WDCR21BApEy9x+z1RIaLEPG1I8v8JdL6ZW4NSgi5XGGCxerykT7slS0fiso0G4+PzlO5qwLUWpFlQHSH7atn5CGOIh+jv9SGhH71TGaZYlndQCECSjBAikZ/CHYSbymaDEG6JbwbYfC8h5lZV04moRx6rDn5ey8k7gU4GV/swLmxFTWqvKSxQ6sHvtcoRfNPw9zMWqOG+PjqwNUfXZoOvRKwJl048MTfQRSIkkrl88iYl074JX3V8/z5OvbDcd/em1uc9bQIIs0ClVpOyMV2NpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0d1oxO51lapISOHE/EoIonYRLkGcJTu5YCHYiZitsqk=;
 b=Y9kfazUL7+LZ1ZG8X9y5vTtutewyK5pbEELWHGoVBmB+CNAhoAO5OVEvgh0pcQy96itFbx2cVr88mhRA3vitLOMgMBq2wBY65q3F6GhNGkxmQeryG3Tjx7UOBrtAr7gmn0eTUIM3graXY1PIdlt0obCWZyRCnA7AJaLhrOaydc9FT2es13t8m7XJBb0UEU5HsdFRHG6PSVHtbVU/WQ8Ra9tLyrl3ClMms/JgFp6zz0RGaOD1L4jpprEiIZ8IHcRsNO+vfxUz9+IDqaFULY5/Syg+bI1Y+HVrHsqEfVtoyPsOo6aY3ja3HzYvyCDlKpLbXqnI3T6gUDfJX925SR24Dg==
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN3P287MB1018.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 13:23:52 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%6]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 13:23:52 +0000
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
Thread-Index: AQHdDspl9ppXmum65ESzuXKgK/RNX7aCoL++gAtqjto=
Date: Tue, 4 Aug 2026 13:23:52 +0000
Message-ID:
 <MA0P287MB2178DE6EB4C9E675B9F967DD88D42@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
References: <20260708110949.31313-1-elgin.perumbilly@siliconsignals.io>
 <MA0P287MB2178B8563D434B18699EFBD188CB2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
In-Reply-To:
 <MA0P287MB2178B8563D434B18699EFBD188CB2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB2178:EE_|PN3P287MB1018:EE_
x-ms-office365-filtering-correlation-id: 18190a8f-b922-4c32-7613-08def22ba0aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|6133799003|5023799004|3023799007|4143699003|56012099006|18002099003|22082099003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 Dm1Lge2Dp6dbm+gmk3ZcbgpPwD+gM9a0aYiqAZzrg8f61gQQg4y68PzbolFuoXi0gqm9fPhfpnEAxeCAOcUFLrxn4xUq5cKRfl04mQ7fKbArKASs9tdPj2DVDIdf9Zcqyp/x6SxtErR0d16bPOjGr6TRgvlW/cpG4SrtjhoOeQUc3JosVrz7tAGe6Rx/iyQ4vR7Ed0qi279SVboJcckgHoXjpUejz/iLAMSHM+gRCiULDukzc1TxorbfRQQLHx79DSM1PId3DsavCE7SmrQqi/FJbK2xKNdeB1cJTJISiY2cBxAZy6JUbZOD/AGk4w4xFWOvApaKCp79AqFyXP+JnG+bd3raxPqkSGQ1GO4aDK4p/n8rB9xMJQVbTCKQNRuLUX+MfpvLcL7aRk3IvfHxz/6bnD4/+pOwWmDIxZk7PEMnPq33vloZe8dn4cT8fuBcL5N+G9hkD4oH3Gnlv1XTIRtJfemCnmiVUkxZd+bz7GEvhmo7kGD/6+xR0BcNlBLB1JEHTxe2xVFxLniDXsXod/FRtIr9EBACtN19B4fpg1s4USg4nAdt1126UjdoOqaDL24aMQsBMFqT2IwUKDAr50xWeLkNgCszikaGkRY2C8Y5b+9he6PqnwdwOradYJk0se7M80U0Q31rXozdpIVCuYImzLLFocFTacECzZnael7Izj7fO/vczcvXI1ocqMQubmCrGoaNRdm/EqydZxCAq/qKbx7teYHhQbn7VlnrNR8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(6133799003)(5023799004)(3023799007)(4143699003)(56012099006)(18002099003)(22082099003)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?39964/xtCJM/AJbazZRozub1nfhrggjFitZnz/t3XYPVwEiXUL1nLzcR+Z?=
 =?iso-8859-1?Q?gsIpttNwdxDMeyr1b/OGa0nOH2E/qrVjs63zMQRXW7pfzQBH29o7sXX3yx?=
 =?iso-8859-1?Q?m9uE/9+aEkZbNOI8UFES/qpys/jWr/C0iUlJo/0NJQannQoS5Ryp52lv60?=
 =?iso-8859-1?Q?ZoVwzoXXckOJ36CPD5IZ4JIpVhlcmqzV3n7zUQzztK0W1o7FU/dQruG17A?=
 =?iso-8859-1?Q?6+MBEy7yCbUc1xpMHjH8hgWPdb0m/Q/0xbt/jyMpYtv6lwHfbzPu6Oddxv?=
 =?iso-8859-1?Q?9Oh5+7enRPoIoACrr0yj3O4mVLjLBEb/5p3LdgyITVJWXTgEqpA/NNMWeZ?=
 =?iso-8859-1?Q?EfrLjSC9y/pS/ahh5Tq3BLRek6jDBQg1jpWxlhcqCunC/QX0gcwfp1NMD6?=
 =?iso-8859-1?Q?p4BHHnE6sr+ErigmGM71DCAMIT2+xNghMobElxkEnlPcsb4OMihh75mvZi?=
 =?iso-8859-1?Q?peT2O5p7LEn5efz2zcycNvwxRY77/mZHPrCoBQc63iKofHvR8gqsExhvfO?=
 =?iso-8859-1?Q?7q8Lfsg5monlB8aTFzl0l69UUlwmSRRyfybm35foQOnMmGOJcaoGqc4Hcu?=
 =?iso-8859-1?Q?v5sNwWv1fJOfThGg8uedp03ISVlLYRigA5j2LeJQgyeSvBLZvKLUs6O6PW?=
 =?iso-8859-1?Q?AgheHeeDUqXZcS4+7YJlCEPjnQBJyIORN+gNFusBu16jHofRbt/e26YzXb?=
 =?iso-8859-1?Q?v4zFKl1rJ4jGL68gxffxXgDGfuoE6FTQQJFIi8OJeuFw7mnGbJT/nHJU2O?=
 =?iso-8859-1?Q?bSM2hP8CIRgCY1J1lGFdELezv7f7Vkxb767HSZQ7xh+PYr+oPsTWi5nGFQ?=
 =?iso-8859-1?Q?VDhj4AjptQeE+spRtdy2Ou80o/uUy+mb8Zr7nmz912jNPXDvg5nUc5VUvZ?=
 =?iso-8859-1?Q?0ZrazaZtdm+CBz9rahXXrn/l9z452gO97zSwsFkClOTX43XfFoK77sj2nj?=
 =?iso-8859-1?Q?Kb14H9IULWSVjII4YIUUItcCKd3RoBNa6nIzBmyaw5pbhbDX3QccO9miCk?=
 =?iso-8859-1?Q?DCPB1zv8qOhlFKYgA1KtT+UVsyxa1k1/cwDTt8+Iy9x5tv6EeE/DcC6TqB?=
 =?iso-8859-1?Q?LeOUjf0/7ZHm8Tsb0QC+wf9TgcOJn0JXry41pcJqXhP895l5wSsFH7xcjT?=
 =?iso-8859-1?Q?6PswN3ltE1BlEigYOsAJ2nd8Im5/+CtvYJicOgG0Y9Er9/sdDSYnoC9apK?=
 =?iso-8859-1?Q?OucFB6xIl1nH3KvtyZnuoe427oGQyk6W3+biQ+db/8VkCxNLrAgWxAuWpE?=
 =?iso-8859-1?Q?cIr2sJ00UvzsmxVhMRsL8jjyfo623Zsd4Y1axJucdhvyEi6qSYpdPp5XiK?=
 =?iso-8859-1?Q?XtIVY0rhhz5qynOW68Iq9K3TET7LDFfiTcFxOjEBYLC9Q6dmmFUtk6YHhH?=
 =?iso-8859-1?Q?Khxn73MCu7GsXPnCfBYdvZ6TboVK5UORu4k+TxwJ8Ae4RB0bPZ2G32HGVr?=
 =?iso-8859-1?Q?EjCrsYsCajt72XrWZ6f0SIj7n0Pg0ate+kx+PWIqpaoEEh69U5Xd9l954E?=
 =?iso-8859-1?Q?TVq6wkTuU7leTlNuYkRb4Rw/RBmLBT1FH+JoIqjKRDQdHpKZYoKt8t5CsQ?=
 =?iso-8859-1?Q?H5nsrZJHucGOJ/OGnF2rtHTXpDTiCewFjxGtweVnE+RSywUv123EabpuwX?=
 =?iso-8859-1?Q?hFdf8SutrJHgeHGcd/YHimA/bymm2ua14wfzt23NSUou5/MXfNQjDYkmOv?=
 =?iso-8859-1?Q?dqu1ugFd18Jtk2iofetgPMFOO8vd5Fm74/PEVIJJS1g1h7s6OXAgIRyLaF?=
 =?iso-8859-1?Q?WijU8Vz4jpUInhHYSVIiB3AUoWTyncnqPFMk+2LXqLu0JVE6ixk5BI+QGV?=
 =?iso-8859-1?Q?mabm8gkmLKzIeT5N4KIlkB1bIaIJC6Y=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 18190a8f-b922-4c32-7613-08def22ba0aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 13:23:52.6212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H+QOQ8CLFuJM1vY1VLw48WW/heHMht5Wo5qvr3WOO0DiXuZuihiJ6HQf5mhqm65wmYftlMZ1INyNP3HjJYB/VDzcIhfVvF3EWJb6i9dP/EJ9YsAl7ybx6Y7V+TPjWB4f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1018

Hi Sakari,=0A=
=0A=
>Hi Sakari,=0A=
>=0A=
>>The following features are supported:=0A=
>>- Manual exposure and gain control support.=0A=
>>- vblank/hblank control support.=0A=
>>- vflip/hflip control support=0A=
>>- Test pattern control support.=0A=
>>- mode support 1920 x 1080 @ 30 fps, SBGGR10=0A=
>>=0A=
>>The driver is tested on mainline branch v7.0-rc2 on IMX8MP Debix Model a.=
=0A=
>>=0A=
>>v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t=0A=
>>v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22=0A=
>>=0A=
>>Compliance test for device /dev/v4l-subdev3:=0A=
>>=0A=
>>Driver Info:=0A=
>>        Driver version   : 7.0.0=0A=
>>        Capabilities     : 0x00000000=0A=
>>        Client Capabilities: 0x0000000000000002=0A=
>>interval-uses-which=0A=
>>Required ioctls:=0A=
>>        test VIDIOC_SUDBEV_QUERYCAP: OK=0A=
>>        test invalid ioctls: OK=0A=
>>=0A=
>>Allow for multiple opens:=0A=
>>        test second /dev/v4l-subdev3 open: OK=0A=
>>        test VIDIOC_SUBDEV_QUERYCAP: OK=0A=
>>        test for unlimited opens: OK=0A=
>>=0A=
>>Debug ioctls:=0A=
>>        test VIDIOC_LOG_STATUS: OK (Not Supported)=0A=
>>=0A=
>>Input ioctls:=0A=
>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)=0A=
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)=0A=
>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)=0A=
>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)=0A=
>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)=0A=
>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)=0A=
>>        Inputs: 0 Audio Inputs: 0 Tuners: 0=0A=
>>=0A=
>>Output ioctls:=0A=
>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)=0A=
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)=0A=
>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)=0A=
>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)=0A=
>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)=0A=
>>        Outputs: 0 Audio Outputs: 0 Modulators: 0=0A=
>>=0A=
>>Input/Output configuration ioctls:=0A=
>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)=0A=
>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)=0A=
>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)=0A=
>>        test VIDIOC_G/S_EDID: OK (Not Supported)=0A=
>>=0A=
>>Control ioctls:=0A=
>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK=0A=
>>        test VIDIOC_QUERYCTRL: OK=0A=
>>        test VIDIOC_G/S_CTRL: OK=0A=
>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK=0A=
>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK=0A=
>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)=0A=
>>        Standard Controls: 12 Private Controls: 0=0A=
>>=0A=
>>Format ioctls:=0A=
>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported=
)=0A=
>>        test VIDIOC_G/S_PARM: OK (Not Supported)=0A=
>>        test VIDIOC_G_FBUF: OK (Not Supported)=0A=
>>        test VIDIOC_G_FMT: OK (Not Supported)=0A=
>>        test VIDIOC_TRY_FMT: OK (Not Supported)=0A=
>>        test VIDIOC_S_FMT: OK (Not Supported)=0A=
>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)=0A=
>>        test Cropping: OK (Not Supported)=0A=
>>        test Composing: OK (Not Supported)=0A=
>>        test Scaling: OK (Not Supported)=0A=
>>=0A=
>>Codec ioctls:=0A=
>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)=0A=
>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)=0A=
>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)=0A=
>>=0A=
>>Buffer ioctls:=0A=
>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)=0A=
>>        test CREATE_BUFS maximum buffers: OK=0A=
>>        test VIDIOC_REMOVE_BUFS: OK=0A=
>>        test VIDIOC_EXPBUF: OK (Not Supported)=0A=
>>        test Requests: OK (Not Supported)=0A=
>>        test blocking wait: OK (Not Supported)=0A=
>>=0A=
>>Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings=
: 0=0A=
>=0A=
>Could you please have a look at this patch series and let me know your tho=
ughts ?=0A=
>=0A=
>Best Regards,=0A=
>Elgin=0A=
=0A=
Just following up on the os02g10 patch series.=0A=
Is there any blocker preventing it from being merged, or anything I need to=
 address?=0A=
=0A=
Best Regards,=0A=
Elgin=0A=
