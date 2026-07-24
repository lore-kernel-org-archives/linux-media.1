Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021092.outbound.protection.outlook.com [40.107.57.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD22B38947F;
	Fri, 24 Jul 2026 06:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784875667; cv=fail; b=SkWO+4kQQUTT8w2yVWZ6EKVNBof1X4GfCFWgpo+ug65bbKRqu2tlNibfBnITlD33noJCDX5ZiF7wLzC84wkF92YVIFyRqqXngKiI9X9mRsK8siwVrjdp6m4Dr59I/UDjpr1PejU4Ls+BwgZpO/l+uMYaNuUv8AGRob/fD5BewlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784875667; c=relaxed/simple;
	bh=O0U3twRi7ZyQ2OW0splkkuAMIq1SwmHhLeuveYdi9Ik=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N3xMkFYoLxSJKQ9saWq9SmCQH3woVj2Y8R6opmmh8nd+DS7Vz3ew0DhK0w7V9E5xWrUzpRP9Hx0tf3QA/v8VpXETEORFsfWKEcvoAVeXaLiSIOrnFF51ibUdCh/57da1PcpFoLI2w3Yq2NcJyKNcnuYGIj+iYipnoWqTsiT3zOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Zb0/Z5Ng reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.57.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Zb0/Z5Ng"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWW5/yX8wPFlpCelMBoFszBJ9dfs1MC2Z6Cf2exFBU2BMwFw44+1JArK+fJoj6N1zjLRAYjZ9G/s+lOjmkn2iHMWSOdxAnCzoLIeYqDF2Bf1iVEAkjxIn6yeFcZuol7OvJJQQBmJJNMb/5wM3OgO4dcWAp9A2EdkEHMAS/Iv+KUjcCqYkB62oGFP0QBwDECNN+xQO3yZgiJEYijfEfm9AvDv0CddN48YLwiGhmAv1nMrkaRGqle/cve4M1kHNPcJ1tTvShvBNZbqWgPSOLJUTIyc0MSqzyxpLAqjh6bdkbHYs4RhHrGtX6P0FTEwidyVyuIdMhE6s6UrrXGOnOdJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryHIvXas09vBwKmKhtt9fhXYF0jSvDThn4PPP7YD+BA=;
 b=nhU0QxYkC8H2HJEa0KBso+REWIXFl/Cpv4UOKpZUFA9qujotCKCjyYD4N4mFDHhr261Lj2+ND1svMzuRqI6B2TZBcho1VPvRCN+QIIte1HLRW6117I//a7csxxavsBTAD1fYswEHEsHPwutqHguCZU7obS28QkL21KL9qG2OdllMzCM1Lc4b5GY5dv4hqRaDnWl4RiyENk8/kTxj3MW1esjoehwNaUI05JCR82xQI3NCBgTLTM+SlUQyoR0A/+1iP/SeWl+RUhIKGFVO8pF1nDsLAq5/Ee8yVi4S9Ob5b31P9l6u21FrHtGUSRHfPPypFOKiFouHDrdvmQsCIyekOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryHIvXas09vBwKmKhtt9fhXYF0jSvDThn4PPP7YD+BA=;
 b=Zb0/Z5NgjjBcWOcCwch6w9OSFQLqbQjOFCSVcuROim54OCkukha3j85CrF80Zo+6LFEPxW2HW29KgvUwoZY0z8gXynsLGTm7wTiGw+OhEEpbw1sZsHW+NGjyEBl+cXnQdEP2qHnDphESxQZgs4V1nh4GMUaSStP9vVHpGF5N8Gl8RpMmdI0xw4OUiIF4yK9j4y17H3dH5b6xkYuXG8WWyeddawBEGC9nvL7oxW/QBPtDHIfx0nL5JCG8Ggo+sGD0TeeATSYzg0rrH6A/qeYt4Y0MlXyRG+BFCG1vmmvu7GNU6wglUQ8reqFh5UsPdKmJEiAANa7uU7C1kr63bv4KKQ==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN1P287MB3680.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 06:47:42 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 06:47:41 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Jai Luthra <jai.luthra@ideasonboard.com>, "mehdi.djait@linux.intel.com"
	<mehdi.djait@linux.intel.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>
CC: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>, Elgin Perumbilly
	<elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Vladimir
 Zapolskiy <vladimir.zapolskiy@linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 01/17] media: i2c: os05b10: Use
 pm_runtime_get_if_active() when applying controls
Thread-Topic: [PATCH v3 01/17] media: i2c: os05b10: Use
 pm_runtime_get_if_active() when applying controls
Thread-Index: AQHdFvFg7yeW1FqMqEy3kXO2HOhIj7Z5ED4AgAMpcJw=
Date: Fri, 24 Jul 2026 06:47:41 +0000
Message-ID:
 <PN3P287MB1829D420E03969123F429A238BCF2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20260718200912.16001-1-tarang.raval@siliconsignals.io>
 <20260718200912.16001-2-tarang.raval@siliconsignals.io>
 <178469988693.3005206.5686931440708466537@freya>
In-Reply-To: <178469988693.3005206.5686931440708466537@freya>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN1P287MB3680:EE_
x-ms-office365-filtering-correlation-id: 8b577694-cc65-4666-1dc8-08dee94f75a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|56012099006|4143699003|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 u0ild2Mw59gBaMoiblPxLaHgkjJS76UNQJQBTlCQevev5oe5hjpR6BvgoI3N+u/7i9UPHlOxveRwLep/KRQNCPmbJv87wqLtw+UJu5H8yL7NampkPt3YmquEZWPJYQWgLKkXsT3uFWBmb4f9RENmuxGE8aaOLO15dYheNKfv1zGVYSW3tGbRNCH9T3sdcAb4Wz/tjbyX/G9EpDBVpCQbjWjUUNMCdf/7j4iaUWAktVrpmiV5aBrNsL4sCKoEsPw90da2CBMSjkx4fnDQ9dOHrWW1bSe/abv79A7fa/qHGS12AAkM+JJUW6ipVMxy8F8Kc5BjRMYUbfp/fwcpF/FfnucZ4bc4qqiSsISqoPgBaHVNSm4TBCLk3MznTBiybJM/SrevPJbvBic+CBvtS+MrYfUoBj6pJrIC3ig7mqvgTdngXmfwHrMcscsudWDBLNcCvwK5USh6/Evij8n6BR1SH/H8O2/JasRaXy0tLiGPgK0KjWQYmrDCtpw+9NL3EIosAUqslnYn04JlXBi1gkQES0qYdY2mRpB8WcQ1iJUF/TF7ozh4dhMSzIaSI9gOM2YodGvZpr6YgP0jDTNc4JTI6MxtIZCBIYJ4KLe6R+n84G9XnkPMt6xp7Pgg9PbXqxhnO/2IlcOfrnAIDG2+3YZrCJ9HqV89zcYCmD+XdCYTflcrQK4V1wYNfe/D3OzupisAZuImqn0jGm/Yevj5R2e0U22Z0gNLfcHspUlKd6snir8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sP0qI6Ec3TIzMn6tnVLQZeimpr2XrAZXSnBU6lY4QuXfwHCglu/zOD7iq2?=
 =?iso-8859-1?Q?7bBDEJkN3BmT65SmNRQGw9cWP60id6RITKR4xXzsQ22bU6eCVIstENrQ6I?=
 =?iso-8859-1?Q?Dy/U+RoHUwoi7BjYtsNwoXbe1W+m/xYUnrJA7xvUpmVEaPrOSWMgUE5wil?=
 =?iso-8859-1?Q?gGLqDVMAXSFOUdyzqBXMxr8nFBLceYtrVTlcMgtq8c7iII2jLiuKSOH10H?=
 =?iso-8859-1?Q?5yN8DWmQT/rohvmMbS6660X52NQ4u/oU62bAzpB1vI75rbY9dNP5RD1bQ7?=
 =?iso-8859-1?Q?aPILxF6HheeaCCmnjlZETcahYyQ95slvlg6//UoT+ZXgb2pXSrzRntd6Yv?=
 =?iso-8859-1?Q?pm+87RQJJd43n46mWkRjeXcqVNHcN6JZoxmbCVJRZHNLUoGzeFLXO/ErdL?=
 =?iso-8859-1?Q?hy5kgs0c8pbsODDUzJYilZVUFlyY77jGcznlj3H5dHqfMGAIfezaXW9hYT?=
 =?iso-8859-1?Q?U/CPH2K5iD42QeqhosrAeeLKXnAnmghTX7gfToWFUyfRD5UpRpqrVcV32S?=
 =?iso-8859-1?Q?APlgOR5WYdQZV73I1gY3ph9JOjzwgogdi5/mRlI4CaNrAH5kOtUbUiGzCm?=
 =?iso-8859-1?Q?wSSzWhAO8bf48qHNby7Pt6RmKbQ785QTQPurulTyLaPFZW1tEBYiQS3slM?=
 =?iso-8859-1?Q?kazHZMEeaEI/lhgoPbmRn0BGqwffTF6zmlmILI4uNFz6b/ZCAAdtv/1ulN?=
 =?iso-8859-1?Q?wG/HlUTvnhoZwH+X2IxNQ+8EJGGOFONHa009vfsHXw9Wo/6YpQxh7qGO/r?=
 =?iso-8859-1?Q?PNEo2VmbfzwJ3QV4uCeFYemdMe2rWHOeMK3RY2z3iZwNXRwdkzGZrhLIoy?=
 =?iso-8859-1?Q?xuSWTFcSy7kPMApvB538wkQboHDL6YNsFyegYbRyYGche4lCTpl52KviZT?=
 =?iso-8859-1?Q?jpfD2s1kItMvwbqX4mvgGtdRHQKc/GNOBTTa4dao8oN++V217GtTeadh8m?=
 =?iso-8859-1?Q?qmj6n2cXndUabVmgG4Xr7O80rB13X1PeIR/fQdhsi6ntf3uglY0xOV8urM?=
 =?iso-8859-1?Q?DGe+0cUnubOnZj87siJNSx5yehpiy9hhgUUwCNC0RqmW6lruJQe1zB4Cb1?=
 =?iso-8859-1?Q?mP5YVpeG+o1spC24HIPW0m5f4N4HZGLxbIDIdRmhJJ4DYQzCXE/eMXI2rT?=
 =?iso-8859-1?Q?5MBVqXhav9zmuX9ba2j5D7GLLo8JY3NSfJc1NmtcZEC9BlJIVL7zJfatgx?=
 =?iso-8859-1?Q?5MGVmcTrcpOotT6IOgAjfK3G/cPy9R/xIxYcMfFS+ONfqHEjtGnrvbHyMf?=
 =?iso-8859-1?Q?ZnuCHIXoEQmJPbVwQZE9B+8WZIzqZZTKJJEVBcDHYjUfAZ403oCg60Fw18?=
 =?iso-8859-1?Q?54/bCd9pwDNzPpavO0bmyOKjx6m2UgfeLT087kQLBaioAyYk0PQxv2b7Tq?=
 =?iso-8859-1?Q?+biseVgbPZGAO8OM4dHve7TSY/AW7qg4LIo2gRiWeZuCGx8KKBB62tckP8?=
 =?iso-8859-1?Q?+W2CX2GrLyJLHs5zqC50DD+CtYN/QKUZaW02DMyMfGm2CGcy1nx+8iGVz9?=
 =?iso-8859-1?Q?WFN8707RlI3YZknbnacVRg7/cRj6w5IVgFH4HKw9BhKTZHFBSH7Jw8mpWJ?=
 =?iso-8859-1?Q?TlaQZjFQajgNkDcO4o5ijbxgxek2uEO2DAEXkOekr8ZlNfEewMEvxXpf/K?=
 =?iso-8859-1?Q?YaywBDjDFLXlMXDLTJX1SG4uY2aeG3nZLYbk08i4zk2a/mkDyZN1289kQN?=
 =?iso-8859-1?Q?0cNN4gumlFbBddBkNx5r3X5gNQa7cNauotp1DC12MtqW3+hqGH7uaBCsju?=
 =?iso-8859-1?Q?VczmFq8pd9Da7wSIrCMJFRH/WyjG57zv+AW0l+PhNfsQXAIlVuFxe+Im5b?=
 =?iso-8859-1?Q?kXvdGdqx24nQLq/RijHfXDYYOwzU1qjkx+vlys3LrTXYG9gRwn6I/kNleT?=
 =?iso-8859-1?Q?pN?=
x-ms-exchange-antispam-messagedata-1: gP+ljP/1jLxMT+1lTghkzV0lzG4MwTdsMzw=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b577694-cc65-4666-1dc8-08dee94f75a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2026 06:47:41.8269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7Qj8qVNNEaribLSvXM5kmER+o6b6BD1e8iwUJ8rMXWFvbXCXt/B2ytWKxnrlbi8mfzkKfzhfz5JRmhQdJmnA8R2V9GlJe0DE2s1MNGLDrZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3680

Hi Jai,                                                                    =
    =0A=
                                                                           =
    =0A=
> Quoting Tarang Raval (2026-07-19 01:38:52)                               =
    =0A=
> > os05b10_set_ctrl() currently uses pm_runtime_get_if_in_use() to decide =
    =0A=
> > whether controls should be applied to hardware.                        =
    =0A=
> >                                                                        =
    =0A=
> > Use pm_runtime_get_if_active() instead so controls are applied whenever=
    =0A=
> > the device is runtime-active, regardless of the current usage count.   =
    =0A=
>                                                                          =
    =0A=
> What was your motivation behind this change?                             =
    =0A=
>                                                                          =
    =0A=
> This is a bit wasteful, because this driver unconditionally calls        =
    =0A=
> __v4l2_ctrl_handler_setup() in enable_streams(), along with writing the  =
    =0A=
> whole register table again, without checking if the device was active or =
    =0A=
> sleeping. So updating some control registers in set_ctrl() seems like doi=
ng  =0A=
> double work IMHO.                                                        =
    =0A=
                                                                           =
    =0A=
I will drop this patch in v4.                                              =
    =0A=
                                                                           =
    =0A=
Based on our previous discussion on this topic during the IMX678 driver =0A=
series, I agree that this change is unnecessary.                           =
                           =0A=
                                                                           =
    =0A=
Best Regards,                                                              =
    =0A=
Tarang                                                                     =
    =0A=
