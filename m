Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454219;
	b=dXwcC3JrrgIt4GBiWNUpsBlnvQzAhgcMiDx9CmXtdgNqm0rAYvOZMEmQAbDct4l4yOLe
	 2krG7E0cOVjORZ4iIwYmJL3OU3458Z9U6ewTzn0RKVU5aTnJuZpX8Aci93Hk38xx80yz6
	 xPm1jn0jUZ/LUeXU6u9usNWoLwS7WtPHuPdhIH052PgBSonwNEgBQ4U9qchhiZbTFWl2Q
	 nLE4KtAKFeVKV6yowtjPOc2rAQtjRa8LL6LT029wHH2QUlLRDSA5Mv+hg8H7fGU5W7X0+
	 HIUhr1+OC4M5WFBsI9sJumaqzGuvZyq1V21QuQ894Q/5850gg0r7c0lE4IAl6wd0NSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=;
	b=3HUI6N1K7CVC5BhHHC/r4zLbKOREPJ/6SeygHM7d+y5GvkRzrd+zsJc522slMQEK35Ky
	 c2CQiDWoL7Ho5KKiKze45NHG+tjaxyeaT6WfR+BiKRQiDN8BKxzc65kgN2L+RwPziWRFS
	 CxNM4pRbV3Ha15lY1pcy+Iaw3RI5wh1q45cV4Z1kJusmHXIpjvXvD8tkSWtZbnK7oVtWD
	 xDeZPk+yzufLeYMw/E61rjoIG4dtAVKV1+4yOEjZBuKDWEKyzSl4AiZuO5BWWhvtpzL7M
	 iIQ/EX/Y0iekBxoG4SWIwPTSItyUcalzXOalvl6US7FFKBKURu39rrSajFF36f6F5yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G7W/sysy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=blDthgvP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD39A60A2602
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD39A60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G7W/sysy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=blDthgvP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGnR61861249
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=; b=G7W/sysy5QqXs5Pq
	CaLhW1/Blz687mycCaPbDHVxLSvWM06H80aUr4zkulSPqC/wzlqvSuCDSUmv2bPu
	uTd0Q64+cvOqAO/j9a8HQnsRuRS6R3PA24N0HULf7nGKT9IFpjnkKccRaTU98q+b
	jKJTY7KWflQQMk8WBZ7F7Bk/KvP5+MluOK5nyQxaFjcBS4QPT76DGCVdiXxqnkHC
	a6ln8WZS7Uozj29nRoIJFFG7TTCDio1ADrw3kdI6fCLK/xr5yz5j9FJPdfzktkLg
	TEJhbYYQ2wbLXHs9UvMUFQub+XpfZ2e5uzjX2/mJ6ck/A5/JNgzmKOqkDZbNT9Fe
	G874ng==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2gxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ed100ed770so310735e0c.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454217; x=1796059017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=;
        b=blDthgvP9zSQ1nV2JsakV/P1W0kIUqDUIiJxKTsOKfHfX4JOC+NbpgTsv4SdfqtiPT
         6cGkow2XVNwgHOUKD3tymqB7oRMnBNN6ewX1EY4zmF9AVGPOTXIh+eMhdgAaW2Ud3p1A
         oy9XCtDt5ZfTrTpqB09T0bsB2/7EebWAvb+Hb3CgIahCVyQNO5Xt4+w1tWQKBzsKlC4q
         gt9IWyGC6+UP+p3mnaSTrrg3QmQkO1OLbobEamD5RiDNGyxHpIM4DwDISUcsRY4SdL0y
         DN9S6+RRzeBq4fAZfMHUe27MnHRvE5UpHx8XGscytQojJ+2dXHMkc3B+nNWa7ksACsfK
         dlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454217; x=1796059017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=;
        b=xfXJ8dME8Chjxiq6uTDED3htyFdUk/mHUiJ1ey/J9q+H9gHbaawo+9wIPTmSLV4H71
         lyr1nTefA9jL+cCeogNDJtlElPBq73BlPqXtGko9RvsHFuv5qACFuBdM3JkfgOsRDHpj
         GRmLFqkg9+VF0ztBzDztrcS53AdUIJ11aFrDcXmX//BW+68WfPBFH1c9XCXflxtzCMVi
         BXiBb4kxwhyadHQsVbpGA9Pl6P+CQXgzTsGorU6YMrYW3jqd3BSV9LOk0B2lKBuXT/kl
         fQdDfgfR6b5QqWDojpTivZVzM0vC3cDAfh/+MMT9j1c7rPkwpTGuHLEbMZU/dTQPM55a
         N+nA==
X-Gm-Message-State: APuU4Z+TChW4ymN9s6FW5KEfdegsyg2SzUd3p/t2gR3DhTLLz//ZKcy4
	j0qEyj2nL7Q8adL1Kl5Y9OO41MtQkklH2MY+Z06yuPTOxkMl+Moo0QDRQHJ/qQhJbU/wcbZntA+
	zEyWWlR0fuxhtjpV5hZeyX49LyWjQPBDBeP45Q2bXQV5oUQylr08FE7QDCjMUc5yaew==
X-Gm-Gg: AZFdTZfmKIn7Xm9qf0/cHAs+oBFXuEQ80zrCIfCaHqFFEaNIMPvsO3hDHSKIf6qHbdO
	txoMsLog+KtlxyIznGa+fjGOx+BSwZQOplor/HoN3LjWeVeyCutkDbHOi3v2ERCahdYxWVJi1J+
	9jJUKIEacXMayF7zSaTmGEun4NuktdOJ/wrlpQRYerb2hAh2t5vHXCO5Gpo4PGDuC6LnDTSy6lt
	qWScpOqMxHDbiYos+ztcFKf/vcAe1H5BX+lifUoe8cUxqZGhaax/oaEBmu4FHRlWhZif0WT4HEl
	faQu4ZJjmP3vA9hPwczQIJR4Fb3uRoCHwna1A9tf6vY8Ozr0E9JxzmUWfpyPW6hhlcYHBMLhf16
	dbworaVU5wiwHk62waTNoIVD9Mr8WGNpziWYW+PjQHWLhG0P0xHjVIIMS6r/SEkv/st6pKbDO8L
	h2G5mXK2s0ScEl/TVLRKyE5v033CgSj960cK09Rqilel1DZeV3miX7b9+T2JUkbGOwpmKYkOW+f
	N0/NhLi9dSsSp2/prc1cUsECjWv
X-Received: by 2002:a05:6122:130a:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ee8af25ffdmr5612709e0c.14.1795454216896;
        Mon, 23 Nov 2026 09:16:56 -0800 (PST)
X-Received: by 2002:a05:6122:130a:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ee8af25ffdmr5612646e0c.14.1795454216357;
        Mon, 23 Nov 2026 09:16:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:55 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:51 +0100
Subject: [PATCH 5/6] media: camss: csid-gen2: Report the hardware SOF
 timestamp
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
Message-Id: <20261123-camss-hw-ts-v1-5-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXyYvMpTFs65IB
 EsL3QHMZuZFsrtHAbEbhOnZ9xcmFdpghxQO4WtPLYe5vp685FLDc207dfs1dy14gm6aLerW0Kl3
 1JFekFB4NJPWA1ejFmcqap1E6Aajwzc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX0my2yg/AQpT+
 t1A6rn68zR+xwMmc0Jwate6/PrR0iqBDNNrN4+CWAnthw7ZcwdNONhZabyb7V29XG0XTbxKa6wg
 r7GlZGvx4wNHkE1mVoaOqMQ6jqU85qlCaxqV04gHtDqgupZCZ9Gxp4vVSq/h6y1VofM10/EsRJ1
 wuz2vQNzu3cEAivMMLIgoW1zEMfkfZO080UfBACmGEDC91x7gcAQkpQCtFlQ9I64fYZXJI9yWhN
 /S0S3JNFDi+dOLfoGb5hIxCW3k8cGpAMk3qx7/lACtQtWdkn7E9pqRgfEkGXt4NGp4bwwhPg2uq
 bg7vRKNjQsaZl9RJptO2lUIuVkDVUjGQyJmVNKQzV9L4dZyU6tGKbKbAyb7tI5+DnRFLOjjlsj1
 x2rX+y2Yvjpn8FMwqFA/OwddaBVH6Mt2VrbJPk2gsYuPIvmB2Hi8rR2II7fRai4s28clc7pZMAu
 Y1rskInVefzRzxpemKQ==
X-Proofpoint-ORIG-GUID: Xnd_XZGfyzBEjQWI8iWunvTvBOIthJTf
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04750a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Xnd_XZGfyzBEjQWI8iWunvTvBOIthJTf
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

The CSID latches a free-running timer value for every RDI at
start-of-frame, a timer that keeps running across system suspend. The
driver already enables that latching, it just never reads the result,
leaving the frame sync event to be timestamped when the interrupt
handler gets around to queueing it.

Read the CURRENT_SOF pair instead and hand it to
csid_timestamp_to_monotonic(), which puts it on the CLOCK_MONOTONIC
timebase the event carries. CURRENT_EOF and the PREVIOUS_* pairs are
left alone, following the reference Qualcomm Camx code which only
interacts with CURRENT_SOF.

Upstream CAMSS uses a fixed mapping of RDI to virtual channel, hence
VC0 => RDI0 and VC1 => RDI1, so the event id indexes the register block
directly.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index ac085ede704653a532aa1ab77b2845471d1e6900..a2da70d5533314816fdacfb8b07248860d243b58 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -376,6 +376,20 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
+static u64 __csid_sof_timestamp(struct csid_device *csid, u8 rdi)
+{
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR0_SOF(rdi));
+	hi = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR1_SOF(rdi));
+
+	return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
+}
+
 /*
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -403,7 +417,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 			if (val & RDIN_IRQ_INFO_INPUT_SOF)
-				csid_sof_event(csid, i, 0);
+				csid_sof_event(csid, i, __csid_sof_timestamp(csid, i));
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;

-- 
2.34.1

