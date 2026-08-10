Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD112DFA3A;
	Mon, 10 Aug 2026 03:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786331164; cv=fail; b=n/ighVC2k8vmcQsXA21O1uV0LlswmR26G4zyDiabX3Dl5tymLg7nr8pGicRjrOp2GSrDhfHaPfMohwZhVwxUfikS45uIpGqCVFPxmfKuttmQn9JhXR3gtKtKCUlR8zPbgFyuSVsnbWeyVGEwzZqzJpCoL1gxzIK8czF9AIrErT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786331164; c=relaxed/simple;
	bh=nwxSkhmpuqKt3da8SUEh2+eC58penASGTrsB6119njA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nN8JFIHI02HGwA8TfMHoHR1xYRyqB4F3+sv7mGggZiueHv7y1hNhKWTri9EjMOsjTOZW1ZoI19JJ9VR4gP49Vh/J8+WT8ABXHO17W4mbUcar8Yvzuwxy12zDQ7IsB2NKeBIJ+rQE8hoeIamReFAm4ak8mnqh9IHq14TQUnbyn8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=io3uD8js; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=gD6FWxj1; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="io3uD8js";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="gD6FWxj1"
X-UUID: 67e1af94946811f1b1788b6acf885367-20260810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=nwxSkhmpuqKt3da8SUEh2+eC58penASGTrsB6119njA=;
	b=io3uD8jswVTgJEIHWZGYQmhUIqZqf3ETc7oCY4okT/O4ZnsgZoOnY4YzzBwwDqBC5sHSOP9ZIBL4FJiAXQaC0LKT20DSWISyb+rVT0ZiwqfKxrvrMkA3/0jYfgIbK/RIHZLfMdzHJyLbxQMAYc8HJmRQteQC8W4KqtNO5u+h6IE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:0db9c8d4-9969-4ac1-b656-96992ef75fc3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:6e4153d6-b747-4cfb-ae5b-248273dc1cb2,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 67e1af94946811f1b1788b6acf885367-20260810
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1927245211; Mon, 10 Aug 2026 11:05:56 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 10 Aug 2026 11:05:55 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 10 Aug 2026 11:05:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Icx/9L+HHFWhzo/kGce0GOTtYrmi7+QN+EAroqlRrK7UPtrMxpIoyXZgj07nfQ3+hTdYPWWq72ppcNoNmCFsvFcelBnOMw14eFr5GtH5a3r4P2PlHNaCBlpaMiuEc9TuDp/PIkK3GJs15JdxpFp9Cf6T+2nXlytB4f6e7vLnswEOahDKWwTzySMJr1cOR2+W/69ZFEa+xPBDh5unAoRJpT72U9VpWg/UdYrjQxUZGhsCfultayF4oSveO9NMpeLJBOnoO7Mmm2iIXozzfWF4tNeeMcEUrq8teTfrnivq9QuNgeAeCJz8f5tGvT8bbnditokR9bSMhTBEoxJ7v8qo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwxSkhmpuqKt3da8SUEh2+eC58penASGTrsB6119njA=;
 b=DQWXkIySUtHAgwdKobIZd1KBhsUS8UDhxe9AYJRnsREL3rcNeXqZOm+gyKjT1GDdNtvumceXJumXBuBMHief1lh+g4q5lk9plvz51Xi+W1TenHNQ9MGqxF0oN0d9Qp+JNI3NRtPVcnVU5S5yi3I1QnPLePn+CHtuxgiPVj7HghRCL+Sh3ZNL8+Dovddf+fMW4LSuJfTIp6qLxGgkqrLhA5lxXm2XnRjcSg82f3aKxIwJt0sI/+oi8vebT88+E+/VripWLg7rmdU3DKtg1SuPpyc5kKNUbrzcP6ZzA5Qx3FpYPQU7oMskoR9SJvL8pvop2vinTPAmdNaxht8Fk4W2Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwxSkhmpuqKt3da8SUEh2+eC58penASGTrsB6119njA=;
 b=gD6FWxj1JvS4bhilGl/4NeD9spQouJD/HAKHmtGsI6nF6B6qmcX3hPhIge+LNAlR1KPG+86nXW6P2F15PmbXlnRiNTYQo0nhuahSQd9bqgijdShYfGgxmHuxcvUdqHk7idzDrkchqH9P7QvAGdUE0lykSDVWbsJrwzU0ddc/2Ic=
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com (2603:1096:4:14f::13)
 by TYZPR03MB9672.apcprd03.prod.outlook.com (2603:1096:405:39c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 03:05:50 +0000
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c]) by SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 03:05:50 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "fshao@chromium.org"
	<fshao@chromium.org>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"fanwu01@zju.edu.cn" <fanwu01@zju.edu.cn>, "jacopo.mondi@ideasonboard.com"
	<jacopo.mondi@ideasonboard.com>, "haoxiang_li2024@163.com"
	<haoxiang_li2024@163.com>, "tfiga@chromium.org" <tfiga@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "ribalda@chromium.org" <ribalda@chromium.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kees@kernel.org" <kees@kernel.org>,
	"rongqianfeng@vivo.com" <rongqianfeng@vivo.com>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v6 01/14] media: mediatek: vcodec: support vcp
 architecture
Thread-Topic: [PATCH v6 01/14] media: mediatek: vcodec: support vcp
 architecture
Thread-Index: AQHdF+Y7RSrzq5sjDEOtpJV5U92T/rZ2XuOAgCBbTwA=
Date: Mon, 10 Aug 2026 03:05:50 +0000
Message-ID: <275503aae6ff76a4c186efe665acf996dec9229d.camel@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
	 <20260720012056.1026551-2-kyrie.wu@mediatek.com>
	 <c3abd49fc12e8cfab6993feb60b361ba07b6fb7d.camel@collabora.com>
In-Reply-To: <c3abd49fc12e8cfab6993feb60b361ba07b6fb7d.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6195:EE_|TYZPR03MB9672:EE_
x-ms-office365-filtering-correlation-id: f81122eb-f1b4-40a6-66b0-08def68c4896
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|38070700021|921020|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: XZJSUNCSt+H6uyj/w+MFJTTsGLZSyiNdoidUAv7FJ1w4N0uoAU2LAl2W53H/CN95gvqcqiBULS1i02iaZEvbNJ/3KsMQgnFt2rPqLvhnxBfsvfh2mkwcVf3taAHtgnkntg49YaNBxoxWStmzULP0pvfinElPym6WRHweBabOVyPbgq/MafvU5mY6cNIBuUglrlc+79nSS8ZGNDvEhf9/+ZM2v5FzUQGpWBsm9eNopTq3SDSKuqOQQbCTHjoxX34LOfF8rB/D66fywc4RdnDl3ONTwYoAI2notwpXmiU8ftYnhbFboUke1ryAnMT8XSIWUjlWNFwFIQGNuFcTiBbmzPXSj9qdCOXR8BTV7LIIN9BFQ6guKcZku/TYhrwAXyx4hJkQup+dTDjT6QTnRpIaNk3qModkkGOv6tfPah2HOn8doAh5KCsFEBlmNId2poPoVuHe0XRXu+My/tsBYNQWdRDh8WKoxiqr0e4783eiR/tZbfWWFhEKJ9jKRuvHvjhjiiP+7BY2ziOlcU6sr54oHwWbyOH6ARTC3GhM0O6mglG/ds/pHbau2kJp2bjoYgnP30JJw0pM4fk+NT2v9SN4HOLrPFfBTcK665rGSBx2hMc5IZkkfNdt5ZzmTolaRaO1r2/sIsf++LWPmjiQxdZdeqEimaj7J5MmyFlj35mqhbeSPCVpm3wOHKtXZdWYjEWEPV6j3MxXsfipEmo6N0w727W4EaoIshRHoisJwHAcwqc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6195.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(38070700021)(921020)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zk5LenpERXdNWXdVOG50dDhUUTBDbXhSem1WdlBnaFBIWlExeWREWUwzOVB5?=
 =?utf-8?B?OW1QTklSM2loUVJpOXF0VkY0UXFlSGdvVUp6RE1aMnBUdDdxWDZDVHE1eUN5?=
 =?utf-8?B?eVBUUUR5WWxpcWVkNnRjS21YZzBuMktLSi9HR2MzVUh5NmVLVFpMUnQ2a29v?=
 =?utf-8?B?SWc0dS8rS29QSU5FMXFncldhN1hiOS9SbGUydFRYTk40MEFYWE0wWlRNVU51?=
 =?utf-8?B?S0drNWQ5bm9yblpuN29LUlZHQUpaZW8renUzaWhNN2ZxMjNHc3RadDd1OVZJ?=
 =?utf-8?B?cUltWEVKMGd0VVpxYkRndm52d0F6VW01enpObjZIVGZSSUJSMzl2c1AyeUx6?=
 =?utf-8?B?V3ZCeGF1M25YYkFvY1lXR3hPNTZJU1VnVG1tVzFEZkNRT2p1TVBHeFZSVmc3?=
 =?utf-8?B?SDhXQ0Rub1FDZ2V3QlNGYVNKZlhjM2VnK1ZTQjBkUjl4U2lYM3dWcUpWcUVT?=
 =?utf-8?B?M3JMbEpLU3dHMzd2V3VOQWJDdk9hbndFRVZzVnBNcWJJVzBQMmNGUURTK3Aw?=
 =?utf-8?B?VkJWUlcxSjQrbHY0RndvRkN4UzlhS0J3eHlBRXc2NXBocElZaUd1VWwvVnF0?=
 =?utf-8?B?dm4xcTdudUVvalFiSmoyNDUwTmc3dVA3SEF5ZGgvcy9RWjNnaFJETkFKSnFR?=
 =?utf-8?B?eTl1Um54UDlpV2poUU01ay9xeEJMczYxYVdRL1JDT3RkamF3UU4vaWZSYk8r?=
 =?utf-8?B?YWVMaVVEY2lzZXdMMXFYRzIvWmlteHQ4dGh6aWtKRnBiaCtkSGExS0V0cU5B?=
 =?utf-8?B?MDczcUFrOWovTENwSlg4T1BHaXl3STA2Q3g1YjE0bEdyaWc4MjIrSWV2NC9Z?=
 =?utf-8?B?dDY4d0RWUW9FUVc2bGZweGNaclM1bHJvQWExVmV4Smh6cUI3eUE2Zm1hM29r?=
 =?utf-8?B?WTlQSVBuTGxiZEhHenlIWGFvWTB1c2N3VFRqdXI0aHM2QnlkRFhMRGVRQUtl?=
 =?utf-8?B?WE5jUHVCOG5lakUvekpGVm9rdGhlbDhGS3ovRDc3d0kwOFZUN1ZXNmJoSEZy?=
 =?utf-8?B?Q25RSW9RWUg5SEgwK3BoZGhzWnVTS1pjVTdlWjJBeldYUzRFUFM5NHhvS05u?=
 =?utf-8?B?bnlwVUNZOXlhbkFEUzgyU0ZKd2xHNytrellBZ0JhamxLY1RVY0pPOFZhR0hi?=
 =?utf-8?B?dWY5NlR6eGoyNjQvS1kzb3F4Um8xSEZ2ZnZZYmszVVJUTjRhVi9VaFcrdnFW?=
 =?utf-8?B?UDRpZG9GeGNFUnQvQVE0bEFnVTBGNU40cmlSMXZOZ05BWmdIREljZkMrQkIz?=
 =?utf-8?B?eDBMQnA0VTI2ZjNNRXNjRmVMREMrUEQ5dWk2SGNsbVRHN2FOaHBES3ZFeHNW?=
 =?utf-8?B?Y0ZYVDB3QnJlU0hpYy9xcWRZU05QcWdyRzYyNDNRelMyYW9yWFJMOU5BbEpk?=
 =?utf-8?B?R3YxU3VxczgzSjdmUFhBYS8zOHNQaWgxRThQTkRjOFZKMW5iNWZtMnZUY1pO?=
 =?utf-8?B?WjM5bzNacFNhNWpsUmlwUmxlTUg1bE40TDAySDZUZ1JUSmJ2dDZvODI2VHRV?=
 =?utf-8?B?V1lXakZqUGZTUFB0TmkrU0pYeXhIQ2E5bkZrYlo0MWdoVUZMUzlON0NUVmxM?=
 =?utf-8?B?KzdGOFhVU3NNZlBjdHcwa2VBdFJ5cHgrSFE5T2ZRMUtQS1BYUHg1RC9Wc2pK?=
 =?utf-8?B?d3h3U1BaeHBzSzFKME9JOE9RdHVSblcrblpiSlNEZG1zdjkwWlNOSGhjdUFY?=
 =?utf-8?B?N0QrSFhRVzU4NmtaaFJTU3VXcWEyaktwSFp0cHJ4QWNscmpVWUJvMDhSalc1?=
 =?utf-8?B?M2xWTlhXOHpHS0VtVEVPWVNDdGJqZmNieTZINW1EUzg0eFhtUElNS3ZlTFFp?=
 =?utf-8?B?Y3YrQTJZcmNKWHdzcnVFTVcwVjRxQWl3ZlpiaTNqaWV0dENXaDBkcmRzb25R?=
 =?utf-8?B?MjQvMDlyZ3RjbU8veFBtQ24zdVNwZjdSRjhKbnZXNHBiMHZ5K0hhL3V5aE8w?=
 =?utf-8?B?ZFNPai93NExYR3ViOXBwenFqQ05Dd0VpNmpOd0NJQ0tjMUt5eEV0N2dVMWxV?=
 =?utf-8?B?V0tjWVU2QjBQVTBTaTR5RThTMVU1L1VuUDdPbVRvTFJNZUtIRVhlazg2K25E?=
 =?utf-8?B?T21TUndMenA4aVBwbmNkSzRnWjVPMVVpZjVwRFFPaFUwcy9xZUw5WEhhSWpM?=
 =?utf-8?B?YnMxSk54WERBZjVOaUliMVhrM2wzeVNsczR2RXBHWHhBMWE4VXpYTE9DTjF1?=
 =?utf-8?B?RkVLMFFIemFZeFp0WmNzY1ZMVWlpT1B0Z0YvN0x0VzJMcml2a0s2UVNHOWNu?=
 =?utf-8?B?c1hiU2VPMGo4a1VncmVBdW9jWXo2cGh1dUdkcHNPV3RxcXY3N3dDZjBybnY1?=
 =?utf-8?B?SWgwdFNwRnFWSUZHN0htVWM3REJkMXhhdi94RXlIbS9lclRjcVBkdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D8B4974A74E7547BCFEA00EE162C5CB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dtsZBWrr8iIAqTsoIO051X9cye0CSD4sepyaPOyrtzfl43NTED+O0+ZOWL0LLQzE1egBjWdD71AAy3ih+l8ds3qsDEESZs/u3yjqoiqeB7FKbS/I4rQWEnTppprY4C+lM14sIWxVf14w4YuOpADuzajBkRYxISRh7BwPrScuGmqFOJxghIrcyTRerjUjtirUbmgvCsDobyaol/EQtnH49SMLjNOaKkOOF9O4+MaS54yzHuudxdFfJVZIffgYMWErn/2nHxcZqHGOwaXgqFS7Uk6VCbxV0RYIHMpiP+UNrh8fFWaZs8RYEKHAEb+aBVD4gwsxIBTjrdrC4a12BdnhUw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6195.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81122eb-f1b4-40a6-66b0-08def68c4896
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 03:05:50.6574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 55zYt2/maOOfTxTY8uNT0PDFy461ZXtgFXXsp/IarJjmgfRPo5IhoEtQ4db8AKvOHIeDS+N2V+p+kFAk+3xE5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB9672
X-MTK: N

T24gTW9uLCAyMDI2LTA3LTIwIGF0IDA4OjU3IC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIGx1bmRpIDIwIGp1aWxsZXQgMjAyNiDDoCAwOToyMCArMDgwMCwg
S3lyaWUgV3UgYSDDqWNyaXTCoDoNCj4gPiBTb21lIHBsYXRmb3JtcyBleHBvc2UgdGhlIHZpZGVv
IGNvZGVjIHRocm91Z2ggdGhlIFZDUCBjb3Byb2Nlc3Nvci4NCj4gPiBVc2UgdGhlIFZDUCBhcmNo
aXRlY3R1cmUgd2hlbiB0aGUgVkNQIGNvcHJvY2Vzc29yIGlzIGZvdW5kLg0KPiA+IA0KPiA+IFNp
Z25lZC1vZmYtYnk6IEt5cmllIFd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4gUmV2aWV3
ZWQtYnk6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4N
Cj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2Nv
bW1vbi9tdGtfdmNvZGVjX2Z3LmjCoCB8IDENCj4gPiArDQo+ID4gwqAuLi4vcGxhdGZvcm0vbWVk
aWF0ZWsvdmNvZGVjL2RlY29kZXIvbXRrX3Zjb2RlY19kZWNfZHJ2LmPCoMKgwqDCoMKgIHwgMw0K
PiA+ICsrKw0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2Rl
Yy9jb21tb24vbXRrX3Zjb2RlY19mdy5oDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL3Zjb2RlYy9jb21tb24vbXRrX3Zjb2RlY19mdy5oDQo+ID4gaW5kZXggMzAwMzYzYTQw
Li5jMTY0MmZiMDkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay92Y29kZWMvY29tbW9uL210a192Y29kZWNfZncuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2NvbW1vbi9tdGtfdmNvZGVjX2Z3LmgNCj4gPiBA
QCAtMTQsNiArMTQsNyBAQCBzdHJ1Y3QgbXRrX3Zjb2RlY19lbmNfZGV2Ow0KPiA+IMKgZW51bSBt
dGtfdmNvZGVjX2Z3X3R5cGUgew0KPiA+IMKgCVZQVSwNCj4gPiDCoAlTQ1AsDQo+ID4gKwlWQ1As
DQo+ID4gwqB9Ow0KPiA+IMKgDQo+ID4gwqBlbnVtIG10a192Y29kZWNfZndfdXNlIHsNCj4gPiBk
aWZmIC0tZ2l0DQo+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9k
ZWNvZGVyL210a192Y29kZWNfZGVjX2Rydg0KPiA+IC5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2Rydg0KPiA+IC5j
DQo+ID4gaW5kZXggZTkzNmVkOGRmLi5kMjIwYjY0NWUgMTAwNjQ0DQo+ID4gLS0tDQo+ID4gYS9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNf
ZGVjX2Rydg0KPiA+IC5jDQo+ID4gKysrDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL3Zjb2RlYy9kZWNvZGVyL210a192Y29kZWNfZGVjX2Rydg0KPiA+IC5jDQo+ID4gQEAg
LTM3OSw2ICszNzksOSBAQCBzdGF0aWMgaW50IG10a192Y29kZWNfcHJvYmUoc3RydWN0DQo+ID4g
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+IMKgCX0gZWxzZSBpZiAoIW9mX3Byb3BlcnR5X3Jl
YWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLA0KPiA+ICJtZWRpYXRlayxzY3AiLA0KPiA+IMKgCQkJ
CQkgJnJwcm9jX3BoYW5kbGUpKSB7DQo+ID4gwqAJCWZ3X3R5cGUgPSBTQ1A7DQo+ID4gKwl9IGVs
c2UgaWYgKCFvZl9wcm9wZXJ0eV9yZWFkX3UzMihwZGV2LT5kZXYub2Zfbm9kZSwNCj4gPiAibWVk
aWF0ZWssdmNwIiwNCj4gPiArCQkJCQkgJnJwcm9jX3BoYW5kbGUpKSB7DQo+ID4gKwkJZndfdHlw
ZSA9IFZDUDsNCj4gDQo+IEkga25vdyBJIGdhdmUgYW4gcmIgYSB3aGlsZSBhZ28sIGJ1dCB0aGVu
IHdlIHJldmlld2VkIHRoZSA4MTg5IGNvZGUsDQo+IGFuZCB3ZQ0KPiB1bmRlcmxpbmVkIHRoYXQg
dGhpcyBtYWtlcyBsaXR0bGUgc2Vuc2UsIGFuZCB0aGF0IGZ3X3R5cGUgc2hvdWxkDQo+IHNpbXBs
eSBiZSBzZXQNCj4gaW4gdGhlIHBkYXRhLiBTYW1lIGFwcGxpZXMgdG8gbXRrX3Zjb2RlY19kZWNf
Z2V0X2NoaXBfbmFtZSgpLCB0aGUNCj4gY2hpcCAibmFtZSIsDQo+IG9yIGludGVnZXIgZm9ybSBv
ZiwgaXMgY2xlYXJseSBhIDEgdG8gMSBtYXRjaCBmb3IgcGRhdGEuDQo+IA0KPiBOaWNvbGFzDQoN
CkhpIE5pY29sYXMsDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KSSBhZ3JlZS4gU2luY2Ug
dGhlIHBsYXRmb3JtIGRhdGEgaXMgaW50cm9kdWNlZCBpbiB0aGUgTVQ4MTg5IHBhdGNoDQpzZXJp
ZXMsIEkgd2lsbCBtb3ZlIGZ3X3R5cGUgdG8gdGhlIHBsYXRmb3JtIGRhdGEgYW5kIG1ha2UNCm10
a192Y29kZWNfZGVjX2dldF9jaGlwX25hbWUoKSBkZXJpdmUgdGhlIGNoaXAgaWRlbnRpZmllciBm
cm9tIGl0IGluDQp0aGUgTVQ4MTg5IHNlcmllcy4NCg0KQmVzdCByZWdhcmRzLA0KS3lyaWUNCj4g
DQo+ID4gwqAJfSBlbHNlIHsNCj4gPiDCoAkJZGV2X2RiZygmcGRldi0+ZGV2LCAiQ291bGQgbm90
IGdldCB2ZGVjIElQSQ0KPiA+IGRldmljZSIpOw0KPiA+IMKgCQlyZXR1cm4gLUVOT0RFVjsNCg0K
