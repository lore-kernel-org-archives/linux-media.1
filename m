Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.113
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794807863;
	b=l/NIV1HElXPq04d910KlRVU5dkuM5JEfY5fcd4cukC8J5PTrCMit98Zg+ACltsKIH3vc
	 LI6VRKSewd5KX+09VRWVj+VEyUGccCvttokQPHG1BzqeHA/b+OXsXfUZRHvfDqJzGQZRf
	 ch3s3VTsyF26siymJfYQKL06AKySSlKFIp00QtPdDBDuFQ0UgWoGg/FrtNzCCRWxfZFDl
	 c9Oe+HNNwdylSwvhklPfGniBmYgVGu7UFl1MxJrkv7TIu551CvLAdoHUtfSoyTdn2jK/c
	 RZt7PenPSpepXFy0s22ELlpcW7v8AEXhYiOToVM2XJbEZLIYHa9G1XdG4dZXomM/lrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807863;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xWwmGBOulBbVkI1Kq6aUfYZnLDTLhgraqzeXEWun9Lg=;
	b=AyKHj4eZ91NBj66iXAwZ2FN63abYRlzce508l++kLrGUOGUHPhj64avG2mzn9vY6gSOc
	 QFpv+1xhltCJ0cKIGBbf7I2S7LKs/jWhVq9Dko2EreMe2ahYBAqHMS+E5KCPvbQiK7054
	 Ykq8jWMn3reO1iyvKwPGHpSiDGwGU9bSvqGBH+eSnISQrMrej6xUQwP6JwciyfMNJ3S+s
	 sR3MzyRa5IVNVkM6thq1/3Mkxregq/oynNac3wTpM3BinWXBYJ6l405aUfPRsDZzgpvqq
	 j8B7fe0ZnC25W1HMagz3w1gSdWdz74y75v5tx941/eE83xWrNzUiyW0f7JiDoxkvxaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ebytelogic.com;
	spf=pass smtp.mailfrom=ebytelogic.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.225.113
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020113.outbound.protection.outlook.com [52.101.225.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8A4606A332;
	Mon, 16 Nov 2026 05:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF8A4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8iFI8yAVH2kQGCBSa5MkbyDkZi6LiOo8WgHFdJ1MNu4W4+3QfAh5e8WrW8eT5amxivnD1WhRP18KRUv+OWQh5YL3jckMHdzWAr6/Y3IGFRA7ginHC6ToLlGz6uGbUBbwrp3qOVQ/TwCvPiEw+fZa4li5lS1rdFnUp4c85VzDubevOETorg4x10rA7GUrdTxmtvlyzITQGPKTVdRpnEE2jZBvgm7d3DI9JyTmL6Uo3IRzSHDOJkTdDQxzzHZim5eYvQigp3aHlhPJlJMrcgVzqpiD2itm7DTCzW+Y0v+TFchqlX6iUYsPaQNod1qTm2GiSGD0u81LLTSTb4mNgg3Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWwmGBOulBbVkI1Kq6aUfYZnLDTLhgraqzeXEWun9Lg=;
 b=MRsn/CZqohQdsQG2oVv6JfkvWQ6F4ihOXsUECf6C3lhqDRZy+myxoZT6o/wPVU5QfkCSXX8qQBk+BC+B37nE9Ss1Kvt1pNtdA/GEVZN7idtJlmaj2Cjt3Rnw6Kd8zTOb7u9MrhYa4SlOW510KkxYb+0Z4C5bxnaW2U72PtiF9JAJBTi0pijTw61TWL2GvAy6w/xSZISoXBnmtpDOmwRD1o/J0Ks1O9cDAWjCS2QoKq1FAL20pE0gBt7y/oSx69LSvuq0bFVIxG0w9f+rjxppXMba2447rUR88XcNSqFzWUfUYmRIJ5u0OH9gegQTIcIph7XROYKSos8+PQsxzw0dzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PNYP287MB4388.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 05:44:18 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8%8]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 05:44:18 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH v6 0/4] media: qcom: camss: rebase fixes and SC7280 enablement for the streams API
Date: Mon, 16 Nov 2026 11:14:01 +0530
Message-ID: <20261116054402.234004-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021134959.2599575-1-hitesh@ebytelogic.com>
References: <20261021134959.2599575-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS3P286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:200::14) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PNYP287MB4388:EE_
X-MS-Office365-Filtering-Correlation-Id: 3adfb309-efda-4532-b920-08df43a4a7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|52116014|376014|10067099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	L/1ehwXgmf3U5/WgJOXm9YB5AGkkeWtMyaSOhXuuLy6YeDsCY3W4rlTdraJox3Erdl2zL8+qwVfbWNTi0fMYeYU+FpY13zkkClppw/VrEcOw7R2V4+/DgaBxqQUznjaqoSNwyYrsJofAw7lUjb75vOdpkynUb0oVp0z9Bi1Qbovllru+V8iGReO8G6Sw2esAhw/AhGJ7AjxHIFqy+vSiQvrlTNrgyQzd8LvImk15QC70jfjwXo3HXZ1ouXa2ZgEveFhvq67Wqr9U40syK4W2vUgp4dEUyAjIrs26Hma41+KOP1lHfp8Zq1iFh6aBtpF12I5RG0XCNcQQjBcW3N9LhUyew22IlaJuhmv3bKl8h0bBwI1fd6svHsLMeDHJXjQTS0CkeuoFqqdv31AxL1AfiRI53uzR9CARkQdjjbyrXx1A8DbN+q1uC4+s+Uxd16fFzX33zsiPtpP0jf+1EXpYOcL+ikzTfHsxP3ifmwZWmf8EPj1AaE1FeSnGIqAEEp/5HgT8K5mvZwtjawYEyT7Jc6CkmW+z+hfLgCW3BH09dkxYy9/qbXKbs4o7gSrJ/TTMXFMuBsjtM/rEYa/iJdhCes+uqXEvQPu+ucZtzQu/4kEyktZJ79v0uYswymP/LJr8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(52116014)(376014)(10067099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BCPfpGYBx8SR70sAKkvU0OQExjUy3wwmVP0LmGmv7Es5vCWtkAkEvx0ELb+r?=
 =?us-ascii?Q?uT1FJkAtB/nia3JkGmA49OfXov/PGZoZyzb+Quy9TLx3cFZVBbesmzWgJvyP?=
 =?us-ascii?Q?3nBuAmJQeiUR/7zoW5rHRYflrLn0KmWNvjRWyDjU8+rmC8jBKtYwqTW6CkCQ?=
 =?us-ascii?Q?gtC4Gyj7cDVTcJWofnAUZz6lyxYqJspt8LD7cC681IIUlPH/Zcigl4rsGYF4?=
 =?us-ascii?Q?Yu+fWBVkMNYXf7T3vgLeQY8qBVQqonY2NOwRCgXziuEtlsMHHHBmThAU9ghw?=
 =?us-ascii?Q?i92sOa1oL+WdxzoOqO2BB5Soe/ch2/OLFSalFHBwQT6XAAM2pC9UXFP3rSqP?=
 =?us-ascii?Q?YK7cwW5SFDTaAkk8qqdP1tssOXeKJ9CoCd8T2pdgnwWzeLM8b/PTLVY5DuCZ?=
 =?us-ascii?Q?+uJyAH+Z9cCXWvlyOl7hY4hCstYCvShqxWhGY3UO/PQHF6zPbgF8a8F3EF5c?=
 =?us-ascii?Q?CLF/HyEHjjHJdnYBgZg37rvFEiDYXdNTGC/waCSYjujSUJ+56qZ3kAeJtye2?=
 =?us-ascii?Q?268QZxglXbSBrSYZYe08oNkQAPAJroVxvGjeRJDQ3TVLUip6T40r4dt7BRZA?=
 =?us-ascii?Q?D4UOV67lFtxn1uwwZ+U1J2LFwmcHgdrxk1hCBcjJpe98KOaDvmcY+9d+HNfN?=
 =?us-ascii?Q?81GfG8sETc4Uq8ptLN07Wj0oJaJF1ERsLJsqtV4NoxnTBLJA34HTOytjRWXh?=
 =?us-ascii?Q?De6vnWW4pKTjhmuwyxwIHAoA6P2OMV+7EPIdtr4A8a/slExlk4RL5ipQwff7?=
 =?us-ascii?Q?UE4iFPxvkE0ijZhYMIi/LVe+vk+/6gRLy86F94W91xk+jwzc0BqR4tpvAMEj?=
 =?us-ascii?Q?WlSpo4pI76Ih5WW+D4ptp6Ux4ey7Eie38mEEF/h8UBzdllsgQkZYP1JOZv5n?=
 =?us-ascii?Q?59wCiLDIxaEBW+/Pnted6nCHaaU413I0YFNoDrVV91BBXQ9lJLiSKlUdiXbu?=
 =?us-ascii?Q?bJWkzUM0CT95OLiwZjqDua1npB+o031B9YCJJGbsxlxRsSSmmS1pFvvgmO3l?=
 =?us-ascii?Q?r/WRgBGtsDwL3RG1gziJ+lXFmWc9U7Tn55NT+f9fM0tNxvowaD57L3y87Gky?=
 =?us-ascii?Q?KHgd1CZUESk10HQnhxbmQM2IyUa5Q5PtagxdywdZLdAQuqNhM9HmWUnU24Wh?=
 =?us-ascii?Q?YSLCXfgQ/SukezfLfuhfuLlAX5bwVRptNmzyJkzbIYXllfeAmPXdJJkXcZ03?=
 =?us-ascii?Q?dnNxOV475qc7Ev+0hVyzvId3CfnsjlKZs40lV5OV+wZjuhCCZYgwgF2bpqLc?=
 =?us-ascii?Q?BfNbCtjRupLCi7m1s+AWx+YJWVyX/amzbFQTG0dI6jNTj8aTK7RATYeLtndB?=
 =?us-ascii?Q?xTV+GghGK3PkgO1PrMP19km7RShNMFz+f67rUb7vNVOfn8dHma1VEN2cm9h6?=
 =?us-ascii?Q?vcUV349Iy8KwmgRoGs0BG/gjah27qQQsASC90JX3KRBJvpxm/ATy6xj/GgdH?=
 =?us-ascii?Q?ce8jqYeG4G23GqXa7A/DPoY8h56FZVO05QNH9Q4u71USn5ge5OzrW7ohFf8R?=
 =?us-ascii?Q?/UJrkxz2TbTG1xcp2jeUIbexK/um6aw9SKPxZTdWEqKUxMzGyPD7svpeXuUu?=
 =?us-ascii?Q?atB6rLRJNhs065M/7Vfi0r7AnPoA+qdu2hhO3DugXfZ5XgjUnaGkQct8WcWb?=
 =?us-ascii?Q?SUjTVfadC7JYUN3vainmcY2NGgTWwqAeXYyTqdfKtNF+JwOi6Sh84/sgsMZW?=
 =?us-ascii?Q?/XnKRkW7C1MpZHZKjF8WaK1Ptr2EGt8A/fKHjwDsSRZWbK4khawu313Gd4dL?=
 =?us-ascii?Q?64HCp/gXS1urGovCYtNDqRR2ANQ93RCiaTBRX1iDPdII1+ozbRk7u2+VthV2?=
X-MS-Exchange-AntiSpam-MessageData-1: R/R/oQsaU/1pkQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adfb309-efda-4532-b920-08df43a4a7dc
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 05:44:18.4278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2aM43yL9Ya/YpknKmZSOO4MgnyTdu1KMql4aHfpA9Y/K38Iciu5Zi+D8KpndPB5QuIEAtSQn4pH6a4nDNfuiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB4388

Hi Gjorgji,

Just back from the Diwali break and catching up on everything that
went quiet while I was away, so apologies for the gap on this one.

Back in October you said you would try to include these four patches in
your next series:

  > Thanks i will try to include your changes in my next series,
  > it will need verification from your side as well.

Is a v2 of

  [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API support
  https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com

still on your list? No pressure either way - I am asking because I have
been assuming these four would reach the tree through it, and that has
left them sitting where nobody can build them.

The practical problem is that my series cannot be applied by anyone but
me. The CI gets six of your eight patches from the list by
patch-id and then stops, because my copy of

  [PATCH 1/8] media: qcom: camss: Add streams API support for CSIPHY
  [PATCH 2/8] media: qcom: camss: Add streams API hw_ops to CSID interface

carries the CSIPHY rebase we discussed, so its patch-id no longer
matches what was posted and prerequisite-patch-id cannot find it. The
result is an apply failure in camss-csiphy.c that looks like my bug but
is really just a missing dependency.

Three ways out, whichever suits you:

1. You post v2 with these folded in. Still my preference - it is your
   series, and I will test and send Tested-by as before.

2. If you would rather not carry it, I can post the whole thing as one
   series, your eight patches with your authorship and Signed-off-by
   intact plus my four, so that it is self-contained and the CI can
   build it. I would not do that without your agreement.

3. I post my four alone against media-committers next with the CSIPHY
   amendment included explicitly. That unblocks the CI but leaves 1/8
   amended in my series rather than fixed in yours, which seems wrong.

For what it is worth I have your eight rebased onto media-committers
next and they apply cleanly there, so whichever route you pick the
rebase work is already done and I am happy to hand it over.

One thing worth watching: camss has had a lot of traffic in the last few
weeks, including Vladimir's CSIPHY device-name change, so the longer
this sits the more rebasing it will need.

Thanks,
Hitesh
