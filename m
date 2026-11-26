Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.94
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795673012;
	b=YPG+02Qy2e5EqRbz/QFEvOfjiI7RNqf8iXY2w80uUohUPe6Y/jJiYTgdAEEAKfbRenWS
	 s/9Q8bmY3ZfRYfNnXDFL5BUu961KGHgWOst7xNQ1fDJoMeZvSUnkppo3FW/pChpVNSBPr
	 4AEE2P6JYVRiIu1GWLXi23KsCyplbgGnvj8UgXVVax7KITVxUcij0vhZvbxm0Y/jQvj/y
	 GbCKwRhqSG0h92pBPyz2eWs0Xl2FOt+jhqOE8R87KcICDH0N4lUCzmExt1bHdXKMkMpSB
	 3bgi4JHCHpgRxxV+039D9Anqij0n2i8ugVxl9vmcLCXd01NkFsQGMVQwF30KC7/WBDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673012;
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
	bh=2LxeavXPe6VXSUosbgjtKtxaYe0oFk+RyjaRfAlz3sY=;
	b=2DaXClE8akfpjcWSd0Sh5KkTdK9j6b2XNBRLS05F9XlKhuUpKuxBfYpx6NqUKL9uOxjz
	 Uu5E8qck6xJNjKDBixluzH9ZwT4Mguk5EIaSYVRHgJ6TC1Zq76ISXWBvKp8FZBRCMsXHs
	 0QLafahaU24OD7OnXKG1bZnMUCAPvGCBfuMFQb4raAKzvTeR6NluXJg9sBmKz6yHXh1my
	 WgGfihStddVOTN9fmuIb5b7mRsXhyGUr5b/FlsYwoksvblcscxq77aCM3/B9E1UqrLPmv
	 Z31B1SDdl4Gi+oapsktfVgdV9MtM0HgpMTWr9Jyr438rp5hXcsIH0d8AKBr5K0fO4fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ebytelogic.com;
	spf=pass smtp.mailfrom=ebytelogic.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.94
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020094.outbound.protection.outlook.com [52.101.227.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33019606A327;
	Thu, 26 Nov 2026 06:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33019606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XyADRK+j6BIaqgXtDPRXN/0jdCGHMCpJ/vGS2R/OQJvyS4ZXvTX4DpOJJhL3fYr58mIwhVEFyrAft77Yv+usLHqjd+t7QB7jCJ8wFVfm6hvbySzFTDGBIfQGPNRuvYZntk9UQAEG0YhgBaZhP4Cv7/VEzhmwb5CC4NTBo5MWrgB8aZ4Ul9ygeSbVyMY2/ulfsQfQjOFLTKXf7aM2mM/W+alavcSMqrE0jySkjqOhUoePuVwnB6FaCEc2Y0UqjpMLxcAsx/7ltejKBVOKJL2tjEbWS8sjhvKayRK1J8vLfBF5oLumyaI/VvmMmgn3e8vnknjZna0wsqzBfpD8O0PWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LxeavXPe6VXSUosbgjtKtxaYe0oFk+RyjaRfAlz3sY=;
 b=joABgVhuFRskgmRKD6h3aS9wzpS1AyjBG42EW+3cWHXwRLWNCwp2NDbMBWXzbAlgvq+yci5GGLRaIt387QpxRJ2jBo0LloFCmJANDm5kAXfYivFsD3f2FmiioMIStGhvANKVIxEF6X4Z4W34U7y+K02L6/SxlZYKvyZbULZJ7MbXaOKlAB7s41ITEkpJVqgvC1dpCTqN9NsaJzmw1CmUbXLAIMh74jjjThDnxf/+6ZffxJG14cADmnDiD37hzjMvjL6xoFzYgCOqfUpt0o9eidTkQJ6zzplNOk3fbeFSTP+rHpmXnhl5V5uvNLYAwQFkR7mANglDO77p9A1XsrXvpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN3P287MB0070.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 06:03:28 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8%8]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 06:03:27 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH v2 0/12] media: qcom: camss: add V4L2 subdev streams API support
Date: Thu, 26 Nov 2026 11:33:14 +0530
Message-ID: <20261126060317.3696384-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0050.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::16) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
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
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN3P287MB0070:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca949d4-cb63-46f9-8fe3-08df4b82fcc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|23010399003|10070799003|261009223027099003|18002099003|22082099003|3023799007|56012099006|10067099003|5023799004|261102123227099003|261028144727099003|261022105027099003|261026121527099003|261026140227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	6t2pquDm6O/SlQFSToczeKCFDoFf+9tqQ257BriSZqBoOaUnuS0jWGxTyYySsp3rjVbRsFO6+KsJwCytZhCmiK6L3HGCIxwOZfYu8MxtOvKBanVKEuDknNSxoguQmW67GmvBwYqDbqufi0DCSsIdVbh2vdZUHB2qhj+5GhacAOww8H1D8YTHgtyTQizuYxyOJzTPbJ7yItzgD5jl8/iOa6hcDmMfMoPZwjfgEwT7boozLrBuWG/awMK8yu0yAZHkWfbFSNAXwupw45acAT3Aof8HcQaSS6mnlEXjL5VOyJQEWPt0YbnJk+rgWi75oA0vEpWGTlGdeiLCck9LOXk1aoxORBUl/TBjiUeevx0DucXu/y8vLfqc2MENZBpLpWe9RhZ4EHZAoVaIA1JNaUsofjuTfmNjzh0W/AbEx91GGLRnwHSSG4wfR0jBXlncbH4q/Hb6s4S5fiOcCFHYQUtS8H6HUIAJTEY+8yZkp8iK/PjAiZT1+Nx31oIeiK2Yqa6/T7DTpB0ZGk+DNdj8VhuO37kDkfnzI+VgGUFk8XEPiqYUkjOyHkLJGGrVi1KopA8O7Z+q2G8m7fb1XdtyPZBhzZbFWYb3uwZsSKstk0JKebtK7kM1j5JDOW3AwVkVXNTROti8oS0FhS94Ds57faA/N0daPc6dQsFHtETvbBy1aCg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(23010399003)(10070799003)(261009223027099003)(18002099003)(22082099003)(3023799007)(56012099006)(10067099003)(5023799004)(261102123227099003)(261028144727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zlqxL7U3S6Y5aUNjJovluQgg0irczDEqYHZAEJ+xlA+AK6EJSeC8gKZoSunn?=
 =?us-ascii?Q?5l69ZmF6MYsvmzL3fAfouAiT+rSpLElS302wH49uGCd0Wzk3usoGNqPZTjoB?=
 =?us-ascii?Q?J+DurOsFtmZzOrLMzkjl/1QhFf0aS5vofhbddVNSUSS7k0EG+wBwn1NHpsDh?=
 =?us-ascii?Q?zJmpnjFJGaNIkZENl0r8I0zbVvA8i2f9+i1sqRKbSoYy0LJP2WJcjYQ3hU8M?=
 =?us-ascii?Q?3mRuJFVOBdi5dLr4Kayh/WQulM5LrHkfwmrFjowIAQKD0rgjdlVgG1Do3a3V?=
 =?us-ascii?Q?xpeMZz/O87ikh6WHcVRHgBLDdAz1qaabQq7SVOlXXoDV+YOvqyhZ0KjBtD3z?=
 =?us-ascii?Q?WD5dbHjncV5olLPxBMmPpezYpU7yWF5jeFRKSQd+N25TMY33JPM9BWFHaXlF?=
 =?us-ascii?Q?oMVvV4dW+QPa0e9ChwbjtYsj7FyoAA7PrS2/uNtOdu8h+kNqFCEsQcUMQ7zk?=
 =?us-ascii?Q?17+3SsKRkyqMbVkUvWJB7Y5WndWYlPjzm0auw9mke2Fg6RPhFoPpVBcvMwXl?=
 =?us-ascii?Q?SBRrdaXa81Cdy5++EdqmCGsh7QvMFfOLlc1Sot6tlptsgHi/KYjuiud1LWdc?=
 =?us-ascii?Q?4SecDp2/q4JV364UgrDpJ5L+QDtVcE+AuhvIBqB+69/qlcI9LGQyvrPMnerP?=
 =?us-ascii?Q?rUQHY9+kDoSmvPEvFWCd9b/zAUQgKdVtRNtaj1dGOjU5Mjy2dUi7VXowuWqi?=
 =?us-ascii?Q?w12z0+KF1kjyYzGkqSF6a5F7r6XPHkKjHmhx33NDs8ngjj9M8IlJ2lqsS+FP?=
 =?us-ascii?Q?PibDuXWCBhbFgWQcnFkIBkm+koJyM3JNJLg21lLs6PWxuUQUzQq6/xpoygyP?=
 =?us-ascii?Q?dX043pF3qXHiVGIF9VgYg2JNzAzG1ieVUNX8+0di4ebl21G6K+0j54DR1g95?=
 =?us-ascii?Q?ydqylqCH+zQZZBe9qdQH+zeUVrHmIoWUOvFnr4VqakG8rXdgHkO1qzvQqXZ3?=
 =?us-ascii?Q?u//j6qwDkZk1CFlQP8LGS9FM5SzUcr6iYDpO6IYNgjXhGCezUIJivteR67QU?=
 =?us-ascii?Q?acKfAbUV6BT6qnX+ys35hGw9YPjjNVVjtUpfgetW0dox2iMIf+ofR71Y77Zo?=
 =?us-ascii?Q?3ajngTOp+fvSOi1O01SlE8bXhe+FlZ/ePSM8FImKu3DC4hchs2EW0uF/UW/o?=
 =?us-ascii?Q?sNMsCFArYXFCK0HqC2UknQfgyYofXkN1TLyvApjqUULh+eYeHFVLgFhkx46J?=
 =?us-ascii?Q?cQ1LupN5HDqzCryb7ZqolCUvIFQ9Adng6CCehMDdfKH/CD/7BT/kyJHZT3e6?=
 =?us-ascii?Q?fGngfFSOa+N7+Dpen4mSHM6/1QnJPdRWhz+G9BbjTXxOT20znq0/NtPSEFnD?=
 =?us-ascii?Q?LZGBufSFEYru8di34p9NfxHLo/zFzq6yXL+Bd9dxL7OI++0mKcU816qtoUtK?=
 =?us-ascii?Q?ov9VsFfFRj+xpft6HtByiaFYzBNlCJMuXFbwcpQGeYefHxlZMZdksQ9RKF10?=
 =?us-ascii?Q?R5MIS5ABBNEDnh+WVWCgAs7yACgfbSeqSa/PIxTKBIaySmQHB3BCbC4cOHGp?=
 =?us-ascii?Q?zaObsCho3zsSSLoPKf5MXHgoxMgRLR2yYn2kpgwUf1gULJno/3Am7AP5eAkn?=
 =?us-ascii?Q?GXrzFQkxRjyWmPgDg5GS/c5c1O+N2eKS+wHfp5VuYTnaVTWFv5tWNuSyLYG/?=
 =?us-ascii?Q?oVPS6YnDk/e+wjRZi3R/sXT8X1KNjTdSDJbtRpvb5Z1cLkaIMhutR2RBUhWt?=
 =?us-ascii?Q?beE7HAptOLwQxDcBNlHB0TIg98kghYRT7biw5V0jmeo9+CDwMZkqwtwXMS5J?=
 =?us-ascii?Q?eIrjDvAfFYcp+I+0xJb0dqcvCOlxDq/SaGmtXkVRjpUA9mvciAebjV746cDE?=
X-MS-Exchange-AntiSpam-MessageData-1: eXLRZpSK8QaUbg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca949d4-cb63-46f9-8fe3-08df4b82fcc2
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 06:03:27.2731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXYYGIkhFd+9uqwG5V/Baho3xZYFW4aDNb/kflct5Ytz5MPpdwZ66FgKUl35cJfWoQfucbYwjdMPGqQ1Ef2CYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0070

Hi Gjorgji,

Thanks for folding in the SC7280 patch.

Ran this on SC7280 with two GMSL2 cameras, so real sensors rather than the
TPG. All twelve applied with plain git apply, built without errors.

Tested-by: Hitesh Patel <hitesh@ebytelogic.com>

RB3 Gen 2 core kit, QCS6490, MAX9296A with two MAX9295A serializers.
qcom-next at v7.4-rc3 (7.4.0-rc3-01389-g1843874b4356), your frame sync
dependency plus patches 1 and 2 of Bryan's routing series underneath. Two
local camss fixes on top that aren't upstream yet - link frequency from
the CSI-2 transmitter, and the source to CSIPHY link made per endpoint -
I'll post those on their own.

One camera per deserializer output:

  imx900 -> max9296a sink 0, route 0/0->2/0, src pad 2
         -> csiphy4 -> csid1 -> vfe1_rdi0
  ar0234 -> max9296a sink 1, route 1/0->3/0, src pad 3
         -> csiphy3 -> csid0 -> vfe0_rdi0

  imx900 SRGGB10 2048x1536, 10 frames -> 39321600 bytes
  ar0234 SGRBG10 1280x960,  10 frames -> 15360000 bytes

Also narrowed the CSID routing from the default 0/0 to all four source
pads down to 0/0->2/0 alone; capture moved to RDI1 and streamed fine.
dmesg clean.

One stream per output, so nothing here covers two VCs sharing an output.
1/12 is gen3 and SC7280 is gen2. No SM8250 or SA8775P board for 10/12 and
11/12.

Saw you'll resend. Send it and I'll re-run the same captures.

Hitesh
