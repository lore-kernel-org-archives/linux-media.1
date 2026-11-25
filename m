Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593624;
	b=S//2iY8TAbaSUF8bRTrZCuT906VbsFXjdlyiYKXcK3hGe5pKpN4VqmE7dZuzr452wN2E
	 L6ljkGqQJ2zO1QpnUvSqpZTNZZU4p3lDZaWGD1CEk/br7o1zztApebhaYHgsNvoO/7ySf
	 PfomQ42YVdFD6OxEiPzY27y7f4Bb2wf08zPWsNSZU7BKk+AUc8BAagyu5tj5AaT4R3RSk
	 292Uv1y6El1gjfxY0o7xGoMCnWo/FPRsU/SJgbyVnrU3FPmcxO48y7hPzuEK6RBqrfG9u
	 qJa4TnZi843FNEpGiszk5CzwPtWZK7gfwr5F+AYPZI2vjDl8rDmT7O8gdEEQfGKQfOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E8makF8FM1RabaNV+Vat/DWzk+BJa7APz9oiRRwMMUc=;
	b=VikM781WXuJNfwb3SXAvgkXizcDIuhrwyleqWpwsOsyVhNFOtgGy3BLhHgIFIHipY3Ar
	 fRgz2IY3XGZ/UfwC3ve+7cZjvGY2pkoc17XzRkiiAxWB0H1ysjm/kR5SkGl3SBDkZ2dyd
	 exxHMkz3Ck2uqgLFxmqXyPO0J4I9EmF7xau35IFJmfRYk4+NsX+5AdW/bR1gKVBJfJL1C
	 zUt99OrM75Y6nBlqnG2i82fnPhL13BGBzHhGGQMlL+vkvEhqrj9GEqhRR9wm/zARb+TkZ
	 /DPu5SqUCQx1ZaSS/5omgdBtmDNdrdXuBBezb0LDONt1AYnuPf0UHAUA9jYQUdnF6ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MB1nAShb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12146606A698
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12146606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MB1nAShb
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68lpV3113986
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=E8makF8FM1R
	abaNV+Vat/DWzk+BJa7APz9oiRRwMMUc=; b=MB1nAShb0YngRFbK/b2GGN+iqoj
	x0NLSeiX2LpC+1Nk+pwZ4eOpeVamc3tCac0ZhZRVI2a+Pyg+O/OnLEqvM2L4OjEV
	j7fF9FpvURfwX1msXv++ubB4evykAeiwQGSvN2pBLRcApmbBVDdtYTTEsBNIfzAG
	O/xhSrGHbXne5IshdA6rAu5FVWwjysdklV9Q+IIvm6ccvms4onJ51YVh3KEuaz2R
	yFfgBKdZqn2KkAodn9KJhnPc3lETh2qzHclqD1OmMufVWu0SZ1hI6aWgKXBxnqHF
	BfFkOQI+1V/PbHPvXoVDy4OlwXAsmrTMN6zSexymVTxVRNcdqQYJst43Ocw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsadk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495a1f5e47so857231385a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593622; x=1796198422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8makF8FM1RabaNV+Vat/DWzk+BJa7APz9oiRRwMMUc=;
        b=ySkjPiOhSg5Pe0IDOwvnIswZ1I4KsFhO/lAhl6nmI4Oocu77/CHr8iyILsu11GNSNZ
         qgsXJmvmCixBGORgwh9mS1ZyTny/SXjjIVraJvfR0mC52PrWMXDVdrSwxXEnA9fM8J9p
         wxom5P4X+8AUlM2zhXD4q2CtZxvyte+3x0Azo+SCJRWmSh+4Z9ocl10wf+yHlfz/KG03
         O4xGJAn77s19XqRE3hj4GiZ4SnH5dG5xYcRYDxKtUOfv80xRz6WJCYGRgugaC3jclfzO
         Cvi0Z46r5pZqE29667ECRBtWejhw6tM7T2pmqmbes4MQSTXO14YKGPIN6czhQ3OF90c5
         tAVQ==
X-Forwarded-Encrypted: i=1; AL+hErFduAQ1paazcOFP9IVNGWNzSL+VgmqQ4K0V5Uf4ftHosajwwLZysXMyMnzeAs7iFkexkeexAb4TbTmwmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+qBnzmrsCj099nxW1tk9tX0fX0eJ0TnWk2KVRskTkKTPF1kgU4
	sML4gZRiWlhRejRQiTHELt2jsZDV9dnn5ZP2ReLXlrY/09jjZSMZP7OUDn2JA7/Ymh+eGiMqt9h
	C+34Sl9uOzvVaT0RRAC3p2ajysfVuLeNrRBwhJpZuJBZh/9aLiP+d1bTkIChVH8yFpw==
X-Gm-Gg: AZFdTZc4XLNQLGOmxH/HtdI89wlYfcqzQRkvaqKLtffn6mR0qr1caT1IN2CMKuJmfwh
	mRjwtXd17IC81gUcBiWlXBAB/ejUqtV8yNaNuDrThLq/OZfbNeIibrUlNvShrnKazhjpxGll5Qy
	48B4xETM6FBgv9okVPfzmSoGeiy2TGMqAb/TGH0waDpUFzW6zIV4QMry+Q9FAclwfA2jFFz/8J9
	E3cD1x8oMGdeO6Asi2scoJatOUiAbOEYrxKh+l662ByDi+9opPyNtNtD7Fblsc14hpe6g/b0HHy
	/hGHp11Ce3ehpuN+u9L8g6Q2FWUVmUybNRxedsBC4adezdK9Wa7oIik6WVZIU0dfZEDFwRoBs+7
	ie1oyDUmHPEsx9Fe7qA==
X-Received: by 2002:a05:620a:f04:b0:949:3ba5:15d1 with SMTP id af79cd13be357-949ba8239b2mr2982730685a.4.1795593620046;
        Wed, 25 Nov 2026 00:00:20 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:949:3ba5:15d1 with SMTP id af79cd13be357-949ba8239b2mr2982709285a.4.1795593618711;
        Wed, 25 Nov 2026 00:00:18 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:17 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 07/12] media: qcom: camss: Add streams API support in tpg subdev
Date: Wed, 25 Nov 2026 09:59:56 +0200
Message-Id: <20261125080001.2540101-8-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Jf6RyLuiRuDRr62fxPhqW6eT5UskapMe
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b069597 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=CAsIyaI2BfGF7LVpe1AA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfXyXpcJBIvfyt+
 JRcinHNtLA5xRsIpMjw4sidM6emVcwNY0i0tRIF/O8f9iwW7A+TkZsW+ZZl8GKJXxOBOmIkRmaZ
 OtGBGn9wRWZk6PYqgDNd6YIpj0rhyko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX+Olmq51Qi6MK
 7SpgegLkgP88z1+FOoszCbr5RTfXLNM+IJtGV5wioXnZoq6syaBUAS5i0OxjKjz6Z0h87mVFbCQ
 hlYiLycYDq4rF7axb22cfu4g8P106nEblQ4ExBwz4H3xCl0HImHbIan+mczOl74rI90cKXT7cQa
 Q9CAKnqZo0wvdS2SHofehzfpvfRwN45Q4MReLJOR2hG8N8WbVN5KaPYClW2LKz7swgJuBIqiPWD
 IAcQ4V4LDJw5Qp4ZZnjy5JS6I6dEFEVn2gLDUSookLsE4U+IB3/K95OUDxRfpXi6dhAehDBEDtV
 F+zDyn9QkUPzWb271p0ZLtQoB0NjNm116ccDTuJLYSF8VvKMTmGwSz9DF/7NOQLl9FDAlYS8Fxv
 0MasGtKpi6jyJGdOO1qahoTBafD1Ker1+XViZQM1Vp/qOAnHbSlW72lGrhcSQkI+R01pVBR2euk
 5IVPrx2W2YzJF29DB8w==
X-Proofpoint-ORIG-GUID: Jf6RyLuiRuDRr62fxPhqW6eT5UskapMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Add support for the TPG subdevice to generate multiple concurrent
virtual channels under the streams API. Replace the single fmt field
with a per-stream array sized MSM_TPG_MAX_STREAMS and track the set
of active streams in a new enabled_streams bitmask.

Add tpg_pad_enable_streams()/tpg_pad_disable_streams() pad ops that
update enabled_streams and (re)configure the hardware, a
tpg_get_frame_desc() implementation that reports one CSI-2 frame
descriptor entry per active route with VC equal to the stream index,
and a tpg_init_state() internal op that sets up one default route per
stream.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-tpg-gen1.c      |  63 +++---
 drivers/media/platform/qcom/camss/camss-tpg.c | 179 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-tpg.h |   6 +-
 3 files changed, 205 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..22fdeef8e76f 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -5,6 +5,7 @@
  *
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
+#include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 
@@ -106,13 +107,16 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	u8 payload_mode = (tg->mode > TPG_PAYLOAD_MODE_DISABLED) ?
 			   tg->mode - 1 : 0;
 	u8 lane_cnt = tpg->res->lane_cnt;
-	u8 vc, dt, last_vc = 0;
+	u8 vc, last_vc = fls64(tpg->enabled_streams) - 1;
 	u32 val;
 
-	for (vc = 0; vc <= MSM_TPG_ACTIVE_VC; vc++) {
-		last_vc = vc;
-
-		input_format = &tpg->fmt;
+	/*
+	 * The hardware generates traffic for VC 0 up to last_vc as a
+	 * contiguous block, so every VC in that range must be configured
+	 * with a valid format, not just the ones actually streaming.
+	 */
+	for (vc = 0; vc <= last_vc; vc++) {
+		input_format = &tpg->fmt[vc];
 		format = tpg_get_fmt_entry(tpg->res->formats->formats,
 					   tpg->res->formats->nformats,
 					   input_format->code);
@@ -120,7 +124,8 @@ static int tpg_stream_on(struct tpg_device *tpg)
 			return -EINVAL;
 
 		/* VC configuration */
-		val = FIELD_PREP(TPG_VC_n_CFG0_NUM_ACTIVE_DT, MSM_TPG_ACTIVE_DT) |
+		val = FIELD_PREP(TPG_VC_n_CFG0_VC_NUM, vc) |
+		      FIELD_PREP(TPG_VC_n_CFG0_NUM_ACTIVE_DT, 0) |
 		      FIELD_PREP(TPG_VC_n_CFG0_NUM_FRAMES, 0);
 		writel(val, tpg->base + TPG_VC_n_CFG0(vc));
 
@@ -136,31 +141,29 @@ static int tpg_stream_on(struct tpg_device *tpg)
 		writel(TPG_COLOR_BARS_CFG_STANDARD, tpg->base + TPG_VC_n_COLOR_BARS_CFG(vc));
 
 		/* DT configuration */
-		for (dt = 0; dt <= MSM_TPG_ACTIVE_DT; dt++) {
-			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT,
-					 input_format->height & 0xffff) |
-			      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH,
-					 input_format->width & 0xffff);
-			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(vc, dt));
-
-			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
-			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(vc, dt));
-
-			if (tpg->hw_version == TPG_HW_VER_2_0_0) {
-				val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
-				      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
-						 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
-				      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
-						 format->encode_format);
-			} else if (tpg->hw_version >= TPG_HW_VER_2_1_0) {
-				val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
-				      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
-						 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
-				      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
-						 format->encode_format);
-			}
-			writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(vc, dt));
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_HEIGHT,
+				 input_format->height & 0xffff) |
+		      FIELD_PREP(TPG_VC_m_DT_n_CFG_0_FRAME_WIDTH,
+				 input_format->width & 0xffff);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_0(vc, 0));
+
+		val = FIELD_PREP(TPG_VC_m_DT_n_CFG_1_DATA_TYPE, format->data_type);
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_1(vc, 0));
+
+		if (tpg->hw_version == TPG_HW_VER_2_0_0) {
+			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
+			      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+					 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+			      FIELD_PREP(TPG_V2_0_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
+					 format->encode_format);
+		} else if (tpg->hw_version >= TPG_HW_VER_2_1_0) {
+			val = FIELD_PREP(TPG_VC_m_DT_n_CFG_2_PAYLOAD_MODE, payload_mode) |
+			      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_USER_SPECIFIED_PAYLOAD,
+					 TPG_USER_SPECIFIED_PAYLOAD_DEFAULT) |
+			      FIELD_PREP(TPG_V2_1_0_VC_m_DT_n_CFG_2_ENCODE_FORMAT,
+					 format->encode_format);
 		}
+		writel(val, tpg->base + TPG_VC_m_DT_n_CFG_2(vc, 0));
 	}
 
 	/* Global TPG control */
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.c b/drivers/media/platform/qcom/camss/camss-tpg.c
index 5764a60fa34c..a7ef6d2bb4e8 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg.c
@@ -200,22 +200,78 @@ static int tpg_set_stream(struct v4l2_subdev *sd, int enable)
 				"could not sync v4l2 controls: %d\n", ret);
 			return ret;
 		}
+
+		tpg->enabled_streams = BIT_ULL(0);
+	} else {
+		tpg->enabled_streams = 0;
 	}
 
 	return tpg->res->hw_ops->configure_stream(tpg, enable);
 }
 
+static int tpg_pad_enable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	bool start = !tpg->enabled_streams;
+	int ret;
+
+	if (pad != MSM_TPG_PAD_SRC)
+		return -EINVAL;
+
+	tpg->enabled_streams |= streams_mask;
+	if (!start)
+		return tpg->res->hw_ops->configure_stream(tpg, 1);
+
+	ret = v4l2_ctrl_handler_setup(&tpg->ctrls);
+	if (ret < 0) {
+		tpg->enabled_streams &= ~streams_mask;
+		return ret;
+	}
+
+	ret = tpg->res->hw_ops->configure_stream(tpg, 1);
+	if (ret)
+		tpg->enabled_streams &= ~streams_mask;
+
+	return ret;
+}
+
+static int tpg_pad_disable_streams(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+
+	if (pad != MSM_TPG_PAD_SRC)
+		return -EINVAL;
+
+	tpg->enabled_streams &= ~streams_mask;
+
+	/*
+	 * Growing the active VC range live is safe, but shrinking it while
+	 * the generator is still running for the remaining VCs corrupts its
+	 * state machine. Only touch the hardware when the last VC disables.
+	 */
+	if (tpg->enabled_streams)
+		return 0;
+
+	return tpg->res->hw_ops->configure_stream(tpg, 0);
+}
+
 static struct v4l2_mbus_framefmt *
 __tpg_get_format(struct tpg_device *tpg,
 		 struct v4l2_subdev_state *sd_state,
-		 unsigned int pad,
+		 unsigned int pad, u32 stream,
 		 enum v4l2_subdev_format_whence which)
 {
+	if (pad != MSM_TPG_PAD_SRC || stream >= MSM_TPG_MAX_STREAMS)
+		return NULL;
+
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
-		return v4l2_subdev_state_get_format(sd_state,
-						    pad);
+		return v4l2_subdev_state_get_format(sd_state, pad, stream);
 
-	return &tpg->fmt;
+	return &tpg->fmt[stream];
 }
 
 static void tpg_try_format(struct tpg_device *tpg,
@@ -282,7 +338,7 @@ static int tpg_get_format(struct v4l2_subdev *sd,
 	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
+	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->stream, fmt->which);
 	if (!format)
 		return -EINVAL;
 
@@ -299,10 +355,13 @@ static int tpg_set_format(struct v4l2_subdev *sd,
 	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
 	struct v4l2_mbus_framefmt *format;
 
-	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->which);
+	format = __tpg_get_format(tpg, sd_state, fmt->pad, fmt->stream, fmt->which);
 	if (!format)
 		return -EINVAL;
 
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE && tpg->enabled_streams)
+		return -EBUSY;
+
 	tpg_try_format(tpg, &fmt->format);
 	*format = fmt->format;
 
@@ -326,6 +385,69 @@ static int tpg_init_formats(struct v4l2_subdev *sd,
 	return tpg_set_format(sd, NULL, fh ? fh->state : NULL, &format);
 }
 
+static int tpg_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
+			      struct v4l2_mbus_frame_desc *fd)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_state *state;
+	struct v4l2_subdev_route *route;
+	unsigned int i = 0;
+
+	if (pad != MSM_TPG_PAD_SRC)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	for_each_active_route(&state->routing, route) {
+		const struct tpg_format_info *format;
+
+		format = tpg_get_fmt_entry(tpg->res->formats->formats,
+					   tpg->res->formats->nformats,
+					   tpg->fmt[route->source_stream].code);
+		if (IS_ERR(format))
+			continue;
+
+		fd->entry[i].stream = route->source_stream;
+		fd->entry[i].flags = 0;
+		fd->entry[i].bus.csi2.vc = route->source_stream;
+		fd->entry[i].bus.csi2.dt = format->data_type;
+		i++;
+	}
+
+	fd->num_entries = i;
+	v4l2_subdev_unlock_state(state);
+
+	return 0;
+}
+
+static int tpg_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *state)
+{
+	struct tpg_device *tpg = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev_route routes[MSM_TPG_MAX_STREAMS];
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+	struct v4l2_mbus_framefmt fmt = {
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.width = 1920,
+		.height = 1080,
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(routes); i++) {
+		routes[i].sink_pad = MSM_TPG_PAD_SRC;
+		routes[i].sink_stream = i;
+		routes[i].source_pad = MSM_TPG_PAD_SRC;
+		routes[i].source_stream = i;
+		routes[i].flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
+		tpg->fmt[i] = fmt;
+	}
+
+	return v4l2_subdev_set_routing_with_fmt(sd, state, &routing, &fmt);
+}
+
 static int tpg_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct tpg_device *tpg = container_of(ctrl->handler,
@@ -433,16 +555,36 @@ static const struct v4l2_subdev_pad_ops tpg_pad_ops = {
 	.set_fmt = tpg_set_format,
 };
 
+static const struct v4l2_subdev_pad_ops tpg_streams_pad_ops = {
+	.enum_mbus_code = tpg_enum_mbus_code,
+	.enum_frame_size = tpg_enum_frame_size,
+	.get_fmt = tpg_get_format,
+	.set_fmt = tpg_set_format,
+	.get_frame_desc = tpg_get_frame_desc,
+	.enable_streams = tpg_pad_enable_streams,
+	.disable_streams = tpg_pad_disable_streams,
+};
+
 static const struct v4l2_subdev_ops tpg_v4l2_ops = {
 	.core = &tpg_core_ops,
 	.video = &tpg_video_ops,
 	.pad = &tpg_pad_ops,
 };
 
+static const struct v4l2_subdev_ops tpg_streams_v4l2_ops = {
+	.core = &tpg_core_ops,
+	.video = &tpg_video_ops,
+	.pad = &tpg_streams_pad_ops,
+};
+
 static const struct v4l2_subdev_internal_ops tpg_v4l2_internal_ops = {
 	.open = tpg_init_formats,
 };
 
+static const struct v4l2_subdev_internal_ops tpg_streams_internal_ops = {
+	.init_state = tpg_init_state,
+};
+
 static const struct media_entity_operations tpg_media_ops = {
 	.link_setup = tpg_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
@@ -453,12 +595,15 @@ int msm_tpg_register_entity(struct tpg_device *tpg,
 {
 	struct v4l2_subdev *sd = &tpg->subdev;
 	struct device *dev = tpg->camss->dev;
+	bool streams_api = tpg->camss->res->streams_enable;
 	int ret;
 
-	v4l2_subdev_init(sd, &tpg_v4l2_ops);
-	sd->internal_ops = &tpg_v4l2_internal_ops;
+	v4l2_subdev_init(sd, streams_api ? &tpg_streams_v4l2_ops : &tpg_v4l2_ops);
+	sd->internal_ops = streams_api ? &tpg_streams_internal_ops : &tpg_v4l2_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 		     V4L2_SUBDEV_FL_HAS_EVENTS;
+	if (streams_api)
+		sd->flags |= V4L2_SUBDEV_FL_STREAMS;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
 		 "msm_tpg", tpg->id);
 	sd->grp_id = TPG_GRP_ID;
@@ -497,15 +642,27 @@ int msm_tpg_register_entity(struct tpg_device *tpg,
 		goto free_ctrl;
 	}
 
+	if (streams_api) {
+		ret = v4l2_subdev_init_finalize(sd);
+		if (ret) {
+			dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+			goto media_cleanup;
+		}
+	}
+
 	ret = v4l2_device_register_subdev(v4l2_dev, sd);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register subdev: %d\n", ret);
-		media_entity_cleanup(&sd->entity);
-		goto free_ctrl;
+		goto subdev_cleanup;
 	}
 
 	return 0;
 
+subdev_cleanup:
+	if (streams_api)
+		v4l2_subdev_cleanup(sd);
+media_cleanup:
+	media_entity_cleanup(&sd->entity);
 free_ctrl:
 	v4l2_ctrl_handler_free(&tpg->ctrls);
 
@@ -515,6 +672,8 @@ int msm_tpg_register_entity(struct tpg_device *tpg,
 void msm_tpg_unregister_entity(struct tpg_device *tpg)
 {
 	v4l2_device_unregister_subdev(&tpg->subdev);
+	if (tpg->camss->res->streams_enable)
+		v4l2_subdev_cleanup(&tpg->subdev);
 	media_entity_cleanup(&tpg->subdev.entity);
 	v4l2_ctrl_handler_free(&tpg->ctrls);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-tpg.h b/drivers/media/platform/qcom/camss/camss-tpg.h
index 7fb35a97dd06..5a6e9e726716 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg.h
+++ b/drivers/media/platform/qcom/camss/camss-tpg.h
@@ -26,8 +26,7 @@
 #define ENCODE_FORMAT_UNCOMPRESSED_24_BIT	0x7
 
 #define MSM_TPG_PAD_SRC		0
-#define MSM_TPG_ACTIVE_VC		0
-#define MSM_TPG_ACTIVE_DT		0
+#define MSM_TPG_MAX_STREAMS		4
 
 #define TPG_MIN_WIDTH   1
 #define TPG_MIN_HEIGHT  1
@@ -89,11 +88,12 @@ struct tpg_device {
 	struct camss_clock *clock;
 	int nclocks;
 	struct tpg_testgen_config testgen;
-	struct v4l2_mbus_framefmt fmt;
+	struct v4l2_mbus_framefmt fmt[MSM_TPG_MAX_STREAMS];
 	struct v4l2_ctrl_handler ctrls;
 	struct v4l2_ctrl *testgen_mode;
 	const struct tpg_subdev_resources *res;
 	u32 hw_version;
+	u64 enabled_streams;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1

