Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3417B54280D
	for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 12:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080197; cv=fail; b=jQvONK8ZXyQNphGSxyTeKK6Wf5NZdf5R23KyfjGbXDAYkWxwDCciHGT93meX1/QlMeulPePfJqiq2ynxNZKBBFlTWkHV3oKLHh7hIUhR7obCDL08MAG4HK9+ra7yu6n2PwA1eFcnsKpp5akAktpgxBEDIhLWhaxYArcMVVcDatE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080197; c=relaxed/simple;
	bh=nzstpmTNGiQvIObwFlLULreQEe3YkBr17mQkFX5bHF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HdPNyoYGS2ugJHf3GejwXY5M2rBKaMxcCn4I6YU9f1KytHAsNOfKv4Yleu+UJXuh3DrPmJrkvn9a508CG9J5Q8XdInGt1vx7BYmQxh/4CKnLbfgU6jNKCxgIX9qNzZBisw0dsTyxo3Y2Aj1dfKPxumi3ndwF5HVIHQ6YMzMMX44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=IHqn4jyq; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MtryBukJ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="IHqn4jyq";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MtryBukJ"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68MBOwA62222821;
	Tue, 22 Sep 2026 07:28:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=WZ20Ftrr3XwifFG8J8ZKWGp6mOWEJ6Dw4PHbB09Mj
	l4=; b=IHqn4jyqRq6NlTsO1fAeCFME2UxSFPYDCvzH3f5IJ8nxM565mLBJiTsN+
	s2Bg3uMYAgkVl7m00PBcg1WL23NHGY+81wIauszIvd+PveRpCJPygW8tN4gAI2c/
	jljQZjTgtX6pytrWYkHwHxtpj9EPMDBuBnw8lHw26QKB5x5c4lziMh+Fo56kV5X4
	syIxaD1yNS6miQ69/wtfC4PeEQvx5UrNjbHxSr2qm/s18okfqaRbwysfVUJ+SBLh
	MQ+sEnoHRK2ZH7zKASo85YH1akAfdG6pOP/4tUoPA/3dROdTPtMQRHnVOl2NdGKv
	D3vvn5kd9ihR6LxDUaopnVLxFR44g==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013063.outbound.protection.outlook.com [40.93.196.63])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x3ev5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 07:28:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIhHmjUekAOMd8groPr89dAwSQZsiNwFNqTpTDuXodhVICi56KgS6GhD+uA0oqhWw72qrzufFPkUGO1CStg9+CTbXS4ISOtYE8ZmM7XhRi7S/09QzOUJBhD7PWXivO9Qtf/ZMvDrTkZggqzvSZAjYchBUjzC3i6r9pMENdqoLrh823Nn+YCuRuO6/41oCyJ96sz/AjyGo6IOhUPHLSifxfKI9q4+oXVWSVxXD5jibvpwi/LXVp1O2ZtEJZJYcmreN4B4PG0LsIZ7kBLm4LlmNdWkEPZVbTTGW77uVsphHxovX++TloFrlp2Iwfb9F0Dm0JRWF4zWzFovXB7Qy4Fkpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZ20Ftrr3XwifFG8J8ZKWGp6mOWEJ6Dw4PHbB09Mjl4=;
 b=XypsPlTIt7llTj3KF0rc6hmCZqx9XAOp0kXmX8J8zQICNXuctblsb9RBB8ztFM08ePlmzOJjfanDIpQN4cDMly1YwuSlP6hE6ElS5xql6w78RLG0sFJhA7YCc0svPa1HVEvCy3yLte5Hy6P5eArab+OLWjOj0SAynzzHuc7mXjZ/+yzl5i9C33+CFzAddLDinsC4yA6y6Y8m3Zo/KCTdjNJjUij50WsK6ZrNmMpwk9v3djp1ODt217FfeXBDpcJu+toyhzMbhD7Sjrx80gkzd0GRFat6Lzo5QI1Fy8rlY/h/IzZbuKed55T/SP0WyhpknTPp2U5MJ6BuvcLRERrNyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZ20Ftrr3XwifFG8J8ZKWGp6mOWEJ6Dw4PHbB09Mjl4=;
 b=MtryBukJRAHQm+4IkF3rqFh7jop1DfC2Iti69XxU8jAPh4iuphsIMFFTjR5RwVTG1p0nAPdNQ0rVW6zIknW8XaAxDHrAQat+H1duwFOPcrxPYrV4GM7exz7J0Bw+so4Ifs2x2OIE5XAuC06qokq0UveC1pvRU/zqQ3LsM3shyuY=
Received: from BN9PR03CA0203.namprd03.prod.outlook.com (2603:10b6:408:f9::28)
 by CH5PR10MB997742.namprd10.prod.outlook.com (2603:10b6:610:2f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 12:28:40 +0000
Received: from BN6PEPF00000071.namprd03.prod.outlook.com
 (2603:10b6:408:f9:cafe::7) by BN9PR03CA0203.outlook.office365.com
 (2603:10b6:408:f9::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 12:28:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN6PEPF00000071.mail.protection.outlook.com (10.167.248.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 12:28:39 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 07:28:38 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 07:28:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 07:28:37 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MCSS5x843203;
	Tue, 22 Sep 2026 07:28:29 -0500
Message-ID: <037afb06-3607-4720-abfe-cc1695c39266@ti.com>
Date: Tue, 22 Sep 2026 17:58:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/13] Metadata series preparation
To: Sakari Ailus <sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>
CC: <hans@jjverkuil.nl>, <laurent.pinchart@ideasonboard.com>,
        Prabhakar
	<prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
        Dave Stevenson
	<dave.stevenson@raspberrypi.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>,
        Julien Massot <julien.massot@collabora.com>,
        Naushir Patuck <naush@raspberrypi.com>,
        "Yan, Dongcheng"
	<dongcheng.yan@intel.com>,
        Stefan Klug <stefan.klug@ideasonboard.com>,
        "Mirela Rabulea" <mirela.rabulea@nxp.com>,
        =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
	<git@apitzsch.eu>,
        Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mehdi Djait
	<mehdi.djait@linux.intel.com>,
        Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>,
        Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>,
        David Plowman
	<david.plowman@raspberrypi.com>,
        "Yu, Ong Hock" <ong.hock.yu@intel.com>,
        "Ng,
 Khai Wen" <khai.wen.ng@intel.com>,
        Jai Luthra <jai.luthra@ideasonboard.com>,
        Rishikesh Donadkar <r-donadkar@ti.com>,
        Mattijs Korpershoek
	<mkorpershoek@kernel.org>,
        Antti Laakso <antti.laakso@linux.intel.com>
References: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20260914114145.574791-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000071:EE_|CH5PR10MB997742:EE_
X-MS-Office365-Filtering-Correlation-Id: c51767da-e1fc-4b35-ebc1-08df18a5086d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7416014|23010399003|56012099006|10067099003|13003099007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HFDVVpRmj3WWIPbll/MfWIHPxzbeQnK2Sd3cYXb7by3QBEbW1HgjpcU5AhWuwUwKEtWhfyxFJh31lVnfHOR97a8g3dHXf/6kviF2ZwkpL4IPMB9jzpSGgzcGH/teUVaP6MHRtRBHYkhfD/iibWLhYBMJ1aviG6PnTpGK8CM80khQ46VOnbg8q8vB/QtfoCnLhZWIlQ48DcEntYexrBVH9+zWS4SDNJLGROkOGoC0r3daFVUyIo2W/UcuxfgO4jQMLd1qyVhN17ihhvsptU0VW1IV9Yfv4Tk6SU3XfBi6XCs5hfYmSb5nzSoSlsjuo5EZjYunXRbG88q+h8qJiOfiNmtg/wnPJpGOLIU/gjuRgGSs/FqP0pmkFIGmqYSUIblZ57dv8Ru6HsBzWobJx8R5cXMpmmPe7xU+OzteiYsJexHmGzDgU2HWQIOqBldf3hoyEZbaaM8zEF1yf4H59zDrRCg9kenN8x1BSAJq78pg6yJmFcIQIAN58S9ALWu8uXsCMmUnC3eB1yGRXn0cTZ+7c448aTFQHwZWhy087paSGivGWTwIESCfbWx6GdHskI8/S7rqagwhUOoGJy7DSKe5QgeoXF9ELrIF8HSSBUULKYX7qdu1Jm7MZgnYnmkYAMKc3z1xuS95nD1SpxrYpO7bYFIwASww9FJ6UAjv9KLl3DaIq61M4oBlqlHi8DwdXC5Wqgop8VPspifIs5kpck2weA==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7416014)(23010399003)(56012099006)(10067099003)(13003099007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kMqtklabdhVx0K5DO9U6Axm4bSrvh3Hu8vv1rwJQETmRnpj5FioAg9qlQSkmo1ENLsslwlP2ddTefqpOMGmy4Djw1bqQrNLwyYCxxVPRBFLQQdock659A+L5N0XJ/DOGAYAkkJZpDZ2dMoSN90hvfpEAGHw/pkEqji0RDqAmp1sKkxx9TEVwv8EtEu+DP8Tac12KjloeBBDkZwnwB/hR4JtXbylvaQtasWx1Q0JuMeLn9RpDYEqb+eeRqBySlOJkGQU9mtK76cZv8dmZufP2XcgI4iorbOjgvE791Jk6LK0wEoXHBvh1xDXV6NQOoNRZA4xl8GhWRWnqmAzIEa5gRcrc4wrL98ZR8lCwQqqyzB0s5lW8o2GWGSMadd+GvBv+M1/sC+kLO/p40JwAylhQLMzy2rDGV6GqHK2PRGaiwekraxWRJ0Qz/NA5gsl0AEhM
X-Exchange-RoutingPolicyChecked:
	apUhxP2lzdC4cbIXEpuriwZL5EQc7WH5C0y6lcyUd8+hGpVnhulbPgulUkV0LOdzskPS7PbZmJnRgamF+IoYMdlhs6xbbaFbYEixzpqYAE/TPZSnS8nBHmmVBLsiRoNeWfJm501l8ynGCbFuFMqiEQaNB8B2r7SXQ6HeignIFVzJp+JTkCAsXWK3RAXs/QlMihXmw64pB+q9dNs8i8LWWGxp7FMSdQg3sLCCYnmTh3tiBaGiEE+hkhFpGf2q4CPvsELAn5qTz8lnKJZnknHIeoWW6pnvwGCcmo2QAX1fpJJcUpcpss711VJM+hfb0NVjarqYOfv9yyBO/YNsAyBEVw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 12:28:39.9182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c51767da-e1fc-4b35-ebc1-08df18a5086d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000071.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR10MB997742
X-Proofpoint-ORIG-GUID: FaGfyGWPbm3KkOIvUtAgT6jeOq0opwb1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4MCBTYWx0ZWRfX//shLWpcjdaW
 StJGwnJXEU2U04vPaZgl59hH0L6HKWe9Z3sX5GXd19cRUNjIxJD6U5++Kgpn/vXGSDH4nFsXsDd
 dL4A7wdyN7qlhvIp5mntPlh7UZyKJm0oaZRPTHnLFNqJrSRQyV0B+UgcaY0AHyyxBMEJjccVOGI
 weevJRi/FVhWRXex+Cn15yHyM5voE4Vm/8Gu5YQ60bFyH+AxgntrMsHEIG3S5ZxqLnxXklbecL6
 MFRNVvxm8o9ehslDLEJ9IQBTvqc6YbNXQEh4VHsgolhvz5IyVohzEyhlHVuKBRtwiTJci1JRWFc
 5EyudfS6UKZT1ZKCboYsQfGHI4fOn+BEP2aLX5JOMOjaGSuwypeI725L+SJdoe7oZer405h5GIE
 OYK4EwQfaKHvK3sLDVF9qFLKa3xakpKIFMju3rpnfzogykusG4dgJWrHOA09n5H/0X35wTz6fOQ
 OwVBhZFh3Y1dQXeXfww==
X-Proofpoint-GUID: FaGfyGWPbm3KkOIvUtAgT6jeOq0opwb1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4MCBTYWx0ZWRfXzvRaHlJO+ovI
 EoSMoU76HP1oGQ3dAiBBXKMXqBhqRSzi+u5hWvvG6SMlm9MF7+E6KPvCGz3Zb68KvG9MdZoFXim
 nezBV0hZn/RP+8IVjUlEJNweacZ7bP8=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab2747d cx=c_pps
 a=VUNJaWZlx74G+l0QYBOIDQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=xo7lQCJ34zX6g-7KaYYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220180

Hi Sakari,
Thank you for the patch series.

On 14/09/26 17:11, Sakari Ailus wrote:
> Hi folks,
> 
> This smallish set contains patches that prepare for merging the metadata
> series.
> 
> These patches have been out for review for quite a long time so I intend
> to merge these early, once we have the next rc1 merged in the Media tree.
> Before doing so however, I'd like to have reviews for the v4l2-subdev
> changes that haven't been acked yet.
> 
> There are simple cleanups but also a noteworthy change: the addition of
> the new struct v4l2_subdev_client_info struct to the set_fmt,
> get_selection and set_selection pad operation arguments.
> 
> The series now begins with a set of imx219 patches, fixes and cleanups
> accrued during the conversion of the imx219 driver to use the common raw
> sensor model. I wonder if all these should be backported.
>

Even though I see these patches in linux-next, FWIW, I tested
TPG with the IMX219 sensor on the AM68-SK platform, and I
can confirm that it is working fine. Hence

Tested-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com> (on AM68-SK)

Branch: 
https://github.com/Yemike-Abhilash-Chandra/linux/tree/CSI_MT_DT_Actual_v3
Logs: 
https://gist.github.com/Yemike-Abhilash-Chandra/14d4cc7dd00857ca55f7f888ac89decb

Thanks and Regards,
Yemike Abhilash Chandra

> The new struct v4l2_subdev_client_info enables passing around file handler
> specific client capability information, which is used to differentiate
> UAPI between existing users and those that are aware of the new common raw
> sensor model. This is effectively required if we want to add support for
> the new model to existing raw sensor drivers: the new model is in a direct
> conflict with how the imx219 driver in particular worked before the common
> raw sensor model.
> 
> There still needs to be a single driver internal state, the different
> UAPIs simply offer a different view to that state. The get_fmt() pad op
> does not have the client_info argument as the get_fmt() is called by other
> drivers inside the kernel so there's no concept of "client info" there nor
> the format returned by the callback should have depended on it.
> 
> The Coccinelle spatch used to generate most of the driver changes in the
> last patch is below, as is a Perl script to generate another Coccinelle
> patch doing the rest of the job:
> 
> caps.cocci
> ------------------8<----------------------
> @ fmt @
> identifier a1, a2, a3;
> identifier fn =~ ".*_set.*";
> 
> @@
> 
>    fn(struct v4l2_subdev *a1,
> + const struct v4l2_subdev_client_info *ci,
>    struct v4l2_subdev_state *a2, struct v4l2_subdev_format *a3) {...}
> 
> @ sel @
> identifier a1, a2, a3;
> identifier fn2;
> 
> @@
> 
>    fn2(struct v4l2_subdev *a1,
> + const struct v4l2_subdev_client_info *ci,
>    struct v4l2_subdev_state *a2, struct v4l2_subdev_selection *a3) {...}
> 
> @ fmt_call @
> expression a1, a2, a3;
> identifier fmt.fn;
> @@
> 
>    fn(a1
> + , NULL
>    , a2, a3);
> 
> @ fmt_call2 @
> expression a1, a2, a3;
> identifier fmt.fn;
> @@
> 
>    return fn(a1
> + , NULL
>    , a2, a3);
> 
> 
> @ fmt_call3 @
> expression ret, a1, a2, a3;
> identifier fmt.fn;
> 
> @@
> 
>    ret = fn(a1
> + , NULL
>    , a2, a3);
> 
> @ fmt_call4 @
> expression a1, a2, a3;
> identifier sel.fn2;
> @@
> 
>    fn2(a1
> + , NULL
>    , a2, a3);
> 
> @ fmt_call5 @
> expression a1, a2, a3;
> identifier sel.fn2;
> @@
> 
>    return fn2(a1
> + , NULL
>    , a2, a3);
> 
> 
> @ fmt_call6 @
> expression ret, a1, a2, a3;
> identifier sel.fn2;
> 
> @@
> 
>    ret = fn2(a1
> + , NULL
>    , a2, a3);
> 
> ------------------8<----------------------
> 
> mk-caps2.pl
> ------------------8<----------------------
> #!/usr/bin/perl -w
> 
> my @prefix = (
> 	"(void)",
> 	"",
> 	"ret = ",
> 	"return "
> );
> 
> my $state_args = [
> 	[ "sd", "state", "fmt" ]
> ];
> 
> my $pad_active_args = [
> 	#[ "sd", "pad", "get_fmt", "fmt" ],
> 	[ "sd", "pad", "set_fmt", "fmt" ],
> 	[ "sd", "pad", "get_selection", "fmt" ],
> 	[ "sd", "pad", "set_selection", "fmt" ],
> ];
> 
> my $pad_args = [
> 	#[ "sd", "pad", "get_fmt", "state", "fmt" ],
> 	[ "sd", "pad", "set_fmt", "state", "fmt" ],
> 	[ "sd", "pad", "get_selection", "state", "fmt" ],
> 	[ "sd", "pad", "set_selection", "state", "fmt" ],
> ];
> 
> my $group_args = [
> 	#[ "dev", "group", "pad", "get_fmt", "state", "fmt" ],
> 	[ "dev", "group", "pad", "set_fmt", "state", "fmt" ],
> 	[ "dev", "group", "pad", "get_selection", "state", "fmt" ],
> 	[ "dev", "group", "pad", "set_selection", "state", "fmt" ],
> ];
> 
> my %funcs = (
> 	# "function_name" => [ arg ref, new arg position from the end ],
> 	"v4l2_subdev_call" => { args => $pad_args, pos => 1 },
> 	"v4l2_device_call_all" => { args => $group_args, pos => 1 },
> 	#"v4l2_subdev_get_fmt" => { args => $state_args, pos => 1 },
> 	"sensor_call" => { args => $pad_args, pos => 1 },
> 	"saa_call_all" => { args => $pad_args, pos => 1 },
> 	"call_all" => { args => $pad_args, pos => 1 },
> 	"v4l2_subdev_call_state_active" => { args => $pad_active_args, newname => "v4l2_subdev_call_ci_state_active" },
> );
> 
> my $rule;
> 
> foreach my $p (@prefix) {
> 	foreach my $f (keys %funcs) {
> 		my $aref = $funcs{$f};
> 
> 		foreach my $i (@{$aref->{args}}) {
> 			my $newname = $aref->{newname};
> 
> 			print "@ rule" . $rule++ . " @\n";
> 			print "symbol $f;\n";
> 			print map {
> 				((/_/ || /^pad$/) ?
> 				"symbol" : "expression") . " $_;\n";
> 			} @$i;
> 			my @pre = @$i;
> 			my @post = splice @pre, $#pre - ($aref->{pos} // 0);
> 			print "identifier ret;\n" if $p =~ "ret =";
> 			print "@@\n";
> 			if (! defined $newname) {
> 				print "  $p$f(" . join(", ", @pre) . "\n";
> 				print "+ , NULL\n";
> 				print "  , " . join(", ", @post) . ");\n";
> 			} else {
> 				print "  $p\n";
> 				print "- $f(\n";
> 				print "+ $newname(\n";
> 				print "  " . join(", ", (@pre, @post)) . ");\n";
> 			}
> 		}
> 	}
> }
> ------------------8<----------------------
> 
> since v7:
> 
> - Take new drivers (hm1246, it6625, os02g10, dcmipp, imx95) into account
>    in KAPI changes.
> 
> - Drop the patch adding v4l2_subdev_call_ci_state_try() and
>    v4l2_subdev_call_ci_state_active() in favour of moving the required code
>    to drivers, of which there are one for each (stm32-dcmi and ti cal).
> 
> - Move dropping set_fmt() in imx678 and ml86v7667 drivers from patch 14 to
>    patch 13.
> 
> since v6:
> 
> - imx219: Drop the change of using fll_def of 1762 for a non-binned mode.
>    Having an even value is only relevant for configurations binned by 2
>    vertically (very special binning).
> 
> - Add v4l2_subdev_client_info *ci argument get_selection and set_fmt
>    callbacks in imx355 and relevant changes for two newly added drivers
>    (imx471 and imx678).
> 
> - Introduce check_which_pad_state() helper for checking arguments instead
>    of using funky here-functions for the do_subdev_call() macro in
>    v4l2-subdev.c.
> 
> - Call the client_caps field in struct v4l2_subdev_client_info caps; the
>    client is already given in the name of the struct.
> 
> - Prepend the name of the v4l2_subdev_call_drop_fourth() macro with two
>    underscores and so suggest it's for internal, or at least for unusual,
>    use.
> 
> - Introduce a new patch "media: v4l2-subdev: Don't assign set_fmt where
>    it's equivalent to get_fmt" to drop set_fmt pad op assignments where
>    trivial.
> 
> - Rewrap the description of "media: v4l2-subdev: Move subdev client
>    capabilities into a new struct".
> 
> since v5:
> 
> - Drop imx219 patches changing the vertical blanking margin and the
>    removal of the rate factor.
> 
> - Introduce new patches for imx219 to fix exposure margin and set blanking
>    control (both HBLANK and VBLANK) step.
> 
> - Add a wrapper to always call get_fmt() pad op if set_fmt() pad op isn't
>    defined. To enable this, nove the ops NULL-ness check from sub-device
>    call wrapper callers to the call wrappers themselves. Also drop the
>    patch "media: v4l2-subdev: Add v4l2_subdev_get_fmt_ci()" as it is now
>    redundant.
> 
> - Use client_info pointer whenever available (was often NULL in v5) even
>    when not required, in mali-c55, bcm2835-unicam, ccs, mt9m001, camss-vfe,
>    rzg2l and ti cal drivers.
> 
> - Separate the frame descriptor patches from the metadata patches --
>    they'll need more time and likely will be merged later on.
> 
> since v4:
> 
> - Merge mergeable patches that have received acks in time.
> 
> - Drop the VALIDATE_LATE MC link flag from this set.
> 
> - Move the frame descriptor patches out of the set.
> 
> - Do not add the client_info argument to the get_fmt() pad op.
> 
> - Introduce v4l2_subdev_get_fmt_ci() which returns the pad format but uses
>    the same arguments (i.e. also the client info argument) as the set_fmt()
>    pad op.
> 
> - Call the VISIBLE area in v4 as ACTIVE_AREA (imx219 driver; patch
>    merged).
> 
> - Set the pixel_rate control's ops to NULL (the control is read-only and
>    not applied on device).
> 
> - Fix imx219 driver's limits for VBLANK, HBLANK and EXPOSURE controls.
> 
> - Postpone the patch bumping the STREAMS capability bit.
> 
> - Fix stopping streams documentation in patch "media: Improve
>    enable_streams and disable_streams documentation".
> 
> since v3:
> 
> - Include the patch adding v4l2_subdev_get_frame_desc(); compared to the
>    version posted earlier, this one uses get_fmt() pad op.
> 
> - Removed kernel-doc documentation from sub-device ops in drivers. These
>    comments are redundant.
> 
> - Include v4l2_subdev_client_info changes for ov2732 and t4ka3 drivers.
> 
> - Fix setting media link flags.
> 
> - Fix the condition for skipping early validation (and doing it later).
>    The old condition sometimes caused the link being validated too early.
> 
> since v2:
> 
> - Include imx219 driver fixes accrued during imx219 Common Raw Sensor
>    Model support implementation. This includes fixes to control ranges and
>    the removal of the rate_factor, among other things.
> 
> - Reword documentation of the VALIDATE_LATE link flag.
> 
> - Require that VALIDATE_LATE links sink (origin entity in this case) may
>    have a single pad only.
> 
> - Drop the pipe argument from __media_pipeline_validate_one() as the
>    function doesn't use it.
> 
> - Fix MUST_CONNECT flag validation for links that also have VALIDATE_LATE
>    flag.
> 
> - Rename the macros to create wrapper functions, define one for "! defined
>    CONFIG_MEDIA_CONTROLLER" case as well.
> 
> - Call v4l2_subdev_call_waive_fourth() v4l2_subdev_call_drop_fourth() now.
> 
> - Comment the link validation code a little better.
> 
> - Fix copying the routes in the routing cleanup patch (copy the same
>    number of routes as before), rename the function doing it well. Make the
>    new function copy_routes_state_to_routing() to take just routing and
>    state arguments, for all callers have this information.
> 
> - Add a patch bumping the STREAMS sub-device capability bit and document
>    that bit 0x2 is reserved.
> 
> since v1:
> 
> - Address compilation issues. I had only tested on arm64 previously.
> 
> - Introduce v4l2_subdev_call_ci_state_active(), to call pad ops with
>    client info argument with active state. Getting around needing a new
>    function doesn't seem easy (probably requires one more layer of
>    indirection I'd like to do without).
> 
> Sakari Ailus (13):
>    media: Documentation: Improve pixel rate calculation documentation
>    media: imx219: Account rate_factor in setting upper exposure limit
>    media: imx219: Account for rate_factor in control steps
>    media: imx219: The horizontal blanking step is 8
>    media: imx219: Rename "binning" as "bin_hv" in imx219_set_pad_format
>    media: Improve enable_streams and disable_streams documentation
>    media: v4l2-subdev: Move subdev client capabilities into a new struct
>    media: v4l2-subdev: Move op check to sub-device op wrappers
>    media: v4l2-subdev: Always call get_fmt() if set_fmt() is unavailable
>    media: v4l2-subdev: Don't assign set_fmt where it's equivalent to
>      get_fmt
>    media: mt9m001: Pass sub-device state to set_selection() callback
>    media: cvs: Drop comments on sub-device operations
>    media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad
>      ops
> 
>   Documentation/driver-api/media/tx-rx.rst      |   6 +-
>   drivers/media/i2c/adv7170.c                   |   1 +
>   drivers/media/i2c/adv7175.c                   |   1 +
>   drivers/media/i2c/adv7180.c                   |   3 +-
>   drivers/media/i2c/adv7183.c                   |   3 +-
>   drivers/media/i2c/adv748x/adv748x-afe.c       |   1 +
>   drivers/media/i2c/adv748x/adv748x-csi2.c      |   1 +
>   drivers/media/i2c/adv748x/adv748x-hdmi.c      |   1 +
>   drivers/media/i2c/adv7511-v4l2.c              |   1 +
>   drivers/media/i2c/adv7604.c                   |   2 +
>   drivers/media/i2c/adv7842.c                   |   1 +
>   drivers/media/i2c/ak881x.c                    |   2 +-
>   drivers/media/i2c/alvium-csi2.c               |   3 +
>   drivers/media/i2c/ar0521.c                    |   1 +
>   drivers/media/i2c/ccs/ccs-core.c              |  12 +-
>   drivers/media/i2c/cvs/v4l2.c                  |  83 +--------
>   drivers/media/i2c/cx25840/cx25840-core.c      |   1 +
>   drivers/media/i2c/ds90ub913.c                 |   1 +
>   drivers/media/i2c/ds90ub953.c                 |   1 +
>   drivers/media/i2c/ds90ub960.c                 |   1 +
>   drivers/media/i2c/et8ek8/et8ek8_driver.c      |   1 +
>   drivers/media/i2c/gc0308.c                    |   1 +
>   drivers/media/i2c/gc0310.c                    |   2 +-
>   drivers/media/i2c/gc05a2.c                    |   4 +-
>   drivers/media/i2c/gc08a3.c                    |   4 +-
>   drivers/media/i2c/gc2145.c                    |   2 +
>   drivers/media/i2c/hi556.c                     |   2 +
>   drivers/media/i2c/hi846.c                     |   2 +
>   drivers/media/i2c/hi847.c                     |   1 +
>   drivers/media/i2c/hm1246.c                    |   4 +-
>   drivers/media/i2c/imx111.c                    |   1 +
>   drivers/media/i2c/imx208.c                    |   1 +
>   drivers/media/i2c/imx214.c                    |   4 +-
>   drivers/media/i2c/imx219.c                    |  42 +++--
>   drivers/media/i2c/imx258.c                    |   2 +
>   drivers/media/i2c/imx274.c                    |   3 +
>   drivers/media/i2c/imx283.c                    |   2 +
>   drivers/media/i2c/imx290.c                    |   4 +-
>   drivers/media/i2c/imx296.c                    |   7 +-
>   drivers/media/i2c/imx319.c                    |   1 +
>   drivers/media/i2c/imx334.c                    |   3 +-
>   drivers/media/i2c/imx335.c                    |   4 +-
>   drivers/media/i2c/imx355.c                    |   4 +-
>   drivers/media/i2c/imx412.c                    |   3 +-
>   drivers/media/i2c/imx415.c                    |   4 +-
>   drivers/media/i2c/imx471.c                    |   4 +-
>   drivers/media/i2c/imx678.c                    |   2 +-
>   drivers/media/i2c/isl7998x.c                  |   1 +
>   drivers/media/i2c/it6625.c                    |   1 +
>   drivers/media/i2c/lt6911uxe.c                 |   5 +-
>   drivers/media/i2c/max9286.c                   |   1 +
>   drivers/media/i2c/max96714.c                  |   1 +
>   drivers/media/i2c/max96717.c                  |   1 +
>   drivers/media/i2c/ml86v7667.c                 |   1 -
>   drivers/media/i2c/mt9m001.c                   |   9 +-
>   drivers/media/i2c/mt9m111.c                   |   3 +
>   drivers/media/i2c/mt9m114.c                   |   6 +
>   drivers/media/i2c/mt9p031.c                   |   3 +
>   drivers/media/i2c/mt9t112.c                   |   3 +
>   drivers/media/i2c/mt9v011.c                   |   1 +
>   drivers/media/i2c/mt9v032.c                   |   3 +
>   drivers/media/i2c/mt9v111.c                   |   1 +
>   drivers/media/i2c/og01a1b.c                   |   3 +-
>   drivers/media/i2c/og0ve1b.c                   |   3 +-
>   drivers/media/i2c/os02g10.c                   |   4 +-
>   drivers/media/i2c/os05b10.c                   |   2 +
>   drivers/media/i2c/ov01a10.c                   |   3 +
>   drivers/media/i2c/ov02a10.c                   |   3 +-
>   drivers/media/i2c/ov02c10.c                   |   1 +
>   drivers/media/i2c/ov02e10.c                   |   1 +
>   drivers/media/i2c/ov08d10.c                   |   1 +
>   drivers/media/i2c/ov08x40.c                   |   1 +
>   drivers/media/i2c/ov13858.c                   |   1 +
>   drivers/media/i2c/ov13b10.c                   |   1 +
>   drivers/media/i2c/ov2640.c                    |   2 +
>   drivers/media/i2c/ov2659.c                    |   1 +
>   drivers/media/i2c/ov2680.c                    |   3 +
>   drivers/media/i2c/ov2685.c                    |   2 +
>   drivers/media/i2c/ov2732.c                    |   4 +-
>   drivers/media/i2c/ov2735.c                    |   4 +-
>   drivers/media/i2c/ov2740.c                    |   1 +
>   drivers/media/i2c/ov4689.c                    |   2 +
>   drivers/media/i2c/ov5640.c                    |   2 +
>   drivers/media/i2c/ov5645.c                    |   4 +-
>   drivers/media/i2c/ov5647.c                    |   2 +
>   drivers/media/i2c/ov5648.c                    |   1 +
>   drivers/media/i2c/ov5670.c                    |   2 +
>   drivers/media/i2c/ov5675.c                    |   2 +
>   drivers/media/i2c/ov5693.c                    |   3 +
>   drivers/media/i2c/ov5695.c                    |   1 +
>   drivers/media/i2c/ov6211.c                    |   3 +-
>   drivers/media/i2c/ov64a40.c                   |   2 +
>   drivers/media/i2c/ov7251.c                    |   4 +-
>   drivers/media/i2c/ov7670.c                    |   1 +
>   drivers/media/i2c/ov772x.c                    |   2 +
>   drivers/media/i2c/ov7740.c                    |   1 +
>   drivers/media/i2c/ov8856.c                    |   1 +
>   drivers/media/i2c/ov8858.c                    |   3 +-
>   drivers/media/i2c/ov8865.c                    |   2 +
>   drivers/media/i2c/ov9282.c                    |   4 +-
>   drivers/media/i2c/ov9640.c                    |   2 +
>   drivers/media/i2c/ov9650.c                    |   1 +
>   drivers/media/i2c/ov9734.c                    |   1 +
>   drivers/media/i2c/rdacm20.c                   |   1 -
>   drivers/media/i2c/rdacm21.c                   |   1 -
>   drivers/media/i2c/rj54n1cb0c.c                |   3 +
>   drivers/media/i2c/s5c73m3/s5c73m3-core.c      |   2 +
>   drivers/media/i2c/s5k3m5.c                    |   4 +-
>   drivers/media/i2c/s5k5baf.c                   |   3 +
>   drivers/media/i2c/s5k6a3.c                    |   1 +
>   drivers/media/i2c/s5kjn1.c                    |   4 +-
>   drivers/media/i2c/saa6752hs.c                 |   1 +
>   drivers/media/i2c/saa7115.c                   |   1 +
>   drivers/media/i2c/saa717x.c                   |   1 +
>   drivers/media/i2c/st-mipid02.c                |   1 +
>   drivers/media/i2c/t4ka3.c                     |   3 +
>   drivers/media/i2c/tc358743.c                  |   1 +
>   drivers/media/i2c/tc358746.c                  |   1 +
>   drivers/media/i2c/tda1997x.c                  |   1 +
>   drivers/media/i2c/thp7312.c                   |   1 +
>   drivers/media/i2c/tvp514x.c                   |   1 +
>   drivers/media/i2c/tvp5150.c                   |   3 +-
>   drivers/media/i2c/tvp7002.c                   |   1 +
>   drivers/media/i2c/tw9900.c                    |   1 +
>   drivers/media/i2c/tw9910.c                    |   2 +
>   drivers/media/i2c/vd55g1.c                    |   4 +-
>   drivers/media/i2c/vd56g3.c                    |   4 +-
>   drivers/media/i2c/vgxy61.c                    |   4 +-
>   drivers/media/pci/cobalt/cobalt-driver.c      |   8 +-
>   drivers/media/pci/cobalt/cobalt-v4l2.c        |  10 +-
>   drivers/media/pci/cx18/cx18-av-core.c         |   1 +
>   drivers/media/pci/cx18/cx18-controls.c        |   2 +-
>   drivers/media/pci/cx18/cx18-ioctl.c           |   2 +-
>   drivers/media/pci/cx23885/cx23885-video.c     |   4 +-
>   drivers/media/pci/intel/ipu3/ipu3-cio2.c      |   1 +
>   drivers/media/pci/intel/ipu6/ipu6-isys-csi2.c |   2 +
>   .../media/pci/intel/ipu6/ipu6-isys-subdev.c   |   1 +
>   .../media/pci/intel/ipu6/ipu6-isys-subdev.h   |   1 +
>   drivers/media/pci/intel/ivsc/mei_csi.c        |   1 +
>   drivers/media/pci/ivtv/ivtv-controls.c        |   2 +-
>   drivers/media/pci/ivtv/ivtv-ioctl.c           |   2 +-
>   drivers/media/pci/saa7134/saa7134-empress.c   |   4 +-
>   drivers/media/platform/amd/isp4/isp4_subdev.c |   1 +
>   drivers/media/platform/amd/isp4/isp4_video.c  |   2 +-
>   .../platform/amlogic/c3/isp/c3-isp-core.c     |   1 +
>   .../platform/amlogic/c3/isp/c3-isp-resizer.c  |   3 +
>   .../amlogic/c3/mipi-adapter/c3-mipi-adap.c    |   1 +
>   .../amlogic/c3/mipi-csi2/c3-mipi-csi2.c       |   1 +
>   .../platform/arm/mali-c55/mali-c55-isp.c      |   3 +
>   .../platform/arm/mali-c55/mali-c55-resizer.c  |  15 +-
>   .../platform/arm/mali-c55/mali-c55-tpg.c      |   1 +
>   drivers/media/platform/atmel/atmel-isi.c      |   4 +-
>   .../media/platform/broadcom/bcm2835-unicam.c  |   1 +
>   drivers/media/platform/cadence/cdns-csi2rx.c  |   1 +
>   drivers/media/platform/cadence/cdns-csi2tx.c  |   1 +
>   drivers/media/platform/intel/pxa_camera.c     |   6 +-
>   drivers/media/platform/marvell/mcam-core.c    |   4 +-
>   .../platform/microchip/microchip-csi2dc.c     |   1 +
>   .../platform/microchip/microchip-isc-scaler.c |   2 +
>   drivers/media/platform/nxp/imx-mipi-csis.c    |   3 +-
>   drivers/media/platform/nxp/imx7-media-csi.c   |   1 +
>   .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |   1 +
>   .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |   3 +
>   drivers/media/platform/nxp/imx8mq-mipi-csi2.c |   1 +
>   .../media/platform/nxp/imx95-csi-formatter.c  |   1 +
>   .../media/platform/qcom/camss/camss-csid.c    |   3 +-
>   .../media/platform/qcom/camss/camss-csiphy.c  |   3 +-
>   .../media/platform/qcom/camss/camss-ispif.c   |   3 +-
>   drivers/media/platform/qcom/camss/camss-tpg.c |   3 +-
>   drivers/media/platform/qcom/camss/camss-vfe.c |  12 +-
>   .../media/platform/raspberrypi/rp1-cfe/csi2.c |   1 +
>   .../platform/raspberrypi/rp1-cfe/pisp-fe.c    |   1 +
>   drivers/media/platform/renesas/rcar-csi2.c    |   1 +
>   .../media/platform/renesas/rcar-isp/csisp.c   |   1 +
>   drivers/media/platform/renesas/renesas-ceu.c  |   7 +-
>   .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |   3 +-
>   .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |   3 +-
>   .../renesas/rzv2h-ivc/rzv2h-ivc-subdev.c      |   1 +
>   drivers/media/platform/renesas/sh_vou.c       |   6 +-
>   .../media/platform/renesas/vsp1/vsp1_brx.c    |   3 +
>   .../media/platform/renesas/vsp1/vsp1_drm.c    |  18 +-
>   .../media/platform/renesas/vsp1/vsp1_entity.c |   4 +-
>   .../media/platform/renesas/vsp1/vsp1_entity.h |   1 +
>   .../media/platform/renesas/vsp1/vsp1_histo.c  |   3 +
>   .../media/platform/renesas/vsp1/vsp1_hsit.c   |   1 +
>   .../media/platform/renesas/vsp1/vsp1_rwpf.c   |   3 +
>   .../media/platform/renesas/vsp1/vsp1_sru.c    |   1 +
>   .../media/platform/renesas/vsp1/vsp1_uds.c    |   1 +
>   .../media/platform/renesas/vsp1/vsp1_uif.c    |   2 +
>   .../media/platform/renesas/vsp1/vsp1_vspx.c   |   3 +-
>   .../platform/rockchip/rkcif/rkcif-interface.c |   3 +
>   .../platform/rockchip/rkisp1/rkisp1-csi.c     |   1 +
>   .../platform/rockchip/rkisp1/rkisp1-isp.c     |   3 +
>   .../platform/rockchip/rkisp1/rkisp1-resizer.c |   3 +
>   .../samsung/exynos4-is/fimc-capture.c         |   8 +-
>   .../platform/samsung/exynos4-is/fimc-isp.c    |   1 +
>   .../platform/samsung/exynos4-is/fimc-lite.c   |   3 +
>   .../platform/samsung/exynos4-is/mipi-csis.c   |   1 +
>   .../samsung/s3c-camif/camif-capture.c         |   3 +
>   .../platform/samsung/s3c-camif/camif-core.c   |   2 +-
>   drivers/media/platform/st/stm32/stm32-csi.c   |   1 +
>   drivers/media/platform/st/stm32/stm32-dcmi.c  |  31 +++-
>   .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c   |   3 +
>   .../st/stm32/stm32-dcmipp/dcmipp-input.c      |   1 +
>   .../st/stm32/stm32-dcmipp/dcmipp-isp.c        |   2 +
>   .../stm32/stm32-dcmipp/dcmipp-pixelcommon.c   |   1 +
>   .../stm32/stm32-dcmipp/dcmipp-pixelcommon.h   |   1 +
>   .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c  |   2 +
>   .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |   1 +
>   .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   1 +
>   .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   1 +
>   .../sun8i_a83t_mipi_csi2.c                    |   1 +
>   .../media/platform/synopsys/dw-mipi-csi2rx.c  |   1 +
>   .../media/platform/ti/am437x/am437x-vpfe.c    |   2 +-
>   drivers/media/platform/ti/cal/cal-camerarx.c  |   1 +
>   drivers/media/platform/ti/cal/cal-video.c     |  21 ++-
>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   |   1 +
>   drivers/media/platform/ti/omap3isp/ispccdc.c  |   5 +-
>   drivers/media/platform/ti/omap3isp/ispccp2.c  |   3 +-
>   drivers/media/platform/ti/omap3isp/ispcsi2.c  |   3 +-
>   .../media/platform/ti/omap3isp/isppreview.c   |   5 +-
>   .../media/platform/ti/omap3isp/ispresizer.c   |   5 +-
>   drivers/media/platform/ti/omap3isp/ispvideo.c |   4 +-
>   drivers/media/platform/ti/vpe/vip.c           |   4 +-
>   drivers/media/platform/via/via-camera.c       |   4 +-
>   drivers/media/platform/video-mux.c            |   1 +
>   .../media/platform/xilinx/xilinx-csi2rxss.c   |   1 +
>   drivers/media/platform/xilinx/xilinx-tpg.c    |   1 +
>   .../media/test-drivers/vimc/vimc-debayer.c    |   1 +
>   drivers/media/test-drivers/vimc/vimc-scaler.c |   3 +
>   drivers/media/test-drivers/vimc/vimc-sensor.c |   1 +
>   drivers/media/usb/cx231xx/cx231xx-417.c       |   2 +-
>   drivers/media/usb/cx231xx/cx231xx-video.c     |   4 +-
>   drivers/media/usb/dvb-usb/cxusb-analog.c      |   6 +-
>   drivers/media/usb/em28xx/em28xx-camera.c      |   2 +-
>   drivers/media/usb/go7007/go7007-v4l2.c        |   2 +-
>   drivers/media/usb/go7007/s2250-board.c        |   1 +
>   drivers/media/usb/pvrusb2/pvrusb2-hdw.c       |   2 +-
>   drivers/media/v4l2-core/v4l2-subdev.c         | 163 ++++++++++++------
>   .../media/atomisp/i2c/atomisp-gc2235.c        |   1 +
>   .../media/atomisp/i2c/atomisp-ov2722.c        |   1 +
>   .../staging/media/atomisp/pci/atomisp_cmd.c   |  16 +-
>   .../staging/media/atomisp/pci/atomisp_csi2.c  |   1 +
>   .../media/atomisp/pci/atomisp_subdev.c        |   3 +
>   .../staging/media/atomisp/pci/atomisp_v4l2.c  |   8 +-
>   drivers/staging/media/imx/imx-ic-prp.c        |   1 +
>   drivers/staging/media/imx/imx-ic-prpencvf.c   |   1 +
>   drivers/staging/media/imx/imx-media-csi.c     |   3 +
>   drivers/staging/media/imx/imx-media-vdic.c    |   1 +
>   drivers/staging/media/imx/imx6-mipi-csi2.c    |   1 +
>   drivers/staging/media/ipu3/ipu3-v4l2.c        |   3 +
>   drivers/staging/media/ipu7/ipu7-isys-csi2.c   |   2 +
>   drivers/staging/media/ipu7/ipu7-isys-subdev.c |   1 +
>   drivers/staging/media/ipu7/ipu7-isys-subdev.h |   1 +
>   drivers/staging/media/max96712/max96712.c     |   1 -
>   .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   1 +
>   drivers/staging/media/tegra-video/csi.c       |   1 +
>   drivers/staging/media/tegra-video/vi.c        |  10 +-
>   include/media/v4l2-subdev.h                   |  34 +++-
>   259 files changed, 714 insertions(+), 304 deletions(-)
> 
> 
> base-commit: b38d06ad1e13c32970d58039c154f009b81a3368

