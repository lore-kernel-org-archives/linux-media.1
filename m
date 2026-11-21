Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795267997;
	b=HRxEfXtVYjOJ/D9KRI7z0pV562mdr3CcG0BX7AjEYtfqBmG77INHHP+9D4MyIuaYxxCk
	 ttXUMwB/kNkOL+Bh0spLCru/j55+8mWgROe+P4VkEr4LDPVQjlXLtljLNDt2MsPKh01MV
	 AO7J73+iJ1ReSMoifuBqxoqnzmkMsN8o9epiHsi/ZvaF8LthPQPcVzBhGzc4BPzzUT8zL
	 OAfEJIAwFBwzXUVXNWqBGFdiBOzQQVH5+mfUtYPd2OV8fJi5pPFB3gY3D8tzpc1H7ysfG
	 Z/j0TQUwzh7LzsEYU0ff+0FrqUcubrSR1gWGJ8LoITpIWamzSFTr7DzREyD9EKecyfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267997;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Message-ID:Subject:From:
	 To:CC:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bb6NJhGxibmCOaSJLuVd3rHNl8W3Oso4mh1PylABZVc=;
	b=OXyWg9erdOtTIUamvK3vGD90e+RBkg+rMb6wljUWvuJXFRrAnzrlWP0CGtVU9Brab7iD
	 tc7TpOf++00f8X97UZg0m0c/phAoCFpdp8eA8T8WUSkt6Iu0KluFa4Txqc03Iyx0xY5sa
	 RK/2XZXJi5MErzpeZBoVQnEKsqSbfkzQHHBCDxqEibQZCKKqGKqGWcsK2UGa/fsE6l4YK
	 9Ug4fQNRrPnZgziNjBhuTkKVBdnewou3pRyj39c7gCPnKJAIoh92NK66R5o8n7sVr7QXH
	 nB6ISezhWt2eCptpXIJUUERe4vcv0xwEi89H+Rl6s/LKOF38wDs4La0tKOOVQOksdeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=oSANUgKT;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=sTpTV8y1;
	arc=fail smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EA2606A6B0;
	Sat, 21 Nov 2026 13:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99EA2606A6B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=oSANUgKT;
	dkim=pass (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=sTpTV8y1
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ALCFBHY2948665;
	Sat, 21 Nov 2026 07:32:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=bb6NJhGxibmCOaSJLuVd3rHNl8W3Oso4mh1PylABZ
	Vc=; b=oSANUgKT6mbdONPT86ljBoQHsaSsIEcbG+KGXgIW3RFLDiQEpVXvOF6Dz
	DqAL176AzItx8qYeYjcddX3p5zZt3+VdLSoYFmh4+i1PYr8mruCdrEAhppx77Cbt
	qvRmXabE3l8nsxpVjaFXr7OcBFvDxDkEexPVSkfddB2uIp9h1tyuToPlURfrFO8A
	isVSfSiiQhHfpp+WCg1BTalc/WiG9vROOzD6/7k2/+w5itagqeTTh3fmDLWrbRW6
	XzLmOJlxdW7G++Ejl/qZSJcY47Y1L353joDBlc1TS9cbl2S6bRn+OQ9U+igp4LCs
	By16koDCXUFpge7VNzYUWKXWvZFdg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
	by m0384305.ppops.net (PPS) with ESMTPS id 4j2k2cpq8e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 21 Nov 2026 07:32:59 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIwuemF7ihEWvxx37oUz6cbULlQyQb3egBgM/nZS2Df9a8pe1ggKljj4kB2mIjGDTvTv2LfbqNPaWfKSLqZ0KF0Wk6cqaAc663BtimgshodqRsH7reTuv3vNyMOGndv7g46S/VRQkL6gU8Rj6zWzq7BD6uXOq1wLCBIFss/EhuxG3HiekYRC3Leuygyws7DWlxDAJzMD+wHjX2S33aUkeruJBJqsel3HC3kYt7gsFqEWkzrhGNczxO+fkRNKAB5x5jkbyyfWvGccN0UYZG27bPH0m0E3bpGRHjOOzmspafpzhuW4bm/1Y12Y1b8f51Lec8TK/To4jZ1Yplz2tOJqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bb6NJhGxibmCOaSJLuVd3rHNl8W3Oso4mh1PylABZVc=;
 b=lbffV/7TvDZEatRTi2Qt4zMar6QlWcWxp6Ok7YHnvThL0UKkxl2ed37Z2cOwmpP1cwfxz50buOyF5hcH2s0v+FeJZkfXmIE3c8TxuOh/W1/c27FFrCrxdHRKJb3rmt/0iJpeQwyDCKSQtjxnm7Wvwjp+4u56GAG5W77UhKtkbSxEaT9D3eeFegt6iO5Xm1ri6EhgPALMye1DijGsxaWr0ONo/rEsqInXI3ORe3T45QVzuC5LvynG5OWbt2E+CVaF2GBLsWllC+L1EDafDz2LNz2mxUTQWLXxDeIoh2uyGddJhpemN8P4F4G1/zlO2BPOe846zD+zXNhgz6RwgRLsJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bb6NJhGxibmCOaSJLuVd3rHNl8W3Oso4mh1PylABZVc=;
 b=sTpTV8y1TmW0d3R471SMcRY2/Ajq38yLTkmppCRfvEtkIojKMqBD2C2dnwpV2X0FM1xqbLzlcQqGChzXMqUxeBKsIbXzty0mVW8E7hKIjwKvhNyvyz/Re/pZ/nyyLGxeDQCkktWYa4lJPXOA6Vwi42fKQaCg1fmSsYNTKM2w7x8=
Received: from BL1P223CA0043.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:5b6::9)
 by IA3PR10MB8758.namprd10.prod.outlook.com (2603:10b6:208:579::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Sat, 21 Nov
 2026 13:32:57 +0000
Received: from BN1PEPF0001806E.namprd04.prod.outlook.com
 (2603:10b6:208:5b6:cafe::a4) by BL1P223CA0043.outlook.office365.com
 (2603:10b6:208:5b6::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.13 via Frontend Transport; Sat,
 21 Nov 2026 13:32:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0001806E.mail.protection.outlook.com (10.167.245.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Sat, 21 Nov 2026 13:32:57 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 21 Nov
 2026 07:32:56 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 21 Nov
 2026 07:32:56 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 21 Nov 2026 07:32:56 -0600
Received: from abhilash-hp.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ALDWri34114845;
	Sat, 21 Nov 2026 07:32:54 -0600
Message-ID: <22e412eebcd3e4cef4dbef9d0daad8ee7dabffc2.camel@ti.com>
Subject: Re: [PATCH] media: ti: vpe: fix double free after video device
 registration failure
From: Abhilash <y-abhilashchandra@ti.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kamil Debski
	<k.debski@samsung.com>, Archit Taneja <archit@ti.com>,
        "open list:TI VPE/CAL
 DRIVERS" <linux-media@vger.kernel.org>,
        open list
	<linux-kernel@vger.kernel.org>
Date: Sat, 21 Nov 2026 19:02:52 +0530
In-Reply-To: <20261103174036.62882-2-fourier.thomas@gmail.com>
References: <20261103174036.62882-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2.1 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806E:EE_|IA3PR10MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 32376358-8e36-4e87-222e-08df47d3f450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|56012099006|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261009223027099003|261021121427099003|261102123227099003|261026121527099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+bIiHgEqjUoMv2DVWS9QUUarzJCvDxiINOCnlM/GjyogGy6ovm0M3I5cyyMmFoM7yqE8/+yRlMuEjCKLOyFQJB+GXxH/AtiP61BbbcuxPPMkYKFoVK00l/UyWrfrn23JIpQ0qbhDgSmUhUWkIemq5a6tQ7tCW6MMnfuDdfnm9JuupCzzUOgKGIKUmhbYVv66I2ArMf/Zfly/FCTUldo1i+keUIoUfGB0xLULHPNgBnb7jsmEo3QqjRUU+R9jyQ66kbw7rd5DVWgdfmwdio5aEN/0wddu0LdaCMFcMpa+8EDFeKWnwvOvc9jSIj73s7ycsvszJRRLKdY1G4q8LidGJ+K5gG2igk57MObRoHAHBBCUP1wVbnWkMj3UGxc54C2CTuGbvHqTU+XlkDzFCLoat6soHDj7ADgdvkVUFxIgPyMr2gB0kxSJrUnGE/xJC4+ejGb1CCwSlxzBWYqE/Z7rxMbvrno2AYxK259mkgr59l0O/qL7X5MthlT6Xp+t/nSCJC4gUlpg+x9vP1TetTN41sSZO+jiChGznOzcvi1V5S8/trN3XwFlsZhCmB+8Pp0u1ngBv1jt9OhXT+M9B8/qRDgEgF0hFXcOEpugMoETx+qWHYOm1YvGw41wP+jOENE/SfL+t1JlGtzM4oj5nyh65qKqK65TR0z/XTa7PZ1JvJmg4emHi3NZrFEIGJFUKm/0iUOk/Dj4QOi7AhJ7popk1w==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261009223027099003)(261021121427099003)(261102123227099003)(261026121527099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V+mRyr5iUexOczY+Pc06oxpCCAyipKtIVVKjiQikC3d4mEIByn1uH8HYNFTfnkAsWMlzAX4QEJmQIgOgTjkaWEwRGx6I1BDOKa/YkyWJxBXZZKYlyUQ3nOeIQlgNo5yiZ6H8f7LBFhoM1rI5rs/azBUjKHQBSYQwpKcpZ5CjExYBhRQFfnFyTS1yqH5+BTdQTd48EnCqbc+nrYSW5BpgqVZPz+EOSAPsadkVROZ84eWmCFkC6MzFGSbwEe1ll5xR8DkFNzPp1N6mb8hvxXB5i3fBDz77Tuxa8ulgmArTC65+d15WyvjKYGu9/itff1rbgBk7EqhirlIz0Nx/4ysRu0kAXsg0ocoK/yHvCnKwX0dqzYqt3sUeW1utBKtNPOxLEG/CNjiXvJAjnB8b8iFmDnrSx40I8kDzc32tawm/nC4QdQPXBdlq6y19f3HLWOrd
X-Exchange-RoutingPolicyChecked:
	mHofR5jej5ySgyF+6O4hFQHe7hHJiGmr3Gdv9DfayP4yhVb2bAuyg2PMu0PIUw+qddbkYZkzO6GdK/1tOTIKpFF8EscHeiUa6lRqLtQEfVvC96jUuAK7jOF9KPxD2fVo1yEmLuIz2Ksw1jAoAe0jmAkCI24+PyU4wmwexj2NIAUzMjy8KWKdP4OCZuctJkTNP2222kGl8cY7Q9DkT7pUYbpPrAHaCuGRI4/Y3A9SvOx4GZYAQmzyMmTSCczdEKs66a4XfS/d4mZF0L5fvtuBwDofKZhlWas4t8nwi2/zu8aDEWJjJnkVPfSoZnrQ7ry1U6HsYr9bQHkalpCW/1Y52A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 13:32:57.1278
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32376358-8e36-4e87-222e-08df47d3f450
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0001806E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8758
X-Authority-Analysis: v=2.4 cv=NYZzRGD4 c=1 sm=1 tr=0 ts=6b019d8b cx=c_pps
 a=Eo0YKKWWvGv/UpXdOuOi/w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=pGLkceISAAAA:8
 a=sozttTNsAAAA:8 a=O-otTr0C43izOhLEkxAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDA1MyBTYWx0ZWRfX9A4cBlwb0iG3
 quCZwVjxLYyZMtDITXele+GNiyLZGGpiU02tJVOzYREnH9s/2ZXTFmlH4GiMUL/c7euUeAxBaxX
 gpM2liZgOwTpCnmnk3CU/dESTDRRzD7BAZONZOPXinjaLD+ICn1S//9LRWdVj8RNbjcDRnReS62
 o9pFrNf8JcUdSRNOGhRTY0OQPlRySZDXFGnLwdiEkMTZq862d/7srik23xS8LM2X+JgXOasgi5L
 Rmb6MSqef6phr8jnNUQ3zrZ/1WHmnWIl2MsjbxTBswccsJeKzbeySV532f6VqvEr/U2JbbOX8bu
 NUGDuqla21uYQ4+sGawEEORW9kc0cw0mXIJ9KHJ/Oi6ZjvnbJSnf58a24G33QWR+cmMLkAUrsIi
 GZy9UnJdpWgD8babFdUniOplRA2oEr7tcflgpiMfw4B0RNcIL0SDp2urJTda+9X69ZuEs48J/16
 327zJ13fNAS5C0S5CTA==
X-Proofpoint-ORIG-GUID: UovokH5iDy4ANf-XhgSQO11XYFX0fV5w
X-Proofpoint-GUID: UovokH5iDy4ANf-XhgSQO11XYFX0fV5w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDA1MyBTYWx0ZWRfX9fK/DiKw3S/+
 cCtebN43fGLJ1ztblxabOZNbyY1b1A0GA9ic9J7Ir60SDxLVsI0pYIqYajxo5XBH9sZtbSvf9Nh
 /hMKTVxr6GDFVoGRg/vBOBFTFotK8lc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1011 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210053

Hi Thomas,
Thanks for the patch.

On Tue, 2026-11-03 at 18:40 +0100, Thomas Fourier wrote:
> vpe_fw_cb() is called asynchronously by vpe_probe().
> If video_register_device() fails there, all the cleanup functions are
> called. The driver stays bound, so vpe_remove() later does all of
> this
> again, freeing dev->m2m_dev a second time.
>=20
> Leave the cleanup to vpe_remove().
>=20
> This bug was found statically and is theoretical.
>=20
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> Fixes: b2c9472f0559 ("[media] v4l: ti-vpe: register video device only
> when firmware is loaded")
> ---
> =C2=A0drivers/media/platform/ti/vpe/vpe.c | 6 ------
> =C2=A01 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/ti/vpe/vpe.c
> b/drivers/media/platform/ti/vpe/vpe.c
> index 81bd1f9cee30..761aa40a066e 100644
> --- a/drivers/media/platform/ti/vpe/vpe.c
> +++ b/drivers/media/platform/ti/vpe/vpe.c
> @@ -2496,12 +2496,6 @@ static void vpe_fw_cb(struct platform_device
> *pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0vpe_err(dev, "Failed to register video device\n");
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0vpe_set_clock_enable(dev, 0);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0vpe_runtime_put(pdev);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0pm_runtime_disable(&pdev->dev);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0v4l2_m2m_release(dev->m2m_dev);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0v4l2_device_unregister(&dev->v4l2_dev);
> -
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20

I analysed the driver, and the fix seems correct. Hence,

Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Thanks and Regards,
Yemike Abhilash Chandra
