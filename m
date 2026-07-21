Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31643395243;
	Tue, 21 Jul 2026 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784614795; cv=fail; b=mvcF134dIZ8NFObWeIClctW25COU8Z0BeuxlrrOsR/1pcCNP3+LCN9R4EFeesrdQSjgIP8heiQazBUny57xXqkOTCHhXC1gld7kTfM5oyESWqHD9js2SP4rk62KlvbxM+xj3ZrxBuh5jRhkDqetmpEG8p4J6i9l67Mrqjn3NN6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784614795; c=relaxed/simple;
	bh=3X/7w03uY+O7hKjdOYo/gZYeCY1+WqKyKSiFmr743Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fgL7ahuNuA/bkyI372p4DzvkMkddH1UHylE01YuDg+5raUnAVA1mMGE87IOADmsVHRfBADNbSeQEAhx57P4fjOJxHkZGGxhmxWFHkynSFviRrh55bOlYblQf7om/6wH8k5q6WRGzpabz7dQoCN+ev9saDLRwAsa5Mop8YDoL/uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=O0gF0i2W; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HNBffXcj; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="O0gF0i2W";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HNBffXcj"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L5tkNq3427441;
	Tue, 21 Jul 2026 01:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xwOc95jtj7FXr7b6j6kAIdv6l0ux9bv3x5mb2iUBA
	LY=; b=O0gF0i2W9wELtlMEHTWT1bA972mqTxoe1+iKkgWfJUw50Tx2KkMDN1iGP
	cPlcyU0eRV2a6LCWio4XcFdcIUP8y5x6AXdD0w8e9BMgsVzOOWXGj83qHWzSU9+S
	xlSfEq5B1fU5pGM2YsIPM1ybfJL9gXVpt7LvUm4XPZAYecKdx/0QiaKaQtGBcvJO
	HaqzPvnw1mlyWV3dC2jlR6hV8cXmHQuAk46i0Hi8dyilmjfkK+k0oXuz1KSRWvq/
	xevgpIvRWr6TtGVFrHbzoPWoftnaTGVf8LS9J7eo4+nPSaKc7//WwvppqMNzaxdC
	tPkJ6bSlD2KHteelCpif3EyVgZJ3Q==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013043.outbound.protection.outlook.com [40.93.196.43])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fhjnjwxfw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 01:16:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+fr29AeJUeQ7NWLKu7HWLcucx4MzcHOOMJcB8rnOpmKGyHvuLv9zm6LDW0tHdOEX/pNZJv8uyidn6yqVEbFHpnibpxFRAH/3xIBR0Gp+G8xNCQEkap+KcxmmoDVz41EovdW3mig6siXK9eJWUHhf7dKYbaJxyEGiTtt4Ae+3XvqWjbGyFyWZ+cvvZ3yrk6f2RCBKe4/ib5ZxRYbzhqbZb2g6vu71lPOAM6ZLVEGwwXfWzXANbI/3PSIvykJ2pkJi0f0ydo/SxlAxZSDEnj8CAvGlC91DrMAwIWaSGUPDrS+Xz2mity9gfnLK2NkLR37QS0kIyymsTCa3Pv0egILyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwOc95jtj7FXr7b6j6kAIdv6l0ux9bv3x5mb2iUBALY=;
 b=e39qKAxtjqDh/p5XcoS91PPZnNMp36jp4GpzwQmXnZqizNM1VH0YwEfCrar92u76RDG8s9jXvcLbMqkeZWLg0p4bRZlGhWkwFmEAfHCnUoL7nMIyyjjMZRRA0cTipHXvB8QvQUdhzqZr3HdsLF33FOimtM7986FQCADSNpBAwyvs9CxYeCsqllceIPPc1lmOa2XHmghDsihmlsfn0A2L/VxPpOfFRqTc101OVCKWxUx/Mi0C8PyD2aayLg++dTbTjhyzgME+7eiiuE7Sql58vzG0AFDeke4IzPhl3eknAaqDH5HucnEyrTRB9GrlzRPYFxehLt1VBS3Dg68dEOTkVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwOc95jtj7FXr7b6j6kAIdv6l0ux9bv3x5mb2iUBALY=;
 b=HNBffXcjQjZgfL0/EWeY85rv2HAeaAUd7t8GS0WTIJ70rXn5H+pWwrP9yXyqZOi3Xc504oCWe13zMbi+hYGjKjGaD/Yl8vbafqTfJyxxZH87u1WqVSYXASe9pYlb8+HhOyNvAFlJ9QTIlToug2Xb9mRlOZMedEfZexK7Yn68Vvc=
Received: from PH7P221CA0069.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::27)
 by CH4PR10MB8003.namprd10.prod.outlook.com (2603:10b6:610:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 06:16:00 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::58) by PH7P221CA0069.outlook.office365.com
 (2603:10b6:510:328::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 06:16:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 06:15:57 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 01:15:31 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 01:15:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 01:15:31 -0500
Received: from [10.24.51.219] (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66L6FRXO662429;
	Tue, 21 Jul 2026 01:15:28 -0500
Message-ID: <8a7276b3-5000-4468-9111-76ec2d33470a@ti.com>
Date: Tue, 21 Jul 2026 11:45:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: ti: vpe: quiesce overflow recovery before
 freeing streams
To: <hverkuil+cisco@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>
CC: <mchehab@kernel.org>, <bparrot@ti.com>, <dale@farnsworth.org>,
        <dagriego@biglakesoftware.com>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <246a3e47-02ac-46c1-b3cc-dfcf30c00065@ti.com>
 <20260713195622.2181593-1-fanwu01@zju.edu.cn>
 <801025b7-a3b8-4655-af49-f9bb65254170@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <801025b7-a3b8-4655-af49-f9bb65254170@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|CH4PR10MB8003:EE_
X-MS-Office365-Filtering-Correlation-Id: a93c7f46-73f1-48c3-92b3-08dee6ef87a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|13003099007|56012099006|5023799004|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	N5bPUvExKf5wGigMYlNyF5PCP/bFNUGw/j/cYVr+3lrLZQeVlEud7QOXCEGBGV0v4qxNRD12rFq87giGnpbKc880wU/0N8WGJ09EmzEI9sD5jQMLMN+cxvtmz+MIqXFPDmHAJITA4ufFvuwZ+QFdDASD50jKtg79UA8KyWD3gbXeVrCOSL0jQBLCzERULCboSY0JpUBUr5edVdCgmkRWChDiHtNChAbbzEVGS9+fM8IeNnU0yYu4wLQelSB6C/LCxIfRGWbfRArhZ42Du2haAJl/A97A8W0/WiusJrwkZowMm69Ew3B5f7R6irbB5DVWbQkh6s6il6VS/C7T5LCutWhHtgxWrderncWNIFqSeiUk9ZknC/i6eUWw5KNVpm6VkHJDHkMHajCJMWQMYmRM5H4swqYqZ+/LJ/VSsPn2D/Bt3IvfDsPA5XuZ5nQs5Zmt47GpIxwFmkpGXR0RdRcmjMSLNqp9xCsmc8F/Th4L/6wXEQ+wMIHNcD3bw/JJ2GRWLuiE93GaXjq7z+moqiwimQm6zCCIEkHwtTa3XgowqllAWSqBGPyuDNVtwwqc+cI8TmlgfQlOeUG3SMp4NJPkBdmWYIWay6at4KJ3LHP0sY1Sr7VlmTVflXH9Sm+E74jwVVHfAgNIbaBFlztPhOoc367tYNzLosXZIxoo/MN94fEJgM0D6kEUgbrEzJDw5NjtsnoamA8HlZ5ewg+3t6/BJQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(13003099007)(56012099006)(5023799004)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sZg5a12X7rVXoXw1+eWPXJHEfdyy76ub/KycjOrqxta+YOYTvTEJeD5Fnm7Stjjvuf2ubsN8awcklOhnmZNi2kGWugUPY7YAJUNx1wXTnGyAwFYfBqdVPGPl3lxsb4TuzmCH0oplSYZBSJHZioCy4mJOLJWqWgAcMPJsO0pozkhkOor9NvC8vDd/sUVTDc8WAVxZ3/QA/EsdOs0HUazSHHpOvwMzGL7UtSFZfl5IderUUPVeWRgxCvLPUET3I8FoAPMU6+0fdKmjPO8ZJTkNGipS+D0sPnQqO29NfbnrPmtLPzeGKv5WUUWCNQSZauka1bVbiR+Hr4QhyZOa1CKCDVoKXj1GnVO7K7gJRKwawIx6mNlO7pMNl5RyehsnicPKTehwWiwKHeDK8fukL+jzDK94zLz850N2m8kQa4JxBEcbknojzP5sH+uBiWwMnQtS
X-Exchange-RoutingPolicyChecked:
	o7ppmmFvHmBNke20IRt0TNLLFC65tUOD3gro5YqlMo4bMGYyd5BgOGgng7G53b5VxunOLmR5frVR3wo2seZ5GF1tNTHu9Z14UBYEV+da1K/7LG90CkuI7C9ln9C326zkULk4RNpwJ/COY5KIxKO0B9KUk03d9lJe9N8K6oSKve3P26gFeTqeGQqrHjrUeOQb6bytiGB3XUyO85cCeE/srjDskWm6SmowpsB9ak9T8OhMoGv7FB37BD+NZSwQyqcD2gZdTgpm01D5zc/kd0f7zua+qaYXPBeMYbvKQjQ99Ud2kcfPCKe9nuhs/uHmWZZqnwF7ITNScKgvGLy8hChKEg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:15:57.9940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a93c7f46-73f1-48c3-92b3-08dee6ef87a8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8003
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2MyBTYWx0ZWRfXzhnJcNU0IMk2
 L3gdY8bJNSYk5JuoHS4j5jRF4fVodMU1DHxx2vrtSRcCZVCfduEqLRvCv9HU/cm32gFjUCChD0v
 lIItZcNSyb2LLgrE2zgdza59fH+7tNs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2MyBTYWx0ZWRfX5BkNc4qu+QPZ
 p0MXdNMUuCmhCawoCS50gEhsk56fH008UKWs8WE+QGBwsksHz/VhJEc4zsLhGpr+qA2FwPQGmUE
 ppV96jH6Ubj3J4SMDUk4Pu5MG3/E8YEyrsPELh8Bw0+uc1hDmbphQL2HQIBJcxHzXjXSwPX2bm0
 gvgagQKpXJnWU/+R8VZZP2KQYjipk/cTo222h7BUSJ0Vvm9fAkgoA6AQoy3GGByHIzuS4x7nWN7
 Timqwq/8zR9TXVn8oVGROdPmEDVW87HeCuKCRR2Tl6y7ZCL6oOBEABn86s/StvdeIID/IIexMwr
 KEKFKo0w5BGylREOBsXS7pf1hqU34lM5JRQPiKn2YW3ehldGvwJbXs8jxzA6G/ENDrJHwNDzVw+
 +MRKhwB+l1ACEW2SUaLslNN9+tyxOMHzN42Kd6jH2WQ7VLJc9UW8fdpB5nP687EngojCC65jISU
 PPoD+yCVmAICM4Ajvhw==
X-Authority-Analysis: v=2.4 cv=N6wZ0W9B c=1 sm=1 tr=0 ts=6a5f0ea4 cx=c_pps
 a=uW7feKH+bNkESiv0jeW3sA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=qnQxj900YwYq4cb1TbYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 3hzeiBBGTdb0IzSy7hp0QZzT2HLA01je
X-Proofpoint-ORIG-GUID: 3hzeiBBGTdb0IzSy7hp0QZzT2HLA01je
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210063

Hi Hans,
Thanks for the review.

On 15/07/26 18:25, hverkuil+cisco@kernel.org wrote:
> On 13/07/2026 21:56, Fan Wu wrote:
>> The VIP overflow recovery worker is armed from the hardirq handler when a
>> FIFO overflow is detected, and the list-complete path looks the stream up
>> through the VPDMA list private pointer. Both keep touching stream, port
>> and device state; the recovery worker also resets the parser and VPDMA,
>> repopulates the descriptor list, and re-enables the per-list IRQs.
>>
>> vip_stop_streaming() masks and clears the per-list IRQs, but it neither
>> synchronizes the hardirq handler nor disables recovery_work. An overflow
>> IRQ that has already queued recovery_work, or a list-complete IRQ in
>> flight when the stream is torn down, can therefore still dereference the
>> stream after its resources are released: the descriptor list is freed by
>> vip_release_stream() on file release, and the stream itself by
>> free_stream() on unbind/remove.
>>
>> Drain the recovery worker and the IRQ handler at both teardown points
>> through a shared vip_quiesce_stream() helper, before any stream-owned
>> resource is released. disable_work_sync() cancels pending recovery_work,
>> drains a running instance, and raises its disable depth, so a subsequent
>> schedule_work() issued by a racing IRQ handler is rejected at the
>> workqueue scheduler: recovery_work cannot be requeued after
>> disable_work_sync() takes effect. The worker may still re-enable the
>> per-list IRQs before disable_work_sync() returns; disable_irqs() then
>> masks those sources and synchronize_irq() waits for any in-flight handler
>> that still dereferences stream state. recovery_work is created disabled
>> and enabled in vip_start_streaming() before IRQs, pairing the enable with
>> the teardown disable across the streaming lifecycle.
>>
>> Return the released slot's value instead of the array base in
>> vpdma_hwlist_release(), and clear the slot so subsequent list-complete
>> lookups cannot recover the freed stream through the stale slot value.
>>
>> This issue was found by an in-house static analysis tool and confirmed by
>> manual code review.
>>
>> Fixes: fc2873aa4a21 ("media: ti: vpe: Add the VIP driver")
>> Assisted-by: Codex:gpt-5.6
>> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
>> ---
>> Changes in v3:
>> - Replace the per-stream irq_rearm_allowed flag and the repeated IRQ
>>    disable/synchronize_irq() in vip_quiesce_stream() with the workqueue
>>    disable-depth API, as suggested by Yemike Abhilash Chandra.
>>    disable_work_sync() cancels pending recovery_work, drains a running
>>    instance, and blocks any future schedule_work() from a racing IRQ
>>    handler at the scheduler; this also closes a window the v2 double-drain
>>    left open, where its second IRQ drain (synchronize_irq) waited for the
>>    in-flight handler but did not cancel the recovery_work it had requeued,
>>    so that work could run after free.
>> - Create recovery_work disabled and enable it in vip_start_streaming()
>>    before IRQs.
>> - In vip_stop_streaming(), quiesce before stopping the parser: a worker
>>    drained by disable_work_sync() may re-enable the parser before exiting, so
>>    stopping the parser first would be undone.
>>
>> Changes in v2:
>> - Drain the overflow recovery worker at both teardown points through a
>>    shared vip_quiesce_stream() helper: vip_stop_streaming() (file release
>>    path) and free_stream() (unbind/remove). v1 drained only in
>>    free_stream().
>> - Document how the issue was found and that the patch was prepared with
>>    LLM assistance (Assisted-by trailer and body note).
>>
>> Link: https://lore.kernel.org/r/20260708013738.110752-1-fanwu01@zju.edu.cn/
>> ---
>>   drivers/media/platform/ti/vpe/vip.c   | 37 ++++++++++++++++++++++++---
>>   drivers/media/platform/ti/vpe/vpdma.c |  3 ++-
>>   2 files changed, 35 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/vpe/vip.c b/drivers/media/platform/ti/vpe/vip.c
>> index cb0a5a07a3d4..30e9a85d4cf5 100644
>> --- a/drivers/media/platform/ti/vpe/vip.c
>> +++ b/drivers/media/platform/ti/vpe/vip.c
>> @@ -814,6 +814,22 @@ static void clear_irqs(struct vip_dev *dev, int irq_num, int list_num)
>>   	vpdma_clear_list_stat(dev->shared->vpdma, irq_num, dev->slice_id);
>>   }
>>   
>> +/*
>> + * Quiesce recovery work and per-list IRQs before releasing stream resources.
>> + * disable_work_sync() prevents the overflow handler from requeueing recovery
>> + * work. Mask and synchronize IRQs afterwards because a running worker may
>> + * have re-enabled them before exiting.
>> + */
>> +static void vip_quiesce_stream(struct vip_stream *stream)
>> +{
>> +	struct vip_dev *dev = stream->port->dev;
>> +
>> +	disable_work_sync(&stream->recovery_work);
>> +	disable_irqs(dev, dev->slice_id, stream->list_num);
>> +	clear_irqs(dev, dev->slice_id, stream->list_num);
>> +	synchronize_irq(dev->irq);
>> +}
>> +
>>   static void populate_desc_list(struct vip_stream *stream)
>>   {
>>   	struct vip_port *port = stream->port;
>> @@ -2428,6 +2444,7 @@ static int vip_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   		goto err;
>>   
>>   	stream->num_recovery = 0;
>> +	enable_work(&stream->recovery_work);
>>   
>>   	clear_irqs(dev, dev->slice_id, stream->list_num);
>>   	enable_irqs(dev, dev->slice_id, stream->list_num);
>> @@ -2452,13 +2469,17 @@ static void vip_stop_streaming(struct vb2_queue *vq)
>>   	struct vip_dev *dev = port->dev;
>>   	int ret;
>>   
>> +	/*
>> +	 * A running recovery worker may re-enable the parser, so quiesce it
>> +	 * and its IRQ handler before stopping the parser or releasing the
>> +	 * descriptor list.
>> +	 */
>> +	vip_quiesce_stream(stream);
>> +
>>   	vip_parser_stop_imm(port, true);
>>   	vip_enable_parser(port, false);
>>   	unset_fmt_params(stream);
>>   
>> -	disable_irqs(dev, dev->slice_id, stream->list_num);
>> -	clear_irqs(dev, dev->slice_id, stream->list_num);
>> -
>>   	if (port->subdev) {
>>   		ret = v4l2_subdev_call(port->subdev, video, s_stream, 0);
>>   		if (ret)
>> @@ -3074,6 +3095,8 @@ static int alloc_stream(struct vip_port *port, int stream_id, int vfl_type)
>>   		goto do_free_hwlist;
>>   
>>   	INIT_WORK(&stream->recovery_work, vip_overflow_recovery_work);
>> +	/* Start disabled; vip_start_streaming() enables it before IRQs. */
>> +	disable_work(&stream->recovery_work);
>>   
>>   	INIT_LIST_HEAD(&stream->vidq);
>>   
>> @@ -3139,6 +3162,13 @@ static void free_stream(struct vip_stream *stream)
>>   		return;
>>   
>>   	dev = stream->port->dev;
>> +	/*
>> +	 * Unpublish the stream and quiesce its IRQ handler and recovery worker
>> +	 * before releasing stream-owned resources.
>> +	 */
>> +	stream->port->cap_streams[stream->stream_id] = NULL;
>> +	vip_quiesce_stream(stream);
> 
> Shouldn't these two lines be swapped? It feels dangerous to set that pointer
> to NULL while IRQ handlers might still be running.
> 
> I want to see a 'Tested-by' from someone before I accept this patch.
>

Acknowledged, I will be doing that.

Thanks and Regards,
Yemike Abhilash Chandra

>> +
>>   	/* Free up the Drop queue */
>>   	list_for_each_safe(pos, q, &stream->dropq) {
>>   		buf = list_entry(pos,
>> @@ -3150,7 +3180,6 @@ static void free_stream(struct vip_stream *stream)
>>   
>>   	video_unregister_device(stream->vfd);
>>   	vpdma_hwlist_release(dev->shared->vpdma, stream->list_num);
>> -	stream->port->cap_streams[stream->stream_id] = NULL;
>>   	kfree(stream);
>>   }
>>   
>> diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
>> index 573aa83f62eb..f9f5b2f1ee1a 100644
>> --- a/drivers/media/platform/ti/vpe/vpdma.c
>> +++ b/drivers/media/platform/ti/vpe/vpdma.c
>> @@ -988,7 +988,8 @@ void *vpdma_hwlist_release(struct vpdma_data *vpdma, int list_num)
>>   
>>   	spin_lock_irqsave(&vpdma->lock, flags);
>>   	vpdma->hwlist_used[list_num] = false;
>> -	priv = vpdma->hwlist_priv;
>> +	priv = vpdma->hwlist_priv[list_num];
>> +	vpdma->hwlist_priv[list_num] = NULL;
> 
> Hmm, the return pointer is not actually used anywhere. I'd rather turn this into a
> void function.
> 
> I also don't think it is needed to set vpdma->hwlist_priv[list_num] to NULL. Although you
> could use that as an alternative for hwlist_used and just drop hwlist_used.
> 
> In any case, this change has nothing to do with the other changes and so it should be
> in a separate patch.
> 
> Regards,
> 
> 	Hans
> 
>>   	spin_unlock_irqrestore(&vpdma->lock, flags);
>>   
>>   	return priv;
> 

