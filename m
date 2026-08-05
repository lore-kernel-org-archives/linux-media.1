Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D93ED5A6;
	Wed,  5 Aug 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.183.30.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921369; cv=fail; b=EyDq95KPf2j4/4lFilfdGxss5UaYZU8B7dEtW5r1KHzD1+YT6sWkXQqNWFWp+uE3YKhFW7FC0lnyq3AoUInOIYL9ez0ZLiow4mnD5aOhZtbnbNx62wweO8TFtjfZztYynyjiExlxZ5Xuf9huxdVgHWdtuZtqoV/MvsI/M4z6dC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921369; c=relaxed/simple;
	bh=EQlardxCqZJpY5J8j+NRe/xbvdvxVUyUZsOzfQ1N/8o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JPZxuv3ekHtgu8Gom2OB2rG7nTs/G+tTZfPmYi622XpqymQnyxwK8xyYCkOFkQsLaBPJabuQXkdXpGjXiotgbh0fn4id9Oqau84cLin1vBQId9mivVojmu4J/XxzZrXkbc/cQtTJOmFJ5p5QZCLFYfidk59leY/J+0AiV8Wqyv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=hqWY5zE7; arc=fail smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="hqWY5zE7"
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6758bq0T1858136;
	Wed, 5 Aug 2026 09:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=p1; bh=8qdkjNM
	5Kf3tx2rSPCheavFP8DkMHXmqHRGYXDvZWR0=; b=hqWY5zE74k3b7Gz+17uJVLS
	b8I3mUAQJ5Cm5b5NB+SxsektvN/o+zuacEAbZJIg7OBeIoYiGrKgfnremRlt1CxU
	dowQ6jf/i/OlmWtAyne6l92WVbnrKjkQXQV7SXTw0IWIedESd0pknAvkiafrGwcI
	joboGbuze8kaubnuQQG0qYuLnhr9QpFKxoaMvTC7hBH2LvjBPTHqayVY9JNkqMe5
	Hg3yH7w9s0TTfIDahmNBqM5LpJsw/cTxs3FIlsETZxH2T0tzeWqFsN3whFnb9sVW
	81rM65Z4lIcf6t0tSmyYaMhbrct7d/6w/4vz1sMZ6rFHVkDvSUddGKeLI9vNmPA=
	=
Received: from os0p286cu010.outbound.protection.outlook.com (mail-japanwestazon11011069.outbound.protection.outlook.com [40.107.74.69])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4fs672496c-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 05 Aug 2026 09:15:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnfFdSMBVsnZVBofn1TsNddW3kEcAleahJ19h8dovwthcPADbFdkjwZl8mlNImbZH0Xx19j5JKGTcVkPDflz732B9nw5jO7eZOe0Ik8nzIJZP7H9Wi98TQWPDmZWohpv7DiuYcD7A6W9bHGbR8uozH4GL07Js6csrBPeO5J6r+QrQ191BhX5AhtrY3O3PLiPB+9F5sh1Bj6Q9epQ95jWtCGM8xuWsaanky8belS7NBepR5WGlRwihLxRoUmg+vGG339TNLuUZsVdn7ClMW6wHmde3IPFPyVnPLFAUTqoqghshBpLHacvOqHxEooD6nwk4w8X3EAvNiXQUKgAVjciHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qdkjNM5Kf3tx2rSPCheavFP8DkMHXmqHRGYXDvZWR0=;
 b=lhmen8QgZZ9G57j0vo8MpSU/WdeB8fVpwD4ygI8c08t14FZz8sTCZ5UB1K2q1SgovZFIyb1hq3DsZ7wCXsv0GVVFVVcfUpLIKxZY1oIaTDh2glVQmyuKKNRBL9pZ341aWJAV/9YJirWPqBPurDGBAkko6mGzK6oWDJzjy2GPs4sE6RpeOLOnV3c/Bo3w9yw5qPkHQr3Ysh1UdvSRwrNfsPGBmQEBTA1CpFJhZTzB1WIMR7mJ2MpBJY6ABaEst6g/HllWJLk9ZbPhz4+lmcr2qwXXF6vstfwOwlhvcLJGlCN6PTi3h/Ep1XlE0cFWTUYVmNCg1i65KuBaPG6M9n2HTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from TY6PR01MB17839.jpnprd01.prod.outlook.com
 (2603:1096:405:348::15) by OS3PR01MB6641.jpnprd01.prod.outlook.com
 (2603:1096:604:10b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 09:15:37 +0000
Received: from TY6PR01MB17839.jpnprd01.prod.outlook.com
 ([fe80::7155:ce29:dca3:29b0]) by TY6PR01MB17839.jpnprd01.prod.outlook.com
 ([fe80::7155:ce29:dca3:29b0%6]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 09:15:37 +0000
From: "Lachlan.Michael@sony.com" <Lachlan.Michael@sony.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>
CC: "mchehab@kernel.org" <mchehab@kernel.org>,
        "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>,
        "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "kieran.bingham@ideasonboard.com"
	<kieran.bingham@ideasonboard.com>,
        "jai.luthra@ideasonboard.com"
	<jai.luthra@ideasonboard.com>,
        "Ryuichi.Tadano@sony.com"
	<Ryuichi.Tadano@sony.com>,
        "Kengo.Hayasaka@sony.com"
	<Kengo.Hayasaka@sony.com>,
        "Bird, Tim" <Tim.Bird@sony.com>,
        "Kazumi.A.Sato@sony.com" <Kazumi.A.Sato@sony.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
 bindings
Thread-Topic: [PATCH 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
 bindings
Thread-Index: AQHdH8lbomNxvZQwBkWz5H/bKtyQ4LaFxb+AgAWhAwCAAHjSAIADVP3S
Date: Wed, 5 Aug 2026 09:15:36 +0000
Message-ID:
 <TY6PR01MB17839A212637F4865314A3FE292D32@TY6PR01MB17839.jpnprd01.prod.outlook.com>
References: <20260730021525.166811-1-lachlan.michael@sony.com>
 <20260730021525.166811-2-lachlan.michael@sony.com>
 <20260730-elastic-amaranth-urchin-4b8bbf@quoll>
 <20260802230344.GD1927055@killaraus.ideasonboard.com>
 <a4d585fa-ccdc-4021-b7f7-f88638a9dbe4@kernel.org>
In-Reply-To: <a4d585fa-ccdc-4021-b7f7-f88638a9dbe4@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17839:EE_|OS3PR01MB6641:EE_
x-ms-office365-filtering-correlation-id: d4c6cfce-e8ce-4c08-07b5-08def2d21c98
x-ld-processed: 66c65d8a-9158-4521-a2d8-664963db48e4,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|1800799024|7416014|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 48CmW5E+oUr47MgiPetgkj02Rc9d/+vjInuS1mz/kJC53dF+m34mWcQrDpmHW3nt6gR/IaBir66wcj273M5x8cTEllmaYrZl6Pz85vz0g6ULgT4CP4pd2qhW3GuwrMyxZWY9aLaJkAMx2pIUvnoS5idcnTvavo9a8vxIBW7Tbtny5Rdi4oT/BwKdo0BK5/YSEEr+mO4WKtpIrp0H0wnfIRNZv8q1hQj1b4d/N4SEHRQ9RvchN7Xm08oqz9UWHkeiFIRhRYrIvajHfjEMJXxoAarIJdU8ITQt1BIhnpW4qK+/JQVHuuoT5TMVCLkcanYShHfp0/xlMJvf6NfOpHI7Vwh/woM78RHuvrDw2zTMujvXM8893aKyyJO/wV8aRudYY2rIZisJss3tVfTLzScY5qiaSNWTzVkpzs3HcYgQLqYdyEz8QoqaWvbP/4X8ey2znMS6yaH38gc4mZ81wi1LRn//sdQF8y/eAqs8TddR3DMtzVWAotNPYiJCUMhMWOgsgGK8Kn5ej7EDRP/UH9riO/k0CS6zUbby3sCbyV164gTKzqJJrn78P2YwClyIMdRx8WqbHFTC1yoeWJmMNyNYhScmPdhta6ey71QkTG/rKK7lke1MapiAwx0XW43mbCq8xby3kDuByxKjG/U1UMm6sqFoENmseoG+F3tfLEK3K3ohmWKbBpHe7w5j2FBULqVDS6yrjMoVGSO9ZvKgzSsYaJg22ua57ueeJZH3DzLs+3A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17839.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(1800799024)(7416014)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?iso-2022-jp?B?U2R6M25xemJmN2hlYTV6LzJ1ckR4NkgxbDZWSXFNeDJEbmlYd3JOVVlw?=
 =?iso-2022-jp?B?Q2JkMDdPd1pUUEg5VVBYRVZqOExnWFl5SGRuOGxSSUlqT1dmQnhZaE4v?=
 =?iso-2022-jp?B?YXdwMzd6VW5RK2lBaEFjUWdZUGVhaFMybDdtNDJydHNZY3hvYkZ6TUdZ?=
 =?iso-2022-jp?B?OXpJd1lxcTJlNTJkMVo0U1dJait3NTZTU240ckN2eHhQdUJHdmtaWWJX?=
 =?iso-2022-jp?B?WCtqMGRkUVJxTW9IR1pVSFp1T3lNMTZqdkFlQTN5am93enZHRi94bjlN?=
 =?iso-2022-jp?B?WW9FUFNKRnU4RjVDb2Z6eTIwLzJyWU9PbUkyV2ZJWkQ4SFV1RTl4Ujlw?=
 =?iso-2022-jp?B?SmpMUzlrZm5yak1uMDFUWHJWOCtoWnp0b3lDVjdkVHA3QVZtQ3hmTFlq?=
 =?iso-2022-jp?B?TDZJWlhPWXJWNElHSEhpS24zYjBRanYwL2pMbDJhemtmTTlJZVMwQndD?=
 =?iso-2022-jp?B?UGxCbEJLL3V3WEVJVXJzOWlrTnYxdXJqMFBNR2ZNTW9EYnBxd0E1Wmtt?=
 =?iso-2022-jp?B?d2ZudGxCR2NQYkVPNHBnVVpMKzNHbDRkcnFVNnhWZDBMTTFlNDVoRVpY?=
 =?iso-2022-jp?B?cFhCMVFCaGlDcTcwK0VVWWZGUWJKUFdoNEdKbmh0QWZpbGJqWkxPLzhG?=
 =?iso-2022-jp?B?eDVjTzlUa0Vta0ZGcWw3Nkg0eUlmNnlmekVHMVp1amdadXJJKzNGWGhu?=
 =?iso-2022-jp?B?VmZSRnY0UFVXUlZWRjhsYW5jdEdjTTB2TC9HK09SQmM2Z1NUSmZyeUVN?=
 =?iso-2022-jp?B?V2NoV0lTTUVIYVN1R3dETG94cTF6ZjFiZXdta1pZNHVyMW9wcGlxTzlM?=
 =?iso-2022-jp?B?ZStEb2VVUkpvajdQTjE1ckZ0K2wwaEc3TU5rU3M5UnpKK2JZRFJ5dmxn?=
 =?iso-2022-jp?B?OXlPZmhROXNOVzdoc3Azc2xaTXgwbEFicnRGUWM5dEluelZLS0I1T0FF?=
 =?iso-2022-jp?B?WjFkbkY5VGFuMTBxcW5mcnRoek5vcUgwMXJ5L2dJQ3lSbGUrQnJzRVRq?=
 =?iso-2022-jp?B?QlA5eHFDUVJUbUpuVTgxTnVjL3ZPcnlUOFVFNnZ2L3V3eXdpVjJCdGhC?=
 =?iso-2022-jp?B?dHdGdFVKL2g5WDJweUE3R2hBT1pHUmgvSFdPMUUrZjRwaDhwVldESmFh?=
 =?iso-2022-jp?B?blFlQW9LT1hjVmg1aSt4bUFGTC9JMTNlSEl3eUJvT1VPeWFSV1RaSFRo?=
 =?iso-2022-jp?B?cTNrUy9SejNIdkpJQlB1TXh2eWJpa0tTcUJoRGpCZjJUMGhDM2JoKzhm?=
 =?iso-2022-jp?B?WWtsSDJMVXhSMEtaejBvcjhqZWoyUjFnQUxUeHFMUys1Q1pieFk1cDdy?=
 =?iso-2022-jp?B?Y0hTbitBMmQzbUc5RGJCUG5UR1Z5SWM0VktMLzlSME0yS2U4YTFQNGcr?=
 =?iso-2022-jp?B?UzBicHh6c2lLSnIrOTdycjAzWDFxc092eDd6NFAwNXk1WjlTZnZHcVRv?=
 =?iso-2022-jp?B?aGdHOVduNnpRUEM0ZXNwSlEvTEJHeEI1cGxHNGk0UEhkTlc1WGpYS1VJ?=
 =?iso-2022-jp?B?d2NHekpvOWxjSEVmVWZrU3UvRDEwY1hzRm9VQnUzUVEwT0d1OUFzZ0xD?=
 =?iso-2022-jp?B?bU1rY25qektkNEhwYWRUbUErdFQ2c2tUREl4OXlGanRzQkFoRkltZHBn?=
 =?iso-2022-jp?B?WGpCTXc3elBKVFlMdG1iVXpLTW9ZRE9KNVlRYlg0eGhNWHd1eHlzTENS?=
 =?iso-2022-jp?B?MUN3U2NBbTlFczBIOG9mZElaSHoycy9jcU5BWGZ6d1ZGVlV5bG5LbkJZ?=
 =?iso-2022-jp?B?RE5UVjVlQkprOXJWWTVPRUZLT28yZjZubTF0MDNlU0dMb09FZkZka3Ft?=
 =?iso-2022-jp?B?K1ZiM2ZoOVBWZUhBVzB1ZzB2L1RsNTlGZ3lJVjlZTVExcEhzV3VCTkw4?=
 =?iso-2022-jp?B?UmFsaUtPMlE4dElGUkErMVNWQ2NtNmlRUXpTZHBqbkNVZnh4N1M2M2ZL?=
 =?iso-2022-jp?B?WlRHQ3FkQmhkZGYzY0ZqYU43V0hJRnNWQ1FrczhQbHg0dFluM1gxNG5j?=
 =?iso-2022-jp?B?RG1PTjRnTm1wak5SdWpjbGxjb1BEVGhSOGJWMTZ1b1ZTZzVhUjg1TS8y?=
 =?iso-2022-jp?B?eTNWb2p4cmN1bmVGTW96a3lkOVVhazRiWkIzZTVlblN2eWlzSU9lbGRK?=
 =?iso-2022-jp?B?Z0RNSThlSWwzbEdKQUIvS091L05MRUJJM3FJVmduRmpoRFRoMU5oZDgr?=
 =?iso-2022-jp?B?MVJUYVhlc1VLaUZmeXRrelpOdTdLRlpxcUZXdi9YYjd4SU54RjZwWkVa?=
 =?iso-2022-jp?B?b0EvcU5wSVozSHgyN2czRHZzRDVuamp5QkRhQ1FIRFQzRFZ3UmJibjMw?=
 =?iso-2022-jp?B?S3pIeWFpbVVSYzh5dk9YbG1rTjkzTUtoWEw5ZXR3ZGpUanI5N3Urbysy?=
 =?iso-2022-jp?B?YitYMHNxQSt6MGt3aDJIUTYydVZZM1FzM20wYy9YcUdNMlEzc1JwK3Zl?=
 =?iso-2022-jp?B?SUx2WUQxRyt6WW12QmJsOGlIbW43eGlGTWxYZTlUQ2JpV21nYlFCb2ky?=
 =?iso-2022-jp?B?cTg0bzBhb1BTK0xheTN2QVZCYlhHR092VllhN0RpSFVlVXRsYnRYOHNp?=
 =?iso-2022-jp?B?RmZ3aWlEWXhOeTBCSlJyMFQ0Q2F1MEpDcGJMRWRWNnpMc04w?=
x-ms-exchange-antispam-messagedata-1: n5L0YaSew82mng==
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	iXRi06p/8jt5hLHgP0abJ1ubuM8zhSCrO7isVzzwLn1f8XxSqVIu5O4PL8oxtvEzawmYGDlKXipvwdeqDo4YbeGl9nagn/0N5ED8GxY9WWfu15idw2q02tSsLF+xopb1hciA5ty+8jl2ZzONMvLbdcpYLKaxcEl2IiO8SmFW0j4stiGzf9unuEOHW9HCmXDz31CHPh0m56wmxSScrrfQRtntvHocPFyNum8PSvs63A+1z7zn4n6WOiDwpVupbnjtpvV40F5n/2SMZ9H4rNWseh3DDTVkGcl2HKJNYMzyU25HRgqZXruXBF98xhZ4gBMes5AWyD3VvrV4zpfmkekrww==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tnMnSFcdmsi6gfQBqt5bZ1i/hzer6scQeTXJC93zHbYC8jTYdRejQ65y5qOcO1OMhR2Y9HqHFMhtpY8HwAh9Grvs4ThbS/hKSkbDaLVB9KOfTVN5x20/EO+YfHZ1TCVvMWGFdUWYSmeaUz1zLjjEteTO9XoMkAW5nhG6L+o4xutrJjFm4ETkZ+LbQkLQWvndpw4ZyoJLqYbPge9cdAi/ml/b79rMe5FFk17reS+8kX/SuVKm1jlzu87c9TKw3saTaUlR4e9I+EkuxRUyOtmWQOq/kvEUG7M11f949TC5hNWk/yQFyNItUBoUx08nC5gy5t7J+5S2FcgvIybsSra11oPtwUSvacKJow923N9zshJP41XeB68cNmOSsYEkgNW6/BC/Bg+tWAmFEWMiPaaLjm/JrWxfdvZ+6MrFXQSmgRRBMHwONkfmuyv3GZK6yv82vzhfvOMNOoWa8TXrTd1VPfZarfyKR2y41PYxxMa0EcMocA8AUFi9+K49RqzguBuFLno+NF7IDm+Ko+8Ew2wEkJ9Etee38zcR11b7UaUSW6PCf9m4JDRsRO1X0Z7icht+qsNMiA3j1CnBHyFVks2cpGfJjuMr/faO1cer0myzuJ9z0Wj7IepQL9eXKGo1XEhx
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17839.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c6cfce-e8ce-4c08-07b5-08def2d21c98
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2026 09:15:36.9482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xVmWaizqFvIFn1llj3sWnGt42GrjxLUJJR/6FXw9sY1MMocEaRdnbMOxHWsbH+ekTfJ4Tjt9LcnTUwLytMlt/33s4PoixCSSwzhHTPSo9Dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6641
X-Proofpoint-GUID: r72Z51fNcjs9bV7fejIbs5ujt9_8UY7d
X-Proofpoint-ORIG-GUID: r72Z51fNcjs9bV7fejIbs5ujt9_8UY7d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA3MiBTYWx0ZWRfX2Q5eL9sT488B
 ZaZ/MXqX1v0QGFSMDkZ/RPZ4C8dTjSyPfeowK1Rnx0Tc4FNLUUjKiVNLYqR7SoKCYPTKDbvE47w
 Qp1VAJL+8ioLwRO/sPkVS4kq9eSAlwaCU3bj5DWfJYpQ3Fm9G+jqPpp/i/97K9fsCAz0dP0dx9x
 WfojE5DvO+D0LjR1WETjjfrF70EScXBQ8Rk8pLS+3dmSd6Gp2ElCqmL7rjEErxv0jNkV5xi/TmU
 FYo9JFf6JeV8GUQ38pZbnN/QyY91VmkBh3eu86JHCGMznuUnY4zea/KcOVsmZmfw1MnT7HNEyTn
 IguUPdw2Z4OI/JV4c8RXrbbu4vtvedlATXvlhvDLNUnD1l1/LeNwYgsP6RbJQr4jLQQlfoAz/6l
 sbjfl2sSMebgypFXA4ZSHiGocsHL2fPobXwZxXLisyBIUtg5aJZVXTL9TKy4UoHKnc3YRTo2WQe
 /pZH4wRb4uZNXLMZ67A==
X-Authority-Analysis: v=2.4 cv=LfAMLDfi c=1 sm=1 tr=0 ts=6a72ff3f cx=c_pps
 a=WDLBdkdy1SzFaI2Xv09TMg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=ZPSk82zQDygA:10
 a=Sv0fKeRqtYgA:10 a=7j0FZ4iXMVMA:10 a=xR56lInIT_wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22 a=M2bq-ooH9SiLYa4vvubY:22
 a=z6gsHLkEAAAA:8 a=VwQbUJbxAAAA:8 a=4eBYOPYM4VWyFkjglIkA:9 a=UAVRJdkkkM0A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA3MiBTYWx0ZWRfX31LV+Jf2HsFo
 N3/+6g+yCuR7CBHR/ohGEBt1Yax3RzTGCzUjPOncrcmguv/M7+uoSldabO98cW3F+07H0UN10MR
 wGzzoCjQG6JF/r64aY+5pk2f0VGjLdWA7KsQEZtLiWgzaDU9tFsd
X-Sony-Outbound-GUID: r72Z51fNcjs9bV7fejIbs5ujt9_8UY7d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_03,2026-08-04_02,2025-10-01_01

Dear Kyrsztof,=0A=
=0A=
Thank-you for your review.=0A=
=0A=
<snip>=0A=
=0A=
>>> To spare you one sending cycle:=0A=
>>>=0A=
>>> A nit, subject: drop second/last, redundant "bindings". The=0A=
>>> "dt-bindings" prefix is already stating that these are bindings.=0A=
=0A=
Ok, will fix this in v2.=0A=
=0A=
<snip>=0A=
=0A=
>>>> +SONY IMX908 SENSOR DRIVER=0A=
>>>> +M:	Lachlan Michael <lachlan.michael@sony.com>=0A=
>>>> +L:	linux-media@vger.kernel.org=0A=
>>>=0A=
>>> Drop=0A=
>> =0A=
>> Why so ?=0A=
>=0A=
>It's just redundant and bloat. The address will ALWAYS appear through=0A=
>the subsystem maintainers entry, thus duplicating exactly the same list=0A=
>is not necessary. Many drivers make the same mistake (I fixed Samsung=0A=
>now) resulting in quite big amount of redundant data.=0A=
=0A=
Ok, I will drop this line in v2.=0A=
=0A=
Best Regards,=0A=
=0A=
Lachlan=
