Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.95
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795750376;
	b=DdUqSnX1J86tZBaPA1qrtbLDrjNqMRl7FY3r29c6/f2RQZbyiVhW+RmliDzNi5fm4/7+
	 7PQihKsfA1deE91q2CMSz6ms4sdsA2n47aUjzDwtaaL6LHcxyhqgK4S8yazSonVq8Pp3e
	 GXk6qGJYGPlyBwW7ofPkjJs2LucBgRqEc3ZlFp9lpbTsN6Yz6a6bCrtRYvLtXi48UFnxj
	 2Jh92Z8vVy+7Hyr7QWzr9+XaKbFC0AbeWcPmZbqcGbhZHz8ezn2dzGxqMgAuqQesHEujj
	 VyyuNFLAdLGGp19jtRktC6umOg29SMLDfs4HYEfSVt56IfUc6rac2470AugHbC4l2jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750376;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GLlppsnWfzbdUB4PFBa49l1N7zvgcQAseaE4i2Ap+48=;
	b=qhpb4bAFVCIKpYmWTUac+iW2+6cKomHjqJNH1NYarFQkTAIy2Btg0HW0lL5ILAgIvwN5
	 KwyEAVQCxaxAo+C9cGsNs5dg2SJi4kohti65+VKRiUEYDFszBrcjFIkvuhGNc7IxXIt0e
	 AkGpG0gtvdGcBBYOfRCMCa4tWXGyPs+jBzxQ8CSl+h28OXwfBn9hD9WhkOfunG/B/MsYP
	 E7mx8K1gtQWSK4lTR/okotx6zvZoB1gW8xmcY7dYdlMCzale4PZC80EgLyo7wHVNTZdZK
	 r8PGwbVbfeFnFciYp/LyO+ZQ8qJSehlmBkYxS5ph9xXZ2DXhFCAFGpK3On5g7jkpZ6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=SOfA4Grz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.95
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022095.outbound.protection.outlook.com [40.107.43.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3FA606A31C;
	Fri, 27 Nov 2026 03:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E3FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=SOfA4Grz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mx8vKVxgD76vSp/J7cQFnBHcdbn/K4xIGUp1H8hoeafaPfhqlUB3jyD/i/kaKYbsm1K2y1Qo1VpJWjT3d3VIk+CazNDxJrZec2fFgX/FJYvJ71bDyV6SEHwuLeByh2QPynJNdcW/QKseY6ZZD1GONIr1va3G/JNtF68nOXqDSQYam5WEolIVMWLt54iC2LBW9f5cdJu3C/iHiU2agx8BOfUDevMK5otxD0duL32dVE5+gD08ND3Gey3CKDesCIdtVpEYKuI8GQEdU8JhatMvXg9jxmjqI8rTbn9MEHeSdEU1BYr+67TaOth2dBQ3YhdNg82R6x+Osvuhep1vwaHrYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLlppsnWfzbdUB4PFBa49l1N7zvgcQAseaE4i2Ap+48=;
 b=KuxrMJZ7gLSQpTa1lAtsk27qBNHNOrJO+jFzcClJ61ggb0D4Ph+ZVO0vqZOkVDIGIAzOOqD17p4KbLKE7nFz7iO0sHxDtsfhw7R4GElCtc8MgIP4cmwXVrqVd4OLqhoyQ+V/0RxkQY3ey+pcYltsuVbNi9hldYbrdk3EqnFRrQlh6LDt6srHtH4PprjOcUHMXpss7BaNh/udw8zUjfcnyJlrh0hoHafCOvQffR5GmnpK3Lu2C0sHllY8Wtboh8VDp8oZKaifCZVnlgOLeig1oiXvqMwVyJ+jZxwlGXqM/m5WIyA0MQKKumdfUL9t/VfRC0FUPoBtpKRvevUQu8FmlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLlppsnWfzbdUB4PFBa49l1N7zvgcQAseaE4i2Ap+48=;
 b=SOfA4Grz9CZZ3hXALB9L+SYbSBzxF5WzWESBne3Fehc4IRI6y57p+CxZwu85veKV3fX8cLT6iYtm+UXAMvIu8EOmiryiSqJGf/o/oZma2rZtx8iBGoW9dHXGRGapFQ3vf0KQLJcswQ15Vr3NbZ90spbetvSs6RgAgbazOYP+4DqGPpo+K5YwLtw+kUemNFNkk1t8x1FUbrXkSIIM0RxyGDzGff2BbSm8Tcv2V4MIGUP0FW+hnwC48Z98HO2ucbLq8JI1LmX8n3FXHPPKGIoMpSwPdE1LoJl4ISLS3LIHh0uyyECqNcWZJK+40eiZYdJ6grmwYYdlxvz5QOScCNGG1w==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by PU4P216MB1870.KORP216.PROD.OUTLOOK.COM (2603:1096:301:10b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 03:32:51 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 03:32:51 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"kernel@collabora.com" <kernel@collabora.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v4 3/5] media: v4l2-core: Add v4l2-metrics interface
Thread-Topic: [PATCH v4 3/5] media: v4l2-core: Add v4l2-metrics interface
Thread-Index: AQHdfO+z6iX+INQb70eCriIYjocbqrdBK6aw
Date: Fri, 27 Nov 2026 03:32:51 +0000
Message-ID:
 <SL2P216MB2441C07DE4CD2D1B41341ED4FB412@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <20261125-v4l2-add-fdinfo-v4-0-2dc73fad9932@collabora.com>
 <20261125-v4l2-add-fdinfo-v4-3-2dc73fad9932@collabora.com>
In-Reply-To: <20261125-v4l2-add-fdinfo-v4-3-2dc73fad9932@collabora.com>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|PU4P216MB1870:EE_
x-ms-office365-filtering-correlation-id: 83b80466-12d2-4ccf-86a8-08df4c371db9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|38070700021|10067099003|56012099006|261026140227099003|261026121527099003|261028144727099003|261022105027099003|261102123227099003|261022075727099003|261021121427099003|261021135927099003|261102130727099003|261009223027099003|22082099003|18002099003|4143699003;
x-microsoft-antispam-message-info:
 MKZKZ2plRjtEasBldORMeDo2nCQ3OQtKHTc4Pu8km8GLq+mJx8o60l/EJN8Yt8ZBeNKu8VULlA96bBD+BN2Ofx9A5CLAzGku8vvcXcw3sExqMRoN103dwVqher+J93GicdsrjMnCSLycvkwZO1dcpVvWExFybwE7DKYf8ZBiolcZStxLB8MzuGTn4d+06iQcYqZYn/s0+SCwDVRErx/97YTKNmorVEaRseSpZ5ENTul3u9f/7DTkMyxByktmqx/0jQ3T9wpfMCgsd+D2vmeAfPvgnmwZTBBQ/vERxe40VH2KoIOJ9+CZZKnnjvtRAuq0oLWlqNiIjDbfItY/tT4j5/O9gzZRuEICXCLMUs02nwVaR8t2s6aMeywFv3dXMU1LFiYKifsFGgT8sVemaOhN6XjC2bC++j393EuuEy7/VQi2TW9DykAw783+jlkZRcbKyyfOqMI+pYl/V+Jwkj47lcYxWhuRHNVO9EK/IgNti+gws7NJo3d5ol2f25SC+wkTlSIy4oxGaggyB5/D4j6b2bU231HWE8ixfDIboGkJ7Bax2mCT07AOMHwAOCJE6PrDtN7tP9PegsAijKpLgpeV54Ty+G0slW5exLmSi961PVE9ti/qLxiRrhuMrn0BfsWRmvzPT0arAOqKyDNyEuMmIBw/XDJaR+sRxhiuKaryJLD9mP1F/zeOG9TqUPdmUxdRQNLBPEXujyS44Kd0hwxtfimt+IN55IxXwJo2/ayFcWo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(38070700021)(10067099003)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261102123227099003)(261022075727099003)(261021121427099003)(261021135927099003)(261102130727099003)(261009223027099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ul1X4kOmdbTbqsZpKAUwiL5GLNdF1MuE7puXtaRXZYT8B7L+yBbSUldMni6E?=
 =?us-ascii?Q?+cEaCMGyroy1z6KX8piAget4EJaZrVa7m/agrd+YgVuyOIAKv7A3PJPXu4EI?=
 =?us-ascii?Q?beD5ZX2nnEtm4VhkMkPQx3ZYMoFutHCtYJG1JkQzTi5DmTmafXeRT9NQz0Wq?=
 =?us-ascii?Q?wlx9GpIRUjMF8bOkHjkDNPIjs245MnC79IzQQXXawbN/k1YImN5KboVwtxiX?=
 =?us-ascii?Q?ePrp0R/Zb6aUdpsiOJaXGtR1iOFXpI+SXsDs+mpB1u69c2I/PGzVkyT2SDMf?=
 =?us-ascii?Q?X5huT28lVhGlZz4WhUq3AJv7Sdq7wSUwwEU0OA/zUfe2kQf4QSVY1woJEobe?=
 =?us-ascii?Q?dX9XSfmvPzoUDrsJFqy8o0MoFE7YQXkEEGNc4EC9OAkRIJ/Nk3JKebqyHmsf?=
 =?us-ascii?Q?83Cr1KtjcmeRGEIIEkX4pC0CBpKiyu5D3x/QVusIzROL4iWaRtzA3fK/iL+j?=
 =?us-ascii?Q?93fezEs5JpTvh0g9YEpOCbI7zXH1XTat5LGzQauxVMadvmi6shqwMyuqpaeZ?=
 =?us-ascii?Q?d0VKvMXBoeDdEz7B8BRyJz2OaIkvMjRr6pNrPkpXh/56GtheL2RuJMSIdzoT?=
 =?us-ascii?Q?KrdJlJdhSAEOs2SCOj2xB+NjVxGRu97IDvRpl1xsRpcrX9RV+2mZs0clvSFI?=
 =?us-ascii?Q?Ctmo0IiEp8m3N2VGkrNHc/11o3Yo9QUoT+FqEA1JZxPUrqnfMym0eksFneUo?=
 =?us-ascii?Q?XSrHI8xhVJfh01DJlQhqy3H80PrUNDmhTqbyRW+gF2c1Ea9FFAFWjseS1nJI?=
 =?us-ascii?Q?xQVPEgXgkVD167+B0Ra/exihP0BS+53Lie8sQ63RusG48ymKOdZ9wp72J/9r?=
 =?us-ascii?Q?k/WZ+unPuI051pLGVOOI5PB7hhzeRHHxxkYKDFwxvyroi6o3Qq5MJeQ+fh6t?=
 =?us-ascii?Q?d84fE9YsB9UCz4Ih/G4tYE/Ksr1FE/LJgmvSvmZwjB7LFJCEYE27rchCtcrK?=
 =?us-ascii?Q?zg57b6OGtjKXBcM0Xeoe6iy7fvMVN6Hvn944kCut0uy8b22kkGN38HR9DkOG?=
 =?us-ascii?Q?3JObiB9MxojKHfBYo6pe9AsRXsXz+GCq5/AtQgmyPZ3hhTBmv7S9z5lN9TXJ?=
 =?us-ascii?Q?oK50YuTMgUvvyo1hBzf8f880R5ObFFZGHqvFOYcY5/s2kdA7L8LAyIvp7wpb?=
 =?us-ascii?Q?opgJDcxaGC7iKeykxv4DHq3MPFhbQ5kRU0Y4Ev5MMuJFMPBhAIMA5pp16Yua?=
 =?us-ascii?Q?rfTGkTny32V7DNp2RvsMwLAa9BS8M0YipM9i6fhhlAzG4W1QLIleFP8nwwuj?=
 =?us-ascii?Q?j1GI/UbNsRWXsNWTRuRihe2JP8YUEu2jE9em+dMr6P90QKvmAYeyNdnin5Af?=
 =?us-ascii?Q?yp9JYdsFZyyrDM6TF9j/FPxO3IVG/H3aG/tghZGJkjDzHpvt5fDi+CEKiOvK?=
 =?us-ascii?Q?yyqOjv7EhJloGpxpfNVs51rY1HwVqyK9gjo4CyV2iY0zeL00Y7cYu/tS4BVq?=
 =?us-ascii?Q?yYbWwKBWNhASX8b/OdasORHmxvVQlqNbK7QBtA/VpKJJsw1KEAEFSbPoao79?=
 =?us-ascii?Q?yx+aFnQSLO5BzbFu0UU57F/OSmjlOM6j+mnyIY/NxK2puzvWguRlrv2CciMm?=
 =?us-ascii?Q?qQApMuyrkStjwI1V5SjUjahSoysDaXa0Mhq8FzhL2kQC+dwkdMoPxa4ViK2d?=
 =?us-ascii?Q?mRqR9LT5ETQbZfpryLc5lBUfT1JH0nKUvSPgXnNAH2eWR5qv7XAeI2hFmRhY?=
 =?us-ascii?Q?gLgRPQetCwQPYLXTxBaB5y5d7MyzJ9d54SfkwfHfp6Pc1Kol2X6JIL1V+zeZ?=
 =?us-ascii?Q?X0lGIdu5dA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b80466-12d2-4ccf-86a8-08df4c371db9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 03:32:51.4475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOJxYEkJLGSqQ7zOXkvZUVSNCQA1N1p79x30ZNnx/HyDC7mOX94hv8gYjjyY5Ombv0VpxK418MoKbAkWHjSsqhSn0aihN79j/yacQgOds7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1870

Hi Detlev,

>-----Original Message-----
>From: Detlev Casanova <detlev.casanova@collabora.com>
>Sent: Thursday, November 26, 2026 12:12 AM
>To: Mauro Carvalho Chehab <mchehab@kernel.org>; Nicolas Dufresne
><nicolas.dufresne@collabora.com>; Benjamin Gaignard
><benjamin.gaignard@collabora.com>; Philipp Zabel <p.zabel@pengutronix.de>;
>Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>; Heiko Stuebner
><heiko@sntech.de>
>Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>rockchip@lists.infradead.org; kernel@collabora.com; Detlev Casanova
><detlev.casanova@collabora.com>; linux-arm-kernel@lists.infradead.org
>Subject: [PATCH v4 3/5] media: v4l2-core: Add v4l2-metrics interface
>

...

>+
>+void v4l2_metrics_show(struct v4l2_metrics *metrics, struct seq_file *m,
>unsigned int core_id)
>+{
>+	seq_printf(m, "v4l2-driver-type:\t%s\n", driver_type_name[metrics-
>>driver_type]);
>+	seq_printf(m, "v4l2-core-usage-time-%u:\t%llu ns\n", core_id,
>metrics->hw_usage_time);
>+
>+	if (metrics->has_hw_usage_cycles)
>+		seq_printf(m, "v4l2-core-usage-cycles-%u:\t%llu\n",
>+			   core_id, metrics->hw_usage_cycles);
>+}
>+EXPORT_SYMBOL_GPL(v4l2_metrics_show);
>+
>+void v4l2_metrics_show_clock(struct seq_file *m, struct clk *clk, unsigne=
d
>int core_id)

To allow maxfreq and curfreq to differ, how about passing both values
instead of the clock?

void v4l2_metrics_show_freq(struct seq_file *m, unsigned int core_id,
                            unsigned long cur_freq, unsigned long max_freq)

Thanks,
Nas

>+{
>+	seq_printf(m, "v4l2-maxfreq-%u:\t%lu Hz\n",
>+		   core_id, clk_get_rate(clk));
>+	seq_printf(m, "v4l2-curfreq-%u:\t%lu Hz\n",
>+		   core_id, clk_get_rate(clk));
>+}
>+EXPORT_SYMBOL_GPL(v4l2_metrics_show_clock);
>diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
>index aad4b3689d7e..4f1ca1bbc61f 100644
>--- a/include/media/v4l2-fh.h
>+++ b/include/media/v4l2-fh.h
>@@ -17,6 +17,7 @@
> #include <linux/kconfig.h>
> #include <linux/list.h>
> #include <linux/videodev2.h>
>+#include <media/v4l2-metrics.h>
>
> struct video_device;
> struct v4l2_ctrl_handler;
>@@ -27,6 +28,7 @@ struct v4l2_ctrl_handler;
>  * @list: list of file handlers
>  * @vdev: pointer to &struct video_device
>  * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
>+ * @metrics: metrics information for this handle
>  * @prio: priority of the file handler, as defined by &enum v4l2_priority
>  *
>  * @wait: event' s wait queue
>@@ -43,6 +45,7 @@ struct v4l2_fh {
> 	struct list_head	list;
> 	struct video_device	*vdev;
> 	struct v4l2_ctrl_handler *ctrl_handler;
>+	struct v4l2_metrics	metrics;
> 	enum v4l2_priority	prio;
>
> 	/* Events */
>diff --git a/include/media/v4l2-metrics.h b/include/media/v4l2-metrics.h
>new file mode 100644
>index 000000000000..fc493b65f117
>--- /dev/null
>+++ b/include/media/v4l2-metrics.h
>@@ -0,0 +1,47 @@
>+/* SPDX-License-Identifier: GPL-2.0-only */
>+/*
>+ * v4l2-metrics.h
>+ *
>+ * V4L2 metrics management.
>+ *
>+ * Maintain a per-file handle list of statistics about the hardware and
>handle
>+ * exposing it in the fdinfo.
>+ *
>+ * Copyright (C) 2026 Collabora.
>+ *
>+ * Contact: Detlev Casanova <detlev.casanova@collabora.com>
>+ */
>+#ifndef V4L2_METRICS_H
>+#define V4L2_METRICS_H
>+
>+#include <linux/types.h>
>+
>+struct clk;
>+struct seq_file;
>+
>+enum v4l2_driver_type {
>+	V4L2_DRIVER_TYPE_UNKNOWN =3D 0,
>+	V4L2_DRIVER_TYPE_STATELESS_ENCODER,
>+	V4L2_DRIVER_TYPE_STATELESS_DECODER,
>+
>+	V4L2_DRIVER_TYPE_COUNT,
>+};
>+
>+struct v4l2_metrics {
>+	u64 hw_usage_time;
>+	u64 hw_usage_cycles;
>+	bool has_hw_usage_cycles;
>+	enum v4l2_driver_type driver_type;
>+};
>+
>+void v4l2_metrics_init(struct v4l2_metrics *metrics);
>+void v4l2_metrics_exit(struct v4l2_metrics *metrics);
>+
>+void v4l2_metrics_update_hw_time(struct v4l2_metrics *metrics, u64
>time_ns);
>+void v4l2_metrics_update_hw_cycles(struct v4l2_metrics *metrics, u64
>cycles);
>+void v4l2_metrics_set_driver_type(struct v4l2_metrics *metrics, enum
>v4l2_driver_type type);
>+
>+void v4l2_metrics_show(struct v4l2_metrics *metrics, struct seq_file *m,
>unsigned int core_id);
>+void v4l2_metrics_show_clock(struct seq_file *m, struct clk *clk, unsigne=
d
>int core_id);
>+
>+#endif /* V4L2_METRICS_H */
>
>--
>2.56.1
>

