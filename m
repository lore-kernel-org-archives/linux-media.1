Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601975;
	b=qC1ZOG4M3Qr5URKH0husEbNmNj1S/BTNB72S88O2fxmsxtKdg3VQNEU2eoX8mH4XKvcr
	 7Zw9hQl7XZhKCAwlIwivm2ju8MNrWQScBqYCdHeHHPPqPA0w71hiugzeAEalPbfyr9Hjl
	 LUcTh2RQ0CkY6sC4VB0yGjgrv3RkNh0m1f6GMeNJDkEgmCNlYfGCJbsnnx/qVoQyoL8Iq
	 iS+nfefOut3SDXYVtSAXojNsnQz+BPo86Ikz1Gjr9sXeIKcy5Hb6vSq/ZejubKl2ZIavn
	 p84yHfFbuSAKJ8P12fXV8ABdp63D02a7N33S9bOhVQi7hzpurKIoxnpuGt7M/6eMA4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
	b=A6AAACxVZ/OLwZnGIPNdXPWMHMigAoPHMIv0V0gyeeWHUxW9eNrqiBXT5IpqB1dOuu6c
	 h/jGH9wAwcqjgZowlG/h9BiXtBCQLPH+X0l37JgMCrabWVw4FxgeIjF7vni92GtlwuRwc
	 +o3iryOoTYIerNRi9hy50H56cBxwgSYbpHUyV4JHdJ3meHxccWfXIFqrdEce21Q4YI40n
	 FtpNxwmSlN/AyT8DCDPCN5G+L6l6d0Z0tio7z6QTRlH0mZYLVPZCDcw9owTWzK5Xfm7WU
	 jkd0UQabJMg1G3v7ZtELBw8N8QVagMJpb/krUTEoidwNr8hd9tQJNdvgQlXiWMBxj6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5+OutYn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxR7PlPT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F3260A261C
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F3260A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5+OutYn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KxR7PlPT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mO194131196
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=; b=A5+OutYn3mREg19i
	188MQxyT9blix3yDPiWVFT4yPYGPOj1PGg9Sdmn4jadzWD/4cS03dgvqEGdHZTGN
	svWn5VSzRvxuCeNHZfeUXB/EhrnGeT4up/1Q88vC5D0oRw6Nu2Ik+Ix1oGVX6Lmc
	Q1WtLxFclLQdeQygPE1y2wYjwR5A7FefLiIdOr0f8fwBUZ0gnppeBLNmp+k3J/0j
	OISnIxxt6tPCS5hmZStbC1NBfw5YJhzMt3ijJJ5RNuHfRigcctVhsmOgLK8IL1FQ
	mT5exVkwl2pQPGQzWzDEdxjj6nPImcXIE/AZxtZMbloVUBJBTsgnnHPV4GuxrADB
	JiqP7w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuhrayw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f26dd2165so1374848385a.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601974; x=1796206774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=KxR7PlPTwvnJkbHBxes822mVeQq8ys0O72goTDet95CWHm/Zowc5HRsAB9p6CGakKK
         uxzZaBBVzDtzfrFt+B2bogTRxsMK/rEuhOhYVRid1SU2OqTQnCIerxinxXoAwb89T9aF
         iqVfPye8WDoGXpWKeYo4uqJYmuvJNCx7kq0DVFyAPjev5vKXBAcM4R7Iw6+WbeMKBaO/
         Ljwt94nTZ5tinXeRF4KRgGFllXc5CQxrlTp+EpAR9IEchPgktnWhg/0Fw3HeMSMr5rax
         ljmhI2TbhMAwzg1wkSL2FmwBYW4XndzM1OcNfDoi8g+5BrmqBUdRpDdv7NgQI++syXhs
         I9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601974; x=1796206774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uE4eOMA+bFp767ewLDImegkyq/ZtrdlqU4ibf7PdpCc=;
        b=A7KH2x1KVsajJAUiOikUaPw1ZYyieDzby0PrVPw6OZTU49pyICqWDflDv/qrmx8otE
         A9w+QuGh8bOWVqIKfh7gK1lg5ZS2BMfnMastTaOkp6I52TwaxYFw1aFj6zfHjnHWApoK
         gf3280m3KKSocmouOsEcNm9DY3iKpldAvVQfSs0yNKZE/R6xG4odPuqZI56YxP1auRi1
         PsvkP+Sn/di9j+LJ71D9dbpK1CoCxDL155Tt84GVNl/C8y2IgXi9o851cJANuKHiLhON
         fD2Ms5qv/hmeCQitaUEb+3c1JKlv2e0te0JAxxxkaOfMVM+Ud8cczFDUcybK6HZ2F2sb
         g+3g==
X-Gm-Message-State: APuU4Z/OKXp0mK3ZfrrcmiEX9WGBrN5f5m/0uzJDrW2YZ0J/jqcqDhKS
	VrQZSEnO4L1rYOGWShPn1301gArAZprwUhL2yswq55hna3Uo38mpG1SY2OaDc/9CLN5h1HhCQtA
	e2q23tduMZJK9Fz/6w1GRVHEV6k2c1I5v8ytYgWpo/+nd3rGz/9WSmajKAFShiZfaEA==
X-Gm-Gg: AZFdTZdiKmlz8CSIOf7Hmoyh8rlPM4bWTBBqahuyQBr7NZYH+BmL/UKgrlqkuLSbHG0
	lvaKoiFFvWtUbXl5QlXlYMqlwsbF4vZ+fXrBUZChU7oAaAjCSijTYW4MmxImQ1EY82kqZNepL/U
	hwUfgQRxaOxD2onb0r5gL8UVjikz40aCI8y+cP95EgQzHMFtu50y0itAdvyqZv3nlcHjC81SNdn
	N6/8XzH8Cw9LleVPjvGT98SyK4YOZ5v1YTqgmzgWz9kFkdWitJe8TwR9JDI8owe+MMcFpG1Qksy
	x1nGeOO/XzDrWLtKWvBeZpaWgt8+UxWgHQEkWu6yLJdzEF3pqjoyAhK1cKDqRzHFIk03frXU5UT
	XwE2CTA5m4NnGOjbmSNexZybDwnR/mPN7TeNt2oXj72Wpnx2Rc+1EEvhZ6lXu5g+XeiKeUTCsuV
	uhghCN23gBvww5vns774DST/g01YsRQ4+sV/3o9jKPfC/yY2nBLSkS86meQc4DxebYg09ytpmtF
	jyq99gq0T4ia8fjzAVE1HsiKV05
X-Received: by 2002:a05:620a:198c:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-949ba8483e2mr3063300385a.3.1795601973717;
        Wed, 25 Nov 2026 02:19:33 -0800 (PST)
X-Received: by 2002:a05:620a:198c:b0:93c:5bfb:9a80 with SMTP id af79cd13be357-949ba8483e2mr3063297785a.3.1795601973260;
        Wed, 25 Nov 2026 02:19:33 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:32 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:28 +0100
Subject: [PATCH v2 4/7] media: camss: Define timestamp registers for
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
Message-Id: <20261125-camss-hw-ts-v2-4-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b06b636 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=3Wk6MWIrbtHnLGL1blMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gCs3Zyijlbxsqax1sIBBgufIj5uVkzV4
X-Proofpoint-ORIG-GUID: gCs3Zyijlbxsqax1sIBBgufIj5uVkzV4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX6E5hSV6nyYOY
 MxVkyePGcmNF5M7Stk6L+Qzz/345B5SPmTdDtbybisItZBDZrta8yX8Ge/PH3HW8hqczG8ucz1h
 WnSOgFuIODMzBHQLzjJYBUByBq4BRIk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX+tJSxSjUud0l
 OmkloiRnRmBPwNBH1FngVJRGyRfG3AujVYtr003NLLewzSzOUPYONZ2yEAkwVwtAg6wyFK2pkCz
 PybCn88m2NFB5HDMVn8RmrLsa6LhJI7Y3cn2l7v+QRPABU0H7lsn0TbZRAmEwl2G1xsr6FOs/en
 duu7hFf6oCMezz0wyD+jf9J3ZTXZqIu1GlbBjI6vqsq+vicgiBe16CmvDLKb4/brfj3UP7dUuHH
 RUy9TSbCEbKyzLhIJ5gzKCkquldUKwtdXP6Gw3TfrF28yBPdIsu3r//wR+bt3Y38YcJTvMbxn8K
 M2PHKUMnY0QhXK1+z9SArZ2MDFOBE2l2ptMexvgDiRVEJylYyoB+YG6F6vSNoUzl4ug2Z+rwvRZ
 7+S+Oy6VC5/4zcfkufIod6tNXRFbpAGwF8ozxB2AyU0/g8N6my7TQrlk8fU5SouP/HWAAStNwCN
 EoJaMNydIuO6h0kiUkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

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

