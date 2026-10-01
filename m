Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B60424D5A
	for <linux-media@vger.kernel.org>; Thu,  1 Oct 2026 06:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837330; cv=fail; b=ndjyfRvnJI4lXK14Nb3bnrmeYDAjfVroAN93uxMEV6ch9oTqM+x5K/T/6/TAsOZQDGa4RMqzdAE5GebMGfVruXMJkYha9UD4y72qe0lkC2ue6IaCTNOHHoy3XdC1aOiS5rhK07p85iwibxM8Z+QHFhJWA6GOk1bLyL+hK4jp5Dg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837330; c=relaxed/simple;
	bh=stRiO4SU5DVonhPB76ddruMLq/OE8XTycOubNNzV1H4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gn/CrJwwnVKGHPVXSP8GwQCvYZ4tN6RY3izGYX+CFCyiW+isZAu/qB5FrNVdYCWz4BusImDsjmKGryIQjgZ9YoS1w9lJaMEuxLfOjjSrRa0zVVWcBy1kJvXtDAjPOjqgqsT1rlShFmAlVL8IbE7rbFZj6cr9hyuygt8XInz/ZJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3HMdXyL; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3HMdXyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790837329; x=1822373329;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=stRiO4SU5DVonhPB76ddruMLq/OE8XTycOubNNzV1H4=;
  b=Z3HMdXyLrhfxPIK3pLFKY/yHBtb+vqVllBXFfWs/w8Y20yqGDv6R2eT5
   KlgrshKVqjchP1Cos6sWUDhgUKzbFV/mjPjSOnxcq652yHAo+dRRJI3ow
   vrfI3piTDIOt0FxY8qkXoxkYZ+7ePUH6HK8afEFvdtuy5sai/eoV3AgJs
   0AywDJr9IpismwLbxUSc/03/Njjg6gVpCD8f1ZaNLfkevIdbM68vycOTl
   HtuoTWInkgX2Dmlkf8zDT3DXPW+t3h/Xef6EILYyjajw+W/JzNbd0UXHk
   ajGTUXeLQG1chdCcF4gy4b+5dWDpDk6I3b/uqrZ+3Iz+WaJGSMiPAn/6d
   A==;
X-CSE-ConnectionGUID: O266umAET/GM3HEbNdKUXQ==
X-CSE-MsgGUID: IZBFCmXsSvupNJOV2FTr2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="90620892"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="90620892"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 23:48:48 -0700
X-CSE-ConnectionGUID: 1XT8yiU5TP+q4Cz7ONR1Mw==
X-CSE-MsgGUID: liwck70KR7CS59O0gxm9ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="283971013"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 23:48:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 23:48:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 23:48:47 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 23:48:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwlyKfcFx0bCYEHfc5oxu0RYruTxYhyxaqlgaAo6955l1hsp/P7SpdXrxdXOS8FnpP2ivz6qx12P9UzhztVF5pgfN11sWPJW/G+lE53tCIxtLSJWkOGca0B/5j1WkBdaYuys3NfOBzShftMZu6/5w+xjfpfFnYGj2zd4fMJWGjFloA/fIrO+mfo5NdpxXkHkscRzax6F/Kt0tl0vapuw4YFTlEjgn/RXw/wMM3nyX5S/1oI1qCDMKVp9PWzAAb2FR/pxOl4u+hlkGVOLdJF/OEnwoqvKrCyVAjc3uwZUQxI1hMK+uUW9krzycInib94fdrPfYa1D9vaUAKtVjl4vrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLF3YTWAcC4dPV+YF8juifbwgmMg8AWnoMNtdH6FtMQ=;
 b=kTS9k1ojeg8TaaWtWoMEVWSzp8TjedWLJnVHTOgQ2mIjr7U+OwgKzBjjviuhkREXLyNzdaWqahm4FudQ4Ujql1MOpNnJAlv11I5ZgE/Tyik322GjIgJJQJJvPjzm6GZ7hyFMDU7Q2JzeQDpmv1lXMFhxU1Ylq4VlgAMOkbxHvZx5O2ja1xfRlByV25kmIUZQ8s/MAvbgwLFKTGps7rZ8RkjRHe+s0sPlqdTk4qLWOCUGZKhsjrk9WBO3+tunjKy8OgArMDPsZda7jDy2xpxe8wZBfq7Nk4TZnYYnDsWkuTiHLutVlpOetzlHJffLKgN6yVBchnKv6+kTfekJ3Nm2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB9526.namprd11.prod.outlook.com (2603:10b6:806:4c5::19)
 by PH7PR11MB6834.namprd11.prod.outlook.com (2603:10b6:510:1ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 06:48:44 +0000
Received: from SA1PR11MB9526.namprd11.prod.outlook.com
 ([fe80::2a31:5c3e:2615:9b05]) by SA1PR11MB9526.namprd11.prod.outlook.com
 ([fe80::2a31:5c3e:2615:9b05%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 06:48:44 +0000
From: "Tripathi, Divyamani" <divyamani.tripathi@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: Antti Laakso <antti.laakso@linux.intel.com>, "Sapre, Sarang"
	<sarang.sapre@intel.com>, "Bajpai, Manik" <manik.bajpai@intel.com>
Subject: RE: [PATCH 1/1] MAINTAINERS: Add more reviewers for the Intel IPU6
 driver
Thread-Topic: [PATCH 1/1] MAINTAINERS: Add more reviewers for the Intel IPU6
 driver
Thread-Index: AQHdULeAACEtOVgeOEKZRJEbSlc2t7boPxuA
Date: Thu, 1 Oct 2026 06:48:44 +0000
Message-ID: <SA1PR11MB9526B080265348AE1F680045828A2@SA1PR11MB9526.namprd11.prod.outlook.com>
References: <20260930084128.2624644-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260930084128.2624644-1-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB9526:EE_|PH7PR11MB6834:EE_
x-ms-office365-filtering-correlation-id: 0cb319f3-88b6-40cd-d11a-08df1f880989
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|18002099003|10067099003|11063799006|22082099003|38070700021;
x-microsoft-antispam-message-info: ibXtoH/sxf1Ge3R0E4cLdMLxybOHnv3guyFhL6j4ZpQKBW3JL//QpdX0iSf8vOthULu2UaNA2x1R3b4RVIs3lSi/eYKNzceuqf2QlEq+JR2sIR24sVEXWlaA8ZI6p0EYFab3Lssc8vVWwKCVb825b0AKjtvgr0Q99SWnxQ3wDyTErMARYgvTq7rgjPWu26KDbEHzd8Gsgm8QhzNDAew2DW9FUadH9F39oxQHbirf0OUf96kvHe1VxVV/akfx90TCSGdKWulEVIh3sZiyXiaN4ISGrVsM1End3sO726zeJV6MlBTT19VNdIARgCiJEbU0K+hsw0yR/kb6uzA+KdLJyeBITk+LSv4jQLUqU3eCtrzNH+WJEGBqN8D4zz+etX3p6VjePIjBnOEabw1UBqS+9eIf7vVSgS15CAIINIDtLVYSbG1vyJTxpYJPOP18XH0taI94gKEzvHezhspamOPCA04y4uwDudauN571at4XJF2fBi4m6QhPSToVc2zjYVntZRGqXzG1riqPWcTwcW9UWtaQ5WNKkifUuR9VjR2EiKsStj81+17m34ohbSjpDzLS9XUVB3kvvkHW6ELyiUr0b+XxFJcps73E2oJduzeRLYilJ/jd4QtxSBUsITWkHrpnAQ6c/Iq8alCxIvnuAwV7MPFLr5jxQxe36q8EaPQg71dVWTuAR60SFnIe4ieo7Y6P/FE9/sOd4I2QdOJ70ORNj7IIUZt7tv10wgv1Oz3Ev6w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB9526.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(18002099003)(10067099003)(11063799006)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/9thcyBYYPrnoh53PPn+429+B/NVlqBOEEaJU2bn4wCLjqPpE0onOXSVOPI9?=
 =?us-ascii?Q?mI+ZaouWa991MMVBu8Gq5kWe+lEXXFYI923o09qkSqBC8x9FPmt+tDUoIzDZ?=
 =?us-ascii?Q?rF5k2vojSCH1GbdATt46JrU6HDAzMwmipxtIbQS4O8CJ9TEzpPTjtXdfp3xX?=
 =?us-ascii?Q?RYfOsXn3EgLx2bQcncYRkl6GwUmWJtuPq3N8RhEbdMUn83lr04FZD52vmha7?=
 =?us-ascii?Q?szZtaXfnN94lQTEWs7S+vhXWu8v7tOwAauoVWwX6uIB6+kyUInoFIHGOf4gp?=
 =?us-ascii?Q?NFnaPEzTvenFAcapPOaQ43uZ4s3oKYMJCBY+W+YbmtjxFsc2ez9cFXtPPNxG?=
 =?us-ascii?Q?hrzBpawrNBFZJVv3fqgvwQubGBa0EYJau02HbaJsu3mSYsPHki0XXn6gB7Y7?=
 =?us-ascii?Q?h1v9+XaQgctXVk7D/i5XHI6zc5gI1XDPk5+3iqSKHWVoLY6bY3M2ONWulHc3?=
 =?us-ascii?Q?peXjO5IehN0NaQdjHD2pRvnpWf7k0d27MdCy7f0fUv6OV5cFIlLczNIVqn0k?=
 =?us-ascii?Q?x0IziD6BJFE7LrK34eEGxRAEL8gRakXzl6VCQns/GRls4KapnOohrlpF4coF?=
 =?us-ascii?Q?OocR9w/jSmz/s2Sga2tnMMs7j2U4L63yRZ7M5xjSgUsATyuubxaSzgiYhwnG?=
 =?us-ascii?Q?ldcxU27WyKfA89JholNhF6PrKMGOFlBzvOcqoGOCUOuNNS79xYuEsD3e+Dk8?=
 =?us-ascii?Q?2/xcIjjPRR5IsUUgvvaDRL0SXaWpxktnQjyMDZ4O7gbw8vNlqwQKbN5uY7gZ?=
 =?us-ascii?Q?37x6uaZknaLkBdaIQgA46IBWSjPG8uvg4PO9pj7FsaEdrHybHfXAdhgsRJ6/?=
 =?us-ascii?Q?oz+TeHBq4QSSSbC5fTWTRyoncjzG5w38eDrQSJ8ROQ8Ktni7HQtKGvoyOiNB?=
 =?us-ascii?Q?PPSVahLUk0LAH2Pe96HOc5RIX4VwziklaSenvkrJPHKGw/WYKAY1YnVrzeU9?=
 =?us-ascii?Q?KDyURa21aPMteHMQJ4IYnXeA95T0qLQPvb9SomtGU5sI9afl+UaO9WtWk9n7?=
 =?us-ascii?Q?IMfyAReADcRkdtQLz/gY55K8gMlOsa28o6Cx+oUswpyB6ik+iOvpyM4Xx3bt?=
 =?us-ascii?Q?BOM9pgVNSY64Gk+sVotB6GgEcF30bim8g4NtHpOPDa/XdHakud0wpfA9xYz5?=
 =?us-ascii?Q?qLOfo9L/PqGVgyxF+F788HBixkcXFn5QTFMZgNlHoh2hvIYD66xrgeIPNFtY?=
 =?us-ascii?Q?DwaM4iYVvwUh6PnjzAbkeYdqleQoymVWX99J1JJ8OklDRzRYKLI6RjtlR4fI?=
 =?us-ascii?Q?OQyLVI8x2FyApJGeUJ+v0kVGN1g4PkltF4xfk0kySMK9mh25Kcx2FgMD0Z5p?=
 =?us-ascii?Q?I6BqavpiJQbKkaY6w9iDLk7JFIEKZAJvOoPA7LbGAccZfOkeMxwA4rmNF4NW?=
 =?us-ascii?Q?SfMx1T8zmEFGZ3XpKB9PduU4WaExpM7ACx/xRDaERltZAdoIBBowt5QrQyHp?=
 =?us-ascii?Q?Lfuef1MOXs+D9OuCtpCpRi5DuOabzhfNj3ozuHEHzVLi3aTKjwX/0uI8GQiY?=
 =?us-ascii?Q?UOv7b0a6OO9u4l+UZlnJ4oxmdSKIbXhQRx7znFWvjb2M5VbjgaGmLx90XZcS?=
 =?us-ascii?Q?23PzWhjIyWKq+5z9rGF7PK6DEx7tNp6dXUZekP0ElG9Gr5Lt56i2dZTD4Dja?=
 =?us-ascii?Q?11IyMVk/eDd4nZVyIeJ9FKPrs2Z/CdJ/+wqvqki6Zu5MC89hVXM88+fVbkbg?=
 =?us-ascii?Q?kYJQOouSxtjWYoe8YJ4BE9GwNzRzvIfi9sYa78+qY0vIigGKYTpO4ChQ2nFK?=
 =?us-ascii?Q?M4877R7L9Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bA/pALNhBo+XyknYH1pvc1USDc+/oAaYjhTudXxK0See+3Np0/Xz9bnBH/2DJz/dQWPaOSivAzeVWXovXlf3wQSbH/ZVLlDhyod9Ra/yVMhWBofL/Oc64MISgXLnmACeFbF5p7UA6jzEJE45QewQTRU9bOvjPgBjZ+HPGfQ6E2fJ028m3QHL1QjifoLpsNHYF/Djv5d0fPeW0RHh5qYryGCXCLEJgHhLt8P8K2nKiOOuNDt7xc5ppqhHa1kJYodVPXzut1b7EeOF9Pc4GipvWgBu83MyGSYTFJ5y4hnCJcSRNDz/o4zayFyeW/Vkbbwl3VPmV/7J2tRpPwY0dF+0nQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB9526.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb319f3-88b6-40cd-d11a-08df1f880989
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 06:48:44.5514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mR0sd28lWGSmiY2PoPhrUF0tCvkJmsFS80kQ2EwZRgsDtZLlyVC/V3MjJii2aZMuL+kDiHHD2ZYXCCxVbkkGtID9Mgts0JEL2J1k8w+GdJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6834
X-OriginatorOrg: intel.com

Acked-by: Divyamani Tripathi <divyamani.tripathi@intel.com>

-----Original Message-----
From: Sakari Ailus <sakari.ailus@linux.intel.com>=20
Sent: Wednesday, September 30, 2026 2:11 PM
To: linux-media@vger.kernel.org
Cc: Antti Laakso <antti.laakso@linux.intel.com>; Sapre, Sarang <sarang.sapr=
e@intel.com>; Tripathi, Divyamani <divyamani.tripathi@intel.com>; Bajpai, M=
anik <manik.bajpai@intel.com>
Subject: [PATCH 1/1] MAINTAINERS: Add more reviewers for the Intel IPU6 dri=
ver

Add Manik Bajpai and Divyamani Tripathi as reviewers for the Intel IPU6 dri=
ver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc4a2dc6d30..a756791bf99c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13261,6 +13261,8 @@ INTEL IPU6 INPUT SYSTEM DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 R:	Antti Laakso <antti.laakso@linux.intel.com>
 R:	"Sapre, Sarang" <sarang.sapre@intel.com>
+R:	Divyamani Tripathi <divyamani.tripathi@intel.com>
+R:	Manik Bajpai <manik.bajpai@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git

--
2.47.3

