Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794840284;
	b=rQe6DuH/yt5K6Dyhc5YcM3iC8pW3DMOX1qE7DJUtV1XeH1gMyScB2gXUwrhMqIDeSIjP
	 D3uAzrCLhk/dxOpUvcMugo+KFOa6vgK82G3mWJAuRHmuQNb26xgccxUlgPXNdBcz6vri8
	 7XX0fm/OihVJ6sjpQ+B4XsqCPmprloN+Jd/FozqUK2L5uFOe1gx3EiLyUmJWdOy3gJaiU
	 CfmfCMylU3CFUm02OhywSBDh0C5lUN3zJwwlUfiMIBlAuombvP9+FMVwY56Y2ww99CBMn
	 ZaRm/dgPUd5bTAPcks1v1Guo3ZcGe4AzaWjwZcJlSJp9U1O/NETw5aC/6SJXsTRFVjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840284;
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
	bh=s6p8t+bwt0ld3c9MfryjIoOH3ES5/EkO7U74hcjb0IA=;
	b=0kJczaeLcvRKqUjSQM6l64niTFDRQz3cwhZMdjotfGnifO+FBp5HEbC6BwmW9sfFm3Db
	 4xLEB68gfoqxqtDxyMLUNeRGDR64Y7JWqp5l06W4vt/whqPBDL2YlZWvuclmZhjUqeuHJ
	 Ccwat0Opp9LFRZu1bsnqiUUSpUf3/oJ42knrSDkglwYySOwReb3ZcWMIEmqz/UqyzOYhV
	 dmJr0bvlxIBXQXonMHp3+Gp0jsWPtRuyYmTruT/jqKVzQNXLEKQa5JoSE6gzd5zeuvM4D
	 n4F06ym8MUicDpwYoBi8l45MFgDaYAF87XraIvz0rOCt9i5nXe7IavhRqefI8plqdZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Eujnsa21;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b="D6/z4950";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD300606A32C
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 14:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD300606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Eujnsa21;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=D6/z4950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794840284; x=1826376284;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=s6p8t+bwt0ld3c9MfryjIoOH3ES5/EkO7U74hcjb0IA=;
  b=Eujnsa210jNS8Zr5qXggI3B/9EzKOpQvoWM/cYJFgxkVaL/jnF3Jy+gb
   +k3UwL7JVYzYOhdH8ES+XPna/q0l1djMxN0aPB5UhTfjZPdqioBLIfHO8
   vCA/3l3ahwiX+Lsa/k6IMvCK9XTBHbV4tWXTbNhIiX+zEtfk/3PemnUTj
   eQ3IMlDaFgoeffHD6jfUaZK6J/wK2rAI6d39ItcTd9yKDbadK3U69X48o
   9KGy+4B6Q3vGdsd1itGKNNvgKpj2ZbIspeoPc5P2lYSLHEymSV0roAgj4
   Nad92BjAyzqKC4sf0Yaw1dwslrFNdAICpo5M6PPeuavTB94WuHH4CESsu
   A==;
X-CSE-ConnectionGUID: F0OUyMaXSei84AC6AwOLVQ==
X-CSE-MsgGUID: +V0fhHlaT/yMd4GXdfEsCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3452271"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3452271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:44:44 -0800
X-CSE-ConnectionGUID: w/D/cC9BRFu0/0u44beghQ==
X-CSE-MsgGUID: qsyNyy02TQaetCauccdkUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9761139"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:44:43 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 06:44:43 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 06:44:43 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 06:44:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNdmR4o/Aws0xsWMhmDUy3dZLA5FgwTOgqVro6zz3SKiUj41IYyMC4g8RzStTci0Q0eXWGEH9Vtpn19r1vuMqczqqrcra99LSoCAZ2gmaR5mqxo2R7wwIfzMUrhGzF7/8tt2uT2oNk0DIze/Kd9dStNCi0zmgZTYCN50yjV6u6FiocB2j9O7N+iDo0msuJ8+VB8xNYC+DRij+ParYEzzPxOvif+cG9JWhfwfa8PGBCGLWIRbJ0yvDs899n2kzGR/t49WcSvzIcuktoOVKP43Wt21ozQaUc8p82DNH2fwhy3SN6MyP8jyFyq2l02+y7+SNo1zZIa06mblilkUXjCZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6p8t+bwt0ld3c9MfryjIoOH3ES5/EkO7U74hcjb0IA=;
 b=iJBLOXAHnNkFooC7HQq827LcBm4EXMOsj+Fdh9zxCToe23gF1rIzUcWOvPTLGNIlXnOrQdIfgYfSB0d1fbRhfAxvbslemRhwuWsIoTyMHOOn6Bv4TP3GmXAVEPUn/3tR6kTtdwWiPLg2uKGvqx/lD9YC+0MpxO04mrpUVyrugcgCe/w+vuBz9UVQHC411ai6S1PhW+gOgxDV5HOvMSSvFFykEV++7IO5kMimM5M+9eHU1PWd2X5mQ6xYqJY7R8vsm1bLfxkw5VW++taPzV+LbnEOAA4yvBRMeWU+A9lXONPTnEhbavbnelgRhrn24QNlC2LTOZMkexqa3o9aaFXtdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6p8t+bwt0ld3c9MfryjIoOH3ES5/EkO7U74hcjb0IA=;
 b=D6/z4950uMHwHjmH1WswW7LNc/FNdjBiXKKY0uGYRpdrN/GG44uDuaxouRLRl7I0FQJSn8jsM8DNvirGeRdJGbHxpZq5ZvHBEHe7btBsxcggOsY8oPmEsfZb6Cg0H3NEsfikD3TixKM9shI8HezY3JIZVUzAeO2IBkynBb67f0U=
Received: from MW4PR11MB8289.namprd11.prod.outlook.com (2603:10b6:303:1e8::9)
 by DM4PR11MB5970.namprd11.prod.outlook.com (2603:10b6:8:5d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.14; Mon, 16 Nov 2026 14:43:39 +0000
Received: from MW4PR11MB8289.namprd11.prod.outlook.com
 ([fe80::e4be:8608:3d70:c1a1]) by MW4PR11MB8289.namprd11.prod.outlook.com
 ([fe80::e4be:8608:3d70:c1a1%4]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 14:43:39 +0000
From: "Su, Jimmy" <jimmy.su@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Yeh, Serin"
	<serin.yeh@intel.com>, "vicamo@gmail.com" <vicamo@gmail.com>, "Sapre, Sarang"
	<sarang.sapre@intel.com>
Subject: RE: [PATCH v1 1/2] media: ipu-bridge: extend upside-down matching
 with DSM module IDs
Thread-Topic: [PATCH v1 1/2] media: ipu-bridge: extend upside-down matching
 with DSM module IDs
Thread-Index: AQHdVg70ERTB0W1eEEOY1zL6rMqMB7cw4HeAgAAkS/A=
Date: Mon, 16 Nov 2026 14:43:39 +0000
Message-ID: <MW4PR11MB8289A9EE5B4203B55DCE5FB59D7C2@MW4PR11MB8289.namprd11.prod.outlook.com>
References: <20261007034914.1654831-1-jimmy.su@intel.com>
 <20261007034914.1654831-2-jimmy.su@intel.com>
 <avr3cTli70qfUMnw@kekkonen.localdomain>
In-Reply-To: <avr3cTli70qfUMnw@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB8289:EE_|DM4PR11MB5970:EE_
x-ms-office365-filtering-correlation-id: c98bfa14-a49f-409f-a8b1-08df43f000cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|10067099003|11063799006|4143699003|56012099006|261021121427099003|261022075727099003|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261102123227099003|22082099003|18002099003;
x-microsoft-antispam-message-info: KBMJ19RefHQe4USi9MbY0brxDm1QJbEp+fJY0VUwyw/wPvTovAl1oojVKeswUgg6J+AIGmGdVanOPfW+MeIVEAOemOEijvSE+NJZjstc9sQEEaSoAcZrw92FO252cQLDAw9Geuas/CckA2Cw09oEYcLhItcXjAveqPvYjq50oa6upn5jj+knNzjUwOn04ruj2hExOJl3lrIRVLi8FpijNCrdNz4hjWQf/iUYy+PKZz4l67NK5hml2IyH0Qf0E+Wxfv0fx//YvLy6UlgfPh5M8EDdueR+y+y28udnMVHmQW5HMRh/YiWPubVwHGS/6T36dUPjOQhYrheJhAEUMsaIlPNDGsYSspl3GKgXC6XZ0CKnK9krxvVo7D57v7yB3/p1XgFsWHBcOCgXjRdag92GoxcZVJ69ybTQIXHThiuaGX9zbfM8IU5beLtzBa2RFs7nqKnPl05Pz2O5wK1X3BBUhg85OgJa2egjnPCTOfKqkn67nnn0Djaa+6M6eesPi0hNNTf/I6yn+D9swrm4yu+6bBKED+2Fw6N+0EDJRjGWGWQMXBlsGpiiAmC59vBAwSlxnhlfK1A7R1sRYl++eZvl1DXQbH7n58ta9REVrnf4ngA1LL4F74p1uMpJZ3uPO6fbUH4Xirqle+vrRFI6OivHi4GL8zMjKkvun7pMo+kw62eyL7vTGwF5l0PDfFqgorqSkqIaY8knUrpdvnyyIfLwAJvB8zeZMrC2UmZrwcDyVmU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB8289.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ghrWKxgAUh2KdcllRtCVxHn9zmiVJyazAgQzKgpg2KMfQk18GbUFVVrBokT2?=
 =?us-ascii?Q?H9yV9JMqC14jhDzK5wCHY40Xp/8t2l9brH6QN/NgzB6S4Osk+q+7J2Pdkn64?=
 =?us-ascii?Q?7386n9s0G0vp0JNuwR8Q0pkTucvgsOZbQLbw5MGstoW4fT5ZErNRSUasaKTS?=
 =?us-ascii?Q?5l9BQigmsEwKhdOcQPLSX4CK8ICDouI8RkF8tlUzLdzLDMoFjLokoV/Sj9Vv?=
 =?us-ascii?Q?qtzpGarI+/E1AWhH8ARAZ9najR0fLJEfg0slT2NslvNItZ3M0O3B6W0OGuDg?=
 =?us-ascii?Q?CCuSqDfmeBaaSNjEtS7AJy9sIJCkcS6ODOpkYfPYmMZo+I6ItCNpMUqp8iKK?=
 =?us-ascii?Q?g8ZA6oaDgILxgdQVpsfOLgqRnfVGsjHO4UFmJfngCXJOdl3MfApD/vVIjsir?=
 =?us-ascii?Q?1RjHpjBtOa5NvXejbNGBYJO/IoqrBvl7fsYgYsjwev+2pFg9EKhaV3KoScJw?=
 =?us-ascii?Q?BrKOODZ5Fsi2BT1HCqgzO4HTrox632TxNB4c9j68vPT4o/6bYLTNxUGzfLVF?=
 =?us-ascii?Q?fILGES4eON81UhbGvQAgIYMjLvUuZ6SXjGkJh3Ld7om9fi54XhKvG+SRMZ4I?=
 =?us-ascii?Q?E2OAvn+oH+t91uMwPq3hdQwwp+ozMxzWsc8Vkuu20WF0D+/mecVrp6e1CCcf?=
 =?us-ascii?Q?klQqFAsW/iD/sTLhrcB2OCpGbjJWLPVg+hedMut5RmV5p8B/nJo+Ic52B8Jn?=
 =?us-ascii?Q?4+KC6Ttv5oG7ZIrhhFinc6u9k4RqBeag5XYKuGXQBZ96NXXUXqTTqJ1TxhF6?=
 =?us-ascii?Q?MJhdEBd885Ni6+Bj9Vbj0EFf5DCLk6+q/5iYho4U2+0vkk6ynf8pxAG4qoRE?=
 =?us-ascii?Q?Xy8MVIJR6qIKdVukGeAugMXwfB5Lb9Ef2j4OY+E35P96Bzsuxde05mm2QORT?=
 =?us-ascii?Q?tmt/36DA2gd9RVTNxyAMsLFmU4mfuun31sGNk31wk5vFxin2kUTJIhsF/7+2?=
 =?us-ascii?Q?XVGLojmjOQo04nyM0OjtNFfQsjRuuUu7IGbWkGJgHeJNpWHnWXgvVHVhuRI7?=
 =?us-ascii?Q?YkKA6POJlYaviIUh3o9aamlq/F4xVyi8nAsFXukonhPmHMqZU1jGtZroGUjU?=
 =?us-ascii?Q?PRd5JdILipYCyC72vlSvylzEj3nS94jfQykeIelfMsDg11o4w8hGxADfq9ix?=
 =?us-ascii?Q?P2LY+aN5U27d5XPSMxRpoukOjH3H23gqsQDHSeiZ4uhQ0RuK7bvUgxHz46Je?=
 =?us-ascii?Q?CsDlbQj+aiB38opuPLC+HhcRHrAyXwliMN/iTjIaJCeKWm6w94wnqKFahrv1?=
 =?us-ascii?Q?6S7iUQUAKV/essdKYPs5L60OtXIDw4BG/ro6+io4VS4VQ28ftp9jNFiTN0Dj?=
 =?us-ascii?Q?fTXsV/qLOOoyL7IjMtQm7b/dfvOwcSQo9NEAhBKZJYQVDu4VcKAbjAg1svSL?=
 =?us-ascii?Q?s12unErArr3YIMPvV2F/D2g6QoGcL2WRKQKnkUsinsM1IeE/cXGGpEm7DuRt?=
 =?us-ascii?Q?hXO11MmcPiQ8rAaNOUHVC1AB259jdy3qnBb1jZv29XLLfd3EhM1ZaGDdPYxN?=
 =?us-ascii?Q?GsXJ/4nXQExegTMSZPXKEtIIrJufQMeWELkNhGAv0zi8Zpz+7ApU1QgIyJgO?=
 =?us-ascii?Q?sAF6yEtjnqAVOy9FF9naWAssol3fQRdz3mrwk/HxTebFcgxBuyvop8lQteIZ?=
 =?us-ascii?Q?i3vUJ7W+FgfeUVH3J35Qeuzn+416uRBZjXy31Z2Lk4IlT6lU7+pNqkU84UHd?=
 =?us-ascii?Q?MIgSMLBMVf+jvaJyte8XJfK5Mc3UyLejOBOUpURVe8U1UxCx?=
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
X-Exchange-RoutingPolicyChecked: qBR+ewxd5ZOrMcJSIrUxTrRuqdnyDF7/LCwrrQlC8rQhLR7tYGsaPFDol01jHKhQxyL6bhmuADEe59vzJFcnqdLoc477F8f/TXs5Vxk/XOSXx7Lyvt+39lUuztKsPIQ5Ut+Hs+djisL22ljmWQ0abFXZGppbYgRCg/P1sat3xUgug5IWX/5bVsuKC7t1DW8zRzL/nfS3dGAU/TyNSOyv8EpIroNAC5bz2rUGEvvwMkbn/RGLlCQdVBlP4fKIhE3D64PK4I378MzEQYeG4hTDvW5+lzM0yRI9cAMpMGVqItaShQmY3KrkLh1Mk8oY3NGhZ6B74wHNYXpz9q5sYKgSFA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8289.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98bfa14-a49f-409f-a8b1-08df43f000cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 14:43:39.3696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mrlFd1m4B98fLR+hSX9mf8u6BUTFMzcaoxvmPY1fskHXi5cjpnlq2m2eFW+6Ek0pTSe52pZur+OcOEOMVmP+Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5970
X-OriginatorOrg: intel.com

Hi Sakari,=20
I think we can integrate the two patches to one.=20
Because I saw one patch is already existing in current codebase. =20
We can submit one patch to change the struct array and support module ID.
Then we can go back to our internal review first.=20
How do you think ?=20

Jimmy=20

-----Original Message-----
From: Sakari Ailus <sakari.ailus@linux.intel.com>=20
Sent: Monday, November 16, 2026 8:31 PM
To: Su, Jimmy <jimmy.su@intel.com>
Cc: linux-media@vger.kernel.org; Yeh, Serin <serin.yeh@intel.com>; vicamo@g=
mail.com; Sapre, Sarang <sarang.sapre@intel.com>
Subject: Re: [PATCH v1 1/2] media: ipu-bridge: extend upside-down matching =
with DSM module IDs

Hi Jimmy,

On Wed, Oct 07, 2026 at 11:49:13AM +0800, Jimmy Su wrote:
> The existing upside-down sensor detection relies on sensor HID matching.
> However, some platforms may source camera modules from multiple vendors.
> While the sensor HID remains the same, camera modules from different=20
> vendors may be mounted in different orientations.
>=20
> Extend the upside-down matching mechanism to support ACPI _DSM module=20
> identifiers. The driver retrieves the module ID from the sensor device=20
> and applies a 180-degree rotation quirk when a matching module ID is=20
> found.
>=20
> This allows platform-specific rotation handling for camera modules=20
> that cannot be distinguished by sensor HID alone.

On second thought -- instead I'd add a second array for module GUID matchin=
g. I think it's cleaner that way. The resulting patches are simpler, too.

--
Regards,

Sakari Ailus
