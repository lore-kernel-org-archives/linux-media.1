Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77D33A9631
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 05:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784526846; cv=fail; b=EoSiIr9ZxsYFp+3RJbshZioaNa5EkY04w22omTmvzPHiZrxxtoMMAgcuVbgCqp00dg/WW3NEZZ5veYYhMFk81hEnJ6TN89VIJ7oFe3PMNj7aZoQc/ku+KlPhQgB3MZxVmrPj/ApCnobNpixfzsewjVvQiImLooILmjdzq3ohviQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784526846; c=relaxed/simple;
	bh=+5eAmUThglPczVYPq2ifFgXuDBHRyO5/+E4JD1M+R24=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=J6N1PZJPp3jdO65ahmkTGAqZVsEZ+s3CjKKX4lifYF3gVaiI5Ei8S60n075VLyT95m21dFVrpvOyXUCSOTvZcSjDdnD44ayHwFVTLe8ETDCTna7KGY+8/52hQH2/nHeae/l/LFIX4tdZGxIgBy3Jf8d/4DWBK6IJUiVysoOzJyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivtuwc9R; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivtuwc9R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784526840; x=1816062840;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+5eAmUThglPczVYPq2ifFgXuDBHRyO5/+E4JD1M+R24=;
  b=ivtuwc9RyoJIoScbhE8UiuytVE2hErIM5SszqB4jD+IxJ73Yp0HlYrlc
   uz3st/RVlk35iUAEQPcOuZjWFYCh8naLZ2zqqtgLdgeFtJzqyafal87wR
   i2QRdLiOxnxcWnECeiz+55t8QMzkDANWVEFrtt28q8Dim/RCootNIyodm
   6iSnUiD90IpVHqDxC7RNhZ/1pDUvcbTSHIkO+jnTPoJvv/BY9wsQ4O0A3
   yzO0zYX1+85YLrKrpyMdgA5VA4Z9+umRDkrPXh/nPmm2uUnvIAHSGjqCf
   Ps4giha1NTgPyEMpV2yMJ7fY9iYwfrhiVKpFqU9/Fzxavt4CC7bfJ0qun
   w==;
X-CSE-ConnectionGUID: BzIcm0btQdGVs4Z61UULbQ==
X-CSE-MsgGUID: c0brvx7iQB2suaKBQ+JvoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="87637037"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="87637037"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 22:53:54 -0700
X-CSE-ConnectionGUID: nbQjsvIOTf+ai6W0qtCcbg==
X-CSE-MsgGUID: 4RzoBaoQTHWrRBS+hyl5fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="256790245"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 22:53:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 22:53:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 19 Jul 2026 22:53:53 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 22:53:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maM6xW90KU34NKSOwkQ1SljXRRB9edDTSUucV8uMayL89xbsxKqUZ8H+XlPzmbAK28ycpAI8bmY7JwjF7xc1Flf29GWSEw6x4A++3Vty7RfVCRE7G1F0+cqiEzycMSHz+xc7Tl/uPAf2hNaxD/jFm0t2wC/oXjrtkHj4jbpUoNTC08dD0cYvSsYqRcN71qiR+iFapfjDj/rFDu7iInsBJG3Dtda629S64HT/hHiY5D6jBtvKOMlJAE08YCtotxl2YedgFblNoOMvJWRwYywOad7AQF9loH6n6SS9KGuxDylPNn3Xh9fkkB8DVp3c7EuH1H94DI6kcPVVjZh0787ymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5eAmUThglPczVYPq2ifFgXuDBHRyO5/+E4JD1M+R24=;
 b=t3YCsTRSsYHtjU9IfogTJgg9qO4wdOL2hVtYltqac38ISwaFnPHbKQqxatSvsaSeMVRuA63tzGZKgY2BlhEq3taBnABAW9BJ0W043aE117mT1NkLVN8HD4iPGWIAUD91lSGSUJwTuJjBSNepJ4E+g0AcEdcS4W1FIASoKMoAll2eNsEPKjc9AKxTSYNungnaxQ/sMpbHHF/nMxJUoByN99inStAh6MOeyokBSfa0WOU63hFDTrqE5e/+5K9P6i7uD2UenYSDyVSeHQXy3nkNqiaK4lVKwef/WxYZ0pxzsTL3uQrcva59qMeh6ysIq7BkdgVMDsBa011t1tBuz8qUGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7962.namprd11.prod.outlook.com (2603:10b6:510:245::7)
 by PH9PR11MB821391.namprd11.prod.outlook.com (2603:10b6:510:3e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 20 Jul
 2026 05:53:46 +0000
Received: from PH7PR11MB7962.namprd11.prod.outlook.com
 ([fe80::9fbb:28a:d5f0:7cf8]) by PH7PR11MB7962.namprd11.prod.outlook.com
 ([fe80::9fbb:28a:d5f0:7cf8%4]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 05:53:45 +0000
From: "Yeh, Serin" <serin.yeh@intel.com>
To: Bryan O'Donoghue <bod.linux@nxsw.ie>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "Su, Jimmy"
	<jimmy.su@intel.com>, "Sapre, Sarang" <sarang.sapre@intel.com>
Subject: RE: [PATCH v2 1/2] media: i2c: ov8856 : remove ACPI node bypass
 mechanism
Thread-Topic: [PATCH v2 1/2] media: i2c: ov8856 : remove ACPI node bypass
 mechanism
Thread-Index: AQHdAuvwHOhqN609oEyBIY16++QDgLZMAGqAgCC8KrA=
Date: Mon, 20 Jul 2026 05:53:45 +0000
Message-ID: <PH7PR11MB7962C4FE368856857E5D21CBF6C32@PH7PR11MB7962.namprd11.prod.outlook.com>
References: <BPkAfNBWv3FtV-5v-zRwnqX_ASShq9wG6NhI7ftYKii_3qF0KxcdaxS31MAkVKB7zlAUoLQQXAaef5p2Qpn4LA==@protonmail.internalid>
 <20260623084536.3400318-1-serin.yeh@intel.com>
 <d9b110be-a14b-4fbe-bf2d-036f3cd922a6@nxsw.ie>
In-Reply-To: <d9b110be-a14b-4fbe-bf2d-036f3cd922a6@nxsw.ie>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7962:EE_|PH9PR11MB821391:EE_
x-ms-office365-filtering-correlation-id: 90b6b082-6350-4b27-53de-08dee623432e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|6133799003|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: va7hIYxfDSr9TDBH88f5XUfbGK0+gonkm80JvK0vNMHy5EZeD5676ICF9aiwvNyxXUVBIf3FrPB9ULMtxHsk0dGMA8ZeEfCYiU/tjzc87XNjSIN7bhp++wdU9CuEOJ2hcRTPY9ND2Pc6ZTpXXLmYP/nKkcjyY9dtuIqK9dA0MerUxK96SO6ixxu9dXfr+L3yUIWkvkQ0BzymjJd67FKNlMPZ3B8FBRq8gRxZiO68fjprDzaja8vrCG88dO7kp8kwvw3DuZgj6FKc+1hxaGyLunA3qXm1TgY7KBYfMCUqmNgFU+wOtJwuPW+iVPOiiYCNumlLQXnJNCS+HTdw8ZDQrkx4ni8H5FvS7fW/wavbxigfglrR8IzsPbcVSzkCo5S7y661kADqqx3AnnINPg2y1U53zNFmzfpnFXYRJYGHkkihL8sllR6nia9GFMNoncif3NcMju+nFzhhnhu3pmQqa2YsBd+UDbG9mzQX2/OY3n2PSwWiBA1RHjZ3/fxP0wE9zEcwUvxs8bKN19hOTRTm1+9+xTgcTJEufYfq7ZKLJw5Sl/H4MH4QEooLCHvHfKmUPK+FyqoQlX3OsnxpaBPVG2Jze8awEBEVwGdJQfR45t3lMHGsmmqe17TmQP3l5fux7FOKQTyt1WVUUma1SF9DDFCDj0ZMA0VE6dAYjjunIGWJMIHk2lyMjqSS7tB0n9Vbp0Q1k3IgU4bYCPyid/pWj8cZc7Xly3MqNbhCfS+B/Vo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7962.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVBtcEZiZFl4WDJqU3VxVEtleVFYTFFzQlpSVWFFZEZnRUhNNEI1bVIyZUg1?=
 =?utf-8?B?MFVXeEhIMEc0ZG8welVYTWJ1R0U0ZTRpRmhmWUgxSkV0dG1kZGRWOS9GZDU1?=
 =?utf-8?B?UXdrQmJqZ21pSHlyVU5XSGZTRzRzZHNZbS9BRk52WlQ5RFdZc2Q4U1duTjZj?=
 =?utf-8?B?UkYzWHJ3eFFIVm1CVlhwVi84TUVxVXVHTTQrVkFFUk94RGlOZXBiWG9vRDBs?=
 =?utf-8?B?aWMrbk44bFYvMmhCTHA4OXBqeUhRWEp2T3NtcUYrSWJMYkhCUGlWQ1FzMzdB?=
 =?utf-8?B?aFdaLzFHUHlPZVZhUHlIcWU3dU1SMkdib2pLYi9vT3IrS21EblJlRjNJK2dR?=
 =?utf-8?B?TGhZbmtPaUs5TWJmdmJ0M2hMekZQSGVrY1dkZFNIdFYrR0tZY1U2d2JOR1gx?=
 =?utf-8?B?SDRaWjV2RW5XbCtoRlVxNU5IQ2RveTlMbzRRNjdvVlNTdmRzaEFGc3lLNFdB?=
 =?utf-8?B?YXFUK0NtWmFSTUVPSjZ0QWlxTFY5Z2NPNDdwN3RhdGx3M2ZLRjRtenEyaVJE?=
 =?utf-8?B?eDEyaXREekRzYzVKSzFFdG9CS0VkaGRiTGZZUVg4cGZ5UGM4MXp3NzEzRWo5?=
 =?utf-8?B?YlBhMDRJM3g3UjNGSk85V3JLWmM0ak5SSkJiZ2F3SlhVNWJaa0JOemNVYm13?=
 =?utf-8?B?bXNiQWlwTEw4bGNQOGlrYWxFVGhWbk8yQUtRNktHWk5vdTN0Z3F4NVJrYms3?=
 =?utf-8?B?Q3F3anpKWGZGSVJjc3g3a01EWlFJejJPMEYrejczV2FvcjBnVFdjc00zVllQ?=
 =?utf-8?B?cmVjMDBPblptVHBSS2w0ZlRzejZISUVscDNmbWF4WFFsaTdBWXdneWtjK1Ix?=
 =?utf-8?B?NWJXaklKT1NBaHJxSTRNVzFZSnJBeTFNelBHUit0cW9mNGJjR2RqTEVRY3pt?=
 =?utf-8?B?NkwrS3ZhRTN0cUR1MGhDNTdkQktKY2F5bG9HcWlFUkFGQWJ3K3p4RDZZS1lQ?=
 =?utf-8?B?SmFVaW1UNjhYOVFWSUR2M1ppVUk5SzJtUlhpd3BRTGxLUThVSFJmV0d5Z2Ev?=
 =?utf-8?B?Si9GMkphQ0xaQ3kraXF3SzRxQUJJQ1FMU2hTNzlhYXp5dmtGWUEvVllBOWV6?=
 =?utf-8?B?RzhtaW53SWF0WUVSa01wL3o5M0g3NDJHYndYYXpZMlFrVHRBbjYxSEFZZXJ4?=
 =?utf-8?B?UFU2VXJTWjBNMVF1SFJaalVXMXMvRi9FRTZQQ1JCeDJIczVGOFh5RFJrWjJl?=
 =?utf-8?B?QmJyZmtZQmgvVWdhenJkRCtmZUJXYXdXRHl1TjAvRU1YZDFkdFBMS3Y1WXdD?=
 =?utf-8?B?NDd1eThtVXhBeUJNVHpwa01EaTBJYVp5Zm1mWVhDaGlMT0VlUmhqNVAxOGhR?=
 =?utf-8?B?ekhkNEU2cUVieTYwWEN4ZG53bW1xTVhpUFlqUzEzV085UjZKa0grTVFWMGIx?=
 =?utf-8?B?NmsycFVvYjBoOXUwc2t2bU05aCtVRWJWK3RmdmRNVTFrZUpUYmJNRG9TRnpM?=
 =?utf-8?B?Mjd4OXM0WjVSOGlBZGswbjlIL0MwcGlEQVRaTEdKVm14a3BSdVlHT3VTUk9x?=
 =?utf-8?B?eEVUUHNnaEhhUFhCUVJ5Zk8zNTdBRG9EZ3pCejh3WE53cGhpSERSeStnZ3Jt?=
 =?utf-8?B?WTBRcUpGMHlRS1A3RnVUY2lxR28wZlVDM09yNHhwYUZ1WUx1RXpVUWJGdzhU?=
 =?utf-8?B?K3NrOVJoYnluS1FDL0UvcFJYZzZhVENmTmNPY01FdE1MQUM1Rm9hZ1hXOVg5?=
 =?utf-8?B?RzU5TzdWYUZNU053N2N6czhPbnFBYXl2SmpEY3RkUWNQZ3BtNmVnck92dk5F?=
 =?utf-8?B?V1d1dytZOXBPTUpUQnNtSEJoaUZaNi9Cb1cvVllVWU1tQ01GSDF0ektuRUhE?=
 =?utf-8?B?VTFkdFZ3UWZ3alJ4NFhZQ0Q2WDRXTkFqQUtOc3hqMlY0YmcrSnNFcE1aVnVh?=
 =?utf-8?B?YUhRVG1lWXc5andiSm5rS2NjazNiaTZia3l1SHBmYjgzU3hrL25Qa0dpc01p?=
 =?utf-8?B?MHVCaFUrZjdoTWlKaFFYWkM4QVdGN0UzNTVGU1VFc0w2NWRkUWkvRmEvZGRm?=
 =?utf-8?B?QjMyV3lxYXRHWUV6SHNRK1ZzWFJvSHFyWEd1YkNqcDVEZFQ0NmdCQ1JUNUdr?=
 =?utf-8?B?N0o3Uk41VC9sWFMweTIwV25iZGFVZ05JRXE4YnUwNEN4OFhzK1dkVG1vVXpP?=
 =?utf-8?B?bURaNGIwR0hrNGdwRE1iZkZzMXg5a3NYaVJxMFdFbmNOaWhkVUFNNXR1RTJP?=
 =?utf-8?B?b0NGL3JodEM2aXhDZkpGYSs1SjUyc05iNWVpTWIyUUY2bitKL2JncnljVWp0?=
 =?utf-8?B?cXB4Y1NTbWErRkd5amxWdUxCd01yc1QzRDBaSE1PTHZ2QWY2UlVJQ2xzQmRD?=
 =?utf-8?B?ano0Vlp5Ukk5NEVmM0VNUnhOVC9walpsRzFCTzd1V2hQNHJaMFVKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: NKVxeDC9nXtLzfiyvgi0uEZi+ES06mOMvr5J0F64+8jbmeeLgjDS8n4Bg3piBWR6cuF4oiZa2pSjLIRk1Tx9I5kBLniOTOcGkiM/uRWWGVU1TEZFFADEJuWDwHgX6KbiPSdelsLPgtYV/dzyl/61qGEiRMFAVaU7X0BSWbr/Ps6IshNVzG6GflrJD2qf10/RlX7bDvjfd3G1AgrILjBKAKItr1nFu+aArSCjCJqgRz82EilGp5f+AhGDK/aE0Is3v7s1pttgiCmqhXnlP3rCoMy/q0Fsbqd2nvN9Olksw2h2x6dYL4e4tVxKit+KkS0DLoQI/MmjMmoiognG1BykFw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7962.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b6b082-6350-4b27-53de-08dee623432e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 05:53:45.7974
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNcYVtzLZmGqJW959CO1Lte8wODGhkjg4gm16pfJCIn/yEaIw2maJu2LH/Gtxkr9y5gMxiMbfkO/qLFmo0vhAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB821391
X-OriginatorOrg: intel.com

SGkgQnJ5YW4sDQoNClRoYW5rcyBmb3IgdGhlIHJldmlldy4NCg0KPj4gIE9uIDIzLzA2LzIwMjYg
MDk6NDUsIFNlcmluIFllaCB3cm90ZToNCj4gPiBUaGUgZHJpdmVyIGN1cnJlbnRseSBza2lwcyBw
b3dlci1vbiBhbmQgcG93ZXItb2ZmIHNlcXVlbmNlcyB3aGVuIA0KPiA+IHJ1bm5pbmcgd2l0aCBB
Q1BJIGRldmljZXMgYnkgY2hlY2tpbmcgaXNfYWNwaV9ub2RlKCkuIFRoaXMgcmVzdWx0cyBpbiAN
Cj4gPiBhbGwgcG93ZXIgY29uZmlndXJhdGlvbiBzdGVwcyAoR1BJTywgYW5kIHJlZ3VsYXRvcnMp
IGJlaW5nIGJ5cGFzc2VkLg0KPiA+IA0KPiA+IFJlbW92ZSB0aGUgaXNfYWNwaV9ub2RlKCkgY2hl
Y2tzIHRvIGVuc3VyZSB0aGF0IHRoZSBmdWxsIHBvd2VyIA0KPiA+IHNlcXVlbmNlIGlzIGFsd2F5
cyBleGVjdXRlZCByZWdhcmRsZXNzIG9mIHRoZSBmaXJtd2FyZSBpbnRlcmZhY2UuDQo+IA0KPiBT
aW5jZSB5b3UgYXJlIHN1Ym1pdHRpbmcgYSBidWdmaXggeW91IG5lZWQNCj4gDQo+IC0gRml4ZXM6
DQo+IC0gQ2M6IHN0YWJsZQ0KDQpBZ3JlZWQuIEluIHYzIEkgd2lsbCBhZGQ6DQogIEZpeGVzOiBb
IGQyZmExMTM0YTQ4YjEgXSAoIm1lZGlhOiBpMmM6IG92ODg1NjogVXNlIFY0TDIgbGVnYWN5IHNl
bnNvciBjbG9jayBoZWxwZXIiKQ0KICBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KDQo+IFRo
ZSBxdWVzdGlvbiBpcyBob3cvd2h5IGlzIHRoaXMgYSBidWdmaXggZm9yIHlvdSA/IEFyZSB5b3Ug
c3VwcGx5aW5nIHRoZSBhcHByb3ByaWF0ZSByZWd1bGF0b3JzIHdoaWNoIGFyZSBkaXNjb3ZlcmFi
bGUgYW5kIHVzYWJsZSBvbiBhbiBBQ1BJIHN5c3RlbSA/DQoNCkxldCBtZSBnaXZlIHRoZSBiYWNr
Z3JvdW5kLiBUaGUgc2Vuc29yIGlzIGVudW1lcmF0ZWQgdmlhIEFDUEkgb24gYW4gSW50ZWwgaG9z
dCwgYW5kIGFuIElOVDM0NzIgImRpc2NyZXRlIiBjb21wYW5pb24gZGV2aWNlICh0aGUgcG93ZXIt
bG9naWMtY29udHJvbCBkcml2ZXIsIA0KZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3
MikgcHJvdmlkZXMgdGhlIHNlbnNvcidzIHBvd2VyIHJlc291cmNlczogaXQgcmVnaXN0ZXJzIHRo
ZSByZXNldC9wb3dlcmRvd24gR1BJT3MgYW5kIHRoZSByZWd1bGF0b3Igc3VwcGx5Lg0KVGhlc2Ug
YXJlIHRoZXJlZm9yZSBkaXNjb3ZlcmFibGUgYW5kIHVzYWJsZSB0aHJvdWdoIHRoZSBzdGFuZGFy
ZCBncGlvZCAvcmVndWxhdG9yIGxvb2t1cHMgYXQgcHJvYmUgdGltZS4NCg0KV2l0aCB0aGUgaXNf
YWNwaV9ub2RlKCkgY2hlY2tzIGluIHBsYWNlLCBvdjg4NTZfZ2V0X2h3Y2ZnKCkgbmV2ZXIgcmVx
dWVzdHMgdGhlIHJlc2V0IEdQSU8gb3IgdGhlIHJlZ3VsYXRvcnMsIGFuZCBvdjg4NTZfcG93ZXJf
b24oKS9fb2ZmKCkgcmV0dXJuIGVhcmx5IHdpdGhvdXQgcnVubmluZyB0aGUgcG93ZXIgc2VxdWVu
Y2UuDQpUaGUgc2Vuc29yIGlzIHRoZW4gbmV2ZXIgYWN0dWFsbHkgcG93ZXJlZC9yZXNldCBieSB0
aGUgZHJpdmVyLCBzbyBwcm9iZSBmYWlscyB3aGVuIHRoZSBkcml2ZXIgZmlyc3QgdGFsa3MgdG8g
dGhlIGNoaXAgKHRoZSBjaGlwLUlEIHJlYWQgaW4gb3Y4ODU2X2lkZW50aWZ5X21vZHVsZSgpKS4g
DQpSZW1vdmluZyB0aGUgY2hlY2tzIG1ha2VzIHRoZSBBQ1BJIHBhdGggcnVuIHRoZSBzYW1lIHNl
cXVlbmNlIGFzIERULCBhZnRlciB3aGljaCB0aGUgc2Vuc29yIHByb2JlcyBhbmQgc3RyZWFtcyBj
b3JyZWN0bHkuDQoNCj4gSWYgc28gd2hpY2ggb25lLiBNb3JlIGRldGFpbCBpcyByZXF1aXJlZCBo
ZXJlLiBZb3UnbGwgbmVlZCB0byBkZXRhaWwgaG93IG9uIGV4aXN0aW5nIEFDUEkgcGxhdGZvcm1z
IHRoaXMgY2hhbmdlIHdvbid0IHJlZ3Jlc3MgaS5lLiBwcm92ZSB5b3UndmUgdGhvdWdodC90ZXN0
ZWQgYWJvdXQgdGhhdCBvciBhc2sgZm9yIHRlc3RlcnMgdG8gdmFsaWRhdGUgdGhlIGNoYW5nZS4N
Cg0KSSBoYXZlIHZhbGlkYXRlZCB0aGlzIG9uIExlbm92byBkZXZpY2VzIGJhc2VkIG9uIHRoZSBJ
bnRlbCBwbGF0Zm9ybXMgd2l0aCBkaWZmZXJlbnQga2VybmVsIHZlcnNpb24oNi4xNyBhbmQgNy4w
KSwgd2hlcmUgdGhlIHNlbnNvciBub3cgcHJvYmVzIGFuZCBzdHJlYW1zOyBwb3dlciBvbi9vZmYg
YW5kIHJ1bnRpbWUgUE0gYmVoYXZlIGNvcnJlY3RseS4NCg0KPiA+IEFsc28gZml4IGEgZGVidWcg
bWVzc2FnZSB0byByZXBvcnQgdGhlIGFjdHVhbCBudW1iZXIgb2YgQ1NJIGRhdGEgbGFuZXMgDQo+
ID4gZnJvbSB0aGUgcGFyc2VkIGJ1cyBjb25maWd1cmF0aW9uIGluc3RlYWQgb2YgY3VyX21vZGUu
DQo+IA0KPiBUaGlzIHNob3VsZCBiZSBhbmQgaXMgaW4gYSBzZXBhcmF0ZSBwYXRjaCwgc28gZHJv
cCBmcm9tIHlvdXIgZ2l0IGxvZy4NCg0KQWdyZWVkLCBJIHdpbGwgcmVtb3ZlIHRoaXMgc2VudGVu
Y2UgaW4gdjMsIGFzIHRoaXMgY2hhbmdlIGhhcyBhbHJlYWR5IGJlZW4gc3BsaXQgb3V0IGFuZCBp
cyBjb3ZlcmVkIHNlcGFyYXRlbHkgaW4gcGF0Y2ggMi8yLiANCg0KPiA+IA0KPiA+IFdpdGggdGhl
c2UgY2hhbmdlcywgdGhlIGRyaXZlciBiZWhhdmVzIGNvbnNpc3RlbnRseSBhY3Jvc3MgRFQgYW5k
IEFDUEkgDQo+ID4gcGxhdGZvcm1zIGFuZCBlbnN1cmVzIGNvcnJlY3QgaGFyZHdhcmUgaW5pdGlh
bGl6YXRpb24uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogU2VyaW4gWWVoIDxtYWlsdG86c2Vy
aW4ueWVoQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvbWVkaWEvaTJjL292ODg1
Ni5jIHwgMjkgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y4ODU2LmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjg4
NTYuYyANCj4gPiBpbmRleCA4YmVkYjQ3Y2Q3Y2YuLjlkMmIwNDY5YTU3NiAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL21lZGlhL2kyYy9vdjg4NTYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEv
aTJjL292ODg1Ni5jDQo+ID4gQEAgLTIwODIsOSArMjA4Miw2IEBAIHN0YXRpYyBpbnQgb3Y4ODU2
X3Bvd2VyX29uKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgIAlzdHJ1Y3Qgb3Y4ODU2ICpvdjg4
NTYgPSB0b19vdjg4NTYoc2QpOw0KPiA+ICAgCWludCByZXQ7DQo+ID4gDQo+ID4gLQlpZiAoaXNf
YWNwaV9ub2RlKGRldl9md25vZGUoZGV2KSkpDQo+ID4gLQkJcmV0dXJuIDA7DQo+ID4gLQ0KPiA+
ICAgCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShvdjg4NTYtPnh2Y2xrKTsNCj4gPiAgIAlpZiAo
cmV0IDwgMCkgew0KPiA+ICAgCQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byBlbmFibGUgeHZjbGtc
biIpOyBAQCAtMjEyMCw5ICsyMTE3LDYgQEAgDQo+ID4gc3RhdGljIGludCBvdjg4NTZfcG93ZXJf
b2ZmKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgIAlzdHJ1Y3QgdjRsMl9zdWJkZXYgKnNkID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gICAJc3RydWN0IG92ODg1NiAqb3Y4ODU2ID0gdG9f
b3Y4ODU2KHNkKTsNCj4gPiANCj4gPiAtCWlmIChpc19hY3BpX25vZGUoZGV2X2Z3bm9kZShkZXYp
KSkNCj4gPiAtCQlyZXR1cm4gMDsNCj4gPiAtDQo+ID4gICAJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNs
ZWVwKG92ODg1Ni0+cmVzZXRfZ3BpbywgMSk7DQo+ID4gICAJcmVndWxhdG9yX2J1bGtfZGlzYWJs
ZShBUlJBWV9TSVpFKG92ODg1Nl9zdXBwbHlfbmFtZXMpLA0KPiA+ICAgCQkJICAgICAgIG92ODg1
Ni0+c3VwcGxpZXMpOw0KPiA+IEBAIC0yMjkzLDIxICsyMjg3LDE4IEBAIHN0YXRpYyBpbnQgb3Y4
ODU2X2dldF9od2NmZyhzdHJ1Y3Qgb3Y4ODU2ICpvdjg4NTYpDQo+ID4gICAJCWRldl93YXJuKGRl
diwgImV4dGVybmFsIGNsb2NrIHJhdGUgJXUgaXMgdW5zdXBwb3J0ZWQiLA0KPiA+ICAgCQkJIHh2
Y2xrX3JhdGUpOw0KPiA+IA0KPiA+IC0JaWYgKCFpc19hY3BpX25vZGUoZndub2RlKSkgew0KPiA+
IC0JCW92ODg1Ni0+cmVzZXRfZ3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKGRldiwgInJl
c2V0IiwNCj4gPiAtCQkJCQkJCSAgICAgR1BJT0RfT1VUX0xPVyk7DQo+ID4gLQkJaWYgKElTX0VS
Uihvdjg4NTYtPnJlc2V0X2dwaW8pKQ0KPiA+IC0JCQlyZXR1cm4gUFRSX0VSUihvdjg4NTYtPnJl
c2V0X2dwaW8pOw0KPiA+ICsJb3Y4ODU2LT5yZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0
aW9uYWwoZGV2LCAicmVzZXQiLA0KPiA+ICsJCQkJCQkgICAgIEdQSU9EX09VVF9MT1cpOw0KPiA+
ICsJaWYgKElTX0VSUihvdjg4NTYtPnJlc2V0X2dwaW8pKQ0KPiA+ICsJCXJldHVybiBQVFJfRVJS
KG92ODg1Ni0+cmVzZXRfZ3Bpbyk7DQo+ID4gDQo+ID4gLQkJZm9yIChpID0gMDsgaSA8IEFSUkFZ
X1NJWkUob3Y4ODU2X3N1cHBseV9uYW1lcyk7IGkrKykNCj4gPiAtCQkJb3Y4ODU2LT5zdXBwbGll
c1tpXS5zdXBwbHkgPSBvdjg4NTZfc3VwcGx5X25hbWVzW2ldOw0KPiA+ICsJZm9yIChpID0gMDsg
aSA8IEFSUkFZX1NJWkUob3Y4ODU2X3N1cHBseV9uYW1lcyk7IGkrKykNCj4gPiArCQlvdjg4NTYt
PnN1cHBsaWVzW2ldLnN1cHBseSA9IG92ODg1Nl9zdXBwbHlfbmFtZXNbaV07DQo+ID4gDQo+ID4g
LQkJcmV0ID0gZGV2bV9yZWd1bGF0b3JfYnVsa19nZXQoZGV2LA0KPiA+IC0JCQkJCSAgICAgIEFS
UkFZX1NJWkUob3Y4ODU2X3N1cHBseV9uYW1lcyksDQo+ID4gLQkJCQkJICAgICAgb3Y4ODU2LT5z
dXBwbGllcyk7DQo+ID4gLQkJaWYgKHJldCkNCj4gPiAtCQkJcmV0dXJuIHJldDsNCj4gPiAtCX0N
Cj4gPiArCXJldCA9IGRldm1fcmVndWxhdG9yX2J1bGtfZ2V0KGRldiwgQVJSQVlfU0laRShvdjg4
NTZfc3VwcGx5X25hbWVzKSwNCj4gPiArCQkJCSAgICAgIG92ODg1Ni0+c3VwcGxpZXMpOw0KPiA+
ICsJaWYgKHJldCkNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiANCj4gVGhpcyBsb29rcyBsaWtlIGEg
bGVnaXRpbWF0ZSBmaXggb24gaXRzIG93bi4NCj4gDQo+IFlvdSBzaG91bGQgYnJlYWsgdGhpcyB1
cCwgaW50byBhIHNlcmllcyBhbmQgcHJvdmlkZSBtb3JlIGRldGFpbCBvbiB3aGF0IGlzIGdvaW5n
IG9uIGJvdGggaW4gdGhlIG92ZXJ2aWV3IGFuZCB0aGUgaW5kaXZpZHVhbCAzLTQgcGF0Y2hlcyB0
aGVtc2VsdmVzLg0KPiANCg0KWWVzLCBJIHdpbGwgYWRkIGEgY292ZXIgbGV0dGVyIHRvIGRlc2Ny
aWJlIHRoZSBkZXRhaWxzIG9mIHBhdGNoZXMuDQoNCj4gPiAgIAllcCA9IGZ3bm9kZV9ncmFwaF9n
ZXRfbmV4dF9lbmRwb2ludChmd25vZGUsIE5VTEwpOw0KPiA+ICAgCWlmICghZXApDQo+ID4gLS0N
Cj4gPiAyLjI1LjENCj4gPiANCj4gPiANCj4gDQo+IC0tLQ0KPiBib2QNCg==
