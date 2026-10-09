Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021110.outbound.protection.outlook.com [40.107.51.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CCB1E1A3D
	for <linux-media@vger.kernel.org>; Fri,  9 Oct 2026 06:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528123; cv=fail; b=Z+A0ocRn2FfbgwNgUJ4u7IOZ2+BsYXLmyMNcBtE4XybeuewyUj3jNIt/g4494IPXS8FmHWFXK1iZo+QuCPXgcqsLMGz7jtHoNd6amSPeNL/hUoArrHp79LHMH0xjwRbsSYhMZmA6RDFu+1uIbLFpNn5rWI7c8uJCWYRX45Qqu3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528123; c=relaxed/simple;
	bh=A2SAufFuNq2xf/CGxIW+q5gwq2F0sHSJgW7Tgsl9CWc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kk5WdKPZmgkdSHy4jLyumCnbOF1/IjUGTUX5gkS9JAgf0bKXVFY8IggeiI+5sHQX1jOHFHuLOYNEAAVXfF2X5w1EkCpXjZHmkVS3qbuEDJ0oQxfg1y30qyF6XRo/yydFHmpI9i+GYZzN12XSv+5RDTaK6vCMb0lxxBZIsRrxg28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=L1tvKySm; arc=fail smtp.client-ip=40.107.51.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="L1tvKySm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmecNy+Uk1XAaoeY2JyOOLqkOXQ5tgyUHUo/9+J7OeE9ejEvcNm/l3UcLQSt3zeyI3XbEDg2lysDAe1lgjKJxUYJFhGN4TihJBISqwKfNWI182N87YmxQdAi1svflLka+Ou5rE+9mtWffDeRWvgDAJ5qANNifrYRX15VCBEqwLtqtHY989j4+cBjxGexDT3n7VLaJPfgD4ElzaQx8XiNQTTidD4xyP+2VuKaKPjgDWdNct+F4BrE3SBBELmRzxIJdCGBPLoFH32dhroJKtWbzY9ahh6LvQ9wFmwxEUqU2XGJJDG6ovC0I7M05kGWu2W70owHU4VOIboAPXJekaW2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPAnSCMIuXfGa5piBH6zAdSFNECEL7rS4ItPIgAY5QA=;
 b=fHV/Rwm/Klo9JxmKwAN+8MaA7mBY33IX8vP0VQ4MmtU9kqxyTq45SC3yR5vVPwDhYyBwqDgVpaE1YIfCpdphCatG2+83TN8W0ddcAGKr6rq65Di1yejH9Ti5/xbV/V1aA3Hs5LIYuC/cv6YlOME2o3Cruejbm8ODesoxeWQaeqITOOwb0DlreyjbdxVtCBg9W2fpLQ+twRymFgK+PRa3rTdeWsJQ7HPDNT+YSm2D1YaZa6FhwHnYruv09tfj8mFpKfxnBH5f/dBDdHCRUiBJRUyjZHT8X4jZxkTieJeO/73UqGOBV1i7f7AILrgofgLmVl1t5UaGyhUADDGY2yHxAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPAnSCMIuXfGa5piBH6zAdSFNECEL7rS4ItPIgAY5QA=;
 b=L1tvKySmxsfo9tYgfDQaGdnzY2Kx9dFzEzjFsF7XVaVWW/cJ2jyzbJ2iW0kt9q9md54oD+IBk/xILxkwnreFoi/ivr8qpUvCRs5/NA1SIX8Zoa0WF7/rynLIIvM/8v77jMyVplc5UBJN/EdlXT8wVz+7cIrAzz01jXq/wFAVj7XvmV5jG1dcfvLt5l3r/Os9WwNJf4Wp8s5Wb14wAvgutBelLJ3IeSSB4sp8Oa7a0sdqM/YYTmT81rDOuW6TLUGXNzWutDo8Nh4VTKkdvDQ5rlVihT25APLZEDUsOEHoVtOeFDa3OxVg6FvYDAh948nAoEvecev+t7Joa5M4zk73xg==
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1684.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:126::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:41:58 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%3]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 06:41:58 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: Antti Laakso <antti.laakso@linux.intel.com>, "hao.yao@intel.com"
	<hao.yao@intel.com>, "dongcheng.yan@intel.com" <dongcheng.yan@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>
Subject: Re: [PATCH 2/4] media: ov05c10: Set reset GPIO high when acquiring it
Thread-Topic: [PATCH 2/4] media: ov05c10: Set reset GPIO high when acquiring
 it
Thread-Index: AQHdV2kUsz1LP3i9okKn/eJi8Frlsrb0w2P2
Date: Fri, 9 Oct 2026 06:41:58 +0000
Message-ID:
 <PN3P287MB1829EAC955CEF50145998B858B922@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
References: <20261008210503.1878442-1-sakari.ailus@linux.intel.com>
 <20261008210503.1878442-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20261008210503.1878442-3-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB1829:EE_|PN2P287MB1684:EE_
x-ms-office365-filtering-correlation-id: 2f9ee103-b42e-4f49-15c7-08df25d06a88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|22082099003|18002099003|4143699003|38070700021|56012099006;
x-microsoft-antispam-message-info:
 4a91rqCO1yn3XKQ0QlU6TuqtYFSgg3SGHJ9+c4RG5/sVY8laLnFLYLiA8xr/gO7lFDsBfF6/2XTlaauhC5D5oLgBVqdl9/dGRzMtCvYAJnw3h+Arwuv2dDByAGS48OaIaBtSP8MMLmBIqlSxuXeuJbDdNCJeX/cgG9F5QGON/E+wNXBQUPAoJ7kv1vdXjVtEUfaqkiKXDBdFR3hcEFdkruOOHdoUo9xAWarV0d7YCI3kDC7j+4ASv7Wycx/KqHthmFg+Ix5Ajq89XbkbHuhzTlP6TzOOTyquAdL9yY9kQ4X8xzJitNOSN9ooFGLpJyEjFUgdAZG5d5BBZj1wkU+rjWBjA5Zn4MMFcUG4POSbnhaedHzGPD9rzgSNCQZ+PfXfkqnIg6lx2NdHEKfM5z0h/y47d90PsKmPgFdRgZih1Nwx8PA4Q6lhTh8TqvG548G6uZGDYfN+CADINCEtl63ksDeNaVPy6Srd96eG04DJ/EsXVeBfgdz3bwSTP/p+eU9lAbYw9OzpsRgj63G1ffWIR8mBS29mGBjeuva44q/yeFx4ehepmm2HpeTVwfi9HYcRqix8kgVC8F+tx9Z3EREG6T3KsSzugE3igjA46r2odYYww5dDDLDtDRQes/LClg/AcNWH5k0YRpyVf/p1qirCiwmj23bx1pOTbJM4gcPmDOohx+gk+kW+fxCrZKYqYJGQCAl/t3i8bIMCX07tGP4zjt/vvNX0DeUZm0dFpMjY65w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(4143699003)(38070700021)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?15zRbpXeY2v3KOnSU8+Fb+RRCyB6fJOx/MO8H+8kpxpkhrSZakVG9d2m43?=
 =?iso-8859-1?Q?SWL6Vkh3sc23CzVUSdXJprt65Cw7/MSTLpISQjTr6zs8DvHjF+8BRau0Mi?=
 =?iso-8859-1?Q?3YmWKCRng4IJBasCA/cdWjd6flKmBSEoxPqlchn/Ayrc8WPD+zvW5sad1k?=
 =?iso-8859-1?Q?EPZ/XULVUxvxtOriANY4+ij/ZcEttFKws1VymqlebEQULQhpmR/vKL6GX6?=
 =?iso-8859-1?Q?rZuNijvle1IvRet6TO5lVQbiqlrrmO1rsYUc0JmyVCz+oYSd4Nf/tn8quL?=
 =?iso-8859-1?Q?aq/P7HpqWBtq9Vwiqvoxxy6Q1GK0s6OhBgbvAa7rGGzn96Ry+06K3OOxen?=
 =?iso-8859-1?Q?Jajg053XBRY+lLkVy2q9no39f87mQn5IN6DbNvlRtwg7+H/IT4/VEqo9bE?=
 =?iso-8859-1?Q?yKxNJvUV3ZP57MqyPF85B9cNSgJKSgy6LwKEPVeBjJV1C7aMoEmB0sCulC?=
 =?iso-8859-1?Q?Dmp7voQIkbPpyLmWgMtzkdnls2chM43rBCrHjKnK9XMQPUFNqYJ6MPpESY?=
 =?iso-8859-1?Q?22HdRjGPnX+LiViuYTuoH7p31x9x0tThluvUAmtyUH9iyOuGTz1qF/5ie0?=
 =?iso-8859-1?Q?d4rVPlKBOiJ4d6+N3r1/fbrtE1glJ4VY9q4JQwjB2jkUtZrlHcVmO551ve?=
 =?iso-8859-1?Q?PLZmgkhIzaXGWmdXa6eIRGcS+vFCyrwCCzdIa0Pn8aODBiZabiZtfV2I08?=
 =?iso-8859-1?Q?yCLvt0kqbBV+aGlkDZIvaEhXnodSUchhGt+N46ZdSb1JJM+ALRHNaI7ks1?=
 =?iso-8859-1?Q?qp3lQlrGuP73FBNp5is6hVtehgF6V8ZdA6bWcwymyM4mg5ruNZZY5MAazs?=
 =?iso-8859-1?Q?0tAVofJiy77xONwzTOgVPBRag/cswIZjooutDkB1ctOAeosW69mjs1shqB?=
 =?iso-8859-1?Q?AiGgCRbGsEA71lm0ufDWSBKq01WX80Gf5FI+diYG9XNqE+15B9RnnhhgNq?=
 =?iso-8859-1?Q?EzzqL0vpSHWsYspWALk0NgUf3Gi2A1arphbicA3ZGPYXxTl4+32ZImHyVC?=
 =?iso-8859-1?Q?Hs2BIKrPmgt+IGpLGM1csq7nQDB7kMlWHRKiK55HeRMFCElbuwKPdeTGDp?=
 =?iso-8859-1?Q?FcQtcOv++uLkYC0DAqXnPZ4EnpLVc7C+9Vw3NPYha65VJAuaR737LMM1Cd?=
 =?iso-8859-1?Q?Ut8z/sjjiMLSHKgp6NQUHBAjWywjnOCbhIqxLcqZUBKu/j91Orly7haz4d?=
 =?iso-8859-1?Q?qQaJcAXBYiEL+Cpony8Cm7cyzC7Lb+FLgSf++o48Nr2AfrSvkZCR5ihy+5?=
 =?iso-8859-1?Q?D9wH3ZT9f+UJsDMIbPU6OGk1/B81vNs0z+/wQVvQPKN0kI0UP0putHbVcg?=
 =?iso-8859-1?Q?zEhOZgYFDY+xz70WYxKkrTUec7KDEwQaGhkGLgGft1zFjgRbwe1brKHEsl?=
 =?iso-8859-1?Q?I7t6jzrHSIHtZeT4x6k4su9DLWv5YBaD7gS+mnZHhAPo+gt0iQiqQN0VM/?=
 =?iso-8859-1?Q?FyX7l9GG2W0QBcL2EWS2cQXFpZML+OEgqEdxDvf1S4eUwKAIR6uS5Bxk+t?=
 =?iso-8859-1?Q?Z5aqKbvy28dT6JB13LyxElTKi7MdBoQ1Ta224MnItScWMtxoCMOXD2NhXt?=
 =?iso-8859-1?Q?IwkKcJ4reoTBGd80TdprMh7rX1GJ3pKVT3aodVQlyq5gPFBhRXPYB/ntIv?=
 =?iso-8859-1?Q?2ZWUjAVmuyMd9t0OreAlf7Tq9JFxiPvPSc6XTDOGzp4KMsCc37jcRORxht?=
 =?iso-8859-1?Q?qQ3sShN67aeCqtdkxfidusPXfM2gqigcKuaJdEYgnBrIL7FA7jB8wK4tlC?=
 =?iso-8859-1?Q?yKCeNyRzisGQT14BRSAtVEoPkmmOoqzCZZgkPnACu1jsfeGXFqG7nebt9t?=
 =?iso-8859-1?Q?eroMTFOgJD9bPYAOFloWGXXAkEGofhk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9ee103-b42e-4f49-15c7-08df25d06a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 06:41:58.0365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhRla2ucYab52l3UZOqYxfc8kCIuZFa0HSaQ/QEztrwtIJkC37u4RTDMGS1IINA5pfBWmeKoRGLf12r/TCaKdHikNtQ2Gnmi4kzHivPgDK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1684

Hi Sakari,=0A=
=0A=
> Set the reset GPIO high when it is acquired.=0A=
>=0A=
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>=0A=
> ---=0A=
>  drivers/media/i2c/ov05c10.c | 2 +-=0A=
>  1 file changed, 1 insertion(+), 1 deletion(-)=0A=
>=0A=
> diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c=0A=
> index 0256e5514ade..900aa84ddbc3 100644=0A=
> --- a/drivers/media/i2c/ov05c10.c=0A=
> +++ b/drivers/media/i2c/ov05c10.c=0A=
> @@ -765,7 +765,7 @@ static int ov05c10_get_pm_resources(struct device *de=
v)=0A=
>                 return dev_err_probe(dev, PTR_ERR(ov05c10->avdd),=0A=
>                                      "failed to get avdd regulator\n");=
=0A=
>=0A=
> -       ov05c10->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OU=
T_LOW);=0A=
> +       ov05c10->reset =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OU=
T_HIGH);=0A=
=0A=
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>=0A=
=0A=
Best regards,=0A=
Tarang=0A=
