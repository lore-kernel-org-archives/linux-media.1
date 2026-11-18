Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795009457;
	b=QlPQxtJ6I/Qlb7zJuSVE3bmJr9OyMpgT29eo+f0MUgMlf4FEvf8icmVnRlHcg9J9RHiJ
	 J0/s5PCo1pLJMgp7PmuuNk6tuQrg6muH96s9aZYYyaea3bRnkqYy2+ENFDlESYx2pC8gN
	 /0M2+UhedgBEWR5VWaU7MBkl+pryAdKUSYj49NE2Zoe7LpH676VGGH1zDgYdxdwY5IOqx
	 t+Fm4ycfvLHEg40CC5yK7CL/LOsgiTPw2arSlbyQGi1ziNg8HD2mr2tzTELIqdICVm0nA
	 EqD8i1VYaXo/nfxSRmndwPHvLSczHXhMqjndAjkY5+zHBt9DeRezygx14AKzk0UE2Kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009457;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uNkMTuaSQqHlv9kJR+lu/tlRR8pqPKsgALZ9qTWDsbw=;
	b=qYkNtlv2IUUS+I1lWNJvDdk1g0F1lc78F8YqVPmUyUjI4xnp+L3XpVS0vMJpR6xzKu9n
	 nt5qHi1rRMPpSwA16p/BaaJLKjq5ycRgrh1bDixMMOtdgLEj5HIbfrHwO1GJvoP7la6LR
	 OAspW0HmGI8nnhV7Ce/dMQUHNF3cCRv1bQ6nruQZ+gtdK2MMpxkxUtxJeqTUvCZkIKjAu
	 1L66Xra7hbkQTvQYhuXvzS4eBImGqmzhdo3/MxXX25xbxTquLK3NEYPZSJR15kVV6KKsH
	 ++h3/IMRPB/pVr3IvqrVYKSo6OSBhOILa3t4OraB5SZ6g711vnTOLtDPrYj+TEIg77g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MXla+GDc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.22
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011022.outbound.protection.outlook.com [52.101.57.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA317606A31C;
	Wed, 18 Nov 2026 13:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA317606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MXla+GDc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V70HxrqBZSg4T3tsrGEvzVxjuAS7O3agDjuCiAfcpeYPfbcnDSuwgPQTF+gmGNNvVpJRQS3StNdeRQNVLIrFP0bqpJwLjW8hqdq9bAo7qRz0BQCDzZgeyWyIsfWEgTOYB75vAbIfjc9tQ1vve3MWXaLpawjaynsQyXZG04Fr2sq/WicmBtjNB6pgvsV95244nbiaZ+UxepT7+TzxjMhbADuGDXp1aDQTmpR2zJiVm1SXFCaLJEoLTWLW/gzUQrbi84BTV/e1frNmZtXX/kQx+DUXHdNuZQ8xo8tbkVdaPNH7Etr54vIY8UdxVPtjm6ROD9QZJowJOO5ZuSMzOSDL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNkMTuaSQqHlv9kJR+lu/tlRR8pqPKsgALZ9qTWDsbw=;
 b=HRFI/0gA1KHey4YfBHZ7rgTaPZx66fMkkZOc/FtD3M2O/aBi69PCdYQur03byIIz2xWCT65ifzIjsR2k+n0GFfZI/cwVCFbP69dTGeqJSM0xrrL56He4T+5NmSNhWMVWRY/ppOxel6HDqFfOfwmkebq/1uPdKBmVw/OeEpWGLMjP5/zLCcbOOtQqpEgnDD18O45jQz97n7XJjPHxlWGENjINVxs/M6njZoOSVpHouIZUpAY1H8Xd/R5fiX+L64p/JfvXkUXHikk7OG3ptdBVJIcmI8rwM3cTEEHILvibvUjO8s0SEyWIqPTwyD7VfP1fOHh1hXVq8TPdNA/6QxZtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNkMTuaSQqHlv9kJR+lu/tlRR8pqPKsgALZ9qTWDsbw=;
 b=MXla+GDcDlEnZReYZSl1wuV8i5PM9gm2UudoWSUWEN7QPi8x/PKXEF70QyZY6Z6wvHt5mo2HBHzMRru/q+oZQ7ibeQXq4MMrc/X/T25lYoKAyIEkKAK2yMZUBRn9d+PiTLtCyi95WK8qVp4rXcb1o9DdppG8ZPErrKcPCQ291QMtp+MN9L4L1oRSOaKQ7oSCum43cAx/N9dGoqvd71mQ0tzPWvDYu98KVagPQuSYFW9ry1XJtZEVrWYD3KOo08QNjXcDuP7pSkcGkJ8rzZ9w0ULQopUA0IwlwTiLeouEU9K/ciLXjGn9BHbi2rS9+koPIPDm9Yqy8wDDaHWMZeu8kw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by MN2PR12MB4333.namprd12.prod.outlook.com
 (2603:10b6:208:1d3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 13:44:12 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 13:44:12 +0000
Date: Wed, 18 Nov 2026 09:44:11 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ying Xiao <eagleshaw@google.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	"T . J . Mercier" <tjmercier@google.com>,
	Jiri Pirko <jiri@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Jacob Moroni <jmoroni@google.com>, Xuehao Hu <xuehaohu@google.com>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-buf: heaps: system: zero pages after
 set_memory_decrypted()
Message-ID: <20261118134411.GQ2245175@nvidia.com>
References: <20261117155431.1654298-1-eagleshaw@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117155431.1654298-1-eagleshaw@google.com>
X-ClientProxiedBy: IA4P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::16) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|MN2PR12MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db172a0-62a7-4e40-bfb4-08df457a07a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|261021123027099003|261022075727099003|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	X5sEkDv/cxbkQcrBxlzApwoSITt5UF2z+LiZ7JKIdx8i8FpIXizo0CZLXFwUX5IrPtPacw4tYBaE34HqmjlGmSda5zJvzC9v1iZ+8YBWnj4YiDZW4rPtIcGrS3RpEMAhUf3uq7Rn9mNEj8QcUfx1l3q4muh2ggk005gq1GhhWqdnSsKcOdLwINrnKzvysbo9h0600IxFBFHQCreX5/OefUTU45KpUr1cXHzXna4vZ06icFAqxDQ+tJvtxuFeBsCYG9MZ3KP+90UYwB9qmriXZKTaD0AEWDLYOyXzCg9Pe/mgU/UQZHba4X+4lZ98JVK2hienPC38RW7OjZSb8laVb/sGLqmi7Gy/SF84LwhN9Myegps1cHKNVhWOBLpz3rf6h3FN79vdm4x3qjHbpza9COs7jSQoKdUYI51KCOZdakur6OIkfap40JbeDmSide8plg+IEuKzm6ClVw7b/kga6BsexKgmExEFUdZP/XJvPI348hDp/NOkDtTxH6TVSRf/6aDFWbuSSpqmulf94jssa/J8PRsJFGxRcovaSges+kHta4kZCbkDDmNRspqNAc9O+5j07g41Qu0pdDIEwMZ60IepffpySzeA6CTVg0EpaGxNwoDlyP8WgX1jy3/0tpt1CoUYAmKBBn6mOHCjkwcKNa4Oz2hdW2gjsjvzEnQ2hpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(261021123027099003)(261022075727099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4R9UVkw7s9anewa2RMzIJ8JHBmY4zKumvGFJnzXak0jC4i4qKh+x8VTkkDGl?=
 =?us-ascii?Q?p3Dujp3iHcOm+EedQldOiru2OsV0zZjYYphmX98MLKJtDMwRHyVvLUKvzCha?=
 =?us-ascii?Q?7YrPuO6yH6VOpvFKwkdh0GU000C8+04fSW7cEJ8zgXJlxYojQyle1TLDD9Kp?=
 =?us-ascii?Q?/O9B/6ilSLW86ZIqvAiDpZFWQ+hTmMNfBqaXNSM7rf1WgyYJgh+bmwKBPhAP?=
 =?us-ascii?Q?DjPrsBMJOMNS1KRg2+6F4gF38J/gUk2T2tC2M5cMxU379Wj3UXyiYIpwOIaR?=
 =?us-ascii?Q?WloM3ZhAAUO86ljQeL4wRN9krCgiyxiVmIDkP2CzvubddGgpWmYddz1x9ICf?=
 =?us-ascii?Q?3aewbhbdwFfFTRk2IQ/wN/jJUEZaJCZzFZ4PDMiGXHXj2v+WcU9TonspYdtI?=
 =?us-ascii?Q?VvM77Ddl6nWa+cADet+75ufRdXazQxPnuKTdBnznswdpo89ti650JtxZ3Vda?=
 =?us-ascii?Q?jUF/uq7dp1zquXeCjrxGYCYndZoGmG+HB0Zs926za3xuR5mmelS2RXRiOzZu?=
 =?us-ascii?Q?4TUTaO9w6vQtrD0Viei5o6yq4kfz0WBuXaHKQyDyl9odWCYH51IEawoSRGlz?=
 =?us-ascii?Q?JqiRslaC3miMC6bAzoN53sRDZc+/gH4Uqt9EK5w8H8wep64U4HnbtpXKbBng?=
 =?us-ascii?Q?eKU6jxZzWPLMEjivWkJdIaaBKbompgpZTJDxfBlPDadgwrr7wg/IkxMPj81r?=
 =?us-ascii?Q?EfpvFiAbDxiSbZQHwCQaesIoxXFjSptAIwTH7cEDla9k0bu8XkNcnT+f3sng?=
 =?us-ascii?Q?iNweIK+dXtlV7nJpxZmiGKPlDY1jjNAcIzLJ6xlPWFCbrgBVWloNqyoX6qf4?=
 =?us-ascii?Q?AtK0TQYnqBPWepdKWiJl/Ho9CWMHTGHC20yOtD96bznE90aGqgxzgxyP7DzJ?=
 =?us-ascii?Q?QzzKm4UMjVU13KkbEJqkEgrtYPucBPxJnmhrXje8oj24ZngTXz29+W2Pj3cW?=
 =?us-ascii?Q?C7fcGv4FdO2ulJzmGy8aIz0sGd4Qr2/kA7nR3Ef9kcm8rEigGhv/QY/VSvGT?=
 =?us-ascii?Q?fXeXq6qk8VCVahRoqrmN0ivjJIJXZYWHBivALWz789DWYuiTXIO6Otp5bdbK?=
 =?us-ascii?Q?gX2lZRVvm5VDc5jfIyc9YV20gMY9TbUn/dcYgJvUA7iWlr7FBFRKpYB1yvb8?=
 =?us-ascii?Q?RuQvAVR4EGCqgTVIOc0/RJzq5WPKmrkqOCPxQOjyD5+aClornAjIyAfB6IMc?=
 =?us-ascii?Q?xAyG/Qav30RD8Ry/PWOrYxjUY6Pk4X8g4xuyu0ugQHn/yyEqGOrgjs80+6Ig?=
 =?us-ascii?Q?mWe6X6RR+AAk9likuu211tfORJK8jvtH3Qwrv841PeFq8loliRqMmDqgIiqM?=
 =?us-ascii?Q?UZRZOGRUzumbsdrj2LuRK7b0t3u9eWXLhyfcwVu0NtNoP3ucZ8pVhBq+LGzj?=
 =?us-ascii?Q?3mikGYA/1BHVUgHhxYmgvbFNX5FjtOzOzeT4LW3c+Kl0o87rluak488PWuIn?=
 =?us-ascii?Q?JtOHk8nHCmaHuz2u90SkYd50SJtkegy8a1A+UJ81lpRV5tetWNTplcD9ckHl?=
 =?us-ascii?Q?rFCiM1y67brxga72W77L4TPcV9mSQ6LfdHZsSjVTgC/CZ5p63c3iHEl/4z7m?=
 =?us-ascii?Q?CaC98b25YfVmQGz8mp3guALnKCGtLGUGIZHOdA4hRcCT//O+uk2+zS4mvdIs?=
 =?us-ascii?Q?UdQtMLWBVfKXCHXh7BK6VdqNeWNE1Nb1XUVgLEONd1Ba9iyn9p2wb5snTCLN?=
 =?us-ascii?Q?e2bOXW542NeeuCcxkf/S6zxdVfOpUxVobJqUQuQKS+60tLWn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db172a0-62a7-4e40-bfb4-08df457a07a2
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 13:44:12.7254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyodtXRXl6qC991S4Kw5Ig7HB5nPIi1Log8gitr4K0n9vm+zSxoJ/k/K9SMgG74Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333

On Tue, Nov 17, 2026 at 03:54:31PM +0000, Ying Xiao wrote:
> system_heap_allocate() allocates pages via order_flags[] with __GFP_ZERO
> while the direct map still has the memory encryption bit set. For the
> system_cc_shared heap, set_memory_decrypted() subsequently clears the
> encryption bit without re-zeroing, leaving ciphertext in DRAM on
> confidential computing (CoCo) guests instead of plaintext zeros.
> 
> Skip __GFP_ZERO during alloc_pages() for cc_shared allocations, and zero
> the pages once in system_heap_set_page_decrypted() after
> set_memory_decrypted() succeeds.
> 
> Fixes: 78b30c50a7ac ("dma-buf: heaps: system: add system_cc_shared heap for explicitly shared memory")
> Reviewed-by: Jacob Moroni <jmoroni@google.com>
> Signed-off-by: Ying Xiao <eagleshaw@google.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)

This seems fine, but Aneesh is fixing this in a more complete way with
this other series.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
