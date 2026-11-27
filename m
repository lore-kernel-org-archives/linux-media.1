Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795923;
	b=qDkRbTOvHmpZu3VQw8r3+LEeRs5486gXqF7xoV4pB9KDxWZYGrbyYNw8zkx6Jnt+D236
	 ZAGmpVgy+z1RoMxpCIOP6u6r7Pru58jiF8/xP5l4IifK1bFO+JOYhvTFd/86TcLUBSs3j
	 8gRCQ/9M6DB+S3Wi3+e7vlQfLr3VgZQBzMeMs5VGwxSbPEu6AyzRa1YhaLJQX+EGdBnYA
	 AjyR3uwO+Vcn0WxQ5Ylx6OmuFDDHtPxNimksNpUzwiuG8ynQ5nzX2JKlEYxLiXuUo5r6I
	 R97dr7BWCwHxv1tT6mL34C8fmzpHBZCTNPB9cbK2Dd+nGddZzbAfTQps+s8I3fyvVew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
	b=v0tgKLXIWqF+zz597o0+siaHY0w5MWwXemHUWop4UtIivNlCMZnqzR6u8B/zyiwRWsfy
	 afT7IoX7rSHsFQgk7BfLn2l5vH8x0TudEm/sc7fPcNmoZ6YhAAdZhtJnBRyST/bVvJItz
	 +WV+oD+scLzp569z4hceO8FBFsdf0pWLTix+i/e9izNt5LYy9wbbui7xKRtXtDm5NvaBU
	 iyqyWaZP1g8JnfaAClW8DSU79Ntoi3XlLi42n2Aoc5l6ZxsB8NMtRO3XjDOpb8Ds1s/pz
	 pzMV/ta6R7Zu0RPE0kGWnN4LFc9MoBj37n7ho+HSc7+b1SfC/TzebugPe/orvjIsQIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WRqTCmHS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T91Ye10D;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA80C606A32C
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA80C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WRqTCmHS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T91Ye10D
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpD3V2338200
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=; b=WRqTCmHSrF7KWxzn
	uuZj+pMUbCOmTNgNodFBFkhgGG1O/VO69m/JiB5rLd2/kgIEoCZEvBN4qdV9+QwB
	4Z8wen5Yg6H6pIXwjM3Lf0XeZ/5v/LRva1TeQtJGrWr05U9dwQIPd1DsjKwxX1ro
	yiRBIfjWaql37Z9D9Gtc4ca6AeGUw+Mf0IRUoUAiTilVDcobZWOz/Brtod/ctnZV
	7Q6i1OzYns90JpDZhyGpBN8KUHM28qOQ43zLvluZb26B0A5NG6kErO6njimoB/7Z
	xafe0P8v2H3NiFl8YGtB4T2Whwz8/+Zkh3vLHCK/lJHlZbh15k69lcLILYgvYeeX
	4HUo1A==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756ka1j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:01 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6768601940bso13469388d50.1
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 08:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795921; x=1796400721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=T91Ye10DymC/iokbFR6cPQPl7bnMwNyL2n95Ws3Kw4KnYaJBoittNkPeWn7GnJWAFQ
         GWgJJi2ZKxSCt8m64HFeJm/StrPLdgsSwQXueQy8sAXsCixPmSwq5Ean4/PWtP+rIqd8
         CkNIkmSpFUVmly0Vt+JrMG6BXdAbKUuKCapMiUefw0Ayb1Zb0OoVJtU49HKMLd5p+XX2
         v9bPnNeN68pyNNnfZFotl6f4/ROmXLl1zEelYQF5q00vWCE+xMAb9cBTq2Ka2pc88N7O
         YUZMwHVXxHCI/2JpYoNK+oHUd65/mxZnXQav/5rxMIXqymhW6Xib7yrj+ezm/hJXmIa8
         BrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795921; x=1796400721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=mxpfdit9ErDyXB2/u1x736sBnOTNzCzH9gV5EBWjcrr9m4sdCv5/Icn9RYTS+FNrev
         utGcHHwMSZHnZuQcaYJjHpNftIh5NwZw+tevfJuSJ7nC82XwdNS0/qy8xkZscU9C6Rs8
         rSkfIaBvgViVWRGwsdl33DEUjTz/b8TaXZx/DWTQzh9DPWeWUWqhmqdDZSqNAjc3qxdp
         /TAMdr374BYm0ntoHP852OFYBqt+WXZwU87fB0+VVlO6FJhDq6Kdo7W46X9+wlW9n1y3
         feCDrooRGKoK8d4z2dJz8/IGBZFT8JqsZJ2skfdkOf+faNVKRF5JpA7LrF6uCYHowqBq
         fTmQ==
X-Gm-Message-State: APuU4Z9B/Ear7PmbQHVDMdnogyss2f1HJ+nlkBs7R5IvRApL0E1ZXSxt
	jsPlps0zVCQBgXqv/ETyILmr7zxVruR2zYBrFGUOJYrNsdFYcndJOEJEU4rt19tsXnRP/QCJXZ9
	cfwIJ53R87Vy5/VLrAaCyy2OPo4cOEA3Xwc18+8ihMidTQ54mv6ZCC55pL+HCO14myg==
X-Gm-Gg: AZFdTZf0S3DcWXrDMhX6UWfD7h75TykhSHC4vS07YBb4sK+E9ETGU17P4PeD8Y6q3ri
	+kvZGZmn5R52L6s03PdDD4JxOHftnkqe06nzoQjdAwaEk2gLA4VIU6jsOhoLJnYULL7E/PJqGPx
	PqiZBfB+LHb8hljZzei37FCayZjRY9IVlUQMzkXXzGcdk3GQprIrnH5err4lkClTrL6rCpPOui8
	XmlmCUHLHbRi147usLuwc8dQo3PeFQ/gepBMWT7XO3iplCpmDAWFG+GQq6CNlnThlWolEvMV0ur
	SO00GRuVW9on59z0iOyJvbzbJfMQKEdnfoPbI6oL4y+s9UAOGYXEvlgI6u7DdUqhsPiGZ2/8qzn
	XG3FL2UNowT10jef0olrFA4aNEUR2otwW95dXodU/Q5qvzawHMkxyA16yFf8VQY+bEJ7PbMSTsX
	tpLeg1HA2pCS9nFxuScBZIKlhBgZg5xU6fPg19WXUvn39uSv810HK7XyAu+MNKcMECu4VdcBEmy
	lB7/RPTulk3Xy27KUIC89baJIaZ
X-Received: by 2002:a05:690e:807:10b0:677:d375:13f3 with SMTP id 956f58d0204a3-67df449a45emr6413015d50.35.1795795921149;
        Fri, 27 Nov 2026 08:12:01 -0800 (PST)
X-Received: by 2002:a05:690e:807:10b0:677:d375:13f3 with SMTP id 956f58d0204a3-67df449a45emr6412992d50.35.1795795920575;
        Fri, 27 Nov 2026 08:12:00 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:11:59 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:53 +0100
Subject: [PATCH v3 3/8] media: camss: Define timestamp registers for
 csid-gen2
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-camss-hw-ts-v3-3-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX8seHYDtXeUe3
 TinGPBSJCsxYlHJsJztk+oCXjUYm+rmK/2wzpyO9GGIceYf2AV5F8v6hkavhmX5Oz2+krTiMbgR
 gSeTqMgrmlRObTvyVb8F7Us+lu4/oyKkeEtsAIoqC5Y9B3enC0IrjfOW8BM3JOGXsMAi6hEaNpZ
 aULWzCF/bGYesRKvnsip/vyGJ2LU4Cbx5eVfrMv6dWqIjKzzn6mdVvOZ2e/LddTj8ADhUsDG+UZ
 4gcIQQpd1OmRfa+Ui40N8IJ/GWsokISjPxPaBxejaRo5ED0HY4ixTmmaU11zndT1xuJovJkkSwQ
 xL0w/Z1fGVtDcNxRaSzjJ8UzDNXwuxSfdIASsXFzd5zDVdfxcDc9MVKDVvUtHUyq0PWqmcTVxfJ
 KB8IQDidqMAz7Ak9zTSFF2L9zVCUjHyzLkfURpwoCr8M/Ah3v/LRqxZrMRdlS51DN/xmGiNhE3y
 YTocLfXzkVHyPierqJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfXxd0MkF8GmatU
 Ovl9zrMrNwLlUqzCzfvtItFjwPn4sebXaEzEoZM43Bs4eX6b0xi8czfv3lfXWzfNNzXqGx9S6e9
 6n2qBg5GOrXbk0jk7zmBTp/MfmrlLog=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09abd1 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=3Wk6MWIrbtHnLGL1blMA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mWJ04SwhFv0rqYd4KVWeCHCULTGHLEdt
X-Proofpoint-ORIG-GUID: mWJ04SwhFv0rqYd4KVWeCHCULTGHLEdt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Timestamp registers inside of the CSID block are available at different
offsets from the CSID base depending on whether the CSID is lite or not.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b91728b981fe80e030fcb5ebfdab138b2..85e9eaf78df75f95d5f44f83b45dc7a3633401d0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -121,6 +121,22 @@
 							+ 0x100 * (rdi))
 #define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		((csid_is_lite(csid) ? 0x230 : 0x330)\
 							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_SOF(rdi)		((csid_is_lite(csid) ? 0x290 : 0x390)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_SOF(rdi)		((csid_is_lite(csid) ? 0x294 : 0x394)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_SOF(rdi)		((csid_is_lite(csid) ? 0x298 : 0x398)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_SOF(rdi)		((csid_is_lite(csid) ? 0x29C : 0x39C)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A0 : 0x3A0)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_EOF(rdi)		((csid_is_lite(csid) ? 0x2A4 : 0x3A4)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A8 : 0x3A8)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_EOF(rdi)		((csid_is_lite(csid) ? 0x2AC : 0x3AC)\
+							+ 0x100 * (rdi))
 
 #define CSID_TPG_CTRL		0x600
 #define		TPG_CTRL_TEST_EN		0

-- 
2.34.1

