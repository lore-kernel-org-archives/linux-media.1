Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601973;
	b=vlYhrFTovfvOEZD0UpaKX7dCJf/GQ6xopz18rttNSiAGL3VoskuT26tt214QXgXTCA7r
	 LEotQFtOP5prHaqGPKHQAxeskDJsOxjhYEAKOPgixy1V9fIeSBLHbTMap13mEEl9zrJ/H
	 YXQzVn/U4ziIGtQWcJ2AgWW4leXi6+GpMFso8w/eErqfpedYpsDlNNlCmxYLsj3Xl0nRu
	 WBgR7oUBC9g0tAzB5ICtaH/qbpCRd/MVNauAyWmEUIXImnUTK4uT/HmokF0noKzZ5WrCX
	 /OktIP+BJ2iI7o27u1QX7ymukiY9M9x88zRmQozCDESpTR4fNfg+/x9b2WhT4SsXYAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OBq9hxEBTY30KE8zgKDzNkgih/yEXBzPwZu+2cy8AqY=;
	b=YT+u+PTpmF36aAv3gSXARc4DU32LFbXJqoroBuYth/M4BlIH7uCUn78zU/ZiPe1jQpQd
	 3H+rnORfnli/FKLxv1HGa66m/VFt0AJqHDlrkQu1SK0etuG68JEzT+6QuYGmz4mFw5ELz
	 x+39MNA2SwAS5e9VnRpj8PSZ1TtPxGHQazK1FjalCF0asy7OybK4n5eW6S2B0TSXGA4Kx
	 EMjJ9aDtnWcWIerKOYh7DgmJdkaQbhGuN9UX6+lC0Yei76B0y2+U1kc9oVoOtu1mtjPe9
	 naWQvLwJtW4gSKKLU5keHKHIk1QJAgW2OsVv84tjsTlCEZlMZ1XzbZDsEt6XYLkHZwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nboM4eYZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxYbVlU+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89CC606A6A5
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E89CC606A6A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nboM4eYZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gxYbVlU+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mHAg2121176
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBq9hxEBTY30KE8zgKDzNkgih/yEXBzPwZu+2cy8AqY=; b=nboM4eYZZYF2I90s
	3hQrrLF6nXRTzzJNMcITB/F0fkUTDbsgS9tY0iaUxuS55mGlrOWuRy7+yHqD90RQ
	okv3pMvGXXdhxfrHnUFmaS5z4nymR5MJ6Fj25a2xgVx/fD+Wcf/UUAjqzpAypVvr
	GxK43fHQITuKXe9iPUcbHtYXPzs7Qrg7ob55vuw7K9PDdF9WsTbvp6b750Vr3BQY
	AWro5SfKyDMzA4+nYB/1Q6xrrsKYUxFT5vRrH/ofNW5ngj6hO/V6xHN+e7a2cQqM
	9xiiSsJvS/5uymXndz8fzXW02dGykviVRLxqvgiZSKJQ3yygIGZA24+bmFp9lwEv
	G7dm2g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukraux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495c71055bso164455185a.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601971; x=1796206771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBq9hxEBTY30KE8zgKDzNkgih/yEXBzPwZu+2cy8AqY=;
        b=gxYbVlU+qeWYZ7BNN1v8zX5abeeF0aroWt+fc/nY9V1laqnQ/cC5BVfSiBlqvXEl4v
         2X8DCcOKfOosB9Vn7SGickG2vZQ9BRZzgOLV8kBmYd9LLKVH6fImVrv/8z5cBEzktYnu
         G0KVzSu6Wh04hp5q/HwZLpJnLBLubwH/Xu+M9IkTDlAJujfST9BKs5zM84dFqPMbDoer
         Ey8btQsAlkXY6CP3TOD/0uPSeZL4WX74YZQh7ar+zKl1DvoMGhQPnpb7IBov9CXRYXNL
         UwZOtulH08qwbGq46Zv+WowaF6l+n+hpFwGdYCuLhpeRHe13XhniKsHCtFzfjcbEpRYC
         rKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601971; x=1796206771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBq9hxEBTY30KE8zgKDzNkgih/yEXBzPwZu+2cy8AqY=;
        b=drCHiPc5fAs2GIIAcpwJd7NjR9atyqaNYoWb0cjva/RZsPQQ1Y1VmiDElpV/dJ2RLT
         Zdc8pxkmIxoUZC+2br/VUdefLeofxz3OpOCGE6G7aXzrcQvrKRxw9aOMbHjBLnOcQuI5
         G4wMj9eqUNv4CqXfXWr8MU1wElGzntS3ULqULyDwSiSk/VoRxEVNM+hj2orqygS8Qa3X
         Gi6IwzGAJfxaNW0tKmg+iUg/XFp5jpYqYdDLUfGrd4xgxVJCjK3NlaD+SfiPTvToxqUW
         Y/RyomdYH88Lq7UHmk+ecKpnzrh4ioyZZJm41LczAf9nEOpDJ6u7tUeucLFMRQf++SUd
         dveg==
X-Gm-Message-State: APuU4Z9fDuDhJc+sf0NrY/2KyeyR+u3l63eIkS4GEvDYVyc5Bxg3bNxQ
	x/ck7Fy0wtCY543wxEp+/9a1aLrEpdHHIWM2Y3JYCF6Nrhx99TI2OXYQOQsiK/9FHS+wNmmgkkR
	RD23dTDAr7bVuOc/eBRB/uMrTQv4kJDkjsmJvgw3Q3vZM+PXrh6OOImZaxdzqEoMwcA==
X-Gm-Gg: AZFdTZdm+sfSfPaP4S4MaLAvZeszrCzstyYiWSNde6B579NNiORYfLF/BwfIMHmK4J2
	miJOlDpxc9WOOoJ3g0tuW9a1f/YRngL0LuGRqdSZwhrUGPYDMxN7/mLQ7ZQtT1hZF8oE47EdFyA
	OXAULl5si1r+dsUymJqY01KzYGkSAWY9tluNvERPfKRs0ORaDNf2swI6E888U89IQKLLEGxp1ew
	beHFI9vAigR/4flNJlDn5cJ5NB9TW2wTWOQFvcxPiIVt9MG6YFYMmsjFu7OOCZrJyz7M/rqunI4
	Xd34V4hQNx5dbWIpAxfJsetc27HNcuQnmhqYeW2DAJGGsXB5kzUtYNieZ/BnHfWg106u1C2mzj+
	VhH6xJpTIlk7m4C2WgAQ5XnWR1hsQxTIoGRjOyjOlZprzSbQ0NzBBNVPucVlGfDql2FZrpeztwu
	hd/Tdz2HfY50XFjPK7AYWP7m4wTKq4muRtWNq6R/ER86058AAALZmqg2WqJpZo/IFi8/uft3oV/
	0c8KqrmRJTmBA9/hNYBndilTOks
X-Received: by 2002:a05:620a:450e:b0:947:b201:fadb with SMTP id af79cd13be357-949ba9b7434mr3275928785a.29.1795601971184;
        Wed, 25 Nov 2026 02:19:31 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:947:b201:fadb with SMTP id af79cd13be357-949ba9b7434mr3275925485a.29.1795601970730;
        Wed, 25 Nov 2026 02:19:30 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:30 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:26 +0100
Subject: [PATCH v2 2/7] media: qcom: camss: csid: Add an operation to read
 the SOF timestamp
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
Message-Id: <20261125-camss-hw-ts-v2-2-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06b633 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=n8IlR8rfZ27013JM:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=wNx3drd21qk8m9CRNuIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: HnxXzlawmDXA8iQ0ZN1ccRaJof16PBYh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX3BfO+kxBSU+Y
 OZE5h9M0stm+FvECkt7EoxC1KwY5ICVu7m5iPtvMqMqAfr4NG7IkCqe9MwJZjk7nZBysBd22Tfy
 D5N+s65wDnAmjVs/yEOmaYrdVkaZecc=
X-Proofpoint-GUID: HnxXzlawmDXA8iQ0ZN1ccRaJof16PBYh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX2AsntOOq+EcB
 jiqaiIp8QhKqbP4kUlX+4zEz6Lx+ddn3UDnN1liZl1YPYxDfhePlhf/RQICI/p2XE06MmifU8AG
 YR6KLTOOGHqw7cd9H+95+vttdZhH/bJMkGe4y3T282Kg3erWzTLF+Re6vHaLkkQGWcUaJgdq04H
 YBBacTqq4cSIH8tu8yFgbl313SaaBE4EqD0PWdRzjDfVdvevvRXL4axdVPLjazbcjU30SZDGZ7A
 wKVI5ipJD7TdbMikXXB+se8CvgqBOUHRxVay1an5j35qYfYUSBkPRACAw1YvLqKtHZWNQ198OOa
 wlbNYteqJBLz9fbgsT2lFg4vz4Ll1mrWeZ38ENFKEyNaWcut8Jkz2K8PA41j9lZk9T+/geerLU7
 ElJ/6/ktl1ZcwJ+jzS+FpQQp6rqtvAht/ZXee1oXXiipknANfKDElk+5vGzwwsO3+6z68x4dGr1
 jaPfdzgBdFu5Uwq2QjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

Modern CSID revisions latch the global timestamp counter at SOF. That
counter is the ARM architected counter, so correlating it with
CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched value
into the time the frame actually started, rather than the time the
interrupt handler ran.

Add a hardware operation returning that counter value and do the
correlation in one place, leaving a CSID revision with nothing to do but
read its own registers. Revisions not implementing it keep being
timestamped at queue time.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 72 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h |  9 ++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 588122beec854ae5b78de9997b68c7a81d4207e1..0d9b4f7dd768aeaed65d01da58b4dd8a3a425cbc 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -8,14 +8,17 @@
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
 #include <linux/clk.h>
+#include <linux/clocksource_ids.h>
 #include <linux/completion.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/timekeeping.h>
 #include <media/media-entity.h>
 #include <media/mipi-csi2.h>
 #include <media/v4l2-device.h>
@@ -37,6 +40,16 @@
 
 #define LANE_CFG_BITWIDTH 4
 
+/*
+ * The CSID latches the global timestamp counter on SOF. That counter is
+ * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz.
+ */
+#define CSID_TIMESTAMP_WIDTH	56
+#define CSID_TIMESTAMP_MASK	GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0)
+#define CSID_TIMESTAMP_NS_MUL	10000	/* NSEC_PER_SEC / 19.2 MHz, reduced */
+#define CSID_TIMESTAMP_NS_DIV	192
+#define CSID_TIMESTAMP_MAX_AGE_NS	(2 * NSEC_PER_MSEC)
+
 #define MSM_CSID_NAME "msm_csid"
 
 const char * const csid_testgen_modes[] = {
@@ -1370,12 +1383,71 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
 	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
 }
 
+static u64 csid_timestamp_to_ns(u64 ticks)
+{
+	return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTAMP_NS_DIV);
+}
+
+static u64 csid_timestamp_to_monotonic(struct csid_device *csid, u64 ticks)
+{
+	struct system_time_snapshot snap;
+	u64 delta, delta_ns, now;
+
+	ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
+
+	/*
+	 * Translating requires reading the counter the CSID latched from.
+	 * If timekeeping is driven by something else there is nothing to
+	 * correlate against, so let the caller fall back to IRQ time.
+	 */
+	if (!snap.valid || snap.cs_id != CSID_ARM_ARCH_COUNTER) {
+		dev_warn_once(csid->camss->dev,
+			      "CSID%u: Can't use hardware timestamp, invalid clock source (%d)\n",
+			      csid->id, snap.cs_id);
+		return 0;
+	}
+
+	/* How long ago, in counter ticks, the timestamp was latched */
+	delta = (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
+	delta_ns = csid_timestamp_to_ns(delta);
+	now = ktime_to_ns(snap.systime);
+
+	/* Fall back rather than reporting a nonsensical timestamp */
+	if (delta_ns > now) {
+		dev_warn_once(csid->camss->dev,
+			      "CSID%u: SOF timestamp predates CLOCK_MONOTONIC, ignoring\n",
+			      csid->id);
+		return 0;
+	}
+
+	if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
+		dev_warn_ratelimited(csid->camss->dev,
+				     "CSID%u: Too slow! SOF timestamp is %llu us old\n",
+				     csid->id, delta_ns / NSEC_PER_USEC);
+
+	return now - delta_ns;
+}
+
+static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int id)
+{
+	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
+
+	if (!hw_ops->sof_ts)
+		return 0;
+
+	return csid_timestamp_to_monotonic(csid, hw_ops->sof_ts(csid, id));
+}
+
 void csid_sof_event(struct csid_device *csid, unsigned int id)
 {
+	u64 ts = csid_hw_sof_ts(csid, id);
+	struct timespec64 sof = ns_to_timespec64(ts);
 	struct v4l2_event event = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 		.u.frame_sync.frame_sequence =
 			atomic_inc_return(&csid->sof_seq[id]),
+		.timestamp.tv_sec = sof.tv_sec,
+		.timestamp.tv_nsec = sof.tv_nsec,
 	};
 
 	if (atomic_read(&csid->frame_sync_users))
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..17cc3b42c8d83180d6abfcc3efe22178dcc2f2e7 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -111,6 +111,15 @@ struct csid_hw_ops {
 	 */
 	int (*reset)(struct csid_device *csid);
 
+	/*
+	 * sof_ts - Read the counter value the hardware latched at SOF
+	 * @csid: CSID device
+	 * @id: CSID src-stream ID
+	 *
+	 * Return the raw counter value of the most recent SOF
+	 */
+	u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
+
 	/*
 	 * src_pad_code - Pick an output/src format based on the input/sink format
 	 * @csid: CSID device

-- 
2.34.1

