Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157087;
	b=n66nUqsTO0euOa20oMVb3MHA0e5+xNb5PCS6aKcIqEf2fkDbOnZ0bFC5Tb6ujNyLFLY4
	 QawapTC5IdR3HU8DlTpxo+tWxCfxKjHDjfikke/3Tlpse0jstS2HdabvqAa9Ylfx5kxdO
	 NkUrrnz4XWGjYW6+htZyPdRa04aKGtvm6BODkt8sOL9rqmyYxxRzQtgamKBfVSC3Bh32K
	 f4O4bmReiWK0suM6CzUY3IoMiyKD4tktH+Fqx7D0b/hs5ypZsbMqcwprrjMO3Msj8N1yt
	 jEdMGcl035WWb57HaofMnVih1lQFQCxCBYbd6Aiw6z5/Pt9yFPAi6u1qPdC1HeCCcCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ld-processed:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0IzH8u7xZiG+5lki1/VjWbgx/dZQIYBA5rj9yNyAjEA=;
	b=QCOPW0/a84sg/jNo98kNmTsPqcfRykksbDdbFGqLpqAHi69YWiRUsbAzMegDGkk3E4s7
	 u0VNUaTND4XX+4HPHmB7v5WMvPCtQi2UzVxhTh9yVVohPSd1cWPKY+E7b9KBQF0gJuWDU
	 xCQJxFI2SmF8HEV2RRclke9VQUBj3wsuhRn3uPAkbvDPhwjphZ5G6Ls1EesIo2LYE0tGH
	 W0MP1LDOl0WSzLlJZsN/pjqxDQt2khXFi8lrQhhemfg7XR5h7CBsAwrr7uUHe4Q4V9x/M
	 XREvWTvnIZExLZRM+boMdW2BJBddvNS5WDCaCgf2xTE7S8XdmbKp0GgtTp+dB2S35Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=TrRIABQu;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=TwkZ3TrN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6813E606A331;
	Fri, 20 Nov 2026 06:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6813E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=TrRIABQu;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=TwkZ3TrN
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK3ULAe3414297;
	Fri, 20 Nov 2026 00:44:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0IzH8u7xZiG+5lki1/VjWbgx/dZQIYBA5rj9yNyAj
	EA=; b=TrRIABQue9DNjHreFKuOz4yeGFG9u46zr5j74chjPC6fHG/UUXGLc86rF
	zJgBTdhU2cjly3tVKdF6zL9QNrJwaWCZbHrYbEo5S6LZZJQHp3yOo2khlRxyHOAH
	dQIoGtbj1nSi/Q9lro12Sv6POokAxSKWAoIoNJMPi6KHf22sWoqvMX8Y70dWU4na
	Qqm6M6hmzvyUgnpX2MbmGh+rBcKkTo1Uq44rqEhbLsOSMFY4vKWIgUh7sIUfBjV7
	YAfsx6ZkA5m8U2fn5GhqdM+2iWXOGbm//heOzRR5qwRzjKzZE6ZKfxHicgtR2x53
	fC3fwpGVId8+NjE68ltTj1euaPQFA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j2d6m147c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 00:44:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAq9WICH4ujKJsDr6HTkuJ8o2NlSTQdUyx0S+RVzlRDvED4OuwBWse5PnO6ZpLQIzpVlgDVJ+0MfyuQkiTZY50N8O9O6Q+iCHFJdmAPRNuIlRTpEsnEh1Mvnm6tyI7bByuk5uFRXoDRpC9bbRYtFnw0j9EFMJYPM09k6+Y5hcDPX9nKWwzdnz/gQ5U1kjz3XlsBR/v2T9MbxJJrKqFx+bLLx+FBFg+AJzOsgyyDsXlFWTl47aRxMNzsANo/pW/p5AdLe7I80Ys7pB5NikadZW1tIO89xcTVZbVR0OqHVDv0VLxEDaNyVZ6QwbQmYQfs/A//Y1YVMvj0tec7Bjza04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IzH8u7xZiG+5lki1/VjWbgx/dZQIYBA5rj9yNyAjEA=;
 b=QKo/nSdYB1fV9wOaTQtof/CBRzzUSWu8hLNdjDeH8Rwp0XzPXsOBVUOKUT7rPvz6L2nuwgStVxg7ez4HlezKaAIJmaLJna/AQFTf3a1Gedd2D16wcHbfO7AJXZMWMUZ6ImEnSAJVxXos9SFGPlhS4PJ1jgzcUAL8IzSPngaHiVR+mkbhWwW9nqJjGhE8XuTwvRhGWmhDQ6uGpESfuqfoM8jV8gAKsFyLCAE3j2F+DA/Mm6bx+ftDFKYEeeZLYg0OHV1R1BEvlzS5Agdvbcs4vJP1lowNRRMmTrPO5NWSqFpzoj/JT5lLo/Lsxtg6WplxcrNvgVAYMmYR0CuF+nXXxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ti.com; dmarc=pass action=none header.from=ti.com; dkim=pass
 header.d=ti.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IzH8u7xZiG+5lki1/VjWbgx/dZQIYBA5rj9yNyAjEA=;
 b=TwkZ3TrNMT8c75s3M5q9hwOjak/EZ0pwRE0mIjIsBWN5z0ACjBAcL85Wvd1FZIGhSxJKG2aUAixM56n3wsoRt1xEsqtXZNk2tCz5YihkHlwBpWH+AorI4yE2/h8rrKM1kAy6VeJqEw7ir39dM2IHQZlc3W7SFFvwvf1c6DTDmfY=
Received: from BN8PR10MB3652.namprd10.prod.outlook.com (2603:10b6:408:ba::10)
 by CH2PR10MB4230.namprd10.prod.outlook.com (2603:10b6:610:a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Fri, 20 Nov
 2026 06:44:35 +0000
Received: from BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a]) by BN8PR10MB3652.namprd10.prod.outlook.com
 ([fe80::86d1:377b:3bec:884a%7]) with mapi id 15.21.0615.015; Fri, 20 Nov 2026
 06:44:34 +0000
From: "Thakkar, Devarsh" <devarsht@ti.com>
To: "Brnich, Brandon" <b-brnich@ti.com>,
        "mchehab@kernel.org"
	<mchehab@kernel.org>,
        "hverkuil@kernel.org" <hverkuil@kernel.org>,
        "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>
CC: "Willis, Kendall" <k-willis@ti.com>,
        "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v9 0/4] E5010 Probe Cleanup and Adding autosuspend
Thread-Topic: [PATCH v9 0/4] E5010 Probe Cleanup and Adding autosuspend
Thread-Index: AQHdcf7uNQhzlLs7uk2lNQnQZdm/1Lc2kTQA
Date: Fri, 20 Nov 2026 06:44:34 +0000
Message-ID: <b7db145d-5236-47f1-91e4-af6106ecb145@ti.com>
References: <20261111170530.809226-1-b-brnich@ti.com>
In-Reply-To: <20261111170530.809226-1-b-brnich@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ti.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR10MB3652:EE_|CH2PR10MB4230:EE_
x-ms-office365-filtering-correlation-id: 1d422fc9-e92c-4587-2400-08df46d1bd57
x-ld-processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|261026121527099003|18002099003|22082099003|261022105027099003|56012099006|261028144727099003|261022115727099003|10067099003|261021135927099003|38070700021|261026140227099003;
x-microsoft-antispam-message-info:
 a9W04K5e2SHVXQVwdN5T4KZEe3trOhv6a2LHDHnmT/C716aUxGS2DEUraCU2Qmd5bx0i85ceQJSGXhf6IS0tVyRBGL3gpBbPjLzJ/bYJJlOLWB0hIV72x3oEGBZ7JoYTo6wk8y2CEyQvbmrfJceIfUbeCc+sc5TV/zvDNR/aLS+pRoJRHMkRQi3ySDUdlhldZ7SaGo4i3plKJAPxNHo1l7o2CsVcEcbzY5I4mo2CXRW3UZks/aTRr9uRDII/2f8Ya9kxDg5Cj20AV7U1t2mD89bZLb2yt835j9S+Bt91LKjNI6y+aAH7CkSZDHEugUw2dhh97Cf4ipXUSWNt0NbN7H/T33/FLUqiVDyZPpY0zfm5S4/VznpX/ck6Sbzt0NXlT6cSIghc43/KApV/62kQQCkS0cf4VkruH3nq5mbtPA11QjN513OBquODKUkGsrC3C/QGO+8a1d4bwUm4dO9WH43b6HY9AGD6gbKlcVrbULJv2YqYKHRd+MMkw4FPihAnLAPBQk06t97wpWxjDlkQB2eJ7o9Irv591tWTcFY/6Nh0O+zwuxaQCwPodlqtsysPvIvnZQjQRW/iR/LZmsq0MjJRWS4/6qg6tBcsLHqHzIeIS5CKLzUIgLlXY7DpiG/SvAl3AIzpXAzTLxPsqDgM5C48A1zFSypgriCzTIx3bmNC9u+vyAivYcb7JQINVeb5/7+afkYjRUZatgMx7q0Asg7+Tg/Mw1GmWMXZ2qLOl0g=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3652.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261026121527099003)(18002099003)(22082099003)(261022105027099003)(56012099006)(261028144727099003)(261022115727099003)(10067099003)(261021135927099003)(38070700021)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TndVcWUzS0dzV1VaZGJIdk1CQ2s5WU9sUGJ3ci8vcG9ycm1QUzR6YXF0Y3NV?=
 =?utf-8?B?SEwrQXhGcEI1QnN3S3R3MWVmU3FMS2JHRnVSVk1vczZyQ0VmQk9JKzYvMTZk?=
 =?utf-8?B?RmgrWTVnVVZVZFZrb1lsYkdzOGI3VW9aWU5SOVUzTHZsenEzWEV4YXhmWUN2?=
 =?utf-8?B?ZE1HN3orRnpSTmRlZG1ZU1QvNnFxc2szalllYVpYM21oWDhsZDZVRnRZVm42?=
 =?utf-8?B?NG1mbzUvei9wQ096b0tPV3FPZ1JqMk5jVFhicjhRYW03TmdjS202SGlmcVlS?=
 =?utf-8?B?Q3hzZzQ2elZQTi8rL0tyT1BHZDQ4ZTc4aUw4Nm9CV2FsRENjRHh1cGxzaitx?=
 =?utf-8?B?K3loVzFpUDVvUVd0Y1dZMkRVcFN3bG1nOHk1WWFLTGZPUG5uSFJoZnk2MmEz?=
 =?utf-8?B?dEZPeWhpbklQWVUzc1ZWZis2NXNtYXUzNmdMaWcxV1RTanVMSUtMdTgyL2Zw?=
 =?utf-8?B?S2VqU1hPWlUxeVNXeUlxZzNyK3M5WjhnU2xIR2RpTVVXVU1RamR6dVY5SXgw?=
 =?utf-8?B?amhxaTJRVmpFK2FvMGl4ek5iYnIrYUo2NzJ3OWtKcFlSS1VrQ1hCeUo3VVZF?=
 =?utf-8?B?SWdKQUFkK0NvVVF3emJFeWtCVWJUVTRsSHhwYmFHQ1lpQURNU0I1ckd3c1g1?=
 =?utf-8?B?bEVtK20wOElBOTdWWTNuZmJzcDZoeUxLblBUWUQrcTh5UzFEYzNLMUEyWkxD?=
 =?utf-8?B?eWpOeFlyRkd0QlRGbFN4MFhRb25aK3NOdmxrWFZxb3RDMDJaVjkxU1B1OCtP?=
 =?utf-8?B?cU9hNEF2ZXpHK2l5djlobkhFNXVLQTF2a0FDNEFOY2hqVEJBdW9VZlZRZktn?=
 =?utf-8?B?TktuL1hjbUpXN2dtaFlMcGtpcWVzaUsyR2tiMTMvQjJTdFNZaGZ5bzJsZ3c2?=
 =?utf-8?B?NEgzUjZqRjh6Y2Jsd0YvRXowTTRkQnd1MVRWMGpueTM4TmNZUlpDdmRpcEVm?=
 =?utf-8?B?QWVYeXBhZURxM0NlM1d4amdSRGoxeVIyMTNicXBwNU5aVmxEcWpsSHJwakdm?=
 =?utf-8?B?T0ZkbTcwTlZWdlRiZG44NXRTTlB5YzVRR0xlTU9WY0lMUGtHZXg2cVBMR2kx?=
 =?utf-8?B?T0Q5MmIxTm9IYlRhL25CdVFydk1JY1QycGZTM0t5MWZJektlYXRlSUVKeW9T?=
 =?utf-8?B?Z2twWGxhSld6NHhEelpYYjZOVmhZcDQvSEpxZmVSbUNacGFIcCtlcUo0YVNW?=
 =?utf-8?B?dkI0SHMzb2JmRERFZWFkYjJQQmRpQXVTMytCL0Rrb01UUk9qYkM0Zy8vY0xm?=
 =?utf-8?B?T2NnL0liR3FyMGVHYjVIWTFCaFFOQmRWSUx1VzJIU3RFazdzeExnRnM0L2ZD?=
 =?utf-8?B?TDc3STJsR3RVSXZ5OWExZXF1emg0WEN2UzdwaUhELzZ5RS9tL1ZDZlBrTDBY?=
 =?utf-8?B?d0NoYWtrRjlIWksvc2lOSndyc1RpaWV5MnR4ZUJLR3Q5TWZrLzk1bUxMem9r?=
 =?utf-8?B?cEkwVkNvMUVGaUg2WTJMWVQrdC9KeVNJSkNZNHVjaXNkbStNUHc3V1UxVEVa?=
 =?utf-8?B?OHArcEV2QlZDdXVOVWkySnpOUHIvd0YwaWxrRE8rd1h3TnQ4c1VUWVh5YkFr?=
 =?utf-8?B?UW9DM0N3RnliekI2UitPaUc2UFhUWHVHUUlQQXdXU0U0WHY4d1VhMUkweDVT?=
 =?utf-8?B?cGp4RjYvSUpreDhnME9EWkNmd1gwWllNdTIrUEh1bm5xTlBFa2EyVWtjeWlV?=
 =?utf-8?B?V29CVXhMOENIUU9OYlVLOEZjaHlzWXc0OVQ4aTR2T0dXMHhYMjhiNXpYSGNk?=
 =?utf-8?B?a2tya0NudEdySGxOeGdxcnZRTVJvWUg1OFhZc2VKOFE1c1Azajd5VnAyemo0?=
 =?utf-8?B?eHREcmdCaUo0Wm8vYmZtTmZQUDZaT21VeHo5bzE3M0ErcVpuQ3pVb2JpMHg2?=
 =?utf-8?B?amllOEFUaHAwUzA3MnBsWFlCNUZPWlpqdlZZQ0UzR3JlV1F5b25qUDJqTDV2?=
 =?utf-8?B?cUcvajlXSDZKL0ttc3FqbFl6TXFRNEQzNnBMNmgzcGdsK3djbDBXNU1QeUt3?=
 =?utf-8?B?ZUFzeXUreEIyVjNXOXYra0Qyam5qZlBYcGUrQUJsNVFIVEhDTlVBemM2L0hu?=
 =?utf-8?B?RTNFdHVIUGZQNHUxbVNteUFIcnpuRk1HclpsTjNLZ2lFb1RBR3dTSHg1OGF1?=
 =?utf-8?B?UFlpQnhoTGozcHhLMEl4dFdhZ2hvY1ZtR0xSbmE0UFVhVjF2eVduemRMNmcv?=
 =?utf-8?B?c2pXbHVKWGlJWmJ1ZWZSR21Ic3ZFUFVZazNJNjZTWjlzYWsvZUFJdmZHOUZU?=
 =?utf-8?B?aUJQajVBQWZMMVNjRjRNVUN4eUcxMmUxVGJrYzhMYkFjWi85c1htNE5vRHFi?=
 =?utf-8?Q?YlB6GevjI6PbNPgTbo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D3A8BF24AEE724B9146E3DEF99FB4C1@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	xD7HFqW8NkFqbghrlECi4nR8deXjJCY4nBonlUUoH62SVkG5K1X02/b25J4JamahaytULXsk3HI0nJIfMUSPW7L/T/3tNiCHhYaCN6Q2A3+3Wy5KnXu17a/Gbkk72kExYYHQtqFAHx3B8YYYRGCE0mDrb14wVnCCcIi+FpDeNO1u0d+RwJkT4gBbL5WnY0J2YXxRtCDF00Toj27lP3WXELoI0zETWCPh3iZ9JnKH6B8GkMqTa7ROD3HGzaSFy83isTve/tRzbjV3oRATbNsN1DE7/E3cWetP2DVZati21eisiXq37ykA8sAhbYtT0rVFWa1suy7z7xyZHpP4hhU9kA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR10MB3652.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d422fc9-e92c-4587-2400-08df46d1bd57
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 06:44:34.8153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S8Jxlod55osmYyyC5GyQlh2kqJpLmruxUIE6d9Zp+p6iRCKOoNxlRpkop7tkboYC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4230
X-Proofpoint-GUID: hHAu0NQJgJaTAGFiEdso8baGSB-u4mN2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfXxXlcGNQGo20Z
 vAEHwjEIGvCgzSYeD9jQRBERN+9IfQYsyW2j4NHiI4Kq1IaKhjGjKbM5i/afXdRO7M1UMOb9cmF
 ctsIT5SzlAIA/jjiGeF+qxscTKjtLSiUNeDAZgM7kp+qUd5elvsKK225BhRF5bvVUNx0EiwQ00K
 zWbfxWxCnGfwSOSxF2yGwu0aKnGaiW9kMfJB0WIfhXS1I4PRSqjRZfiAMcGoLXkQYCs4qTSKZiR
 TZWK6dK75/02ea9p82pXZaccdC7VT/HU7gyZMHe+rfYVFAClLs4Mq1iN5edIX8s/xoW8NNaAkvm
 reGm858Qcr1/27xwcHMxY5bcl2ajJn+OEsDJLZpKZOYZKPAesgPFvmIl7x/swkEKu5NZ9n35lp4
 9h98y9tq6ayZSXh4C0ZnQHAKBVAoYvNo5BKuFwFf2viE5z10ntEq3cM8ByJXwIQ39C+/SpBOZg5
 tX5a7lr98+eLLwaWN8w==
X-Proofpoint-ORIG-GUID: hHAu0NQJgJaTAGFiEdso8baGSB-u4mN2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAyNiBTYWx0ZWRfX/wGC37uXYrG3
 hzH5yzdPI3agmh404bkNAuWDuOWUv3buWxrqZeKISZ9iCl8ghAIa/nRAQg8MGUNFHYtKns+mRFZ
 cIMYdtBIPKXauR3I7ABgZJGIqqIDp8w=
X-Authority-Analysis: v=2.4 cv=c6U+0h9l c=1 sm=1 tr=0 ts=6affec55 cx=c_pps
 a=SAua1AGvvEPKktuR1BOyGQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=ALY_fhqUV_XLF7AeeNsA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200026

SGkgTmljb2xhcywNCg0KT24gMTEvMTEvMjAyNiAxMDozNSBQTSwgQnJuaWNoLCBCcmFuZG9uIHdy
b3RlOg0KPiBIZWxsbyBhbGwsDQo+IA0KDQpbLi4uXQ0KDQo+IA0KPiBCcmFuZG9uIEJybmljaCAo
Myk6DQo+ICAgbWVkaWE6IGltYWdpbmF0aW9uOiBlNTAxMDogRml4IGNsayBuZXZlciBlbmFibGVk
IHdpdGhvdXQgQ09ORklHX1BNDQo+ICAgbWVkaWE6IGltYWdpbmF0aW9uOiBlNTAxMDogVXBkYXRl
IGU1MDEwX2luaXRfZGV2aWNlIENhbGwgU2l0ZXMgdG8NCj4gICAgIEVuc3VyZSBQcm9wZXIgRGV2
aWNlIFN0YXRlDQo+ICAgbWVkaWE6IGltYWdpbmF0aW9uOiBlNTAxMDogRW5hYmxlIGF1dG9zdXNw
ZW5kIGZvciBydW50aW1lIFBNDQo+IA0KPiBNeWVvbmdodW4gUGFrICgxKToNCj4gICBtZWRpYTog
aW1hZ2luYXRpb246IGU1MDEwOiByZWxlYXNlIG0ybSBkZXZpY2Ugb24gcHJvYmUgZmFpbHVyZQ0K
PiANCg0KSSd2ZSByZXZpZXdlZCB0aGlzIHNlcmllcyBpbiBkZXRhaWwsIGFuZCBpdCBsb29rcyBn
b29kIHRvIG1lIGFzIHRoZQ0KZHJpdmVyIG1haW50YWluZXIuIEFsbCBmb3VyIHBhdGNoZXMgY2Fy
cnkgbXkgUmV2aWV3ZWQtYnkuDQoNCldoZW4geW91IGhhdmUgYSBjaGFuY2UsIHdvdWxkIHlvdSBi
ZSBhYmxlIHRvIHBpY2sgdXAgdGhpcyBzZXJpZXMgPw0KUGF0Y2hlcyAxLTMgYXJlIGZpeGVzIHRh
Z2dlZCBmb3Igc3RhYmxlLCBhbmQgcGF0Y2ggNCBhZGRzIGF1dG9zdXNwZW5kDQpzdXBwb3J0Lg0K
DQpQbGVhc2UgbGV0IG1lIGtub3cgaWYgYW55dGhpbmcgaXMgbmVlZGVkIGZyb20gbXkgc2lkZS4N
Cg0KUmVnYXJkcw0KRGV2YXJzaA0K
