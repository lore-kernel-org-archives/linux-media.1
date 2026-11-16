Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794816222;
	b=dnKKKve49V8DbidmcmhA212fKMRTs6tb/o8uhODqdf8bun4+2eMF/vPsBe+pbguutV+3
	 IFu9t+vorrSNGtbO666YcH5J+gl3vnrXvVi5znIB+fF+j87zdrTcGQU6VLOe2KCbwSYm8
	 tPBSlQnsXs+rZdPkNT4blc8TfmDL7vo6KFQIayWHvve3b1PlpcYWPgzf97U5BhSqDy0Y0
	 /Id+AP0Bj3PCL5I1ahgK2BgA8hDlKGcKBnqMsr87cyPszjMpJNWrXFQmjfhIeBKfu5nlO
	 ObsM6bJzuyKSf1USl5b/XBkn0JneIQk7eYz+e9zZ0r1Y69pG4NgUsd3o/c9G8gYYcBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794816222;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Aw1u3oxx8QN1a5KUTHSf7PiGo5IkTx9Mk1GAuYDBU1U=;
	b=fwGfkSthLb/4/pJ4xyJJ59tvDEdntVjtEaRmTtU+bXaV9be/GhTkRR5CF3nE1rFAd42r
	 PQpoWm8R4lvo6dTDHFlHuMhxMZZi2WKVbWduvZ+3gtyGMOhStyqJZbfftOQnn0wcAubvM
	 8pRwb45H+yg+Kavoq6sRWpdAcoxVmUu34RDUAziHN2nVkxIp0dOKisu25VIgEVbPxc4dR
	 fGmbj7UVfsfZuQd+NkEfn3ulktZA6d5yjeqvZHndGQw11AYLNaw/MkIkkaGvVaTDzgRkb
	 p72+XSWHfLNTTvWRKQotIlCVD1V8VfKIjUDWWebg3ULNiT9twpPr8LnNX3p719tx+Uw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DsIej9aO;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NkKucCEA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282E0606A32A
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 08:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282E0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DsIej9aO;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NkKucCEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794816221; x=1826352221;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6tmXdJM1assrWRzL3zD8CywdUbhvtk/jcYGBRRdNkKk=;
  b=DsIej9aO2XjvOlLenNgnx9FOXEbRfAZaYLjuBoqAod2EZwtkKtHpxLYc
   VNtYK2fhtHEIy39pno5FvUIj0ejqwxcalezB+bTqF+QMW/ZGpWxTOpBN9
   e8ltPMBLmyYoY3CJzTKGep/QJf1lE5GBclXntEhm72SrJRjHFLJRGfv6v
   tgzC0/90aNDIQy7/rVsV+KnPMNvnNgfxIDzCLiDKeROqmaWIBC4NhGssz
   JVD+bmIAUXG6pPf7H6aA102kQcG4OqP7/4YbaFY76KZhyidrXXMC1fmDf
   sZQgLmfNCt8EA1wA6jWWHFaJ+eQtqHFZ7fj32T3/Qx87TpI8lupPmPqIx
   A==;
X-CSE-ConnectionGUID: XyHBpOSYQaS7lTBR8v/t0w==
X-CSE-MsgGUID: gcLQW3mTSSW2d27lTl9EZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3534058"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3534058"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 00:03:37 -0800
X-CSE-ConnectionGUID: MFRs2zn6SQOjo2eYzZrUiQ==
X-CSE-MsgGUID: CfRVn6aHT3CdNYlwxFlx8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9642771"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 00:03:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:03:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 00:03:35 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 00:03:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRQ8bqsd9CW0oo3hvP4PzfY1kr5Bm6OC9KPq9WdywqMMWoHuRm19kQ2jH3OqYg8//mpwd0hOT0Q+sZ5xF/rf+931htEV43H6EwOTnSwRVCl3vCMLC1lWshGnIZBzTUrJFmPde6YGhBD6uHIAQPRC0viak55rWiPj1wQtqAF50AYCoLYiFWKWyAshij1aBOb78wAnrCR04Hax2VsHzaXsPlgF5eISbsogIhqTVdw1T72r8/ZZKfbvbtPoRxBfEmEjEcR2uxWzm9ioirYIc+zaayI5/xUOfj/gQZWYM9osHV25bacwV0/RHBp95TJuxsuWSEDN1unkp3bOUPJ4+C3GzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aw1u3oxx8QN1a5KUTHSf7PiGo5IkTx9Mk1GAuYDBU1U=;
 b=IJ0SXwysWbf3tF+GBefk5LekQbuxoSDgkDZ9MdveoqMaKyUxkdYHn9CLakfB5UxUyhxp1vX9jy6V9VS8QaI6B3wEjgv3ODZJ/qe+lJhC0ikF+PlnHdjJ799mCqT6nmexvEqFIHTCeoadAXNZT502/601bLlTHSbzLjq/tDedoI9BexEATcA9VTteP4BdsV8WTQn6hRebogFeyIjt4XdUAWva38sqX8ezarJkb7dM/dl3aDR0BMp76+eC8nPnmyrKBk1+yqcTPLvLtxwx4RPs5DUunHE8ELohGnoZmeB+3QBWCAAe1mlj/gkTjd7cNYkslX4K308lW4O+l+IrXJ6edA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aw1u3oxx8QN1a5KUTHSf7PiGo5IkTx9Mk1GAuYDBU1U=;
 b=NkKucCEAsvzWu6KDxzthoQWJiSXlAwGzcyZdku4nG+ir/xqyiSDYnC6z3b/mhoOvyzpZ5jdkoW4+Ol+tKGcOFOn2ZtR3ND8up/zyxkHKW5ronaohwT3wWRxjPe7k1dP2RuMXBc/A6ug9NIbE4FbXt6HQLDcW30OwMdk0lH/HdZc=
Received: from MW4PR11MB8289.namprd11.prod.outlook.com (2603:10b6:303:1e8::9)
 by CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:03:33 +0000
Received: from MW4PR11MB8289.namprd11.prod.outlook.com
 ([fe80::e4be:8608:3d70:c1a1]) by MW4PR11MB8289.namprd11.prod.outlook.com
 ([fe80::e4be:8608:3d70:c1a1%4]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 08:03:32 +0000
From: "Su, Jimmy" <jimmy.su@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Yeh, Serin"
	<serin.yeh@intel.com>, "vicamo@gmail.com" <vicamo@gmail.com>, "Sapre, Sarang"
	<sarang.sapre@intel.com>
Subject: RE: [PATCH v1 0/2] media: support upside-down camera mounting
Thread-Topic: [PATCH v1 0/2] media: support upside-down camera mounting
Thread-Index: AQHdVg7yr3nAEkfAnU63XQBXnlPGOLcr6QGAgASq5OA=
Date: Mon, 16 Nov 2026 08:03:32 +0000
Message-ID: <MW4PR11MB828958D66F3062048E5A9FB89D7C2@MW4PR11MB8289.namprd11.prod.outlook.com>
References: <20261007034914.1654831-1-jimmy.su@intel.com>
 <avbM3VvDu7PuhZKC@kekkonen.localdomain>
In-Reply-To: <avbM3VvDu7PuhZKC@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB8289:EE_|CO1PR11MB4916:EE_
x-ms-office365-filtering-correlation-id: 8d65ace8-b083-4072-296c-08df43b81bb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|10067099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|261022115727099003|261021135927099003|261021121427099003|261022075727099003|261022105027099003|261021123027099003|261102123227099003|18002099003|22082099003;
x-microsoft-antispam-message-info: FKNPB1d3vQW1BW0Yfinjmi6Wlj0dDNUb9eqV5aUW5qPRp+KZOsXjml+/cqW44lc8U0LaIvxqq6yashFqAthtHeHuoon4CpgxTfO9Q5h5mjloayCfUvzvEcBDuzbAtGGZMWmnKmhZmoCkl3U1G3PRdfl7lQB16gAt3HYyZNc+4z/4trzcSoWpJ+mlgxhAJhIfO593XXrsmZ/QuXO1mD46xGcsxTP8iI6ZMaNZ7GYm1RpuhWYiDcQE72pij93jgALBaiAbtmqaPUcqLcxer3/OsL7dayqsySe0F7HT5PJ1QCU2S+h1kXCp3OpMlJQzJcq1eTdwkganIfFRhtgw5H5hRVaj3uMin2ZvtIWX5RLfMPIxHvsMkvauC5RDs1mELNAeJdvrd4LG7w3pGXo+VTDCUU8VxkA4+fktXpaT9oK/cSBmhrD21/9iG3e9GQg3UjzsMcnFnYYyTvYJCilzNtx2LEGwDh2iP8ZsrPRgf4qCZrRqRa6PxRkik+WzwagaX8ltMxaBDmAMolA47i0Z0LChFj5ezp9NS/uiipr79ixLk7ZorDR/Lm9mtoV/p8zic++om5OTmMuVB7vgPHv1KrqiBf02dbVRdmC4ZJ2QSz5Ow6QMMgyyBoPXu8G0n9gd0ERoTkVpVToA7tczkQxCLXTIb3PGVYoam88v03eXGNW1/Ht9G5qD381+luVasHrydACJnr9ecINh5ACxYACEuNs4xZQI21rCn8dmPJaB8w5sxJM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB8289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261022115727099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022105027099003)(261021123027099003)(261102123227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Wq+dvGi1iQEBFv8mijmPwywlVH7VsVTwuTxzRhbnhgzNmOt1HdVLt6qNBXM?=
 =?us-ascii?Q?a1HnWMxYKbZH1jhm29dw479mTq3bB7xZMM4YH3kURSJLSxBpplZjs1xRLqbi?=
 =?us-ascii?Q?+kYeIFMhwmU6x3oZx/rWLE3lTl0vX0bvstYJitzoMOYQ8tUxzh7G5VV+C05Q?=
 =?us-ascii?Q?WGuzR++XHw70uMSxql0PA2ljnfC7mH1oTGD6IEdSRjUEOljR+4n6D6wScn6R?=
 =?us-ascii?Q?6Uzzi9dSqrnx14WbqX/ejGEmPBPgLzSNNYF4mp29O7Y03NwJ1r3doUvQUUTP?=
 =?us-ascii?Q?894diFzcL2VgrPqvmeoYJbWQb0FOzgnGo7e52u6wkNKmUuZ5cUxEpSEjYs5q?=
 =?us-ascii?Q?aFaE0x0u0QxkiqRXzjIpaeIdZTjqZjpFFQzJxU0nEzJluiRyJaq1b2kDk0BX?=
 =?us-ascii?Q?6CglFEProgsomqVMWS0EbvPJFXAqFNBbjYgJPNls0e1bUtCxDo8sVbLfrx9S?=
 =?us-ascii?Q?lVl8qdXYUReeVYt3z92vYPhF/CJbS1Z3pDwmz/pLbgnNzR+ABYtW2g9baXGY?=
 =?us-ascii?Q?4ziyFE6i8u3T7/7ilfzrYdgH0m8yb2APetAlrRZIEfkTi81RHIvVf1MrZspy?=
 =?us-ascii?Q?hXBD4AEZo6OAhzSnLXo+ZFzZFPMoVkBWkB558UqJhpnWTS2QNeeuOMHb2XyU?=
 =?us-ascii?Q?6dJVWJpJpcL5SOu3NT//hCCo2DFhMCVZ79xOWCIdZA4Pa3xnnl+UsBeQ//ez?=
 =?us-ascii?Q?a7oG68xZKu9iLhlPPY1gYV3L5uR6l3E+1BNX9hhdg6dLW+C1AJHE1XlZgO0b?=
 =?us-ascii?Q?4qTbLC8WTkn1lt8eDoVxSzE1O1zfoRTvepBV1Yqc9kvkcS9SsLECQqHUaY3z?=
 =?us-ascii?Q?beAA7LpgPMEsBF+xeU+giukDfDVZU1+sFHa4LQ/LKoY4cmZ4D98kSP5m4vr5?=
 =?us-ascii?Q?VRCNZ/y4rBUd5PtdODXTHTn1LOg+l24nlqORB7mUY2EmdIdngHAlluNnxhVt?=
 =?us-ascii?Q?1x1Wi+HJnObqEn41zy7eY/9uFcfV+e8FwgAOIynhA8LWjwA0Q+PukN/eMRHy?=
 =?us-ascii?Q?Tgz1rADi1xzAK+jd999sm69ZnGrbpCYRhIGuURfY7FWUmd64UttDzfKFYp6L?=
 =?us-ascii?Q?1zt8Mw3xbdqwV4FcAcoZvC2D7+Uksvo9IhPeXLeMhEPr8GXTu1QSnz+3/cQd?=
 =?us-ascii?Q?l2d9IFxl9KrDrdmVbzvhQ+gULAh2Lk3R9OJwyQ7bhKZ/0cGlRKs/2+8ph8Oe?=
 =?us-ascii?Q?COQEqQXTdEBNDG5d+e6NvObrM5bLhGiqPpZUGkXulrev1InPxRSwvySfNRjs?=
 =?us-ascii?Q?fHen4zOHQJkOcR/RjD3IGsT57081cuRuN/kE3HPMtNTZBebyIPNS6o7clmqp?=
 =?us-ascii?Q?2fOLrE6Un291Fv5zVWX6Hqs5m0ZnCcJUQaG2b7X+F/CMwqzSlTZmZEDXeqjX?=
 =?us-ascii?Q?f3b8v0wai+FQ/cabaQLePeDmAauWeIW2uMsmfY0u8JXqzGEnhJpXyXqhvUaI?=
 =?us-ascii?Q?B247kd0MRY6+f6LcSkC3Caw73ZsRb/ulTngg5tOnUnCmZ70O98pStpbSVaMV?=
 =?us-ascii?Q?Nwk17QPE1x4wf71RzZerqlcsKYUpcCYRuzmw+6PMoMywLY6zGT0HgBGthZfk?=
 =?us-ascii?Q?pbczT21zbe50s2rUi2IVR8npiiywahdTz30WGKqplrd+qJZ8uBkS9u3Ueocz?=
 =?us-ascii?Q?zbdjzKdoq1l/v155+Cmk0SK8kW9kDVHtiQcfn9CDl5n4s0DEH4qV3HU75fmt?=
 =?us-ascii?Q?ZOcBwMEReVu3whf3sBpNSk+bgtus+VAabIg+f8cOz6ng+HfF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: u8X1DvEawvySWLtFqddQOpWBLm6hwMiyjo3DhDX49bWoC3SdDDlnt8/sn3MUnidy2XXL8163Ehs7KK1NCPQ015eNoukggPCXauprF9OIH7pla7Xh6nci/C4SL6jdSqOjvk0z5rqqDDfjMM6VcFEgVfwWWeKCGdjEE1gks9AoHDsBqjVCkozkSvi/iaFSquSeADlcNfHQWfwVcFeXrcL4dlhrlQI7SmG5/nbYxGPSBOc+JHOuFRFAwtpJOD5RXh5fRv3Yc3ITRmakIF9HlUGta3YeGAGl08S6h2Rkm0zNy1ycjYnsre8xjyWF7CDbuqFdH+tirLMbxB/Xjl/hk5MQeA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d65ace8-b083-4072-296c-08df43b81bb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 08:03:32.7042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bdJooI+umO86LFWGamJsGUAd9tmAhrLBOcqPPPLLqUr6p5zud8ZuY7EssvFFskQRJcAcUhu63iApgCWidOUvlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
X-OriginatorOrg: intel.com

Hi Sakari,
I checked the latest codebase and would like to confirm with you.=20
For my current situation, I need to rebase and re-submit the patches to v2 =
version, right?
Since it looks a big change for ipu-bridge.c recently.

Regards,
Jimmy=20

-----Original Message-----
From: Sakari Ailus <sakari.ailus@linux.intel.com>=20
Sent: Friday, November 13, 2026 4:40 PM
To: Su, Jimmy <jimmy.su@intel.com>
Cc: linux-media@vger.kernel.org; Yeh, Serin <serin.yeh@intel.com>; vicamo@g=
mail.com; Sapre, Sarang <sarang.sapre@intel.com>
Subject: Re: [PATCH v1 0/2] media: support upside-down camera mounting

Hi Jimmy,

On Wed, Oct 07, 2026 at 11:49:12AM +0800, Jimmy Su wrote:
> Some platforms use camera sensors mounted upside-down. This series=20
> adds support for handling these sensors to ensure that captured images=20
> match the device's mechanical orientation.
>=20
> - Extend ipu-bridge upside-down matching with ACPI _DSM module identifier=
s.
>=20
> - Add upside-down quirks for selected Dell products
>=20
> Jimmy Su (2):
>   media: ipu-bridge: extend upside-down matching with DSM module IDs
>   media: ipu-bridge: add upside-down quirks for Dell PA14260 & DA14260

Can you rebase this on current media committers tree? There were lots of ne=
w systems for the upside-down list that I just merged.

--
Regards,

Sakari Ailus
