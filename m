Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688D2233945
	for <linux-media@vger.kernel.org>; Mon, 27 Jul 2026 02:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119653; cv=fail; b=WV7dDHu3dv47Ubm32fNBOmtgqbnYuxm618tkt7HaJg58g9vMpvkdHWixZ9Uorr3jZy6sna/PfPbkb0aep5hgk0Mu5URh/yIRKsD9sdzyYQhBC2POXKRx/Tj+1n+hvDIEAxSwYujk35aZUnUVAsU5TVbvkTGnchBEa875FdvI48A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119653; c=relaxed/simple;
	bh=FOXEg3QJBWuZ5OhufO0GvMPsFo/NATViU99faMzzIcs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fY1TMmzbViPUNAi2vnlGHFY/GRpg7Sa3kMRR1sf/f+4pTmdgKDDpJKHFkkKA22AQwXnNKtHoysSHMdbgvFawF9NseXbnwf7cscChLfPzX2lu42RuOrX4xFqVjsqseFJFLuaRxC0Vde19jYrwNYqKZ+48rIhtC1PGhiRb17KniJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrT2IzUE; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrT2IzUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785119650; x=1816655650;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FOXEg3QJBWuZ5OhufO0GvMPsFo/NATViU99faMzzIcs=;
  b=mrT2IzUE8ba54UNuTjRzf1VShc2qNE+/77odlA6T8MVzFPO6rNvKCDl0
   GVzbDa3AzeYIiu8J27JW7mw4e4MVQMl2BXyw1JjKgFW65rD8ci00lU0Kp
   wGqVIQcP7C0Z8DFkspt3eaLZP78XsuELYUaj0Y0wwiqVPUNymtr7ifPkh
   NfFVxirktqo+WPgthTN00vvZ49BJAz3RGJ9+iyNKFJaGQowZiYUcyg7sm
   NjalEAlJFU9McQiKxogvZWuhZ/rGsgdLnniyF0ZJyNRTY7yowy/LqtgOd
   nGBxhEYrcmhHHsd2QMfbnbt2tJ8+kmrfk0ZLRfFVfXjIxvp8QDd20xxoc
   A==;
X-CSE-ConnectionGUID: 3mu7kVBMQqasuk2HWhbwyw==
X-CSE-MsgGUID: kCxzGb6OTTiG46C2inSBXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="85626492"
X-IronPort-AV: E=Sophos;i="6.25,187,1779174000"; 
   d="scan'208";a="85626492"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 19:34:10 -0700
X-CSE-ConnectionGUID: EvXPQWV8SdiNAU5zFLImdA==
X-CSE-MsgGUID: GjutBieqQ7SzBRRlXk0XPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,187,1779174000"; 
   d="scan'208";a="283793667"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 19:34:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 26 Jul 2026 19:34:09 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 26 Jul 2026 19:34:09 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 26 Jul 2026 19:34:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KbEHl8xdzbVTw+RFjiAHgEyOyyDuOhMpvP2muZnN5TGnvO8m7x1HnVz/A+Hf59+V1UtGcT6Oaa9FBAbC1tAMQ/w3FVWYwA28vHRllXAroknCUUKVURa7UBx6iV0au5tHpnrc2KCVfymIFb0EBosQ/wvaXCd07k0ww4imF6sI5e8PLvbyCg25Ppj2P/Y4t45h07eEX9eDTZBAlagtvudXZBUwIfm6TnX+DyvOPvTs6TxCYFKaBCC/jsC9B5sm3U995ul9yB6KCqsV4d/TmKGcMNT6eMKxSbuYgnEGPcSMr2FPtEG5Us2uO4+h/D1jNiYbRKUIqyqyWZQwT0P9WHsE4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FOXEg3QJBWuZ5OhufO0GvMPsFo/NATViU99faMzzIcs=;
 b=bbiUUBwWqCSE0I3h3usvl28CGqqiuRZ7hqPY45ABP/p/hKtFT2rF3+qvLnL6KUseZtqFZvKE+gwv2N/NTPMCO9E1gKovYIgut32I3SaSrv8RqNywZOYaQz9RJS+PGbwFZeuvT3xb1SiRywrC2e45takX+Dnr9KNQCNqtcErBHW6d7RwRpZJE6tTcFzqsQUvm9pqWmM8oYptX9gN+RdDYYRcDou4TKfZy8pTPZ2/CRkkHmcbCsiuIHuPo618Cb7Wbu5VEp2c/wLOGZHm+2lZtMqJCKTw7jYWgD1cCJptDMxE+0CvgFDQLcf9YK6ArWMh5BsiJnLaoWgHwRAJbU4l8aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 02:34:06 +0000
Received: from DS0PR11MB7971.namprd11.prod.outlook.com
 ([fe80::40aa:a291:4c25:6e0a]) by DS0PR11MB7971.namprd11.prod.outlook.com
 ([fe80::40aa:a291:4c25:6e0a%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 02:34:06 +0000
From: "Yeh, Serin" <serin.yeh@intel.com>
To: Bryan O'Donoghue <bod@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, "Su, Jimmy"
	<jimmy.su@intel.com>, "Sapre, Sarang" <sarang.sapre@intel.com>
Subject: RE: [PATCH v2 1/2] media: i2c: ov8856 : remove ACPI node bypass
 mechanism
Thread-Topic: [PATCH v2 1/2] media: i2c: ov8856 : remove ACPI node bypass
 mechanism
Thread-Index: AQHdAuvwHOhqN609oEyBIY16++QDgLZMAGqAgCC8KrCACYgygIAKlR+A
Date: Mon, 27 Jul 2026 02:34:06 +0000
Message-ID: <DS0PR11MB79711DBEBF6B41481C20D630F6CC2@DS0PR11MB7971.namprd11.prod.outlook.com>
References: <BPkAfNBWv3FtV-5v-zRwnqX_ASShq9wG6NhI7ftYKii_3qF0KxcdaxS31MAkVKB7zlAUoLQQXAaef5p2Qpn4LA==@protonmail.internalid>
 <20260623084536.3400318-1-serin.yeh@intel.com>
 <d9b110be-a14b-4fbe-bf2d-036f3cd922a6@nxsw.ie>
 <nwsGXSUCUOLmR7tbtAgvOc3Cvog_0QqnFUI9jev6FLOxt0Cyf6D8gYfJT6XUWuvzYFvsYgGrp21TCTKGQ4Mm5w==@protonmail.internalid>
 <PH7PR11MB7962C4FE368856857E5D21CBF6C32@PH7PR11MB7962.namprd11.prod.outlook.com>
 <681bd27e-d58b-4b2f-b65d-49f3b2c01bc2@kernel.org>
In-Reply-To: <681bd27e-d58b-4b2f-b65d-49f3b2c01bc2@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7971:EE_|CO1PR11MB4979:EE_
x-ms-office365-filtering-correlation-id: 3889c89e-d15a-49ac-cf54-08deeb8787b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|6133799003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: 7YCivrv2BWTvpSOU+n1sM/37PHAHMRNA4f+Q99rJ51BcuBBaHG9mPQ/9wmcKc4IDGh/EIvA9yKyJI8LE9Z3PuA9/RvKITUG7LNiXQxHATujrQfigrlFr3fmNuXjc/IfV9T+78ZZfA3CYtmSoX/WPmgCb9V30J3CbFb26ww89g82mkGzRp8IqOpms+wBtzLJBgzNfv1BhnKqoZcDE/4+9VjaI8tcvTLyfSEZWU+eu9zaD7CYZAQmbEHh4be8jbSTpgiVW91UH889Xcgq8gMf6IzjBbMEjoJYUIwou+23+25C8qIHTxunuE7EYyRxzUhSUA15OeDV3u0XuKPXMzNxJMEQ4PoCrIVbgXkiqextZoaejkT7Vy1izDzZRxeHUgAG37UPgv8VGitep7ZDw/z8OAUNdKMJiNmRx0KowRAVIZ3reZzp0hxi0pjnO4W+AQwuLkjsXu6iB+pOFe1gaEh23dqxFDvLv1381m5y/Ndc6B8Jx/hqCee3/r555XbgazPBO5RxIiEcn8BSBu1IJrY080ZG/joxdng+wy1lmlrMOkGmj+LsLV7vL8ZOQVPFDUqAh6ERdSm50L2bm/5DtOHZZMyiSscRxqEfuYIwJ9a5HZrHJYftZ1uDl56pkF9P+wSMZqQi8c7moWCdrqgXJai019x8aJ8lxZ+x24fb2c9rU8K+j76jywLrNP6pAhhWIa2YOk7kkbO16OKdYpxRmWN3PZrqenPao4N1t0iSrnOr0abU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7971.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUV5a3lOZGtYSFk5QWVsTHhrRkRvTmZCMVBGWDhSbGN5MVdVbjBYR1VxNlpK?=
 =?utf-8?B?TkU1cTllZTVORk1rK2tIUS9sZ2NDeThlSk1mUkJBczUwaG5VZENmUTRIYzRr?=
 =?utf-8?B?UlN4UFNMRmo0V0p5dGVkbFVCTkxlejFPS09lY0d6RjVYbkpTWGRtQlFZT1hN?=
 =?utf-8?B?QzdzaWI5YTRYRnRCMGw3UGFidlpOZFpIYmpZc2d5eC9PNGpVZlFkT3Z3S1RO?=
 =?utf-8?B?UEJQVGRWaWZldk5VZTZPRVpwNG0zNHZaOVBvaktaSkI4RnpUYWpGUU55TG9y?=
 =?utf-8?B?L0J5bGdMMS9JUUNkZlRNbUZhZTVTN01VbzNxS25aSVV0M3AvcmZtM2FxamEw?=
 =?utf-8?B?Um1vQzExWjNWd1ZsMkRKa0VxUTF3bThpeFpESHc4bFNFaEN6Rm5uZkVWb0pN?=
 =?utf-8?B?VXBEcWU1Uyt5THZhNEovbmtVd0dRVmg0Vld5eVpaS0N5dTEvWWRXT3VwOGo5?=
 =?utf-8?B?WXRyYXI5a0dyZUlaakVWLzNLa1FRYmx4VHdZODBrMitGSHEwMkpRYXgzWmxi?=
 =?utf-8?B?Y2UyeXpVT0VOb3RWNzh4VGkvUFY4bnRmRDhGLzA1WTFDdlNoOTlYeUovRUNj?=
 =?utf-8?B?dW85K3RYY2lYbXZ5Sis1NjBhY01HVEdCNGpiUytMVGtKVEF0QlNIOENPMGdX?=
 =?utf-8?B?QTdoc21oOTU3cGpiUXNsNk5ENUxGYmkzMDZrODVzVkN5d25DOFVFemZFSzd3?=
 =?utf-8?B?YWw0ekdKQVpqbXZxZldiVFIza3lFVXRsV3BBSTRUaVJKdUdmSHpYdGxIVEpG?=
 =?utf-8?B?M01kNng3ZjQyaFNjbXp3UitsVWVESllGSnlVaXFvd3dlMk9oNzZ5TDFTQTZM?=
 =?utf-8?B?YmJZaUVoNHFidlZaZHhLcDRVTW1OUEdCTFphR2k1MHFwQWRJUjNMckI4Qml2?=
 =?utf-8?B?SzJMR0pIUTB2QnhJSndDbWNkcGQ2YXpGWFJROWw0cjZuQmxoMWg5dVB5WWR0?=
 =?utf-8?B?Vnh1WGI3S1lUa0pLZExMWWlZS255OGxQcTRlelp5Q2FZVmFNazR2OFJ1MHBv?=
 =?utf-8?B?TUc4ZGIxOFYyVmhCVHRab1Z4Mmp0dElvK0I2dHkvMUZaT2ovblduZDcwS1JG?=
 =?utf-8?B?RFFJaEw4UzlXVlkxc1BVWGpHR3ZoblNkRkpQaTZhQzcrTmtVS2NMaitOR1gx?=
 =?utf-8?B?b29zTE00dUhtZHBGTjF0dW04ZHJzeitzdFhVQXEyelNyeWg4Z2pYeCtWazNB?=
 =?utf-8?B?OTNkTWM4bHFRVFYySlBZZndGS21sMWt1dVpkR0V6OExqRVUxMW50cGpPYzBm?=
 =?utf-8?B?SEEzd0xodHZBczBjVTNRN3FvbXIrcWNXRTBpQ0VZYytIS3NtaTNUOTlrUEJx?=
 =?utf-8?B?bmxWbEZEa2E4ekhTc0VBMWJuaU9XelRYL3drT1dmdWdlU2UzSzlVUlZMNndm?=
 =?utf-8?B?MUNMc0tUWHJhbXI2ZHg0MmhXSTRyZkxmTHVrdVR0a1JDQWlEUDBMUzU1M3RI?=
 =?utf-8?B?WDgrcG80ZEZLb2dKOUYxd3FSU21UaDVwUmdYN2xOam9kN3d3NURVYXIrVWUw?=
 =?utf-8?B?Wms4THFXMWRhK1dLRFdwaUhFZWNIQll3UHNIV3JlanBjdC9WaEVHTzlsV3gx?=
 =?utf-8?B?bHE1b2UrMkc4bHB6bDJZRlI0bkFscit3ckFBeWtLY3lFb2I0Ly9GMkNmZlhH?=
 =?utf-8?B?OHpSQUhleGtKYjQ3elJPdm9KSi91aUMwb0RMWkE1QnJYUy9kaUdXSFRzVk9N?=
 =?utf-8?B?cVcvUSs1QW9kU1JMakFjS1U5OGRUU2k3NEJDK1Y5MjBranozaXk0bmw4dmtI?=
 =?utf-8?B?U0NmOEdnb24rVnlFY0M1NVdxYitNd2pjY1NhUmIwTkIyTDc0VFVIR0hhaEpu?=
 =?utf-8?B?QUhkTDE3QmJEczRaZk0vNEZVUWRxU3k0bjBERXo1SVMxNlAxb2dlZmg5S1pj?=
 =?utf-8?B?RHR6UmorWG41YTVGZVQ4L1VicCt2Sm1WSU5iQ0lhanovNlFya1ZKM1BRY3Ju?=
 =?utf-8?B?bXRZaEpZMEk5SzdSUkJQSU5abms5eVJWajAweWlRRXFZdGl2dE14U0puajI4?=
 =?utf-8?B?UkpxOGxUeGsrUi9rUllaNG8xWUdJU1IvUGttMXg5Yk41SGlRZ1I3WnRDSTJw?=
 =?utf-8?B?Nkt2NjhDcnVHeXdnNjVWY2VFbDYzWGtSekxrMGFFaml6UnBqR04vUXFjNWZY?=
 =?utf-8?B?VVo0R2hURGg4UzRhTlF3MjhlVHhLWTdNRS9aeWxpWmdkWWgzNk5LOU5OM2Mz?=
 =?utf-8?B?RnZrUnYwOFFZSVNZQzZEbDJaRStzWVpDVWVDZTNqeUIzb1NvdmJScUp1REMx?=
 =?utf-8?B?Y2ZHL2RUQTcrNWJwSFhQdFFQaDNxRUFJTS9kVjlySGxVeDI2WUt4WUJJTHRC?=
 =?utf-8?Q?Mic295UmPumxu9OAqv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: c9dOAY3B6K6Tp1Abogw+BYrU8rb06PF1zIWhQYZb/qq45c6rdqq9hC32Jy8HosYNiu7nN1wBg0qO5CMLi+eoW3uothL8n1+DhaRhiDKDDYIJjsr/2/aniRLM1ED9NeFzPBG1iCo9gurNvnKs4MeTmSZr1TwWPprlHQHvuAgrQmd3mHjJol6AJuqVcAGo1lvGa4pRHlj204dBOu1hSPFeD1YfCQUNYppPWRcZFxqsro1KzaYYE4/gKANOO+rI7bJ5v32DRceaM14H3Khq6dScArHscRxjWmJEggw4/r/whfEJsIZb+Ioa6M5AgmAS7WLR5VIqb6OhCaq8vok38tGX1A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3889c89e-d15a-49ac-cf54-08deeb8787b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 02:34:06.2721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +R5BI6yS0U3ILvnlPK33hGzes2S4SqvMUX+rnu7YiVLkY45PsyzwR0utpAz4bzzjyTn+miVd5y6m38y7PbJWRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
X-OriginatorOrg: intel.com

SGkgQnJ5YW4sDQoNClRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLiBBZGRlZCBjb3ZlciBsZXR0
ZXIgdG8gZGVzY3JpYmUgdGhlIGRldGFpbHMgaW4gdjMuDQoNClNpbmNlcmVseSwNClNlcmluDQoN
Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBCcnlhbiBPJ0Rvbm9naHVlIDxib2RA
a2VybmVsLm9yZz4gDQpTZW50OiBNb25kYXksIEp1bHkgMjAsIDIwMjYgNDo1NCBQTQ0KVG86IFll
aCwgU2VyaW4gPHNlcmluLnllaEBpbnRlbC5jb20+OyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5v
cmcNCkNjOiBzYWthcmkuYWlsdXNAbGludXguaW50ZWwuY29tOyBTdSwgSmltbXkgPGppbW15LnN1
QGludGVsLmNvbT47IFNhcHJlLCBTYXJhbmcgPHNhcmFuZy5zYXByZUBpbnRlbC5jb20+DQpTdWJq
ZWN0OiBSZTogW1BBVENIIHYyIDEvMl0gbWVkaWE6IGkyYzogb3Y4ODU2IDogcmVtb3ZlIEFDUEkg
bm9kZSBieXBhc3MgbWVjaGFuaXNtDQoNCk9uIDIwLzA3LzIwMjYgMDY6NTMsIFllaCwgU2VyaW4g
d3JvdGU6DQo+IExldCBtZSBnaXZlIHRoZSBiYWNrZ3JvdW5kLiBUaGUgc2Vuc29yIGlzIGVudW1l
cmF0ZWQgdmlhIEFDUEkgb24gYW4gDQo+IEludGVsIGhvc3QsIGFuZCBhbiBJTlQzNDcyICJkaXNj
cmV0ZSIgY29tcGFuaW9uIGRldmljZSAodGhlIA0KPiBwb3dlci1sb2dpYy1jb250cm9sIGRyaXZl
ciwNCj4gZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3MikgcHJvdmlkZXMgdGhlIHNl
bnNvcidzIHBvd2VyIHJlc291cmNlczogaXQgcmVnaXN0ZXJzIHRoZSByZXNldC9wb3dlcmRvd24g
R1BJT3MgYW5kIHRoZSByZWd1bGF0b3Igc3VwcGx5Lg0KPiBUaGVzZSBhcmUgdGhlcmVmb3JlIGRp
c2NvdmVyYWJsZSBhbmQgdXNhYmxlIHRocm91Z2ggdGhlIHN0YW5kYXJkIGdwaW9kIC9yZWd1bGF0
b3IgbG9va3VwcyBhdCBwcm9iZSB0aW1lLg0KPiANCj4gV2l0aCB0aGUgaXNfYWNwaV9ub2RlKCkg
Y2hlY2tzIGluIHBsYWNlLCBvdjg4NTZfZ2V0X2h3Y2ZnKCkgbmV2ZXIgcmVxdWVzdHMgdGhlIHJl
c2V0IEdQSU8gb3IgdGhlIHJlZ3VsYXRvcnMsIGFuZCBvdjg4NTZfcG93ZXJfb24oKS9fb2ZmKCkg
cmV0dXJuIGVhcmx5IHdpdGhvdXQgcnVubmluZyB0aGUgcG93ZXIgc2VxdWVuY2UuDQo+IFRoZSBz
ZW5zb3IgaXMgdGhlbiBuZXZlciBhY3R1YWxseSBwb3dlcmVkL3Jlc2V0IGJ5IHRoZSBkcml2ZXIs
IHNvIHByb2JlIGZhaWxzIHdoZW4gdGhlIGRyaXZlciBmaXJzdCB0YWxrcyB0byB0aGUgY2hpcCAo
dGhlIGNoaXAtSUQgcmVhZCBpbiBvdjg4NTZfaWRlbnRpZnlfbW9kdWxlKCkpLg0KPiBSZW1vdmlu
ZyB0aGUgY2hlY2tzIG1ha2VzIHRoZSBBQ1BJIHBhdGggcnVuIHRoZSBzYW1lIHNlcXVlbmNlIGFz
IERULCBhZnRlciB3aGljaCB0aGUgc2Vuc29yIHByb2JlcyBhbmQgc3RyZWFtcyBjb3JyZWN0bHku
DQoNCkdyZWF0IGRlc2NyaXB0aW9uIHRoYW5rIHlvdS4NCg0KU29tZSBraW5kIG9mIGRpc3RpbGxl
ZCB2ZXJzaW9uIG9mIHRoaXMgLSBsZXNzIHByb3NlIG1vcmUgYnVsbGV0IHBvaW50cyBzaG91bGQg
Z28gaW50byBvbmUgb2YgeW91ciBjb21taXRzIG9yIC0gdGhlIGNvdmVyIGxldHRlciBhdCBsZWFz
dC4NCg0KT3RoZXJ3aXNlIExHVE0sIHRoYW5rcyBmb3IgdGhlIGRldGFpbC4NCg0KLS0tDQpib2QN
Cg==
