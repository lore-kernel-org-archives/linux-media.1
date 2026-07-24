Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675A9347BD9;
	Fri, 24 Jul 2026 20:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784924553; cv=fail; b=q2IvlYNBKZx3rT/LQok5V5kF7cSmx2IHNBkj1B6Z74ao26NtLPaqgHzhMCbBMMeupYSa6xYujV9VJPwS6bCOg4Nnu4ia4Ni1RlveGy8SXhR2Zl7Lm9xSCN2WK3YF6KYNM2l37QxN7HT8T+Jd+ckW4PKIFRQmd0joR+5Zz3GCh20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784924553; c=relaxed/simple;
	bh=eyhACqcyzHqOG9pPDIKSv9yZotAShwsvJQIiM4NQCi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kzY2bYoIqzr9bNTheqV/PTsrdauHotpeJfcC3ACheSsmS2SSlSVx2c9KNTYzuY2aR+TypWg5qKenljubL1yJAqLyNqr1q/iL/YzB42cF27BGAW3/X5Moq0UwUkHd+tZb69eWEqF3xJm5UATeowHmcRs+ZIFM9PfNMPpw+XL+e8Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OXExSlfw; arc=fail smtp.client-ip=40.107.159.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OXExSlfw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtoYTZEKbTW601Rsq/ulhmMLRAxaZfzEPRmWBJbc00xTQJDPMWXOSA4xYTaru711eQy8bBYA2oyp+++9UMrwk2kSSJxCeM+Joms5tyk4sRtYRoMRyjJ+pQr2eQ46KcKx0C3jVfWnhq8Px9KNpJr4LDlSzXxxodoCLoKMog6CyXAFcjuhuHG2Rkm7QqWYfGtSPtB0iW2iCv0JNqbhEOp0OOjkBgzk/XIhgid/182y5LRZJ8WHVh8888mULdVpre8x4huYWnmQ08nR92qzexKQbYpK0cTtJGGq/VQCMyEajWc4wlK+D2bv9neBWJOWwwFwxIIMzsYSebb26EfqcoiXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhdW7ENEZgm8OYKR5UstCwdlW9EpCB7r5H9BhZmmj4Y=;
 b=xX0dIsFY8DeQUb6oDRIcCfq2z4ZidgKLxYb4JD7JTnv27oI9VzwaEWQ7b4/2N83H0sA3zGBGCZYqQfn7eVS09lM+YWtBUbR9wuvRYdCclTVQtyg+kF+0x7o9/fN+eGSJudItashwmFXNotUn5GjEqe55WZNa6bl14Hu7zR7sMib+AZ2slEEpeqOEdwA9LZwobjK4P/ljkdfMjhU52ga+YIru/LSWS8dpTImiUKJdPK02Ad1f1Kiv2RZEIFHttOC87M+7zW5wS+M4MFWjpfSXwl8s3pS/VJoqeJ9EQKMPVYSOVwlgTj8YyREpx3OHMwBZ2dYL1nbpv6Asda2a6ZsHjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhdW7ENEZgm8OYKR5UstCwdlW9EpCB7r5H9BhZmmj4Y=;
 b=OXExSlfwK7BAfwEk9cPcMBYakl52AEtJq7uGFLuOffiH20Cw/LqAgNF3Dyq6nwxpdB/H7ksElK7ba8yI3NWugGrfIQ/JHQXMccSfK06pEpmR/1lHb+AwBbWTxREdgf4Ov3L2CDNvCUPQSHHiNpl/H0+whIdJbysRZZ2t05nmiCFnkiHjCUXDyWs8GrOBrH7uN4GJJjR3JokgFGXwuZStOqtHrBmbPpvK1x+Zf5+arPL5tPJ7PPzGzSNMcVwOKioAenojt0TL5WeGmQDzELNs+QC8yOoZ71EC8ACcl+gbs79AXhA5Gm1yQAxB6wyc7oxPhikehCJgjyYFxcvGmJ+tCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 20:22:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 20:22:27 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hverkuil+cisco@kernel.org,
	michael.riesch@collabora.com,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bod@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 0/2] Add myself to two additional linux-media drivers as reviewer
Date: Fri, 24 Jul 2026 16:22:15 -0400
Message-ID: <178492443924.3806545.15758297562948011840.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
References: <20260603-dphy-params-extension-v1-0-22e0e1ed8bf2@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:806:20::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: efa63786-422c-42c9-4382-08dee9c147cc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 bzbSv+QRkazRF3YBb/Fk6PPpKt6OscPWpLeb6BrEaORdmQbQbiLril6G3GMHsbHxvdkR+B9MrXFzI1FUY3wPbKaXTYvQIhkHuFCybzOPheFmz4kSmVodPvlJrmWVhSoWHuuoN4+B0/JKiuOlez31tlQwVBgL+UMlmGZANkg9MpHoECt26sZlPJARnhVe77O1jPzgC9RbattQDXbKTnV+SEOTBqgr5Vk1GQTZvil2ksUWwGw9Z4S2oEdf0uTiK/iaL165tT8jqPZt0/J5GwdK02NM+1gQ4JYlSsDuKh1Qyp5pOd2p1rs678E10z+Wbpy9er4s1R09XLZ4hoybe0ADdZL6QjzXC/DRFwfKUctzAH8+TS7TSX1jyFfc+BoguI4y8zZQQyNVL4yVQHw8Wv9BMwwShrcZUck8Wa/XL2+nh6wCDYCO3wybjchQb3N9doHikB5LJttG7nBMnD7IXwLpfrt4foA008Et3ojhywF0B5av/B/8u+hH4OVBBl/qHfgpHCIR6K7GHf8BU5gi7XN4iT44ktSPkPk/HosmreFJz/GKcWj9VbCrN3IQmS1i1xOqA4tCgt/JY+VNXu1dReAxDSwiOmgOU1DZmz6N5HNncMNKcJ/p9VxC/JArV4zwUQzqx62dbBbpa5LCZrBodDmrldBh2jyozWe/Zi0qGZFJRgI=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WXd0ZWVsaUp5TmloUHRDdGt1SVB0aDdFbi9yQTIralkzODNjbDZjTHpRVUlV?=
 =?utf-8?B?aEE2Nk41K1B3U0Z6dDlIS2dEMTRua2FEcGJlYVBpVzF1N241M2x0RUQ5Skd4?=
 =?utf-8?B?bExFeDdiZzM5aEk3enhTdzJBc0t2OEd5UnRPUUMvWDNHdWRaMng0Z2VMMGRG?=
 =?utf-8?B?bGJUZ3R2dGZqRUJDa2VHWWQ3QVpwZTJIdDRMQW9wOVVMNExRUkpUeHNxSDJU?=
 =?utf-8?B?R1lPUkJYc2JaanB4WDl1eVplQjh5VjZEWWR4alpMcnJFT2xzdFdzMU5vL1lN?=
 =?utf-8?B?VEcxRXhNaEg5dkRuOG9HeDZxNHVrSkVjYnQxamZSWUJHUDRiVzJUV0JsdDlY?=
 =?utf-8?B?d1ZBbFl6dGNUd1BXZHNqUEo4WHo0REFodGJjSXFQbXpxemttdW9vek5STHUx?=
 =?utf-8?B?SkVkdmxYSmlQbkVlOXNySnVhMERXa0ZrcitPSjNGc28xQWRTVzdWNDcybFIx?=
 =?utf-8?B?N1RQNHJ2M09Va05jZDkvaU1INUxwV0N5SFE5SEQyVWdHTHZZNHRZKzZTc0l2?=
 =?utf-8?B?L0VINFNjN3dsbWJZS3Bwa3R4VjY0MnFGOGZzaVNRWGRFTy9FemJiZktUVE92?=
 =?utf-8?B?L2ZSUHV0OWN6TjRhOFl2aU56aHM5NTJMa2JiWVQyRnpVZFB0M3IvVkhyamFC?=
 =?utf-8?B?N1ZDTldKdFphbUI4VEI2akpRR2NhUjRPRWhWVWp1ekh4ZzVqaU53VVNaNm0x?=
 =?utf-8?B?Rllla1ZqOTBrd21SZVRNM2RoZnc1d2RSemk2aTZTb2xFVjhmL1NGcVBwSjNN?=
 =?utf-8?B?ZG1vU1F3TE95WW9MUEcvTjZzciswblBDNDdyMlF0RFhVQTNVc2Njem9TWE9Z?=
 =?utf-8?B?c21pNHRvSi9ERmxGTlg1NS9KdFpPUG8yK2huMFFwa3VZWFpuZFJJbitCYk9V?=
 =?utf-8?B?QWMxUmxRanFIb0ozQ29QdG10aThGWDFYRUFrOWpQVlZZc3RVeldlWFR0VkZE?=
 =?utf-8?B?cXpQVXlXUlR5dmRzUjF6WFhKVk45UE5Jb3QwMVVDR2VTaXJrSTZSQ3ViQ1NF?=
 =?utf-8?B?bVV2UUlLZ2xyTVlWODNiQk5LTUtaazZRcmdEK0E3VlEvNjNVMCtuU2dNNWlW?=
 =?utf-8?B?eGUvQzYxM1U2WklidjRHWUoySENFZ0FFM2x1RjdvNXEwWkEvWjU1L3V6QU9u?=
 =?utf-8?B?TVNUU24rSHNWYzRjZHFGemlXcUJPRk40UlRxME9aclc0alc4VmJTZHdlWnZS?=
 =?utf-8?B?YlVxYUZ6RElNS2JvbzQ3ZloxblduektLTWFIbDhMa2VOVGo5USt5VVF6T1hq?=
 =?utf-8?B?eDd0TGVkeG1zSzZacnZDZkFmM0QwRzdPaTYvNDczNkZ5UXBLSnJPemorK1pY?=
 =?utf-8?B?TWlrZW9kOFhMNUhwQXN2aWhhdTFrdEUxb09xVlZpaFhTVWt4K0lpanZYUU4w?=
 =?utf-8?B?NzZNcU5SM2JTQjg0STRDRUQ1ejRSSXMzM3RuRzc2Vy9NV3lLNU9SZlFFWHZs?=
 =?utf-8?B?MnZYeHJSWE0wNWpjeW9oV2tyTUY0MUp2c00wdmlYeHBwS053TDNwYW9odlRG?=
 =?utf-8?B?cVBXc3pLWFl1djNDWlVrd1dMVHdjd1RxWitLN2tDWFh5OXp1VWxFek1kMnVx?=
 =?utf-8?B?cmx0RFV0RzJHSUhFbmp1c2psUHUweno1ZXpwdzFhM1hIZ1pBc2lpQWFmdklX?=
 =?utf-8?B?Vk1RVCtkY1p4N0JkUjZBYjlIcC92b2tXSS8rZlYxUy9pRmNXMU52RzRLemdD?=
 =?utf-8?B?OTJ2TzhEQUg4a3k0T1pxb21zc1FaMzUvR0tXRUFXRTVmV0F2blFjOXhYRjl0?=
 =?utf-8?B?SWQvZHY4WFFISHBYTzNmLzE0Ym1vTERTTGFveW9QUC8rZmVCT1pYV0VFN2NQ?=
 =?utf-8?B?WnBsTDR4WWpGNFM4aEs2ZnZzOGdCTDRqVDU1L2hsN2REMmdRbFY0ZlRkNVcw?=
 =?utf-8?B?aGxJQUVnR3p3aEpVOVBuR1B5RFI4Z0NDWGFzdUxyUi96d3BxMzRnalJEMFk5?=
 =?utf-8?B?dnk0Z0o2TmcrU0lPNjRFNHhmTmxVVDUrYjhYWGdZZVd2UXVuQ1RkRGpMWmho?=
 =?utf-8?B?SVlUQ2s1R0JHNXM3UkVmaTUySWo1YldMWU56MTdlUHBCRXR6akhjbEkraTF5?=
 =?utf-8?B?MmRyaWdhTFBWaHozdFdveklFQTBnNDYzOVZsS0c2bEIzak5uS21YSnZLS0Z1?=
 =?utf-8?B?WEp6YU1TMFdCa2ZyVzBMZU9KbkFBRDMvbXQ2M0pZekkybGVKTWVHR0hiMVhv?=
 =?utf-8?B?L2hsMzFjZkxYSzJPOGx6WERQV1BxUTIzdG84dGRTdzQ4SVhJaXJxbUc4RHU0?=
 =?utf-8?B?Mng0MERpdGY2MDZTNGwxc3FDN29SWTdTQlNndmVQMjU4c0t3WmNXTEdUQ3B0?=
 =?utf-8?B?WTBjS041Uytocmg0amVDbjN2L2Yva0NCb0p0dGpVWnBWRS81S0xJS0o2bFNt?=
 =?utf-8?Q?XcL71KL2O0BF2espPgyenZfRwVDjTQcT3DdAE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa63786-422c-42c9-4382-08dee9c147cc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:22:27.7811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MFW6QZ+6bTT17RldjfeX3XBY2leR+gYON94C+OEF5KMlLfOVrOnzYgNPV8GQZ1SZ9QQ6r+rPiN7ZVanpFVGsWyAb1GwfAC7hRAV+cCjC98dcr5ud0W091aSjGGJdlrqY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927

From: Frank Li <Frank.Li@nxp.com>


On Wed, 03 Jun 2026 00:15:39 +0100, Bryan O'Donoghue wrote:
> We discussed in Nice adding reviewers to help get other's code reviewed and
> to help the reviewers get more relevant knowledge by formally inspecting
> the work of their peers. NXP and Qcom were mentioned.
>
> Laurent suggested I can help out with these two drivers and so, I'm happy
> to do so.
>
> [...]

Applied, thanks!

[1/2] media: imx: imx8mq-mipi-csi2: Add myself as reviewer to imx8mq-mipi-csi2
      commit: 83f0e8cf32a767357e4bab2281c46c218ea06a87
[2/2] media: rockchip: dw-mipi-csi2rx: Add myself to the reviewers list
      commit: 510b66ee871754336438e7f5d6fe205cc8c3d6de

Best regards,
--
Frank Li <Frank.Li@nxp.com>
