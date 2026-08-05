Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB993E63A2;
	Wed,  5 Aug 2026 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785924542; cv=fail; b=uijESkODEEtlWJBdyDoQ854VfHDkPfUVI7RPOAPPBVUWFxPwFo/VgEy/CmflzI64TxVQ8NwY2Kq7iwd7V6rGa7de389HOgmjEo+RLJ0bOFttZJAXBH3chw6nLq3LISIkdsh6nYVSevcmUpD6AUY2oUNOTmQmMLZ+OMQI0JotbZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785924542; c=relaxed/simple;
	bh=7CPVL2TU0mTF44cRXTMUwgmt9vZXe+dl8kGRZF+ltQE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fYFRYebR4+sXfodF6S1fGE/lb49XYAW/GB+xwXBordCHu4FZFODD/TJsLWuom5efjEGke2A0tq8FkYbI3Cy2rVa+4aVapCnGtuZM6YuXEZ/hJ4ZXdBqeKlA2UtcM4i9qhVuix9Qp9L9FLsTaoxVi1VhNnQ93Q5N26q0bcLxV5pA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=DLJDwj5k; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="DLJDwj5k"
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758brml1858139;
	Wed, 5 Aug 2026 10:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=A8wJvM3
	/87mNtYC3gAwxOniA2PpvYpE4l29Q7d+Xlog=; b=DLJDwj5k2D0mvZn/BSAs1cl
	EnZHwUQSLwYibHhPjsyTf772kW63blm6cdabRYzjJUFqspxMrOqM8Ra9r8isuzBI
	c4cIUXLwhkGoil/lmuS1d+IoizYqFxPBLVAf8TRtFwiAVf83+kDjm7VXRGsoDVX/
	nxNNIZnnnbbBTiws+P2j6Vt07XJRwJTfSfkshvw5XJ87JCN583KUmP2IJ2kmDEmJ
	AXpHUAyShSPuRGMxOlsIwVg1D35zXtGDkDRxBUk9XuKxmSEZ4XkKZj21cJLTvcCf
	b7ENPna8z1n1X0D4murFgRsVtl2G/lwDxxuaf9rD9MvniSWCI5vkzGYnViIe6GA=
	=
Received: from tyvp286cu001.outbound.protection.outlook.com (mail-japaneastazon11011020.outbound.protection.outlook.com [52.101.125.20])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4fs6724avv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 05 Aug 2026 10:08:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDPQcfU1MlD9WG5BaD7Q0hj3dkRj/i9kkRbHMTqeZrKCn1kdi/Yf5YoYTWW7fb/zBpu02FbGBhdSLfAHJnsQOMGG15+H6FdoZQcBkt8+t+xH+v/YxC+ikTwahhGUn5E+5OdFIoq9+G4FBuUp9ObEUNfsZeFAYFRjlpuZcmOuTsvsZV+b6x8jtP/+xVe64KbKucn+gai1aFjUhH2996/cjQUb8U9E2Fdh3FIKeipuP6OWsM/C/lhxTl8rohvfRfy8YOXrExKdagaAxxAlnQRz/PcA1qie7oDPgoU077Dl/JhFfhKDM81iVa6AvXx0ZkhxLneS2YEoTk3uFe27U21bow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8wJvM3/87mNtYC3gAwxOniA2PpvYpE4l29Q7d+Xlog=;
 b=aY5rCwXfzWlr9iWF5qATtSd+ueHr1jzgaNpBnrE9MwqzfHP+xy2wr9kxisBFlPwxZUgQaDrXfKeevU6Sepj05SS10K6IQBgXpAtVeGwHJ3kyeP7Busn/+XLwiQK/gE+J8gKEzBZ59T2N2f3/TG9AhS7VCezvpic/2FovXhybuaVpW5fhYrWs212wC6DXrWfv9+bgDpMFfXnUwJ/iG2zL1h5UtbuePuhredweXTqVJg0nWfsRBZqsMplgVNFWezlLj5krHEHHSB0Q5FqExZYeMUBG8Z6fbZyi/sGik3UjMxCaGLOXGYO0PQjN5agxg4jRZle0ksxqYIn8Iik/50m0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from OS7PR01MB17833.jpnprd01.prod.outlook.com
 (2603:1096:604:445::14) by OS9PR01MB18211.jpnprd01.prod.outlook.com
 (2603:1096:604:4ab::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 10:08:39 +0000
Received: from OS7PR01MB17833.jpnprd01.prod.outlook.com
 ([fe80::6938:cbba:dd27:306a]) by OS7PR01MB17833.jpnprd01.prod.outlook.com
 ([fe80::6938:cbba:dd27:306a%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 10:08:39 +0000
From: "Lachlan.Michael@sony.com" <Lachlan.Michael@sony.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>,
        "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>,
        "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "kieran.bingham@ideasonboard.com"
	<kieran.bingham@ideasonboard.com>,
        "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>,
        "Ryuichi.Tadano@sony.com"
	<Ryuichi.Tadano@sony.com>,
        "Kengo.Hayasaka@sony.com"
	<Kengo.Hayasaka@sony.com>,
        "Bird, Tim" <Tim.Bird@sony.com>,
        "Kazumi.A.Sato@sony.com" <Kazumi.A.Sato@sony.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] media: i2c: Add Sony IMX908 image sensor driver
Thread-Topic: [PATCH 2/2] media: i2c: Add Sony IMX908 image sensor driver
Thread-Index: AQHdH8lhE8SDcEsoKkihTzyT2JdkmbaLhXGAgAOzH90=
Date: Wed, 5 Aug 2026 10:08:39 +0000
Message-ID:
 <TY6PR01MB17839D1B955BFC76430F6152392D32@TY6PR01MB17839.jpnprd01.prod.outlook.com>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-3-lachlan.michael@sony.com>
 <20260803005333.GE1927055@killaraus.ideasonboard.com>
In-Reply-To: <20260803005333.GE1927055@killaraus.ideasonboard.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB17833:EE_|OS9PR01MB18211:EE_
x-ms-office365-filtering-correlation-id: dfc72060-6170-418f-48db-08def2d985b3
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|23010399003|1800799024|376014|7416014|366016|38070700021|3023799007|6133799003|4143699003|10067099003|18092099006|18002099003|22082099003|56012099006|11063799006|5023799004;
x-microsoft-antispam-message-info:
 5TxS4HzD58A5vM43fN5l7nu7KS6QjLjqdL4D9kKZktiuaxNSf9RUSwiiySzdgKopgws2SFsKV+HLGGJDmyzRZ3BE5lvazJEiokUljodqHLOq3Wz4QC+uFsmGyseI3YPuX4emJFlhHmhly3x+fA3XbmxA8AIj06tTJXgWRCQNBOMFuqPcR6A8yogQS4/Ntp3IrB0yFjKmhYRqQ+q4NlMcxNERZSF1t9rQoj8cl1SVQbONOgCzhd+VVU1dSwZqTbU1a64xh2a98MmA+IgOqTIv5E+oj/uNULnLE3cmTw6jfaEV/ZVj6sJO2XD+3fg5cDg0XovptrlZj/osJw2/+ipOvU70K0uGF/j6Jw7Vw61JFBcPZCC3ig61GRJWPtmcruvHq7rcVGHiMWDkbKLUbhxHt0gsKj7siA1oI600CuNKnjoMviB0E/Uh7wvjf83FArncJwpBAbA0iblv/5ndmVTYdCqONu7wX0W4isJjUcJ7S4Ou3N7PeS0w/+zj8HOvY+BLk25UIYEKDURGz0pigxKlZEjSh1Y/ZiEkjxbd1rJlq4aFscUVoT2LwuT4nF3W53boYHjN2bsXIwo1jcyNNpffZSGQQWxIqoVST+p+SSkLN7MMPTk5BtHjNOzieqYm4ijnuUZnlERt1SK8bfnkkKSjh7yb+OQc5+cB6nJMD0tPgBtSZcRCjSyDRq8cb6y1gbpqhFCvgVmuKSBqpzkdj1UKm4f9BdsVuZ3lvkGlpe77QA0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB17833.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(7416014)(366016)(38070700021)(3023799007)(6133799003)(4143699003)(10067099003)(18092099006)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?I5gj7Z9iPQszj3iOGxYXcAs7lTchTJyeVLEIU3EV4iytS75pEmoj8znc5Y?=
 =?iso-8859-1?Q?0DMU7D4NBGbHBG8UULGfBRJfyUVO3CbkfCleC1Tv3OV9fFCTlNRp8pLtjd?=
 =?iso-8859-1?Q?tcRdIwon1ghFQ63/HhbJh/AoXFoNsf9/BEThsiMngT85VLkjw9i/9YR1wC?=
 =?iso-8859-1?Q?6fRFeBlW4ofHTkrIUxGwmDOT9Sw4Ij1IRtXxzekEMwcqutpNLhecivMo4d?=
 =?iso-8859-1?Q?IVpbVD6/d7wz9fu2ogyBm+Lh3770XrDFAVs5Eyoa/t+l8M+tkwQXVR+yBr?=
 =?iso-8859-1?Q?9mw5ozAk+7YqrLZvSVQ5jvA5VHOZOCaNpSV0bepVwgOPxT22G1A/vKyQl1?=
 =?iso-8859-1?Q?CQNWkm9YWy5J9t+D/zzcx/Cq5pbEI/iSSLruSDg1m3AvFU8r7f3F3iQOlg?=
 =?iso-8859-1?Q?rMA4t/hhN6NMCPrLESVBwm6tG0SF1x41bXhTtQSt3Wkzgs11y0RrmYC8fr?=
 =?iso-8859-1?Q?oBoh1NIPywctwjo62UkMeQl9iRtAZjP+INth/7dwv4FtR5CK2yEQd+jbNU?=
 =?iso-8859-1?Q?h5ShrEzzmqbWOx91hUVNI72//RRCnHWYHVroeWYrF0yXP0pxyx9V+SEmtf?=
 =?iso-8859-1?Q?EFWIXq2TqOq+HLIKihxN3uMALQsP3nd5CwR8jouCN/JrvPoL9jiu09vBk1?=
 =?iso-8859-1?Q?vuknfmWpXOTiUgIRqe7Xh4Ok828c76FUJf4iba3MITJIMrLk/1rnB2oZYq?=
 =?iso-8859-1?Q?8Me4JfOHAb2h7/Dn7dajOHFIuzTjwluk1KltsnqdNaL3xdM/amriCi3bhk?=
 =?iso-8859-1?Q?tfIoGByr8yzDUEkBKHBCqBzSXj0P5FRGPYPGoZJmwP5XFcnfDluO1La/ou?=
 =?iso-8859-1?Q?H1D8pqlzY26qAjTRnaGRV+WDs7xjK8LpRI8jZS5uqDeWrxRFDCN/G2J0eo?=
 =?iso-8859-1?Q?9Bcj6oPA3vFnCh9IccE+kJNoDkgR5IO0CYsdDxGUG9qclFUqDQhZlqqoTR?=
 =?iso-8859-1?Q?3sZi8KaH9905yuPAqL85HUXjELyD34XCyjoyKMA3eUWYlfdFMP8+YpOEr8?=
 =?iso-8859-1?Q?QS+eVsCJHajNYOqVSVve/WCt56zy3UfL9yPEWYujFJfworTUoY2MPNWXQf?=
 =?iso-8859-1?Q?yd3aqWyKlUY3Foz1CYUtxKOHrN1OtfZ+nD7+J06JM0gIak5zVm+HIOtCpm?=
 =?iso-8859-1?Q?z5UlIjkiznd7cwzkMFSXyhrfGpMwiQU3YNZJ15Ios08tTdWt15OvHkq4Cs?=
 =?iso-8859-1?Q?DO9efYBx7pitJuKt4MHNhyV71i27H6pDApLQi2CI58ajy9/JrWdOFvZwv/?=
 =?iso-8859-1?Q?S8SHZDYmIBsF3e11HR7/X8Hv7a6GXbJPfZisR9CX+olWzjPKAgThJoDiP4?=
 =?iso-8859-1?Q?d+7lSGvkR2dB71dhs2vpA53feqwAtlB5a4K7cB3et7GA6gY/5Gb6zJgsoZ?=
 =?iso-8859-1?Q?7SaD9TI5zpfga7DguhRoQTyU1r3JQRSIuIweVxg+UwIzsbgR4wwPr7lUF0?=
 =?iso-8859-1?Q?GX/kEE01Wdjt8e9qjXQssQJ1H0C3TNxa7gJhgJPGnPXGOYXMPu8NMV54QK?=
 =?iso-8859-1?Q?pz2ah2uqgGsH/1ExBw8oVrlEkvmG6eMv52dX0TE8FJQLLUJnhM5hDG7nOi?=
 =?iso-8859-1?Q?pDuZ0+xdoY+adh0vNe5qMsOqQeNUY0o/A4rsDxm6yjEG9/X3Sj1YlXF+UK?=
 =?iso-8859-1?Q?PZ7Hi0cyh1iy4LMBySpI3euRqZ+fOoW3E5g+7RKgakNOunF+lpr6lVsBkj?=
 =?iso-8859-1?Q?apE+ZREzQiKSrXnhfOcRYqGrNU3J5YUKqyFeQoAM2kV7KWsTcDR3kTyHrD?=
 =?iso-8859-1?Q?1eghpuY5NRtwhGsKDUEC26H/cIh9pPGkdenfpwS0tHmV+fjz4jCoMmEXFC?=
 =?iso-8859-1?Q?X6JX2z/IvxSG5bpjC+/lLpGEf6sS8lWLR9qTU4IIhdZyfnr8fUBy?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	P5/4+9Au99098DHrUgy5q7pQe0iT4xTA6XWA+alo7ZVBpVuHPm5rNwSb5Br5/L3x+1rEnPTxcImeM7wewjSevL5wWqT8i1jioeX+vzBToHCwRlbprWiWy1PP1DY12fGPZD8ywkaP14qx+TtRM+XVoAsZCVVEhMrdI31kgbTj/aPlgmldBToayj1xRq+XTnk08WMZtxtbFQc0p2z9UgTVpqqs436IV8Wa1r0ocOVD9lrnpWABamTYF8WKp6kwMBz4oFWOwm3+yxW+LbG7UJn4TPIAxbA6HEs/2mXoyq2pwizUEw2O8eJZvpq43HhStIFTbFf3YpcDG5xHYxRLxblTIA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/amH314UQX48RS2vILMUmAMKE/ahT3sXb9BHSaqe7xzds9QkAHO/yvoHNaPDak1N7Mjg9TKXLNAam6V7jiED29qS96XjxcInxETdYD2dG7FRp32273Xh8hR9ErVAv4n8qxtyDWveN9EbAIuvHCQwg/L9r6lxosXZiuJWNFyEuHGtseZcjdYpoHENLLxTrO7TKZEkrsFFEvoh9fOko3pmaPqRocC/qLGQGY4crGxpXpaaQ6gsdncZmKGdgsv/kHRGEsS++9C6Cxp39CPCNq7L0jhF00oZT69tx7njn2cWTX1y/ez9gSEEGCKlavktkAECd19nGa+zMP4Ujnp1aWE/+007E4oyEzmOypu+0RRui+lBPQN37gRT5S6ZBx3QawqlSDtk2lHwkPwuoQJxOkU4VHer+Q5zXfqvn6AZhvlQ+l1qm4rN1rj8Og0KykSnUWJMEwuFGXVgBkjdSiTpTiFjAZK8bv85DZZqvqvIsC5EmTrTNAornJlvr/ep4SIrXlKRuHOBum88Lj7Y4vg+xlcAjKW0fuD5hAHxRLfza/WuNSTn6XuqXAcUoi2gzwP0vJuxGYZTGUQyAz8/PdeIvbY8slz0lMmAclt1xeu9VNfc44fhLVXftRVjfNqptT+tAH0c
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB17833.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfc72060-6170-418f-48db-08def2d985b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 10:08:39.7564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YHc61KBWABXA9rEV6LaX4BGTOPXK31as5b4ijpBW7yAyvbZnBUpuoyoeN1jAqPlWG2ytT7prlxycPVjH1HIGixGYA7SulLgMnOy7LdKbErQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB18211
X-Proofpoint-GUID: B21fL_FqTYDwSVpQ4eMEEPsfC6FSjw7D
X-Proofpoint-ORIG-GUID: B21fL_FqTYDwSVpQ4eMEEPsfC6FSjw7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA4MCBTYWx0ZWRfX/+y0/ybYO7wl
 gSREOCfmv/rh1jOShy+THReEZcDCZEsCsB+ye7nWgFFgqmjNsFkdeZpso6Dc+ylyd42PfVCueJl
 RN9E44ZT0755bpjVQwmkYbbK4k2Bi28LLi8guKBIkb2mkW4cextuE0jNr365ds/Vcc6GLY8wmvv
 kea/OokIZvh+aSa29Rx1lo3FyYHGMs8wencQyS+XRd7+o8I6Sl5nQVaJwdB0rSGIkMNmrCm52EB
 cTLky2b/DXGK7hFVaM621GP7VmytqdKLvExsHvZXFVRO7+7bDcy6s0VtXUHfEZeBfUXVv0Jn0fd
 nzrooQOmV+nPFrk/EhKRODF+vknWJp9mXbYCK5xoklineKmu/bmTlsyRijH8pyEt9emqZ0ERonK
 Xm4kNLuAa7nO9YNGChmM9v7+9QipZWI1dP0a1jkOltLeQLAHqS6Qwpj3e8c9+rhZTdF/CJ9ONRJ
 /KpaueABmI3OAaMFhHQ==
X-Authority-Analysis: v=2.4 cv=LfAMLDfi c=1 sm=1 tr=0 ts=6a730baf cx=c_pps
 a=/I7KA9t+8HAhutJC4ZwGhw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=7j0FZ4iXMVMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=M2bq-ooH9SiLYa4vvubY:22
 a=S5l3pgxlQea2u4jzLXIA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA4MCBTYWx0ZWRfXwiQYygP3dgfH
 Qtfo5ezRzvqbl4l71MhGKTHktN+ujG/vM/ruLds4uUwKf47+dc9zaD92X/jxFAqj69WF3PS6fr2
 B4Rqi5XrNFvYn0wmZFEngbR+J+QH7Z9A1pS1e3JzYDV0fqI2rOE+
X-Sony-Outbound-GUID: B21fL_FqTYDwSVpQ4eMEEPsfC6FSjw7D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01

Dear Laurent,=0A=
=0A=
Thank-you for your review.=0A=
=0A=
<snip>=0A=
=0A=
>> +#define IMX908_DEFAULT_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10=0A=
>> +=0A=
>> +/* IMX908 total area includes effective area plus=0A=
>=0A=
>This should be=0A=
>=0A=
>/*=0A=
>* IMX908 total area includes effective area plus=0A=
>=0A=
>> + * 10 effective OB pixels in vertical direction,=0A=
>> + * 10 pixels OB side ignored area in height=0A=
>> + */=0A=
=0A=
I will review the comments for alignment in v2.=0A=
=0A=
<snip>=0A=
=0A=
>> +struct imx908_mode {=0A=
>> +	/* Sensor timing */=0A=
>> +	u16 hmax;	/* clocks per line */=0A=
>> +	u32 vmax;	/* lines per frame */=0A=
>> +=0A=
>> +	/* Derived values */=0A=
>> +	u64 pixel_rate;=0A=
>> +};=0A=
>=0A=
>This structure should be dropped. It will be easier to do with a=0A=
>hardcoded pixel_rate value (see below), but should be done even if we=0A=
>decide to keep the pixel rate dynamic. I can give it a try based on v2=0A=
>of the driver if you're having trouble.=0A=
=0A=
In v2 I have =0A=
- hardcoded the pixel_rate=0A=
- dropped the pixel_rate from the structure=0A=
- moved hmax and vmax to the main struct imx908 and deleted struct imx908_m=
ode=0A=
=0A=
<snip> =0A=
=0A=
>> +/* Compute pixel-rate from link-freq/lanes/bpp */=0A=
>> +static inline u64 imx908_pixel_rate(u8 lanes, u8 bpp, u64 linkfreq_hz)=
=0A=
>> +{=0A=
>> +	u64 total =3D lanes * linkfreq_hz * 2; /* DDR: 2 * linkfreq */=0A=
>> +=0A=
>> +	return div_u64(total, bpp);=0A=
>=0A=
>In his IMX678 driver, Jai hardcodes the pixel rate to 594MHz, which is=0A=
>8 * 74.25MHz (IMX908_XHS_HZ). The rationale is that HMAX is expressed in=
=0A=
>units of the 74.25 MHz internal clock, so we assumed that the pixel=0A=
>array is not read out using the link clock but using a clock derived=0A=
>from the internal clock. The multiplier was chosen to ensure that the=0A=
>minimum HMAX value corresponds to a positive HBLANK, as negative HBLANK=0A=
>would confuse userspace (and developers). Having a fixed pixel rate=0A=
>greatly simplifies the driver, as you don't have to update the pixel=0A=
>rate control, and HMAX calculation from HBLANK becomes a division by 8.=0A=
>=0A=
>We're not sure how the pixel array of the IMX678 is clocked exactly, so=0A=
>I don't know if the above corresponds to reality, neither for the IMX678=
=0A=
>nor the IMX908. If you could provide more information about the pixel=0A=
>array readout, that would be greatly appreciated. Note that the pixel=0A=
>rate value does not have to match the physical readout clock, as it is=0A=
>only used by userspace to calculate timings (to convert between h/v=0A=
>blank and fps).=0A=
>=0A=
>Jai can provide more information if needed.=0A=
=0A=
After a little bit of wavering in v2 I have hardcoded the pixel rate as per=
 IMX678.=0A=
In parallel I have tried to get more information from the engineers interna=
lly,=0A=
however this is still on-going. =0A=
=0A=
I have also tweaked the constraints on the minimum HMAX, you can see this=
=0A=
in v2.=0A=
=0A=
>> +static int imx908_link_freq_to_datarate_sel(struct imx908 *imx, u64 lin=
k_freq_hz, u8 *sel)=0A=
>> +{=0A=
>> +	for (unsigned int i =3D 0; i < ARRAY_SIZE(imx908_link_freqs); i++) {=
=0A=
>> +		if (imx908_link_freqs[i] =3D=3D link_freq_hz) {=0A=
>> +			*sel =3D imx908_datarate_sel[i];=0A=
>> +			return 0;=0A=
>> +		}=0A=
>> +	}=0A=
>=0A=
>A blank line would be nice here.=0A=
=0A=
Ok=0A=
=0A=
>> +	dev_err(imx->dev, "Unsupported link frequency %llu Hz\n", link_freq_hz=
);=0A=
>=0A=
>The caller prints a similar error message, you can drop this one.=0A=
=0A=
Ok.=0A=
=0A=
>> +	return -EINVAL;=0A=
>> +}=0A=
>> +=0A=
<snip>=0A=
>> +=0A=
>> +static void imx908_update_framing_limits(struct imx908 *imx, struct v4l=
2_subdev_state *state)=0A=
>=0A=
>Please wrap the line.=0A=
=0A=
Ok.=0A=
=0A=
<snip>=0A=
>> +	if (ret) {=0A=
>> +		dev_err(imx->dev, "Mode register write failed: %d\n", ret);=0A=
>> +		return ret;=0A=
>> +	}=0A=
>=0A=
>You can drop the error check here.=0A=
=0A=
Removed in v2.=0A=
=0A=
> > +	for (unsigned int i =3D 0; i < ARRAY_SIZE(tuning_regs); ++i)=0A=
> > +		cci_write(imx->cci, tuning_regs[i], value, &ret);=0A=
> > +=0A=
> > +	if (ret) {=0A=
> > +		dev_err(imx->dev, "Tuning register write failed: %d\n", ret);=0A=
> > +		return ret;=0A=
> > +	}=0A=
> =0A=
> And this one too.=0A=
=0A=
Removed in v2.=0A=
=0A=
<snip>=0A=
>> +	ret =3D imx908_link_freq_to_datarate_sel(imx, link_freq, &datarate_sel=
);=0A=
>> +	if (ret) {=0A=
>> +		dev_err(imx->dev, "Unsupported link_freq=3D%llu for DATARATE_SEL\n",=
=0A=
>> +			link_freq);=0A=
>> +		return ret;=0A=
>> +	}=0A=
>=0A=
>The link frequency is validated at probe time, so the=0A=
>imx908_link_freq_to_datarate_sel() can never return an error. Drop error=
=0A=
>checking here too.=0A=
=0A=
Ok, understood.=0A=
=0A=
>> +	cci_write(imx->cci, IMX908_REG_DATARATE_SEL, datarate_sel, &ret);=0A=
>> +=0A=
>> +	/* Lane config */=0A=
>> +	cci_write(imx->cci, IMX908_REG_LANEMODE, imx->num_lanes - 1, &ret);=0A=
>> +	if (ret) {=0A=
>> +		dev_err(imx->dev, "Clock/lane configuration failed: %d\n", ret);=0A=
>> +		return ret;=0A=
>> +	}=0A=
>=0A=
>Drop this error check here too.=0A=
=0A=
Will remove in v2.=0A=
=0A=
>> +=0A=
>> +	/* Recommended black level offset is 50 in 10-bit, 200 for others */=
=0A=
>> +	u16 blklevel =3D (mdbit =3D=3D IMX908_MDBIT_RAW10) ? 50 : 200;=0A=
>> +=0A=
>> +	cci_write(imx->cci, IMX908_REG_BLKLEVEL, blklevel, &ret);=0A=
>> +=0A=
>> +	return ret;=0A=
>=0A=
>The error is propagated through the chained cci_write() calls and=0A=
>handled here. That's all you need, cci_write() will print a message on=0A=
>failure, with the register address and value.=0A=
=0A=
Understood, will fix this section in v2.=0A=
=0A=
<snip>=0A=
=0A=
>> +	/* Get active state */=0A=
>> +	sd_state =3D v4l2_subdev_get_locked_active_state(&imx->sd);=0A=
>=0A=
>The caller already has the active state, pass it as an argument to the=0A=
>imx908_start_streaming() function.=0A=
=0A=
Ok.=0A=
=0A=
<snip>=0A=
>> +/* --------------------------- V4L2 controls --------------------------=
---- */=0A=
>> +=0A=
>> +static int imx908_set_ctrl(struct v4l2_ctrl *ctrl)=0A=
>> +{=0A=
>> +	struct imx908 *imx =3D container_of(ctrl->handler, struct imx908, ctrl=
s.handler);=0A=
>> +	struct v4l2_subdev_state *state;=0A=
>> +	struct i2c_client *client =3D v4l2_get_subdevdata(&imx->sd);=0A=
>> +	const struct v4l2_mbus_framefmt *format;=0A=
>> +	int ret =3D 0;=0A=
>> +=0A=
>> +	/* Retrieve the active, locked subdev state format dimensions */=0A=
>> +	state =3D v4l2_subdev_get_locked_active_state(&imx->sd);=0A=
>> +	format =3D v4l2_subdev_state_get_format(state, IMX908_SOURCE_PAD);=0A=
>> +=0A=
>> +	/* Applying V4L2 controls only if powered up */=0A=
>> +	if (!pm_runtime_get_if_in_use(&client->dev))=0A=
>=0A=
>	if (!pm_runtime_get_if_in_use(imx->dev))=0A=
>=0A=
>and similarly below, and drop the client local variable.=0A=
=0A=
Understood.=0A=
=0A=
>> +		return 0;=0A=
>> +=0A=
>> +	switch (ctrl->id) {=0A=
>> +	case V4L2_CID_EXPOSURE: {=0A=
>> +		u32 lines =3D clamp_t(u32, ctrl->val, 1,=0A=
>> +				 =A0 =A0imx->mode.vmax - IMX908_MIN_SHR0);=0A=
>=0A=
>Drop this, the control framework already clamps to the limits.=0A=
=0A=
Fixed in v2.=0A=
=0A=
>> +		ret =3D imx908_set_exposure_lines(imx, lines);=0A=
>> +		break;=0A=
>> +	}=0A=
>> +=0A=
>> +	case V4L2_CID_ANALOGUE_GAIN:=0A=
>> +=0A=
>=0A=
>Drop this blank line.=0A=
=0A=
Ok.=0A=
=0A=
>> +		u32 reg =3D clamp_t(u32, ctrl->val, IMX908_ANA_GAIN_MIN,=0A=
>> +				 =A0IMX908_ANA_GAIN_MAX);=0A=
>=0A=
>Drop this, the control framework already clamps to the limits.=0A=
=0A=
Fixed in v2.=0A=
=0A=
>> +=0A=
>> +		cci_write(imx->cci, IMX908_REG_GAIN, reg, &ret);=0A=
>> +		break;=0A=
>> +=0A=
>> +	case V4L2_CID_VBLANK: {=0A=
>> +		const struct v4l2_rect *crop;=0A=
>> +=0A=
>> +		crop =3D v4l2_subdev_state_get_crop(state, IMX908_SOURCE_PAD);=0A=
>> +=0A=
>> +		u32 min_vblank =3D imx908_calc_min_vblank(crop);=0A=
>> +		u32 max_vblank =3D imx908_calc_max_vblank(format->height);=0A=
>> +		u32 vblank =3D clamp_t(u32, ctrl->val, min_vblank, max_vblank);=0A=
>> +=0A=
>> +		imx->mode.vmax =3D imx908_calc_vmax(format->height, vblank);=0A=
>> +=0A=
>> +		u32 exposure =3D min_t(u32, imx->ctrls.exposure->val,=0A=
>> +				 =A0 =A0 imx->mode.vmax - IMX908_MIN_SHR0);=0A=
>> +=0A=
>> +		__v4l2_ctrl_modify_range(imx->ctrls.exposure,=0A=
>> +					 IMX908_EXPOSURE_MIN,=0A=
>> +					 imx->mode.vmax - IMX908_MIN_SHR0,=0A=
>> +					 IMX908_EXPOSURE_STEP, exposure);=0A=
>=0A=
>All the the above should go before the pm_runtime_get_if_in_use() call,=0A=
>as the exposure control limits needs to be updated even if the sensor=0A=
>isn't streaming. You can add a=0A=
>=0A=
>	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {=0A=
>		...=0A=
>	}=0A=
>=0A=
>block there.=0A=
=0A=
This has been modified per your suggestions in v2.=0A=
=0A=
<snip>=0A=
=0A=
>> +	ret =3D imx908_start_streaming(imx);=0A=
>> +	if (ret) {=0A=
>> +		pm_runtime_mark_last_busy(imx->dev);=0A=
>> +		pm_runtime_put_autosuspend(imx->dev);=0A=
>=0A=
>I would add=0A=
>=0A=
>		return ret;=0A=
>=0A=
>> +	}=0A=
>> +=0A=
>> +	return ret;=0A=
>=0A=
>and here write=0A=
>=0A=
>	return 0;=0A=
>=0A=
>to clearly isolate the error path from the success path.=0A=
>=0A=
>That's a personal preference though, up to you.=0A=
=0A=
I will follow your suggestion.=0A=
=0A=
<snip>=0A=
=0A=
>> +	ret =3D imx908_set_selection(sd, sd_state, &sel);=0A=
>> +	ret =3D imx908_set_pad_format(sd, sd_state, &fmt);=0A=
>=0A=
>Those two functions return errors only when called with invalid=0A=
>arguments. Invalid .which, .pad or .target values in sel or fmt would be=
=0A=
>driver bugs, so I think it's safe to not check for errors. You shouldn't=
=0A=
>assign ret, and you can=0A=
>=0A=
>	return 0;=0A=
=0A=
Ok.=0A=
=0A=
<snip>=0A=
>> +	ret =3D regulator_bulk_enable(ARRAY_SIZE(imx908_supply_names), imx->su=
pplies);=0A=
>> +	if (ret) {=0A=
>> +		dev_err(imx->dev, "%s: failed to enable regulators\n", __func__);=0A=
>=0A=
>You can drop the "%s: " prefix, the error message is clear enough and=0A=
>doesn't need the function name.=0A=
=0A=
Fixed in v2.=0A=
=0A=
<snip>=0A=
>> +	return dev_err_probe(imx->dev, -EINVAL, "unsupported xclk %u Hz\n", im=
x->xclk_freq);=0A=
>=0A=
>	return dev_err_probe(imx->dev, -EINVAL, "unsupported xclk %u Hz\n",=0A=
>			 =A0 =A0 imx->xclk_freq);=0A=
=0A=
I have updated the driver in v2 with stricter 80 column lin-breaking.=0A=
=0A=
<snip>=0A=
>> +static int imx908_init_controls(struct imx908 *imx)=0A=
>> +{=0A=
>> +	struct v4l2_ctrl_handler *hdl =3D &imx->ctrls.handler;=0A=
>> +	struct v4l2_ctrl *link_freq_ctl;=0A=
>> +	struct v4l2_fwnode_device_properties props;=0A=
>> +	int ret;=0A=
>> +	s32 hblank, min_hblank;=0A=
>> +	u32 max_exp, max_hblank, min_vblank, max_vblank;=0A=
>> +	u16 min_hmax;=0A=
>=0A=
>We tend to follow a "reverse christmas tree" order for variable=0A=
>declaration (it's one of those coding style rules that aim at increasing=
=0A=
>consistency but are otherwise completely arbitrary).=0A=
>=0A=
>	u32 max_exp, max_hblank, min_vblank, max_vblank;=0A=
>	s32 hblank, min_hblank;=0A=
>	u16 min_hmax;=0A=
>	int ret;=0A=
>=0A=
>I think hblank and min_hblank can be u32, as they're calculated below=0A=
>with imx908_hmax_to_hblank() that returns a u32.=0A=
=0A=
Understood about the indenting and fixed the assignment for these variables=
.=0A=
=0A=
>> +=0A=
>> +	ret =3D v4l2_ctrl_handler_init(hdl, 11);=0A=
>> +	if (ret)=0A=
>> +		return ret;=0A=
>> +=0A=
>> +	/* Initialize the pixel_rate control */=0A=
>> +	u8 bpp =3D imx908_bits_per_pixel(IMX908_DEFAULT_MBUS_CODE);=0A=
>> +	u64 link_freq =3D imx908_link_freqs[imx->link_freq_idx];=0A=
>> +	u64 pixel_rate =3D imx908_pixel_rate(imx->num_lanes, bpp, link_freq);=
=0A=
>> +=0A=
>> +	imx->ctrls.pixel_rate =3D v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops, V4L=
2_CID_PIXEL_RATE,=0A=
>> +						 =A0pixel_rate, pixel_rate, 1, pixel_rate);=0A=
>> +	if (imx->ctrls.pixel_rate)=0A=
>> +		imx->ctrls.pixel_rate->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
>> +=0A=
>> +	/* Set link Frequency */=0A=
>> +	link_freq_ctl =3D v4l2_ctrl_new_int_menu(hdl, &imx908_ctrl_ops,=0A=
>> +					 =A0 =A0 =A0 V4L2_CID_LINK_FREQ,=0A=
>> +					 =A0 =A0 =A0 ARRAY_SIZE(imx908_link_freqs) - 1,=0A=
>> +					 =A0 =A0 =A0 imx->link_freq_idx,=0A=
>> +					 =A0 =A0 =A0 imx908_link_freqs);=0A=
>> +=0A=
>> +	if (link_freq_ctl)=0A=
>> +		link_freq_ctl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;=0A=
>> +=0A=
>> +	/* Initialize HMAX and VMAX */=0A=
>> +	imx->mode.hmax =3D IMX908_HMAX_DEFAULT;=0A=
>> +	imx->mode.vmax =3D IMX908_VMAX_DEFAULT;=0A=
>> +=0A=
>> +	/* Set vblank */=0A=
>> +	min_vblank =3D IMX908_VMAX_DEFAULT - imx908_active_area.height;=0A=
>> +	max_vblank =3D imx908_calc_max_vblank(imx908_active_area.height);=0A=
>=0A=
>As you declare the bpp, link_freq and pixel_rate variables just above=0A=
>the code that uses them, instead of at the beginning of the function, I=0A=
>would do the same here:=0A=
>=0A=
>	u32 min_vblank =3D IMX908_VMAX_DEFAULT - imx908_active_area.height;=0A=
>	u32 max_vblank =3D imx908_calc_max_vblank(imx908_active_area.height);=0A=
>=0A=
>Unless Sakari has a stricter rule about declaring all variables at the=0A=
>beginning of the function ?=0A=
=0A=
In v2 I have mostly tried to go with the inline declarations but if it is b=
etter=0A=
at the beginning of the function please comment again when I submit v2.=0A=
=0A=
>> +=0A=
>> +	imx->ctrls.vblank =3D v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,=0A=
>> +					 =A0 =A0 =A0V4L2_CID_VBLANK,=0A=
>> +					 =A0 =A0 =A0min_vblank,=0A=
>> +					 =A0 =A0 =A0max_vblank,=0A=
>> +					 =A0 =A0 =A01,=0A=
>> +					 =A0 =A0 =A0min_vblank);=0A=
>> +=0A=
>> +	/* Set hblank */=0A=
>> +	min_hmax =3D imx908_calc_min_hmax(imx908_active_area.width, pixel_rate=
);=0A=
>> +	min_hblank =3D imx908_hmax_to_hblank(min_hmax, pixel_rate,=0A=
>> +					 =A0 imx908_active_area.width);=0A=
>> +	max_hblank =3D imx908_hmax_to_hblank(IMX908_HMAX_MAX, pixel_rate,=0A=
>> +					 =A0 imx908_active_area.width);=0A=
>> +	hblank =3D imx908_hmax_to_hblank(IMX908_HMAX_DEFAULT, pixel_rate,=0A=
>> +				 =A0 =A0 =A0 imx908_active_area.width);=0A=
>=0A=
>Same here.=0A=
>=0A=
>	u16 min_hmax =3D imx908_calc_min_hmax(imx908_active_area.width, pixel_rat=
e);=0A=
>	u32 min_hblank =3D imx908_hmax_to_hblank(min_hmax, pixel_rate,=0A=
>					 =A0 =A0 =A0 imx908_active_area.width);=0A=
>	u32 max_hblank =3D imx908_hmax_to_hblank(IMX908_HMAX_MAX, pixel_rate,=0A=
>					 =A0 =A0 =A0 imx908_active_area.width);=0A=
>	u32 hblank =3D imx908_hmax_to_hblank(IMX908_HMAX_DEFAULT, pixel_rate,=0A=
>					 =A0 imx908_active_area.width);=0A=
=0A=
Ok.=0A=
=0A=
>> +=0A=
>> +	imx->ctrls.hblank =3D v4l2_ctrl_new_std(hdl, &imx908_ctrl_ops,=0A=
>> +					 =A0 =A0 =A0V4L2_CID_HBLANK,=0A=
>> +					 =A0 =A0 =A0min_hblank,=0A=
>> +					 =A0 =A0 =A0max_hblank,=0A=
>> +					 =A0 =A0 =A01,=0A=
>> +					 =A0 =A0 =A0hblank);=0A=
>> +	max_exp =3D imx->mode.vmax - IMX908_MIN_SHR0;=0A=
>=0A=
>	u32 max_exp =3D imx->mode.vmax - IMX908_MIN_SHR0;=0A=
>=0A=
>or better=0A=
>=0A=
>	u32 max_exp =3D IMX908_VMAX_DEFAULT - IMX908_MIN_SHR0;=0A=
>=0A=
>as that's more explicit.=0A=
=0A=
Modified in v2.=0A=
=0A=
<snip>=0A=
>> +	/* Pick up rotation and orientation if defined in overlay */=0A=
>> +	ret =3D v4l2_fwnode_device_parse(imx->dev, &props);=0A=
>> +	if (ret)=0A=
>> +		return ret;=0A=
>> +=0A=
>> +	ret =3D v4l2_ctrl_new_fwnode_properties(hdl, &imx908_ctrl_ops, &props)=
;=0A=
>> +	if (ret)=0A=
>> +		return ret;=0A=
>=0A=
>You need to call v4l2_ctrl_handler_free() in the error path here.=0A=
>Better, just drop error checking. The function sets hdl->error upon=0A=
>failure, so the error check just below is enough.=0A=
=0A=
Ok.=0A=
=0A=
>> +=0A=
>> +	if (hdl->error) {=0A=
>> +		ret =3D hdl->error;=0A=
>> +		v4l2_ctrl_handler_free(hdl);=0A=
>> +		return ret;=0A=
>> +	}=0A=
>> +=0A=
>> +	imx->sd.ctrl_handler =3D hdl;=0A=
>> +=0A=
>> +	return 0;=0A=
>> +}=0A=
>> +=0A=
>> +/* Confirm the ID of the HW device */=0A=
>> +static int imx908_identify_model(struct imx908 *imx)=0A=
>> +{=0A=
>> +	int ret;=0A=
>> +	int err;=0A=
>> +	u64 val;=0A=
>> +	u16 chip_id;=0A=
>> +=0A=
>> +	/*=0A=
>> +	 * The TYPE_ID registers are not accessible after power-up while=0A=
>> +	 * the device remains in standby. Exit standby and wait for the=0A=
>> +	 * required stabilization period before reading the chip ID.=0A=
>> +	 */=0A=
>> +	ret =3D cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_CANCEL,=
 NULL);=0A=
>> +	if (ret)=0A=
>> +		return ret;=0A=
>> +=0A=
>> +	msleep(24); /* Regulator stabilization after standby cancel. */=0A=
>> +=0A=
>> +	ret =3D cci_read(imx->cci, IMX908_REG_TYPE_ID, &val, &err);=0A=
>> +	if (ret || err)=0A=
> +		return ret ? ret : err;=0A=
>=0A=
>You don't need to check both ret and err. The err pointer to cci_read()=0A=
>(and cci_write()) is meant to chain calls with error checking at the=0A=
>end. Just check ret and pass NULL as the last argument to cci_read().=0A=
=0A=
Understood.=0A=
=0A=
>> +=0A=
>> +	chip_id =3D val;=0A=
>> +	dev_info(imx->dev, "IMX908 chip ID: 0x%04x\n", chip_id);=0A=
>=0A=
>This should be a dev_dbg() message, drivers should be silent at probe=0A=
>time when everything goes fine to avoid slowing down the boot process.=0A=
=0A=
It will be dev_dbg in v2.=0A=
=0A=
>> +=0A=
>> +	if (chip_id !=3D IMX908_CHIP_ID) {=0A=
>> +		dev_err(imx->dev, "Unexpected chip ID 0x%04x (expected 0x%04x)\n",=0A=
>> +			chip_id, IMX908_CHIP_ID);=0A=
>> +		return -ENXIO;=0A=
>> +	}=0A=
>> +=0A=
>> +	/* Set to standby mode */=0A=
>> +	ret =3D cci_write(imx->cci, IMX908_REG_STANDBY, IMX908_STANDBY_EN, NUL=
L);=0A=
>> +	if (ret)=0A=
>> +		dev_err(imx->dev, "failed to enter standby state: %d\n", ret);=0A=
>=0A=
>This error shouldn't be ignored:=0A=
>=0A=
>		return ret;=0A=
>	}=0A=
=0A=
Ok.=0A=
=0A=
>> +=0A=
>> +	return 0;=0A=
>> +}=0A=
>> +=0A=
>> +static int imx908_probe(struct i2c_client *client)=0A=
>> +{=0A=
>> +	struct imx908 *imx;=0A=
>> +	int ret;=0A=
>> +=0A=
>> +	/* Allocate Memory */=0A=
>> +	imx =3D devm_kzalloc(&client->dev, sizeof(*imx), GFP_KERNEL);=0A=
>> +	if (!imx)=0A=
>> +		return dev_err_probe(&client->dev, -ENOMEM,=0A=
>> +				 =A0 =A0 "failed to allocate IMX908 device structure\n");=0A=
>=0A=
>I would simply=0A=
>=0A=
>		return -ENOMEM;=0A=
>=0A=
>here. kzalloc() failures are logged by the allocator.=0A=
=0A=
Fixed per your suggestion in v2.=0A=
=0A=
>> +	imx->dev =3D &client->dev;=0A=
>> +=0A=
>> +	/* Initialize V4L2 subdevice */=0A=
>> +	v4l2_i2c_subdev_init(&imx->sd, client, &imx908_subdev_ops);=0A=
>> +	imx->sd.internal_ops =3D &imx908_internal_ops;=0A=
>> +=0A=
>> +	/* Register access initialization. Set 2-byte (16-bit) addresses */=0A=
>> +	imx->cci =3D devm_cci_regmap_init_i2c(client, 16);=0A=
>> +	if (IS_ERR(imx->cci))=0A=
>> +		return dev_err_probe(&client->dev, PTR_ERR(imx->cci),=0A=
>> +				 =A0 =A0 "CCI regmap init failed\n");=0A=
>> +=0A=
>> +	/* Get mandatory input clock from DT (INCK) */=0A=
>> +	imx->xclk =3D devm_clk_get(imx->dev, "xclk");=0A=
>=0A=
>The DT bindings don't specify a clock name, use NULL instead of "xclk".=0A=
=0A=
Ok.=0A=
=0A=
>> +	if (IS_ERR(imx->xclk))=0A=
>> +		return dev_err_probe(imx->dev, PTR_ERR(imx->xclk), "xclk\n");=0A=
>=0A=
>That's a bit short as an error message.=0A=
>=0A=
>		return dev_err_probe(imx->dev, PTR_ERR(imx->xclk),=0A=
>				 =A0 =A0 "failed to get clock\n");=0A=
=0A=
I'm mostly too verbose but good to see I can swing both ways :-)=0A=
=0A=
>> +=0A=
>> +	/* Get clock frequency and check against acceptable HW values */=0A=
>> +	imx->xclk_freq =3D clk_get_rate(imx->xclk);=0A=
>=0A=
>imx->xclk_freq is used in imx908_get_inck_sel() only. You can drop the=0A=
>field from the structure, and pass it as an argument to the function.=0A=
=0A=
Done in v2.=0A=
=0A=
>> +	ret =3D imx908_get_inck_sel(imx);=0A=
>> +	if (ret)=0A=
>> +		return ret;=0A=
>> +=0A=
>> +	/* GPIO reset acquisition */=0A=
>> +	imx->reset_gpio =3D devm_gpiod_get_optional(imx->dev, "reset",=0A=
>> +						 =A0GPIOD_OUT_HIGH);=0A=
>> +=0A=
>> +	if (IS_ERR(imx->reset_gpio))=0A=
>> +		return dev_err_probe(imx->dev, PTR_ERR(imx->reset_gpio),=0A=
>> +				 =A0 =A0 "reset gpio\n");=0A=
>=0A=
>Same here, "failed to get reset GPIO\n".=0A=
=0A=
Ok.=0A=
=0A=
>> +=0A=
>> +	/* Link to power supplies */=0A=
>> +	ret =3D imx908_get_regulators(imx);=0A=
>> +	if (ret)=0A=
>> +		return dev_err_probe(&client->dev, ret,=0A=
>> +				 =A0 =A0 "regulator get failed\n");=0A=
>=0A=
>And for consistency, "failed to get regulators\n". Same comment for the=0A=
>messages below.=0A=
=0A=
Understood.=0A=
