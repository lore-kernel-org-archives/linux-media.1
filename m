Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020133.outbound.protection.outlook.com [52.101.225.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5263B0AE4
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529139; cv=fail; b=HAiWetLohup3WEC2F27YT0/Bv6QvjcgOrGHESMxz7VbkBEQhXd6nMFRnchJlT7T0lFZIVN940gvkpvjghcF8vc4sIMjNaYuYLIwcJfc0CzlIO3/5dSDo7lE/0sHprJmPGV+gNVKdJdP2f9iA0aB7r3A1EdLl/GExtxC1zpMiwtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529139; c=relaxed/simple;
	bh=xDzIHHXemi9nC4i+OalkEfhr7qHiaHbtpOV2/1CyNjc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tBW1+yQSnUvLqntLGb/7o0B+fVe268OSkgz/Rr+8t9+wsK24+1W0GePnYBR8mJ0nGqHnlDE1vyTzvlRiQXRUKIqkS4bsaKJQ0nCsIsUfzoZcEAIIjU/oJqJP8Q56cOzIxiXqukjv+Z5RwrdaNxGXr9dYArgT8jocXP+cXrcvJRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=evSm6f/6; arc=fail smtp.client-ip=52.101.225.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="evSm6f/6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDlkdSYUbi7Pd8OtgvjS474OyrO0Rsl/dEe9uUluVx0QZDmw4vVwOuOgUO8YXb6QHvR8dnYrPJFb0FlHnzLlKWL65ElVHJjeyrBdByuEu2pXT+I2sWfASOlDsy0K+orUInwQIuvVqjusuFM1brNP3/BHIn2O6nXPJxYu2DwbjhupdQsQqRsnlGAKQc2+1XrMVywOyDZgWMjKuS+KekRnZcKCFrqXAjYogY7cTf26H3XpLW1dFuh5MBPxYXrRzYwAExrV5IF6zyqaCH/YYE/1bHFry1I1KcwuM9huoZ7Qc15APqbOzb86GgfBKSe88nH+bOGpCAmhYmWysXf++eR0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDzIHHXemi9nC4i+OalkEfhr7qHiaHbtpOV2/1CyNjc=;
 b=aSGx9v/FoMDBwdLFwq97qvjlEOyEee6mIOSX1h2sXJmCeFqrUnJ67Q4aIEPO4A/+F3w4SyVbvRKoMPXe8IZ80xSiwf9pkfg8au6LLTtrxxjjFeBzgJjcTMZSwdGbEpDw0z+g/WNbCEKOjwff7Z0M6GzCSQLqch1YJ+h6LQHbqn09jAfC7pvdprfNJLboMD6Punlgo9H1j7R3YqAEKeyHiAF4H41wSjlP1xXJxYLglULDILySIREikRY1an2pkF+Vd4zQbirbjfDKBEdTeYxSbdRoRu9KjxdhB1E9IeF9Z51TPVcUewtUXbvmPYzmVE42NA/nJtnPNADwbDv3EuENaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDzIHHXemi9nC4i+OalkEfhr7qHiaHbtpOV2/1CyNjc=;
 b=evSm6f/6HmzVQOo7wlukPm/ODDdsRK86oQ85G98zKkAiFnyIP5CY5ji4vO5H1DbV+2Y7dWdMqGz+f0BU8mcRtzOOVxrcNjBV6gq+EUg5AJSWUDeOsdQ8Vyl0YxaJWZRTzJ/HuNdGv713WCodhjtugTz00nbLUG0es/3fRfWs+GQSm9P6qvcCHoIzJyQP2YgeS6ZWSclnMNARwJL1zsuYtryotD55dG/nnbE/lhr9AmCZjpqIf+0Q4dO2A/sHkv1cFQK2yzob+CSM74GsS0EAbgK/SR58ECJeNY+KrAitFunLvkukMDRJlWlQ6mXufdH6pT0k7QI9rwBFlsN3f0Y5Cw==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA5P287MB5900.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:20b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:58:53 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 06:58:53 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: Antti Laakso <antti.laakso@linux.intel.com>, "hao.yao@intel.com"
	<hao.yao@intel.com>, "dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 4/4] media: ov05c10: Remove duplicated writes to analogue
 gain register
Thread-Topic: [PATCH 4/4] media: ov05c10: Remove duplicated writes to analogue
 gain register
Thread-Index: AQHdV2kZNovwIh7bgkuadstpb/h3RLb0yD6n
Date: Fri, 9 Oct 2026 06:58:53 +0000
Message-ID:
 <PN3P287MB1829D833031B9C2C0A525C188B922@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
 <20261008210503.1878442-5-sakari.ailus@linux.intel.com>
In-Reply-To: <20261008210503.1878442-5-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|MA5P287MB5900:EE_
x-ms-office365-filtering-correlation-id: 56486b41-a7e2-4dba-40a8-08df25d2c7ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|10067099003|22082099003|4143699003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 G8z2m5T/lMFKLxE79U9K1ubMr3QR5X/mKE5Qyr3or5RS8LcZHL1366ZNrWaWKe2mGob+RFv83uGLsgROezKuuTAtbP7I0K5+DaxAVYv9+WSSWAUrK3z+V/Jzk6Ul3GwgvezvHNNRDx/M3VeV6RP3RSpv1Da8uTOtCWTnCzSUpMK7ap+Ws2Xq50JqCh4j3eF0dpQVEFYJ6WzS3k7ClhgIBbXegY2Y0q3tykYaPmjFMONKQxvnfydAMTiy6f2oMypGbcveNHAxJTUy2lsjsuiFc/2CRNFha770FW/Qz636rhi1gpi9To7JAMCvwzfOjt6B4r7CHAQrw1Syjj3SNEkqdmQ/xN4geV/HxRf8+8PdGpBRPgXrkHZBbcr8uH/w6o5K1aF/VV+BFovJ7Ihgjb3JYEpPcymFfuxFt3T7srbFtLL+eXORxVMTVxpt8B5gkH/QvC8cP9hf21kKjC42AEF2p6uZFgmEFPgP3zB7ZQviOhHMI/ThYNYz7yQjxqiIPEy+pAa3UCh8XQOW8n1MGrrRjMcvYicpGyTVjigbn+m97wcLYpieI7l2blP06qYA8boe4U1Tgg9viSH6EkNRNsbLOO0x1dor+dWt50Ue3xo4PcUj0zA6OvG9FYxPQ2n9OOVw4lT3lEq+7wAX8u1tx+6W9eKjZV/ZDGuanIUTPZ+Zevrar4AYF9x5E8t+qSUakLu7uG2bdNmzfXFi9B6KcKldcxIgld14EK033gbnNKXVRbI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(10067099003)(22082099003)(4143699003)(38070700021)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?j9p7uXPg4JivhwUux1H+YtcwRoFknHsLSeH4P8XIrBoPjW1nvKqt3hvCc4?=
 =?iso-8859-1?Q?V/qWSnPEeKLOb1XFPL0/ddCXSz2hOCo6P5tccmmdqqqCzOu+UsW8lfSJVT?=
 =?iso-8859-1?Q?/btZ3R2HAMWXqX+2Yy3nAOMz2DZw9Dwr3f6WWdJi7URCFGtnTkp4QGdpsl?=
 =?iso-8859-1?Q?Am/57R/MoSzwpYqsIAGW5m+SStvGOhZnLJ+nYGJUiG0x4HSOtUwd0TXMFa?=
 =?iso-8859-1?Q?I15LchA/jIH2tPtq30aeN0QGQScVY3RuRlBo5Xxa6YgydBxpS0hmte4lHk?=
 =?iso-8859-1?Q?8GfYegfXPO2eVQRM6ifd0huUb89iRbkJLK3tC2jomSjM9lVt2gYXuXrnks?=
 =?iso-8859-1?Q?S9N9e8lGbiza318q39UfehHoFSzOyujBqcgoVwRKMc2kBW8bTK4RJrcllk?=
 =?iso-8859-1?Q?R0yXsWOp5Y3IsLaodWfM/dtq6KMTq2jYaPZ7/h5VOnUeYuRRGE77tGugG+?=
 =?iso-8859-1?Q?mwxHZOS8i0iu0q/stBjpoiEOMhUDh+wE3npjn12DPJyvmTt+KoLkmzDjfA?=
 =?iso-8859-1?Q?uRQFM9G6kGNmCLVTx2J6H9+guhkksX02zn1S2krTUMu2c8ba+ENdsI/Jta?=
 =?iso-8859-1?Q?RwUOZWMgtR1sR5lKGdxckKVcqLpmFUyvOGzQYK4SpHjno0Pdt0wJWvzUyR?=
 =?iso-8859-1?Q?/8BhkOzaNVsUwtARZCPlIyY2QEYUQKxstdeT8kIoNNWWxH1NwoCUiAgzpT?=
 =?iso-8859-1?Q?+2lAooJStkmP2T2cfbHjyYlHvE4j0Z3Bk2xIVor+rcLnP1SI+7umdXtvnn?=
 =?iso-8859-1?Q?OyL/4bQM2HK67h/VgoZo0kBMIKAVHgPzuzTkVM0PoCJQFM2h2aq4Kh7EWp?=
 =?iso-8859-1?Q?SEXvC7/lbfS9502NF2tvkesfJvWy/g1hMweydIaztqOoajZ3XDf2hSMfNY?=
 =?iso-8859-1?Q?8TNCTdCG1cNSpBqKl74gejGiDokr0vbXTFVDUicYIjMTxV1Qk0Y0KPse4x?=
 =?iso-8859-1?Q?uMX2Kc7TOGp7Vq1jHKKvg30t8mHyWybXee4AEmt7armPq8f1u/9UJrn2Pp?=
 =?iso-8859-1?Q?LoED3LhYZkd7aJ/a68NX1rgBHf/rkLvWInMbSbK1i0zvZ1/T1teu6kFu1C?=
 =?iso-8859-1?Q?BPGacd3+jJ5EHRqsEJot64qt4qf0++aSmAnaCPqnez4268rbYcZ//btJwN?=
 =?iso-8859-1?Q?eVA2nPXw5HhqgZ+oq1awdAT3v/eeNvRJMGFXilDlfDlSJTTqNNwO2FY3Ad?=
 =?iso-8859-1?Q?XVnVBA9ekHpSR0xbRiaV5JGrDS7CFG6iqGldJZd47Ii3gdncCVENz2dot8?=
 =?iso-8859-1?Q?idG4WkARbIHaWPex8BvjwZCGM6owaDxosy4k/W6zaBHrztzJ/f4VnaWyj6?=
 =?iso-8859-1?Q?xdTUNGLrNziUGUvYaxPncg0efa0mXFpXZCgHBniwrnzhfyGMHaqnr6xba0?=
 =?iso-8859-1?Q?wmhtzwdIoOcep9uFnCmaYYZqGwHQ2Bz+dGA5Niuu+RSvwtpqzy9iONVJSJ?=
 =?iso-8859-1?Q?ckV64fXoseYqAIN9tjK3d6bfNgIN/m3uz3CDzOFnnIIyl49gDZHhueQg5K?=
 =?iso-8859-1?Q?+GgRergXdk8EjfWKCpheoTmPqBgFoTWA1QyNEZUhnoSj1EogM/7eLn+Ng9?=
 =?iso-8859-1?Q?+YV6Nu74s2CXKWqAoc1axGSBprwbgxL+P8BrEeIJMjSr2UPiYQXOVpG6lq?=
 =?iso-8859-1?Q?y8Bx6qbpz5eGRnq9+LowjbfedqPSq7wazWAi+oT9izkbQg2Y5bdhkvdg89?=
 =?iso-8859-1?Q?qnYCSfcrzWKO8zEJCKrLD3qhhW+TyOx/OQ1L2q7+LoWbnAA9GSpuvpDVfa?=
 =?iso-8859-1?Q?54Jj18g5wuxZl1+V5DDK80vsKt1ZuGt35Nmh2UVGTMPjkGTzF3BPFOWI0h?=
 =?iso-8859-1?Q?BYLH34mw0AauuJOaFhKS8WI+KpCzPro=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56486b41-a7e2-4dba-40a8-08df25d2c7ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 06:58:53.2844
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zG6Bv0KBBatm8XCO9TBTVKAeHEatLZblSNvkLcUam75k1849mu/m+bG9HlfcTU4RBomGKxV0lHvwsCOGpwhpwSjzrvCul/i/T0MF577ATH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB5900

Hi Sakari,=0A=
=0A=
> Remove duplicated writes to analogue gain (P1:0x24) register from the mod=
e=0A=
> register list.=0A=
>=0A=
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best regards,=0A=
Tarang=
