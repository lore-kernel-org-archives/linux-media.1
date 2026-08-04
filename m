Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E592472A2;
	Tue,  4 Aug 2026 01:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.183.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785805245; cv=fail; b=GR6LFqbXCU+iCXzUbYubvncvyzQe5Jo9qkm+KK3SFvDQqIpGsH/cMid7tN6MsWdOx/FUvldUkBVwmWzLy5dr7PtQceXEwyswUewvvxd3yd6vueww8Y4pcKHOQwP0Y1v0r5RISQBStwB4tvV93r7YOE70+LCv4hh7kqre/MhOzmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785805245; c=relaxed/simple;
	bh=c1dBdu2AdFtS7UTRBm+zpM44JzxhuSQYFRoSkswDCP4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZG/dITCdNlneRFtYwPgr87l0Z1x476FoZIhDAyqfFci9yeDHgTtkA+nTQFlvIdf215aMJ6ZCrjtSMk5yt7s21AM9LuDXBoT+PD7U/QRDekPMPpvjdWtrnFxELZpaorZIcRUzefVG4Hn/oftM6dvpzaXcYCMBlWU8imnMtSvs4Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=hQPG6snP; arc=fail smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="hQPG6snP"
Received: from pps.filterd (m0209324.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Njaxr2468810;
	Tue, 4 Aug 2026 01:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=c1dBdu2
	AdFtS7UTRBm+zpM44JzxhuSQYFRoSkswDCP4=; b=hQPG6snP7dbLIPGWNIIX35V
	6YGRXe15qX0qghEbgE4jxD94To19QjX7kshDPYL2ZEUX45V52uHuGaH7qxpIlwo9
	myLJZbJ34ytcQ4McTPeKdWOmDR83L9Mhf/EiSJo2oxrMSpUHfBI8yQTxwnBIUn90
	BaydeHscD2u+Sw9YFXr6nKUVC4lw3s1yhrfVra1AXHu9lCtL/40fHrnClMiKQcjT
	P+EkoVevp8x4PBZ0KZ5WiPQc+z5SvRvwgDkISNrrG77aLoHXHMymtIplPbARZIm1
	54hLvBv+xQALRwhQBVb5PNdZFklAPU3AKDPJvHi1TyPqGI7f3ndKW6gpNTTu48A=
	=
Received: from os0p286cu010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4fs5y2tv9t-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 04 Aug 2026 01:00:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYkDZ8SliJOwRiZpRltfCw/XxMLztb3tPP3nh8FeY0lPe9SfaM8N8x9ooqjTMxvWBDvenuMovfJ7462laUtOKPKaUpRhAj0gLCDx2AvzNeqB4c2XB1QCSGLdfyxPIt2isGQjZgsJ91VYaLJaJtgOklzSpVDdVqHuIj9RCV6VlbLEFiUIABPdrEbhbaDl89UhZIyxELig39UdlbnXFFsbP+Q9KoFz3SaMF5aiX1R8HPHPJkUTqVLODy1OPDdSkMMfLx4MDh9ohhKz5y35Eimte6I9t0bOCmSpq5jWUkqXpHFmJ27D1R36pBGQ3HCY95T4KuF2kQlpkYDLFmClMXP3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1dBdu2AdFtS7UTRBm+zpM44JzxhuSQYFRoSkswDCP4=;
 b=LYW0eEcGvIP2PE48TMG2rJj/uU1DcM5Ba+X9+ZO/an6j9SHrNTI4vsQlN3+wrWurH8Z8kFKL+oXKg+KEDyKVOZUkj/KMD7iAuC8+D823Wv2HjRx3QuZiR+DLFdXn26wIwllI2FF1JAdrAkQpYQCz8m34oEEt3hf1XN6cK9n6jZQwBqjVTpl3x3A61Ganh+JbqBfWpWvOY5TbNBg8NChAeuvgFXx/nItF909mhtYoZNCCN5y/mnZqBeqI7WaWBSce9Gg2D9bi702Q0ULT+cfJKAP2gRvNA4xlulT/vDmvy7vGFI9aHJaKV7RktD5ylm8Ipj1kHLsVuoLleURJ5zWHAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from TY6PR01MB17839.jpnprd01.prod.outlook.com
 (2603:1096:405:348::15) by OSCPR01MB12624.jpnprd01.prod.outlook.com
 (2603:1096:604:33a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 01:00:11 +0000
Received: from TY6PR01MB17839.jpnprd01.prod.outlook.com
 ([fe80::7155:ce29:dca3:29b0]) by TY6PR01MB17839.jpnprd01.prod.outlook.com
 ([fe80::7155:ce29:dca3:29b0%6]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 01:00:11 +0000
From: "Lachlan.Michael@sony.com" <Lachlan.Michael@sony.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
        "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
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
Thread-Index: AQHdH8lhE8SDcEsoKkihTzyT2JdkmbaLhXGAgAEYlICAAHcsCw==
Date: Tue, 4 Aug 2026 01:00:11 +0000
Message-ID:
 <TY6PR01MB17839FF48671E744E7E23A93E92D42@TY6PR01MB17839.jpnprd01.prod.outlook.com>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-3-lachlan.michael@sony.com>
 <20260803005333.GE1927055@killaraus.ideasonboard.com>
 <CAPY8ntC1T4_orgvxBRqpqux4V90d5XZ-3KZZKoqnCPkbf6wE0Q@mail.gmail.com>
In-Reply-To:
 <CAPY8ntC1T4_orgvxBRqpqux4V90d5XZ-3KZZKoqnCPkbf6wE0Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17839:EE_|OSCPR01MB12624:EE_
x-ms-office365-filtering-correlation-id: 6bcfb3e8-ffe7-4dd3-df4b-08def1c3bc36
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|23010399003|376014|7416014|1800799024|366016|38070700021|3023799007|56012099006|4143699003|5023799004|11063799006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 sxTwhONABzTtzpRvY41otOZTIvWyDtXy9JLomaJXKMyl6SnLKZRgrGCcZcIMRsPHkkLxVTT16txSrcSlJ0DfptYwrf4GQsy80vX3MGgmvshsrx7LccrPO9khkBKK+LmZX5EhOw4PmRZ7uOioM9bNB6XyXGT4b/fkUI1NjT1yCe2qZnvXLODmDjEUE/MAWnKZP+iEsUP664B6IbSf/sTVvhGZnvYPC0l/nlkeGe2ZA+lKPEm0hHmUN82f3nR20B9Lti2g12nMytqtMq916hrOarSFywXAqsaPeIVP3XN5QBgRFx/YC0I/+JB0HoHZUVGqwTZXq0j5pdX7lpsgU5owyl+hxPcejft2xvMIiKERZU/sMq08Dx8wheK7a8Z/IilRt22je9UBan6UKu4ix6AgOT48lkcnVR4iFjQBp7kvWnSMvHZ4+Wra3ccdUnx3WFaFoVnLC7lhg1BSTRZmQC+0R+hzTMiOMZTdhK3sBRsFdOqvaZpJmRRBaTLNDplb967Pq5qrld81d8IUuvsisARid9JwzkO1CgYkDxZWdsRmLmy5eBjS6eM8hesuI3SDydf7Ki9/RUrFhrO7OUpbz4AR5KIT9+i02x5I2AtkoJVLLPukS/3n6aw2mI9h+LCol9+e2RJFETMActeePGFlwbJ1Ec5Ja1oe8/Wc4cKS1ZezbRI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17839.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(7416014)(1800799024)(366016)(38070700021)(3023799007)(56012099006)(4143699003)(5023799004)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?T05zN3liUUlTRG1aT3RCay95OGJ2R0hjbmNUbVAyU3EvRlFSM29seGZ0?=
 =?iso-2022-jp?B?RGpTa0Nob1VFeldZcU42dmpCa05CaHBJTm0vaDZaU0ZaQ1p2U0h0dWY0?=
 =?iso-2022-jp?B?dExrck1oTjZJRkVZWUlmb2FNTXRDbnJ1eUxOVWxjUE9sTzB5Yk9Bb1JM?=
 =?iso-2022-jp?B?Tnh2RitsbzJVMWN4N1I5dmtMYzBBQWlqRWVnbTZjbmkycm00UzQ2MzdF?=
 =?iso-2022-jp?B?aHZ6cnBKUlBhdlRINE15R3ZodS9idG5JTU5odmNOaEwydHBjVWxXcHZp?=
 =?iso-2022-jp?B?eFV1WGFDZHkzQWhVWldHUis1d3E1enRIMjdwMzJKMzZ5aEZzek1MK2V6?=
 =?iso-2022-jp?B?QjhOZ0p2T2hsUXRvNFpwQ29hYmZMTVAxRW1Zb0gvWEIzbU00NjRZSTVN?=
 =?iso-2022-jp?B?YzBvWmlEMzhiTXRBWG9CTXFJR1lkU2diRVlRVFIvQ3R1ZnpXVFZYcEw2?=
 =?iso-2022-jp?B?eEx3MHdvSWxQV2ZLNDc5UWExV2lKdm1CWU42RWg0WFk1M1kvMm9WMzdB?=
 =?iso-2022-jp?B?eUJYcWxhSzFVTUxHZjJkY2w5SXpuZk9Bd2U1VzdUN254Y0xZS1J4Z0Fm?=
 =?iso-2022-jp?B?dXA4WXNiSTc0VnNFS0hSQjFBcENtNm9YNDRmaEhnVkNnS3ZYd3dKRGd2?=
 =?iso-2022-jp?B?WVhFdkZpZEFQODNYdW5xRk1GWmxsQkI3SDZFcmVJTDAvTUJqT05PSkpz?=
 =?iso-2022-jp?B?eHVVdE5TOHZwalJnYWd5L1c2VVhsK2cxbXJTdzJwY2ROU1JRMStTODhl?=
 =?iso-2022-jp?B?Q2Y1RkI4eEJPZXhYWEZTV0QrclFIY0RzY1V1clBrUlYzYWNUZko4SGNo?=
 =?iso-2022-jp?B?bzdnRlYwTzNuc25nb05zSG0yVjYxVk1KYmtyOUNnTjZIZDVJNjBvNjFy?=
 =?iso-2022-jp?B?by8vTTMzSFI0aWdrWnNwYkRLTTlhd3hKZ3lvWnlRWFBQVGNSZ3NTYndm?=
 =?iso-2022-jp?B?OUdISzFxNjdwZFpPQjVMTE1oS1lnM3dGeWZYN3gvWG5McXpSMVl4aFZh?=
 =?iso-2022-jp?B?VU12cVZOZk4vVmcxYXdERHJtTjBWMHhGUWEwTXhuWFdxVlVlSjFvM1By?=
 =?iso-2022-jp?B?WCtiVHc4MHVJUXBGZ0RWRFluTUNSYXh1dWYzZWpmem9KaXdobW91dTI0?=
 =?iso-2022-jp?B?NUNQbmorR3B4R0ttM2NOY09hcmJ0aHM4WEZUYlBWUHhJNkVZUG5RM1Vi?=
 =?iso-2022-jp?B?RXh5Y0VWbklTM1FDeEQ2dDYxSjhZRHc1Q2xqY2VYNUFaSUJCRHJQNytB?=
 =?iso-2022-jp?B?RGQ4UXBhT005K2RCSmVnMWtXZHMvaWQ0dHdpRlJrQllsOFJhTXg5UmRS?=
 =?iso-2022-jp?B?emVxdE4yS3dxbGY0TkNVOHZFK1BObEdES0pTaWxoOElERGNDNk1oTEth?=
 =?iso-2022-jp?B?WXJPSWNnSE00OGhSMzdVY1NHanJIaktBYk1Rdk1jRGwra0pxdld0eXgx?=
 =?iso-2022-jp?B?bkpobVMxV0RPbHVya2dTYmVtL3VKRml4ZWtZSUU3NS9jY3F4K3I2V3Uz?=
 =?iso-2022-jp?B?VUloRDZiMkVxeUtOSHJpaUlremVGNUNwTzhBRFIybnp3UkU1MkxmdzF1?=
 =?iso-2022-jp?B?amU4NnhuOUkvTWg0c1VMSS9QYUtmMUd1bytvaUo3cHRiQTcvUXhDVSsy?=
 =?iso-2022-jp?B?M05TbzJCaTg2ZzRJTFBVQjFMWVlqcTZmdHZkbFRrR0U1N2VUNGRLRi9K?=
 =?iso-2022-jp?B?RS8xc0N5REhORTBMa1pnS2lLSkdVUm1EU1psY0Q2MXFGU2lHOVQ0QTBa?=
 =?iso-2022-jp?B?eHBiMm1Va3A0bXNOeXNwOWJVR1RHcStXOGFIeHZERWJsUVRrSXVUak1w?=
 =?iso-2022-jp?B?VzFsMjVjLzJmWldWTVJRWXF5cE9zaTVxOE10VDE3OTdqZ2wvTE54a2NH?=
 =?iso-2022-jp?B?U0lualNUTVRNY2xzcUw0VFAwNVVHc1hneWpmRDFHWDNQZXpMcytwT2FG?=
 =?iso-2022-jp?B?eGxLbTF2d1FhT0k0NmxiQ0FCR2xMZnM0VkdqZmpxTjRKV1ZXZmxqTmdj?=
 =?iso-2022-jp?B?aUQ0MHhoQjBmVG1lYk1Ma0IzMjhDWUxMaGEyRUJvMTRaeFhTSFRYdTcr?=
 =?iso-2022-jp?B?NzAxT29qUk9rVjNhdDdZbDA3aGllT2J1MjFVZmJVczBUbUpkdTdXV1lO?=
 =?iso-2022-jp?B?aWZOYXZrWVJ2V05YY1ZRRW5SMm1CcEtVdEZPUm01N3E3VGd3M3BVYkRU?=
 =?iso-2022-jp?B?SGRwSGlWRzE3RVRSVFc0NkpvaUNzR3NlVVlXRHBFeEdRVGo4SDVRNGlN?=
 =?iso-2022-jp?B?SHZIbm9oKzE5V281bjdGUnpySkxJTXBPVkZqY2lmNHZsODBvVXEvWndM?=
 =?iso-2022-jp?B?alJ1ZlVxNGJJcFhLSm1USGlDNjIwK20rdUtZSUhXdWkzaHNjODVrTmIr?=
 =?iso-2022-jp?B?UVVyZmhKVFh5Qm1GR25SNG50SjM0MUpmZlZraUVNdUtOK05DcVR1ZmlF?=
 =?iso-2022-jp?B?STBIdGp6bTBIM1BwR3NIY2REaE1CdEhybHlIYWRCQU51T0RZcVZSVmkw?=
 =?iso-2022-jp?B?Z0ZJcjVZV3NhbGl1V1h2TjkzOUd0T1NIU29JbnlLeGM4aUd6U3pzTEpj?=
 =?iso-2022-jp?B?VHpOc1hjQStESXh4R2preElzWVE1YkZCYXN5eGV0OXB0YWNV?=
x-ms-exchange-antispam-messagedata-1: UijMIE2KAi0kIA==
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	clg+HIuQzCocTBRbA//IVZ1GoPoCWaC+mnB+PFbpvG4iIdpaQh0qyQQlju91+ouUonjuyt8RhMwGiXTczy2fpzT3Bw7sJK+UEWviGz9cGSA2bSbiXq/9RQRcvg5ZJgm8ibZ+QnKqHA0q4OxlM8SV08wLUIxXXdkys26nkxjIOBniiPMNsTduXOoCNzTLDXhlI09Fzi10sjMqRNEyUR/Sj6Bzgr7pv5HOwxQYGjdk4bn8+ymAwZ+SvUBopA2ouPYwwtXvJdOUpMaWpWkWexk6DAVysaoYkdhs2Pg/EzCpd+/ZuhF/HGyJRs+tUbeSC8xiJOIoekiVt0xL+lMkU2c1yw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F8bWGzMJNCFxZmSVUjr+Lasi1gDYjl9+ihlq6hKl61e9cSun834GfzYgKlIbxpne7Wjv3XTNFYg/c2Q1jMFj6L8CY01S9h9pcvSLuI2PU+bgy8rcWYbsKnax1OuueqqUubmXhn3LaJs0ENyUj9v1vTRlWt9Ua+vds2JvQFeb7qxItlgNDf01l9AGjPW4rfEGRk2Y1FIETpfK18KRkd02qtcVW3IWEW8Be1Mnd+nyUdmu1Opeh5j7eV39uojiDS6ztU8fDwswntCyqXiFyFYlOa6tfhfiastCbhfGTFq7duCmhE+cy07rJoXzBBgXWl65Fk1A0VKfuR/2kGhF8RNnlBATzYceWL8PoBRbjAi18MWywadUlM1XbQicNR6KiicXqqUnb+uDNUI8sUmt15TKCwlFqNbOp5qd/6PJjlUaDwvHqr4Ta15045bht5MiYJbBXwDv0lHGSdBAZyukAwdpA7kvYPgREBui+sFiLfCiWFMNOhqN57uhsi2OOLr7YiXrSW+DhklnKBfNu/xfCfOE2uftjE0Ub9ZbKarC0JAMHnBH87JKfxdc6nr3jq/JCuXx3P1xUd/kDHcJQdJPHtfr7f1jUktRE1e6e12hobfYMnD6Cs+oNtCXmoe9H635XFFb
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17839.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcfb3e8-ffe7-4dd3-df4b-08def1c3bc36
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 01:00:11.1254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJOwfk2wFTvCG2W7v1goJakv9V7x1Vwnl4Ua0F6WNSXUi3F2D0PcXirCVp3ap0sstvIR49u8AQ5khou6eZ83Y+uDgoatTfrqdWJo8XXnJ8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12624
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDAwNSBTYWx0ZWRfX08C41XNwUNJ7
 TfxhT/nNOemEkrkutDOo4fmdu4JHyxjNgRx3yzu/5UbvQJCUp0INtHR7t/sLD4x0qB7zb+tvZSU
 WOTvcyfZBIA+0vQFTiOa1xShTPwQPwg5SegATUb1Xky7NPaMKehuCKo8JexbdgHTJm4r9rSLU2T
 Uep7vfEnI2kUFq0Gt0aCJ/2uWA+6Suogc9yz7AO/5u+YM12IYJThlVHbSyspRE4aYNQXOwHE8O0
 BcdvFc3c0CDnqWFYejgJfuQ0Bw0WoAC3AdyIf5p+hCzbw/GmuerPUMIZkAZGxrRJb5Cyn734Kph
 M2vCourjhUvjeM9e9kqaYSy+XEWbRG1I/T2/RtUMJIifSmPGhWi6GugrXllB0+L9FIsI7uUAUcc
 yb9wWAr36B4Hds1POZPrF1vQxAg/1n++QMu1q8sS7kKXG1ad+qoKx7tK4IMl8Lc3R1kz3LjkcBg
 AXHoX+sAz0o/EGw7AVg==
X-Proofpoint-ORIG-GUID: 62z80skYDUpfUSY0kkH1OXYISNL0gy49
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDAwNSBTYWx0ZWRfX9NxxGJ9vZehC
 W+dTO+rmd22l3BeleSfLWHOWX6vkHV2jzxAo8q5mxpKUQ9qcTRHL8+XjQLP7zFkGsueQkzvA+xp
 XKbc8gD1VqaOZhpPbtNLQcmWD62LvMF1wGVfaaAnZtNVqTXi4Fw+
X-Proofpoint-GUID: 62z80skYDUpfUSY0kkH1OXYISNL0gy49
X-Authority-Analysis: v=2.4 cv=ZaMt8MVA c=1 sm=1 tr=0 ts=6a7139a4 cx=c_pps
 a=qVcjx1QDnGeY+Wm5df+JPw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=ZPSk82zQDygA:10
 a=Sv0fKeRqtYgA:10 a=7j0FZ4iXMVMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=I_Y4LlEPCAdqsIK1J1Zo:22
 a=EtdjoYK4AAAA:8 a=YAAMKV1bZc0v0mznNbMA:9 a=UAVRJdkkkM0A:10
 a=tLdAwY1bkP_xiTqp-F1-:22
X-Sony-Outbound-GUID: 62z80skYDUpfUSY0kkH1OXYISNL0gy49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01

Dear Dave,=0A=
=0A=
>In case you'd missed it, I'm trying to convert Jai's IMX678 driver=0A=
>into a generic Starvis 2 driver[1].=0A=
=0A=
Thanks for looping me in.=0A=
=0A=
>IMX662 that I'm interested in is streaming with a total of 7 changes=0A=
>to defines or const structs in the current imx678 driver.=0A=
>IMX675 (5MPix Starvis2) frames with a similar number of changes but=0A=
>currently isn't giving me images (test patterns work).=0A=
>IMX585 looks like it may fit the same pattern, but I'm waiting on a=0A=
>module for that one.=0A=
>=0A=
>I'm therefore looking to parameterise those diffs but otherwise keep=0A=
>it all common. This avoids the hassle of having to convert potentially=0A=
>4 (or more) drivers to the Common Raw Sensor Model once it is=0A=
>finalised.=0A=
=0A=
We will be following your work and also plan to convert IMX908 to the =0A=
Common Raw Sensor Model at the appropriate time.=0A=
=0A=
>IMX908 here looks to very much follow the same pattern, so unless=0A=
>there are additional diffs between Starvis 2 and Starvis 3 it would=0A=
>potentially fit into the same framework.=0A=
=0A=
Currently the IMX908 driver is SDR only. We plan to add Clear HDR3 [1] supp=
ort=0A=
in a future patch. Clear HDR3 does the image combining internally in the HW=
=0A=
and outputs one combined HDR image, reducing artifacts for moving objects.=
=0A=
=0A=
>I'm hoping to get an RFC out this week as I'm then on holiday for a=0A=
>week. It'll be interesting to see if IMX908 will fit with the same=0A=
>pattern.=0A=
>=0A=
>Lachlan: Are there any particular people we should contact for details=0A=
>of IMX908, or just go through our normal contact?=0A=
=0A=
For details of HW, please go through your normal contacts.=0A=
If anything to do with the driver, please contact me.=0A=
=0A=
Best Regards,=0A=
=0A=
Lachlan=0A=
=0A=
[1] https://www.sony-semicon.com/en/products/is/security/security/IMX908.ht=
ml=0A=
