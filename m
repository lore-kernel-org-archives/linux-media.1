Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.94
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795673013;
	b=tjyDMaQ761ciW/CFioK64ETZhEdpgWcg1kESkGj0/Ku6Sw2vTb9rAUnW5vL1hQ9LRpJ7
	 w6hE+thJYgXFHpvlpx/uv1ZRKJcSySbjS2GVHXAoRvlYdEWZ6Fjz0WTjjQxEa8E6EaXid
	 vKw1ufPFj8hl8ImYojp6vmH7TKHEAqtarZJv/e46OCEtqakRzZKt3ecovKNdXpF9Hbcyq
	 FVr2S8Ijh13Uy6fwF9bLWJYl+jjzjju695IcDJXJGNc2n/C9ukTm9YfoceVpQtYd1P+h2
	 nWkLgL0mdUjvEqe7mL78U4C5xtcMvHPwX+U/kc/s3g3DYfnurzXZ8qRblIsFbVbVF0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673013;
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
	bh=Qk3BJlQZlkRODHj3XWIljABGkIDlMzeOoFkEWLG3e24=;
	b=twHT1vtjPADNSVCUAIMYGY1KjFB4kz49PefmBKsj2hhb2c3TyZheJDHaVAY8giUQ2jgj
	 jlJpRG8cbpKJt3bpNky5joZcW8Dw+QhrtL2ph7cNeUr+2ej/rF9R7imW/BKItVQIF9Bmv
	 yMLjvMFrlRBZOyYPpTRxhkNraMOe5dxmcYxgo2e4rjSXP/ueBghpPlWWw2BRZw4LW84/K
	 PNA96C54jSDwwmzenS3UzBymaYAWnyS9+SNiYljk+92vSwFuCgjECas5hqG0nv5OONhls
	 XAtdqqzPDvgy4dPZj72pjYi+lJG9kBhf1EhaF6XlASdMIG5wzAQFDu34OvROaKOK0cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ebytelogic.com;
	spf=pass smtp.mailfrom=ebytelogic.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.227.94
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020094.outbound.protection.outlook.com [52.101.227.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9A4606A329;
	Thu, 26 Nov 2026 06:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B9A4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hzw4H+764kjIrN1GACMzL+6m1iCaJl1cyus+17m+eRckZRSnCbEtXxg3tBEjk3FNS6Ap4URszi4tQWx1V1AwGBJ4QcNo6n994CmD7GMZNeIkceP882GHX29jabUJNBESopQs/LsXSmiAIWXKTk/1JpAu07qAAY8WAxUkRU3oneWyF6yenujAUKzm+OU0+CCW1kb+24VIlQRB4yJuNulUJzoovBkLTJiY9BXQmpRPADUs1F8lo/ARFoo55BKuXfa9CTIr2AuRuIO9PCLrmIBrebNeXqu5wxHYzXIqjxb1KrB1akWxYEefGCS0zWybx9c2ZiWFamAs8n+dhP0iXALUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk3BJlQZlkRODHj3XWIljABGkIDlMzeOoFkEWLG3e24=;
 b=rerHLXxepuw/hOEKQ6ku9ABTphPiFGv0WhHOd14y36RzSuh2tW3z8fIPxm6dRU0aA/i5rkD75L6OcwDsNocqg6FUyMyXAUQZ0q+Kpa8Ho166xj5lRjElfrPhgTRhk74nHG+ii5ddbrxM0YcO3Zz63gVNbUKzprptU10mDkTcdZM/pckoDDHdhUW8Koo+zBP2sliRGOiZZNjbTCgPgnKBeQkCVBliLkkTX8HyphwmwhSlXO1Me6+ReEJH03xw/qyMyoFNK4bRbGNTcOzvW+MfE2WPv7UwLc4ya9AGpVRuoge3fyP7Yp8vsc1aW+lpuWU9Qi+7WSAyJTU/AUas/qEROg==
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
 06:03:28 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	linux-media@vger.kernel.org,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] media: qcom: camss: Two routing fixes and one tidy-up
Date: Thu, 26 Nov 2026 11:33:15 +0530
Message-ID: <20261126060317.3696384-2-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org>
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
X-MS-Office365-Filtering-Correlation-Id: 6a980612-f367-4edf-3ba2-08df4b82fd8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|23010399003|10070799003|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	ed2bUJBGu+L1/A4n3JK66ykCz7iN983ScBg2EWNYVCcK/MKocr3Auf5QLio53n5sjchlpJczdMbAEFdlmjYLMj3c5Low5cJ98OfVuJwOgvXW9vkAqgsKACz2TDWIJg3iyrLueI5bH1q3vC2oG08ZiqUCnpgQmzOSZt6p2SaociBcVh0d/r/YuBmzetNk6QqfTAoIIzbDke5vqvh34nKNPP5qmp0gLXgk7kNqruJJAaqbXD7Ru1QciYw0t5oE2MlqeEGYfmPgB/WZaYU76LoATezyoSMU2p3FGQfy0lCquss6ZxpLNjGBPKfAob3nj/Ah2mxiJWV22nOcRyvBAxpUWsxlrNhs0uud5r6hoqyI8CUiL8ZiTLXoNT9CBGUSwOLO3VGy7CaNbefrtKnMPeOSgF5oWvOBwuJD9SsXnGVJsq5Kv2jadiGoyF//uCmu8EZ7UsRO14WisWPv4F2Q7dLShemzYOtIzOWYp9ou4DFfP9jR6wilc84780+O33Lj64AIPI+JjUWg0zkAg4TRciKKyOBIAe3mi9bCv5JY75nVhZntDvGqjYYsmTIAmI8hVkjg4jwYHBgp+AaF6FnlL8iYTA9wpT9dENeShc5iVqK8p9c+umz10rn7kB26FxveA+13AaG4PKMsPnOLXlBlM3n1m6xmLiNkg0U2cud72kZ4w50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(23010399003)(10070799003)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SK7xYxORqgoflTFXMWh3q8hhluHCVCfQZz5mlYAtbY56BjDIfLrh4HHavVC7?=
 =?us-ascii?Q?W4KD95AFlOrJyDLstuakMQHEidVGzWNUnCEL05n63CNw1P/mPTEeggTZfQAa?=
 =?us-ascii?Q?dGT3zWfPWQFdms58IQ0lDPAmmjdKt2GsAXriHm9qBY9eNPni37AGEbsLRmli?=
 =?us-ascii?Q?pwoMeCHDNOMJVZO3cddadGNyyxmh2SnrBvwAkdzBjh7LvGykY0FForY9xt2I?=
 =?us-ascii?Q?XLetlcDGWk6O5IjyCK1uUan1AQzcheeYIVI4kaYEa9R+p9eUwDqZqNLoYjF4?=
 =?us-ascii?Q?mToQOxWJZTCEGsDVB9B1nt3AHV94J3ZSbZh7YU9YRnqBTBYWbhjC/lQgiLgz?=
 =?us-ascii?Q?BUG48i7DA8zaSJdsDjfrSC1/QeeUisYkmF/rqMOzV18smEAoDtNqZ1IRLYaq?=
 =?us-ascii?Q?a8zKWkTS6EPs4NwmNhrYFdiekCv6SYxVx6qdJL1eIhhqAIHqjO+sVVmHF7Up?=
 =?us-ascii?Q?iD5v+P7BZ0gPQOxAXhEVRBfU4dwYdjoyVhfa12xwUmOsteJNgBVXeu6eP+uy?=
 =?us-ascii?Q?hM70airq1pbjjgh+kGBlgdAOXwyGQIn3In4bQtYJIWj/apvgyPZWQ2J4eSlT?=
 =?us-ascii?Q?Wkc36VpBaqoWzb1uTu9RFZSUotjRnwMhe8m35oWm2fXedt5YiP9lG0D2MQcz?=
 =?us-ascii?Q?Dzpe9V1EIcd7J0Dh91p7L18wPlwFQb7Ejm0yXEQLt3femLsC4P+6aZKZv3BT?=
 =?us-ascii?Q?syzF3lQaLAzR21FWUSDBrOl1I5lR4MBTp3CLSSAO1oIDff1cajUXP0FI/s3A?=
 =?us-ascii?Q?EeTZqWKeq5YR22JsITstlGOZzHPleRjy9hbMuhiXuRRqq5hOS94LzyH/3I9w?=
 =?us-ascii?Q?Y5xDB49AOrmcSINQ+oe/ua0QW8mWa3kw7l3E6Bqgfbwm4Vz98pWyvKate0Fm?=
 =?us-ascii?Q?yp/BUKXVyt1kxzl0uZxPRzFQp2P/sQzInRq8YY05MNVg5btWKpne99rtgSsJ?=
 =?us-ascii?Q?eViRbRtPejN0dGSnCzYjIvcAv43eQcUGVxx3XzdsVl2kfbuXbZIcRB8Bx9j2?=
 =?us-ascii?Q?V++9Ox/E8o23nAyFRPyBQcWwsJJ6VlzEX4dQ57kyQsLYXMpaF1+NO7dbF27s?=
 =?us-ascii?Q?l5e3T2uy4/EzbVQQNxtcRqWLgeOx6CCVIiqugvl9ChrM3mh0dNhuyIlBOXwy?=
 =?us-ascii?Q?u43DPeubFFp6YeYebisrrlYsIcKhDBrLwHFEkfYmBXhueOibpOj7q8N4SiPg?=
 =?us-ascii?Q?eHShZrIP5CGEQQOSImLwMSd88tbMyw7VEvVPLa99esuF8kqjWVM153BB1Iae?=
 =?us-ascii?Q?vf9sQqgftR0napDKrWa/lEYwAdrTcXLbCyndvYWJtw2FzH8qBvYYgtl+FRMZ?=
 =?us-ascii?Q?h0AlPiFwOVbsaupokrVTlhRnCNW97uXL+zSQ/xQR2VmZIrpSNaKTPYLD4JZR?=
 =?us-ascii?Q?RUv8lJXl+70IizxmBcWiiJTr8l8gCI2kF7BGZceaxKiiSPjpfb8YzKReX4Fj?=
 =?us-ascii?Q?GV+CmHj68SRe1QNLk/nP2bmxcZaYtQdXUgBc5nGb1NyZnK6rXJ+FOI0sDYQJ?=
 =?us-ascii?Q?vkP2a7tomHGcElaiNtekgCmMycGNcTek6X3wKZ3JrRHvOKRyNH4iKnR6jLwV?=
 =?us-ascii?Q?146HoAPz858i8WHmORbebKKK3GskUbDR7bILU3OVe8Iu4Kxchmraxmr02vka?=
 =?us-ascii?Q?rZozzvHUAHJFr+Nm25HzEftVH8YaUjnF3/lRLsY/5Z7+rcy9wrIu+W2Lm2o5?=
 =?us-ascii?Q?lA+GG2hrq83yN1f6woJzOSb3zIrwrI+LJ8puf5I91H1JwczviP/EY4+ERQXh?=
 =?us-ascii?Q?cAfuTYl7un9MAL8127kiJkE0YyTOYT7eLGVErYz/orZ0tyosBALORjL7Mh73?=
X-MS-Exchange-AntiSpam-MessageData-1: ZHhC9XHVZlzUwQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a980612-f367-4edf-3ba2-08df4b82fd8e
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 06:03:28.6771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFbbZzScVSyNuBU7edgR03i+1b45Tuise5artZRN8OzHG8nlhV8FXK2PKGCvIYdHTErFtQO3LGoDOMOyJt2XkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0070

Hi Bryan,

Ran 1 and 2 under Gjorgji's streams v2 on SC7280, two GMSL2 cameras on an
RB3 Gen 2 core kit, qcom-next at v7.4-rc3. Both streamed fine. 2/3 also
replaces a CSID source pad fix I'd been carrying locally, so one less
patch here.

Tested-by: Hitesh Patel <hitesh@ebytelogic.com>   # patches 1 and 2, SC7280

  imx900 SRGGB10 2048x1536, 10 frames -> 39321600 bytes
  ar0234 SGRBG10 1280x960,  10 frames -> 15360000 bytes

dmesg clean.

Hitesh
