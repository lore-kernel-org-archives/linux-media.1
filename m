Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454217;
	b=H7RpSqMNGhnHS+XqeLqD441XTVFXpbHktgMBPQJmroHP8Cd+Gb2Oq6g7j0gUQgKg1e72
	 Bs1/hlznpdC/quKK9NPDDcj5T4McfXc1c4cAZj7xksSg2ccIm1qAIzt0JhoNQSA63JPOs
	 oYJppZ75gcumXHw3KlEb8lysHNXmZbno0+g8alIE9bBREvK0X4oUksywebJsYzALSHBu2
	 GrYgNgg5U7XkXzLepgDXvQ18rmvXgXUnQ4SWq38MW6ac5pa0EIKPFqD1ngjGte5Hd40Yj
	 kghFRdLW5ZEABMJ+RcDhinf15FVK8FK79LzytE9WBKDUpH0JmVS6jdlwrVGZaSkezcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=;
	b=TxImS0G/HL3b7MZ0BjxZS5JJdzxOm08SJMEI1D7zHuwi/+4Issrxtdj2ftVfmrz02v5h
	 K3jeGFkFyQg1JHxYRAWwt7hijh/gQqWxeGP62HoIRYqHf4XPE7u8soDiX2s+/fMucLlah
	 ZTpl5hEhc05vBJIlpIxWQ+PymAo8g9qc8O2XiMvUT0iNKkZ05Fn20zm63iUkikaBU4SFJ
	 hQrODa+gs1B/Fgx7l/1lt8Tvs4bYKwae6co47mPAMoMrN60mLFEJYAtp7wEbBMwKplJXh
	 YSsIXZrsZB4XvElEapWVIdG/2IqaScCPyKeRNivlC7QMFlRdk9d4uBJ3FOsO08HW5tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1UZspcA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Htg1kg/9";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404BF606A6B7
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 404BF606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1UZspcA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Htg1kg/9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGmS81861145
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=; b=Q1UZspcArDdeTUrb
	fhS9bbV/smsZy07uxfcgo5RgdDFDMhLin8FCeQY3b3uO1aXMyY8VvQH5u3A4fTIC
	dol2hRGsRD2UlfuZZJENUMNz3D/cPD3YRgXsqy9/fdEsUPPo7c8cEvLvXygdGHKl
	d9PYwFmXZcL6j5gj6vMDmaNJanE4yzfhMMOEW65ULlNvnoFDBirOMWX2EzEvFWs6
	6kLMzPQPajentGBrUDZNwhKqJ3WRIwkNCWXoVDVJoE+ygAg9SMxId8PkDzcpaONh
	C+9LCROVRKFVLPzIAtjAfenLgMzRLin6ESDkNGIuBrj0s1v/wQPH+aWAn4bbPuU/
	nDJtwg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2gxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ece7f075c4so977206e0c.2
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454215; x=1796059015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=;
        b=Htg1kg/98zLV3Guz7jIs8+QV27FCJIVAom4Sbr6FuOmku+qo9V7p9SZ806Vay9pdJ3
         aoEDxTP9Q1R5YFx9yWVrSinhvyo6+NzpkQZeSUPFV2z20Te1GUFpGrgG6nP5Ub+GX5Dl
         vf47xXiIpb7lmNR9FdYaBDgZucoKP3R3FFZKhyZET/W3h8YYp8bHyskk+0XuL+in80Ds
         R+/2XO+DQBmFQ2WWEPkWYC1MZkEOaIm4iePg/tO/gyVIvYJjjuIhalJMos/P2oZvotFk
         Hk2oiCRZkrTovkLs78iGaiVLcHd7q7w59Ss8IHRewog3OQpxrSUlcyU//eDjZfYDWigd
         2rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454215; x=1796059015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=;
        b=1P1ur3+Rtc71/MovXjclp0F9hUsx+APOrwfsmhPBVxpUJ1kQwK1xgvk4wwPewseqpH
         B7T1RHBJoh29AzyHTN8pwDQ+dwoTVq+49nKzYELq0u4mfVCHM4w9rq8jiU+NxFGZ1gjW
         zTHepEUwMXGO9R4w2kSpzH6MzndPuXpwHonnaixkrO6Jf8O39V20gmV3+KFXUOcp2rwM
         Sc34qUTKzh9iO0dxLMiSw9DqgclqsyHoqhnlz7l9AKmNTsEm4oXvCD+ZqJUNmJL5V/E6
         t3NCyBUqqfmpzwO4BHLRS+RcoT9ljXvZ9Svi4uwkVXHzTr4YY8e5JES/zdEjTWEYbLed
         t2Og==
X-Gm-Message-State: APuU4Z9vFK07zCkW8tA0bXGMkqJnXFjBp4Nb6cOm6uiw+bx786MQZ2u0
	2XMY+P1YAJHr5aBOM9v48guewBft5CJSG9tiyQ3vbQRc0FapCgkwN5/lS5M6ReEsmH2hwQo6bE0
	cr/e+rockv7ReAaDU2ySEXj8mIsCHov8QXfdW4w58EBbZEjskVlMYWgz6vG8f+XfimA==
X-Gm-Gg: AZFdTZd2s0FRUrFRpufzpZsGDDMXzoWTptFna9lv0uZ4kRC/0CrGvMew06kg4WjckuG
	RMVsWwbpcP12h2aVz7WDj/t4Q30YJ9i8Gx0YpgOLFkhHHYQMsVXXjAJArYZt7ZN4CG7FdlrT/qp
	Le5Cjx1WPb0ftAMRxHeaqkKf/xN684tK7ms9/bWmNtc5BvIgjuz+PPQW/KahahfGtGR6XkV/rPb
	1s8i5CuUhnMQnTgE0+NFC98DKjIAqfsvfenAq9rYbLMBxaBsvtHowBEgF/U6QPRCswcvwtGuz0J
	10OXdZOOVwT3+ivXfuJ5+ceczLy4AOBtyt699pKvtLbDx9hR4GTcvzv7CNmE1qvYn1G7Z2ZK35B
	3L6nSyvWK1azPH/fIZCKwLtB36BBViRMD61f/JdpZZ/08fiTMsynBdOyMLrJlzRuAWlwX4d26OI
	DpfyCecaVC1Ivfpe3OfYTw1RpzebRuXQU5YTWtIceoVge3iK2nZxXbTF/I8sa5Yn1d/6/VzhvhD
	W3sCrvqNouAW2QdEZooGoMcSart
X-Received: by 2002:a05:6122:21a5:b0:5db:4749:1737 with SMTP id 71dfb90a1353d-5ee8aea74aamr6082452e0c.4.1795454215436;
        Mon, 23 Nov 2026 09:16:55 -0800 (PST)
X-Received: by 2002:a05:6122:21a5:b0:5db:4749:1737 with SMTP id 71dfb90a1353d-5ee8aea74aamr6082167e0c.4.1795454214663;
        Mon, 23 Nov 2026 09:16:54 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:50 +0100
Subject: [PATCH 4/6] media: camss: Define timestamp registers for csid-gen2
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
Message-Id: <20261123-camss-hw-ts-v1-4-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX7VE3PJLE4t2U
 UAUYlp+YIqmv5snPdyMuBS9tXGYr9+qWTTMCb+H/r1XQ2Zd8TaIjHSNwiNCqsaN47sqQ8WvI3mV
 BNY6LkskIy0sRCUswwRvWI/gPkJ6PaM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX8+eZuhA8q1mN
 c5dYymhTV4gTL4ClPbtoTZKKrm/m7oZy3dszWazTXpwbV3yWQXOB56m7F6qYHp983ASVLatAEVI
 muXqOHUC7F+2afqouJ5EbNT0+fOFlvSSerr7uWFI8oRy1gd1wYPbvmmYJDYtLx5Ic4w723fik9R
 KwoQgz1+lfr8jX3qckKMbgREffR9FrZOyWjA/WoLenqsYfaDK1DTZnPEx3UJ8RSKw4nWDhySAds
 VvQJOocc8V+W/NJH0p9520+l/NvnQ6cM027LYZmoD3U/1Yn9ukEX3s8k6kYaEoTNg6z9xiVCr4W
 82pO9wUqQFqJwROUJ0O0eyTiZcX7TRLAUt8I8PVxjqrkxc1gS8rAira9/xptUObmMYU17wFgHpy
 qw3x21RcgYVU2CBEk9GPbKXHauHKM/oC4AZh1Utv5NLTK+Cdi18Ssg1FZk6a2EvAFfe08+F2ucY
 23Ta9N/EyMFwiaKTGTg==
X-Proofpoint-ORIG-GUID: L-aQeZK-PDGc9TczDfOpoSccTEpA4P8t
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b047508 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=3Wk6MWIrbtHnLGL1blMA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: L-aQeZK-PDGc9TczDfOpoSccTEpA4P8t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Timestamp registers inside of the CSID block are available at different
offsets from the CSID base depending on whether the CSID is lite or not.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 72f329c2bb1ddeec96f33c21198104157c14a73c..ac085ede704653a532aa1ab77b2845471d1e6900 100644
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

