Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795922;
	b=vmpCQRk3cGB6KT1JH2fqq7+x0w7j3fj5jKMxrAQxLNz3egnLfKwGkK0zGCb5Cvr8cT1t
	 EWI0GgJoCghXZkVdHLFKWcTwCeOpxXYdSXtU9rWDlfPMZ1FWFD4JmAiTtwn1X9U0TZaUj
	 N1F1UNK17UiOTmbZua8c8xdwWGHkQzVQ22ekAtxRnx25usJUwceqjXWbxmGSY/Vx1lo74
	 DbYWHZNQkWnzAeDVsL3O7ZCcR55zzP3JznieKuPCXj2DvwPSSM1VFPqYwBVBTTCHprFxo
	 0YgukPWC0ZZKOMsvyu66mHXAR6S8p2X36lCwkDMvWXtqPjAuY/luIndmC2VDUNn+PCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795922;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6g40nXt9Y4AM3m3tiqDwHnrE908XIDNWdeHZ2AeCuSk=;
	b=JH53eB5h3/2pfo/cfIPSCC7Nd3hmytwi4LW8CTc+IeZHSkGwx9aTdKbw/c5dcGq7LuZZ
	 HT4WotlOfGkoef4WX2xLv9PrlkMjT6eBaqrnPTQm6osiCO+03fpTZr5Ju0n+37NKv5dy9
	 eT915gYPAlulUdyitevFBmqt+xyC5NbMPulKI3TDoB+UXQ/B6gd7beir0VemnyRIQn8U2
	 MQs7bVFsnVOvA8Slzq0iqdBFDI2nNBf4zla0Lq9AHO8yQenDNw3ZDoXxRMXb2q9b9E/qt
	 4JNx0cy15FUl+OtjAxc8QuY/+VpecE+BIDycXrrWrRUbGIpJgkL3DaIzZiDb97bhXOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=amD9ydYC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TkZ9jKNh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960D1606A32F
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 960D1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=amD9ydYC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TkZ9jKNh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpBAC706539
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6g40nXt9Y4AM3m3tiqDwHnrE908XIDNWdeHZ2AeCuSk=; b=amD9ydYCKcixOWi3
	/u+5gbpOAt3nWA4jyUYQ4LCqu+gn1ZgUFfC1uip0pMX0H3MejV9tjnGNO0pxRaT3
	GFM+8chQGLrABih+Sgmbbf25Isnn0zpI90aV0DQ5LakouQ9re+SseAHvi5EdAfCk
	OV0LYO2eyx+k1E2ZqjS50b4qLj+bKvoINhErZP5da0SCCJrgK9kzkHY+AAYda0wQ
	xC1Wb2QdYVzAbj6f7tFZLUbc3cYWHAInuRqjDD5dLnWmq2EPClTfS7JFdR+X1dtb
	wifKTJLD2MkcsA3umQ6/NX5Hk94dIWZwcetUu40TXF3wo7MvKrpYntPG58JO9gx6
	NfIl1Q==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6t6ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:00 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67dad09bce0so6837154d50.3
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 08:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795920; x=1796400720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6g40nXt9Y4AM3m3tiqDwHnrE908XIDNWdeHZ2AeCuSk=;
        b=TkZ9jKNhHjLbyVvkZk54sbDAbkKeSsww+HiaCOf55SQuQH1iPF9wRHFF2fcF4SGdDT
         DGkp8RNXQjkyhzv8WbBRbn/BYYrZc3j6lIL/mwnWXtU9vRH5vvKy0VULCOUw0qYx3sMf
         Nn77RPdkK0aub4Uvmn19xlxEarRVngiwpR2T+JLD+7JAPjWcUOO9Iymaman/HBa38xtV
         SlWtfoqRloZBOLmi9bA2lSdE6TXfgyTaDKczEg1qsPtF2t2OH3D5ODBrjqBROHIb+2ZU
         ROhIviXacrm40vG1wk5b8dT3c1l8dhtkGeM1PpAbYV8TS4P8gzguU0fy7nTMy4W9J03u
         0wHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795920; x=1796400720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6g40nXt9Y4AM3m3tiqDwHnrE908XIDNWdeHZ2AeCuSk=;
        b=zJQ6dEjJLTavwLGOOnsKOuOJxyw1WfwX0ZbRQ5oelNjYTMeFWn2JO+VJZVYLF3Oitr
         x1RwEn04ec4WTI7h1TQKqPsnlf5yADwCGRELUIRiNqw7Ctca1RH2/43sBH3Yt6Bgo+8i
         Z1Jem+9nhbwRqa8zn/fC2cHxda1afvFfLzeh+hsEgX1rlSQvdFfjfOP/s/XLjsymZRZz
         eJpdqTdWhXLleg/BftK7mNmS+dN+E1TeKDcQfuHv38BFvmuxe1oaMoBdQ4jNSsUSsnUV
         qAqZDZEPKZVepmtqZzfP/Mf3wCMNJbjlly87eLSG+Np4prXKz4hV52TjXJwi2AJPPQ7n
         u1sw==
X-Gm-Message-State: APuU4Z8Jjz7FUdCsZYinaTLolgoWxzB5OdsC1FL0ZFKj+oQODN1OXwLr
	whSh83emt0ALZ2c77Oi8TGtUPrahARj7qv1KoO9HnaHQmAJNu5qTAkl1sDm57Kt9ReRVml4WhEt
	DvWKwSPMPQsqllummaISU907zG5dnRomq4XZI5R2xqngXIK8sgHVHp7obn1Q/QNLRbAOfCvfl3p
	69
X-Gm-Gg: AZFdTZdITfKRDb8pp5VNRRtNRgbtU9mAqqHIoLXTk+WWkzhfcVPwidUGDx9VvUsowLk
	er0CWb3D6tc0hTMq8sQ90l968iWmNdjWL1qdI77PeORcjK2lomcAsDn+aLLaP6e6vFk0ffG6IQv
	W1rXtAIViZoht2BZ4kQzqY3lkFW+BSGMMb2/JHSOqfB2WSNT00eS6qPrH2PLwnXzsgLOBa/fNIL
	77suB25sRMze0OGMB+RQY9Qv+zds7TdDkApugmR6t73rRDiU0j6iVxz0MsXw5msN6eZkadNdG4x
	tY+Kubt8s5cA1iAX7KUXPJmbLNzoUn8nDnzciEinU60qi2/kW6ljhiLk91buWAZyoOkXvWRMG1E
	xGoRFSZRXPXV/sybTy81RXdc9N4vVtU4cujQER8t/vYInch4D80/imGIS4aN7eYe+js6EVZ1Pi/
	46tyRlPXCFQ8uzQFABdLCowKDebNXiQ1bGVk0bBeAz0fD11XqQsqIhnuD/amw/qVkN13EgJGwhV
	Y1F9eAcpq96TxYXLP7BMNV5LLpL
X-Received: by 2002:a05:690e:b81:b0:67b:ed25:6981 with SMTP id 956f58d0204a3-67df446b547mr10773207d50.77.1795795919696;
        Fri, 27 Nov 2026 08:11:59 -0800 (PST)
X-Received: by 2002:a05:690e:b81:b0:67b:ed25:6981 with SMTP id 956f58d0204a3-67df446b547mr10773181d50.77.1795795919025;
        Fri, 27 Nov 2026 08:11:59 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:11:57 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:52 +0100
Subject: [PATCH v3 2/8] media: qcom: camss: csid-340: Report the hardware
 SOF timestamp
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
Message-Id: <20261127-camss-hw-ts-v3-2-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ksbmKrunfEHn5Lx0OeXpF5pF_LGOZBFX
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09abd0 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=q_A1cxkaZBfKfFhyi8QA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX3toPl0lXvY4D
 cx7LtGIMw2qNBUD5mzmBxXcGM1we/7G/DgysDVastdpH9BQOolf9znwz04kMuXo0OEm+PMvEaK9
 j8VnwiI511cAd1QHZbYq3C12LWrfm5Y=
X-Proofpoint-GUID: ksbmKrunfEHn5Lx0OeXpF5pF_LGOZBFX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX8UmMuHFsYnSE
 +36gnRbVCqcoMwGkBm2G0fgVITQcTYDXS6zTG3u0781f+kUVeQvqPuEGLD+wrbugIlZ3wTPHf9K
 2SkhDXLUWO8ZH3Hufu/IMa9AvQ1d59Sp7YzG0LSW0EINaPIKmp2IXkrWTNqm8FMgEVljmpul8Nn
 j5LGV0ffjX3IB2dAEINiqy3yfxHGiuJ3BbWCHKxzIgLYjU1ul3kPwtbkRSZPUchvo6R8AhGcOUI
 f0G+uBZOgPOCjKe5Pe09rP2fyPYAx7L6idpok8zJlE7hloadQURxlP47YTXOT2xC/Ws3PNcZVKR
 6qQdZYoxJIB8+/Cf8nMp8+euzBdcoS7NB9Kj7QArKUiku88iWZAlmdqff8WVX+zQC1rYJEOuTvM
 dJ4xJMo903lJBIMLT/QHNdxeYKRfzY9fs4k5YlEygmKeiuKw2xq3T9kWOIK7Cn3kLsrdLS5sn9w
 i9jlFWgs10qI2mjQ7uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

The CSID latches the global timestamp counter at start-of-frame into a
per-interface register pair. Implement the sof_ts operation to
read it, so that the frame sync event carries the time the frame
actually started rather than the time the interrupt handler ran.

Measured on QCM2290 that removes around 36 us of delay, with ~8 us of
jitter, from the timestamp userspace sees on a 60 fps stream.

TIMESTAMP_EN is not at the same bit in the PIX and the RDI layouts of
CSID_CFG0, so replace the single define with one for each.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c | 37 +++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 42ff629ce410d33f21930ee56d714f41911cc077..ec4b1d9a86fcf08c2ceb12b4c4c2b85b5c7b8e51 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -49,7 +49,8 @@
 
 #define CSID_CFG0(iface)					(0x200 + 0x100 * (iface))
 #define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
-#define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
+#define		CSID_CFG0_PIX_TIMESTAMP_EN		BIT(1)
+#define		CSID_CFG0_RDI_TIMESTAMP_EN		BIT(2)
 #define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
 #define		CSID_CFG0_DECODE_FORMAT_NOP		CSID_CFG0_DECODE_FORMAT_MASK
 #define		CSID_CFG0_DT_MASK			GENMASK(21, 16)
@@ -61,6 +62,13 @@
 #define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
+/*
+ * SOF timestamp of the most recent frame, a pair of registers holding a 56-bit
+ * counter value, the low 32 bits in the first and the high 24 in the second.
+ */
+#define CSID_TIMESTAMP_CURR0_SOF(iface)			(0x290 + 0x100 * (iface))
+#define CSID_TIMESTAMP_CURR1_SOF(iface)			(0x294 + 0x100 * (iface))
+
 enum csid_iface {
 	CSID_IFACE_PIX,
 	CSID_IFACE_RDI0,
@@ -108,6 +116,7 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port
 								   input_format->code);
 	enum csid_iface iface = csid_port_iface_map[port];
 
+	u32 timestamp_en;
 	u8 dt_id;
 	u32 val;
 
@@ -125,17 +134,21 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port
 	 */
 	dt_id = port & 0x03;
 
-	if (iface == CSID_IFACE_PIX)
+	if (iface == CSID_IFACE_PIX) {
 		val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
-	else /* RDI is raw, no decoding */
+		timestamp_en = CSID_CFG0_PIX_TIMESTAMP_EN;
+	} else {
+		/* RDI is raw, no decoding */
 		val = CSID_CFG0_DECODE_FORMAT_NOP;
+		timestamp_en = CSID_CFG0_RDI_TIMESTAMP_EN;
+	}
 
 	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
 	val |= FIELD_PREP(CSID_CFG0_VC_MASK, vc);
 	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, dt_id);
 
 	if (enable)
-		val |= CSID_CFG0_ENABLE;
+		val |= CSID_CFG0_ENABLE | timestamp_en;
 
 	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x df=0x%x port=%u vc=%u)\n",
 		csid->id, enable ? "enable" : "disable", format->data_type,
@@ -184,6 +197,21 @@ static int csid_reset(struct csid_device *csid)
 	return 0;
 }
 
+static u64 csid_sof_ts(struct csid_device *csid, unsigned int id)
+{
+	enum csid_iface iface = csid_port_iface_map[id];
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
+	hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
+
+	return ((u64)hi << 32) | lo;
+}
+
 static irqreturn_t csid_isr(int irq, void *dev)
 {
 	struct csid_device *csid = dev;
@@ -233,6 +261,7 @@ const struct csid_hw_ops csid_ops_340 = {
 	.hw_version = csid_hw_version,
 	.isr = csid_isr,
 	.reset = csid_reset,
+	.sof_ts = csid_sof_ts,
 	.src_pad_code = csid_src_pad_code,
 	.subdev_init = csid_subdev_init,
 };

-- 
2.34.1

