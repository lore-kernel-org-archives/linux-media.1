Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674630;
	b=CQ53fa93AzlkCwnMmDOgjaG2EHPPKAfByhIrbvOk1kwiPb1jMwV7jBWmboWmgQAJZcTE
	 xUAjQFeLV++H/1oK1zkiMerev4+Ut0xm5I0pqfVOH11mB26PrdRvKvbsqPDUXcIhE9esB
	 Jysa/JNUhgM2aZV1DmJOZVemOUX5OYqaK9B2TFLFcLiPdRAxLPXh5Z8EqqYqm0KvW9CIP
	 BpMQ5hnsvvb+0vxQezL3/Z/lfXKe2QkJNdK8ds92QgNQOtN4ssUKfnu/C+l33+YfxvtFh
	 XFZpZxrbER9X+q5A3DV3Q7/0bkzP6jRWX4z7ogbP6PS1UOT88XKuD35Hpx3s0AWKrVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674630;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=twPhT6DCIljB9iVBwXtvD+GDtRBv0Oe/wv0kE3Py8cs=;
	b=iKo6wSD2WueF2L1hJFynDewG3VWdllD7h63vUS6szehjbKoYWEdCZwYTlmBoxLuVCTAv
	 EUEULsRNAo8qPonIGa4ggI9t3siqi0sd9nrZscOjTAIgSKoMXwaiYwPOJ/Svr6MQQYo34
	 7SSPr9NxvT6rtgr+JkxwHelx234GZnJHT4FIhAjgffbIrWxwgH0AL0oNrT92tmQqdm1dF
	 uLkXW3a308oniJCAtFwuki6pZGPHcQPMiHvXH2xyNEk9Nz7T/X6ks4mPZHJq/sXQuYtQz
	 qyDa+PSY9CGNe6DIGj85lzpBsE6zXgbXBL0DsEg7JytrIg63rodAii3rAhJBzTBCXOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kujeYA5m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kO3lEVB/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C4B606A331
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C4B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kujeYA5m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kO3lEVB/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ37S2B3731042
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twPhT6DCIljB9iVBwXtvD+GDtRBv0Oe/wv0kE3Py8cs=; b=kujeYA5mM7NFaQlD
	KH8i76l6iU0uQT+Jo5qIITi18WJMY5DCCmNWMW2iCf5rmUaUMElwmFilhAwk4ltl
	FMvA9WGrpHzVBJlsvZG78t02IYPHqHp3Huytvw9snHhwN5WuFhhg+LTphFzo7hBk
	5rkqlJT2l4WKka1TRxcztnCV0qCctbEXzyP4+jfcm+kfvMl0PSPtnyfWA6IlBfTo
	vDy+/JoaAt6dKIFJJKAHjorhzOiKlu1OyEqUGft+75c44Lne2CNe7dhW2+yi4FzI
	z3VGZc4sChgd1nc28UK2r60lS8fYi73V4DJaGY3a0HODX34sFw+Fi/z9T10F0wZC
	Z4Z4Ug==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ark0tx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:30:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2edd25534afso55783815ad.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674627; x=1796279427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twPhT6DCIljB9iVBwXtvD+GDtRBv0Oe/wv0kE3Py8cs=;
        b=kO3lEVB/i5cQxtE7UMjC3hwGR4eAuG3dVe0b/Fs8alTJX2vd0iF4dch8tRJBIbwXYh
         oRlixnJNSwKi9j9iHUHkROsDQ3LvSkYl6FKDldD8GVNN54sH1UxBv3Tdo/gH6HLW3wAC
         bpiQOVb/PXhaYPanaxcHnmVGIsJWBfYbBjO9d7UVFTEM2+cL94QOKaw6dBl/PxWbrp36
         8WlVIHEXNxINzFXYcch1YFZGrw87g01P+F3/CW9VMatRM649Gvs0YS7xS5I9FcY+Vl7f
         rc9+TaVIIuxNDgsAc4AQ3dkRfkiuouUatzN7K94oj7jOWQzco64Nxh0NiND4jF+NDY7M
         c81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674627; x=1796279427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twPhT6DCIljB9iVBwXtvD+GDtRBv0Oe/wv0kE3Py8cs=;
        b=c4OHUEDaH2kFetakJP2uOsSHdMX88SF7zeegG3XQmFKbZIzvnaqVL0TcEi9cwUww3u
         /Y8hneqc606pOGgYWgBnjtGKXjQJ8SdOep5jx0kbcOC4DOTbjXqRwxrBwkMWec4knIr9
         PIkCwkAr3NPpxLiw/b3xOgoITNMQIusqeV4CmKyqhQieEBBcYe0NkLI3piDgUcfj7Mz8
         H4Pv2AhpsbCJOfn2m+Czw7joVGZ8LL8M9PKMKkod3z5PSitWsnVwl/CryupQI4eBlWyu
         KrIyaFc4DQeZ3U/Ofv4l3H0dJofF6CktaUKDGAAIiz1mJwNv51sJX2VGkLBY/DAnBcGN
         6zHQ==
X-Forwarded-Encrypted: i=1; AL+hErHBrTUloveuPUHL49Ur+qgCcl9Zvjj2IOlwFBof8pupIrsqloD1cqcENRH5odUiuf7TenPZLjWgZlotdQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/BhwvTbjVwtwGiPsMwEeK6kIYEHic5hlcoTV0Bv03IqLsNvMWQ
	Efp9U78g+X0jGWu67IyJr+4cJj355yaAXLiIAGtziuRS5Nhtv/3R8SYdo1cv/8A4hxoyu/CAPAR
	2EcswkkOM6K0frNPnFVl/PBQkvk2hzlKmSNUIYjY6wuFNMb6NSEcvthUJPkDQhSdqyQ==
X-Gm-Gg: AZFdTZeraYaxPqWHT2+iy1cCqTw0ktGbJrlRkv87c3TY7oA0k/p8bFcwKmYzoFk+ETK
	lwj4viKVXLO7IsyL4RkQWKRyp0mFM5gp9hAAOa+bRzdBGRC+1asvn0AAhjSTpsTZfZ8iEyo8C+e
	WLOLcUw0R0xPauXuHJZBwqHWI548rhFCxYaZp1/A6YcDtJSOHyWoXS0dPDDP4sLQIZE0IyojkDp
	s7CfGX1rZV0Fqubncs8vJ1/WYAvRtX0y7YguEIqTpO+Bo8UFXl8a+nhbU++t/qinckszlyA/7uT
	Ns4G7xxkU0E3J+DVf8fflNe/Ta2qk2AttrSoUaVi3DAqPVe9ps1NNFGzY0op/aH4gRZfCJ7TYFy
	fCp1SMxSMPG7bR7bRzf2yA+te9oJ3CKxqvj3fAkaSVHzb/XLydKv0l51C0G6L9zp4X6Z2vNFVI1
	ZXLw2ul8nr
X-Received: by 2002:a17:903:b0e:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2f03f1e0d4amr200898035ad.54.1795674627274;
        Wed, 25 Nov 2026 22:30:27 -0800 (PST)
X-Received: by 2002:a17:903:b0e:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2f03f1e0d4amr200897475ad.54.1795674626705;
        Wed, 25 Nov 2026 22:30:26 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:30:26 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:15 +0530
Subject: [PATCH v3 07/21] drm/msm/dcp: Handle asynchronous HFI responses
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261126-jshekhar-v3-dcp-v3-7-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=13639;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=LBsHeuV6bgv/pBpJy3SD2kKtIvR3zofMrxf2Y7qPd/o=;
 b=UONHsd8o0l7P1cL6iaNhwt6mNDJufolOWKuQNXurN+uwvrMryR0Vz/qYPSoWdiMhFIX/qBIan
 3sZLAA+i305D7OjCgRu+ZB57mq1b/8aSHFxVldQAskZKswiAjZR45Wq
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: SchOtGa6QHc-m8uzfDcMLZJ9X3gDLziW
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b07d204 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=V-hixniTzbwhkIHIihYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: SchOtGa6QHc-m8uzfDcMLZJ9X3gDLziW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX0Ze6S2u0xPgh
 /8+xNSjRh4VPa9lc88aqG/QYr0NfZVcGNyRe8m75iQE3LcOshRPTwAEuIXvOSfvhLnY/3xgtMX/
 OvmhT3S5dAPDdAE1yX2JcB95Vav71Xo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXzcPdktE16JDH
 lJh7sqwOoCZe/jpnracLPRzaIil3bpsNJuMrzkLZvqYvo74gOaTJnp++UggIbqbZXrqHd2lfx4S
 uKUwHHhwQbLCpdHE4dAlncKcQGfXqCHYLcTfFTYwtwMGKjOKx45fVX25UVNxlppE3TMyBilZLQN
 SS6iBpdH7S+QLs5ht8wZaxXPSeZ2FRAZ0h4pGIVuLOufRd0zvZjhHt6DAOTW+vI2Rc35WNrM3gz
 mo4JMWPOcgAH68jqcrzcS7lMXlJGklm5W3qhEZ7pT69eDNsu5kJzuKCMJMNm61vTplN5YNdiQHN
 yCDLsPmk4oL9s0jtOcD7h/de0qzDB8pTILokxRiUqya0xF7uc0NUswH9fDn2730Ylq3uG8THfdO
 fp3UCrSMnJKeju6FUxFCnMYAmGCgorgPJ3yCwrWIuzoWJLFgT6co4oyaWjBfBNv/MY9lmKS4Dug
 S9KTF4Mx7V6IoraK+EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Handle HFI messages that are not synchronous command
completions. Capability discovery, resource voting, and display power
control produce asynchronous responses that must not be mistaken for
ordinary command replies.

Dispatch display events, cache capability payloads, deliver
power-control notifications, and defer resource-vote processing while
preserving the existing completion path for synchronous commands.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/dcp_hfi.h      |  41 ++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_core.c | 245 +++++++++++++++++++++++++++++++++
 2 files changed, 286 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi.h b/drivers/gpu/drm/msm/dcp/dcp_hfi.h
index 9c80e38aa96f..6ea2969e5d89 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_hfi.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi.h
@@ -19,11 +19,24 @@
 #include <linux/workqueue.h>
 #include <linux/xarray.h>
 
+#include <drm/drm_mipi_dsi.h>
+#include <drm/drm_modes.h>
+
 #include "hfi/hfi_packet.h"
 #include "hfi/hfi_pack_unpack_common.h"
 #include "hfi/hfi_packer.h"
 #include "hfi/hfi_unpacker.h"
+#include "hfi/hfi_commands_device.h"
+#include "hfi/hfi_commands_display.h"
+#include "hfi/hfi_commands_panel.h"
+#include "hfi/hfi_commands_display_events.h"
 #include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_defs_display.h"
+#include "hfi/hfi_defs_device.h"
+#include "hfi/hfi_defs_panel.h"
+#include "hfi/hfi_properties_device.h"
+#include "hfi/hfi_properties_display.h"
+#include "hfi/hfi_properties_panel.h"
 
 struct dcp_drv;
 
@@ -35,6 +48,19 @@ struct dcp_drv;
 #define DCP_MAX_DISPLAYS	4
 #define DCP_HFI_CAPS_BUF_SIZE	4096
 
+#define DCP_HFI_RESOURCE_VOTE_BUF_SIZE	256
+
+/* Wire-format resource vote entry. */
+struct dcp_resource_vote_pair {
+	u32 key;
+	u64 value;
+};
+
+struct dcp_resource_vote_wire {
+	__le32 key;
+	__le64 value;
+} __packed;
+
 struct dcp_hfi_caps_cache {
 	struct completion device_done;
 	struct completion display_done;
@@ -135,6 +161,21 @@ struct dcp_hfi {
 	atomic_t packet_id;
 	/* Blocks new work once transport teardown begins. */
 	atomic_t shutdown_in_progress;
+	struct work_struct resource_vote_work;
+	/* Protects resource_vote_buf, resource_vote_len, and callback state. */
+	spinlock_t resource_vote_lock;
+	u8 resource_vote_buf[DCP_HFI_RESOURCE_VOTE_BUF_SIZE];
+	u32 resource_vote_len;
+	u32 resource_vote_generation;
+	void (*resource_vote_cb)(struct dcp_drv *drv,
+				 const struct dcp_resource_vote_pair *pairs,
+				 u32 count);
+	/* Protects capability payload buffers during event delivery. */
+	spinlock_t caps_lock;
+	/* Serializes capability transactions. */
+	struct mutex caps_cache_lock;
+	struct dcp_hfi_caps_cache caps_cache;
+
 };
 
 int dcp_hfi_init(struct dcp_drv *drv, struct virtio_device *vdev,
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
index 9c46a4560a0d..1a1addd33877 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
@@ -9,6 +9,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
+#include <linux/unaligned.h>
 #include <linux/slab.h>
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
@@ -21,9 +22,13 @@
 #include "hfi/hfi_packet.h"
 #include "hfi/hfi_packer.h"
 #include "hfi/hfi_unpacker.h"
+#include "hfi/hfi_commands_device.h"
 #include "hfi/hfi_commands_display.h"
+#include "hfi/hfi_commands_display_events.h"
 #include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_defs_display.h"
 
+static void dcp_hfi_resource_vote_work(struct work_struct *work);
 static int dcp_hfi_prepost_resp_bufs(struct dcp_hfi *hfi);
 
 u32 dcp_hfi_next_packet_id(struct dcp_hfi *hfi)
@@ -228,6 +233,191 @@ void dcp_hfi_cmd_callback(struct virtqueue *vq)
 	spin_unlock_irqrestore(&hfi->cmd_lock, flags);
 }
 
+static void dcp_hfi_store_caps_payload(struct dcp_hfi *hfi,
+				       struct completion *done,
+				       u8 *dst, u32 *dst_len,
+				       const struct hfi_packet_info *pkt_info,
+				       const char *name)
+{
+	u32 n;
+
+	if (!pkt_info->payload_ptr || !pkt_info->payload_size) {
+		dev_dbg(hfi->dev, "%s: empty payload\n", name);
+		return;
+	}
+
+	if (pkt_info->payload_size > DCP_HFI_CAPS_BUF_SIZE) {
+		dev_warn(hfi->dev, "%s: payload too large: %u\n",
+			 name, pkt_info->payload_size);
+		return;
+	}
+
+	n = pkt_info->payload_size;
+	memcpy(dst, pkt_info->payload_ptr, n);
+	*dst_len = n;
+	if (done)
+		complete(done);
+	dev_dbg(hfi->dev, "%s: stored %u bytes\n", name, n);
+}
+
+/* Route asynchronous events and capability packets before flag handling. */
+static bool dcp_hfi_dispatch_event(struct dcp_hfi *hfi,
+				   const struct hfi_packet_info *pkt_info)
+{
+	switch (pkt_info->cmd) {
+	case HFI_COMMAND_DISPLAY_EVENT_VSYNC: {
+		return true;
+	}
+
+	case HFI_COMMAND_DISPLAY_EVENT_FRAME_SCAN_START:
+		return true;
+
+	case HFI_COMMAND_DISPLAY_EVENT_FRAME_SCAN_COMPLETE:
+		return true;
+
+	case HFI_COMMAND_DISPLAY_EVENT_HPD_STATUS:
+		return true;
+
+	case HFI_COMMAND_DISPLAY_EVENT_PANEL_DEAD:
+		dev_err(hfi->dev,
+			"DCP: panel dead display %u\n",
+			pkt_info->id & 0xFFFF);
+		return true;
+
+	case HFI_COMMAND_DISPLAY_EVENT_HW_RECOVERY:
+		dev_err(hfi->dev,
+			"DCP: HW recovery display %u\n",
+			pkt_info->id & 0xFFFF);
+		return true;
+
+	case HFI_COMMAND_DEVICE_INIT_DEVICE_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, &hfi->caps_cache.device_done,
+					   hfi->caps_cache.device_buf,
+					   &hfi->caps_cache.device_len,
+					   pkt_info, "DEVICE_INIT_DEVICE_CAPS");
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_DISPLAY_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, &hfi->caps_cache.display_done,
+					   hfi->caps_cache.display_buf,
+					   &hfi->caps_cache.display_len,
+					   pkt_info, "DEVICE_INIT_DISPLAY_CAPS");
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_VIG_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, NULL, hfi->caps_cache.vig_buf,
+					   &hfi->caps_cache.vig_len,
+					   pkt_info, "VIG_CAPS");
+		hfi->caps_cache.pipe_caps_received |= BIT(0);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_DMA_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, NULL, hfi->caps_cache.dma_buf,
+					   &hfi->caps_cache.dma_len,
+					   pkt_info, "DMA_CAPS");
+		hfi->caps_cache.pipe_caps_received |= BIT(1);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_VIG_R1_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, NULL, hfi->caps_cache.vig_r1_buf,
+					   &hfi->caps_cache.vig_r1_len,
+					   pkt_info, "VIG_R1_CAPS");
+		hfi->caps_cache.pipe_caps_received |= BIT(2);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_DMA_R1_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		dcp_hfi_store_caps_payload(hfi, NULL, hfi->caps_cache.dma_r1_buf,
+					   &hfi->caps_cache.dma_r1_len,
+					   pkt_info, "DMA_R1_CAPS");
+		hfi->caps_cache.pipe_caps_received |= BIT(3);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_COMMON_LAYER_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		hfi->caps_cache.pipe_caps_received |= BIT(4);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		dev_dbg(hfi->dev,
+			"COMMON_LAYER_CAPS: received (size=%u)\n",
+			pkt_info->payload_size);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_INIT_DISPLAY_WB_CAPS: {
+		unsigned long flags;
+
+		spin_lock_irqsave(&hfi->caps_lock, flags);
+		hfi->caps_cache.pipe_caps_received |= BIT(5);
+		spin_unlock_irqrestore(&hfi->caps_lock, flags);
+		dev_dbg(hfi->dev,
+			"DISPLAY_WB_CAPS: received (size=%u) — all pipe caps received\n",
+			pkt_info->payload_size);
+		return true;
+	}
+
+	case HFI_COMMAND_DEVICE_CALLBACK_RESOURCE_VOTE: {
+		unsigned long vote_flags;
+		u32 payload_size = pkt_info->payload_size;
+		bool valid = pkt_info->payload_ptr && payload_size &&
+			payload_size <= DCP_HFI_RESOURCE_VOTE_BUF_SIZE &&
+			payload_size % sizeof(struct dcp_resource_vote_wire) == 0;
+
+		if (!valid) {
+			dev_warn_ratelimited(hfi->dev,
+					     "dropping malformed RESOURCE_VOTE payload size=%u max=%u\n",
+					     payload_size, DCP_HFI_RESOURCE_VOTE_BUF_SIZE);
+			payload_size = 0;
+		}
+
+		spin_lock_irqsave(&hfi->resource_vote_lock, vote_flags);
+		if (payload_size)
+			memcpy(hfi->resource_vote_buf, pkt_info->payload_ptr,
+			       payload_size);
+		hfi->resource_vote_len = payload_size;
+		hfi->resource_vote_generation++;
+		spin_unlock_irqrestore(&hfi->resource_vote_lock, vote_flags);
+
+		if (payload_size)
+			schedule_work(&hfi->resource_vote_work);
+		return true;
+	}
+
+	default:
+		return false;
+	}
+}
+
 void dcp_hfi_resp_callback(struct virtqueue *vq)
 {
 	struct dcp_drv *drv = vq->vdev->priv;
@@ -298,6 +488,8 @@ void dcp_hfi_resp_callback(struct virtqueue *vq)
 						"HFI error: cmd=0x%x pkt_id=%u\n",
 						pkt_info.cmd, pkt_info.packet_id);
 					dcp_hfi_complete_pending(hfi, &pkt_info, -EIO);
+				} else if (dcp_hfi_dispatch_event(hfi, &pkt_info)) {
+					/* Event dispatch runs before flag handling. */
 				} else if (pkt_info.flags & HFI_RX_FLAGS_SUCCESS) {
 					if (pkt_info.flags & HFI_RX_FLAGS_INFORMATION)
 						dev_dbg(hfi->dev,
@@ -642,6 +834,47 @@ int dcp_hfi_send_no_wait(struct dcp_hfi *hfi,
 			payload_type, payload, payload_size, HFI_TX_FLAGS_NONE);
 }
 
+static void dcp_hfi_resource_vote_work(struct work_struct *work)
+{
+	struct dcp_hfi *hfi = container_of(work, struct dcp_hfi,
+					     resource_vote_work);
+	u8 buf[DCP_HFI_RESOURCE_VOTE_BUF_SIZE];
+	struct dcp_resource_vote_pair pairs[DCP_HFI_RESOURCE_VOTE_BUF_SIZE /
+							 sizeof(struct dcp_resource_vote_wire)];
+	const struct dcp_resource_vote_wire *wire;
+	u32 len, generation, count, i;
+	bool dirty;
+	unsigned long flags;
+
+	do {
+		spin_lock_irqsave(&hfi->resource_vote_lock, flags);
+		len = hfi->resource_vote_len;
+		generation = hfi->resource_vote_generation;
+		if (len)
+			memcpy(buf, hfi->resource_vote_buf, len);
+		spin_unlock_irqrestore(&hfi->resource_vote_lock, flags);
+
+		if (!len || !hfi->resource_vote_cb)
+			return;
+		if (len % sizeof(struct dcp_resource_vote_wire)) {
+			dev_warn_ratelimited(hfi->dev,
+					     "dropping malformed RESOURCE_VOTE size=%u\n", len);
+			return;
+		}
+		count = len / sizeof(struct dcp_resource_vote_wire);
+		wire = (const struct dcp_resource_vote_wire *)buf;
+		for (i = 0; i < count; i++) {
+			pairs[i].key = le32_to_cpu(wire[i].key);
+			pairs[i].value = get_unaligned_le64(&wire[i].value);
+		}
+
+		hfi->resource_vote_cb(hfi->drv, pairs, count);
+		spin_lock_irqsave(&hfi->resource_vote_lock, flags);
+		dirty = generation != hfi->resource_vote_generation;
+		spin_unlock_irqrestore(&hfi->resource_vote_lock, flags);
+	} while (dirty);
+}
+
 static void dcp_hfi_free_pool(struct dcp_hfi *hfi, struct dcp_hfi_buf *pool,
 			      u32 count)
 {
@@ -729,7 +962,10 @@ int dcp_hfi_init(struct dcp_drv *drv,
 
 	spin_lock_init(&hfi->cmd_lock);
 	spin_lock_init(&hfi->pending_lock);
+	spin_lock_init(&hfi->resource_vote_lock);
 	spin_lock_init(&hfi->resp_drain_lock);
+	spin_lock_init(&hfi->caps_lock);
+	mutex_init(&hfi->caps_cache_lock);
 
 	atomic_set(&hfi->packet_id, 0);
 	atomic_set(&hfi->shutdown_in_progress, 0);
@@ -738,8 +974,11 @@ int dcp_hfi_init(struct dcp_drv *drv,
 
 	xa_init(&hfi->pending_xa);
 
+	INIT_WORK(&hfi->resource_vote_work, dcp_hfi_resource_vote_work);
 	INIT_DELAYED_WORK(&hfi->resp_repost_work, dcp_hfi_resp_repost_work);
 	INIT_LIST_HEAD(&hfi->resp_repost_list);
+	hfi->resource_vote_len = 0;
+	hfi->resource_vote_generation = 0;
 
 	hfi->cmd_pool = devm_kcalloc(hfi->dev, DCP_HFI_CMD_POOL_SIZE,
 				     sizeof(*hfi->cmd_pool), GFP_KERNEL);
@@ -787,6 +1026,7 @@ int dcp_hfi_init(struct dcp_drv *drv,
 
 err:
 	atomic_set(&hfi->shutdown_in_progress, 1);
+	cancel_work_sync(&hfi->resource_vote_work);
 	cancel_delayed_work_sync(&hfi->resp_repost_work);
 	while (virtqueue_detach_unused_buf(hfi->cmd_vq))
 		;
@@ -807,6 +1047,7 @@ void dcp_hfi_stop(struct dcp_hfi *hfi)
 	atomic_set(&hfi->shutdown_in_progress, 1);
 	spin_unlock_irqrestore(&hfi->cmd_lock, flags);
 
+	cancel_work_sync(&hfi->resource_vote_work);
 	cancel_delayed_work_sync(&hfi->resp_repost_work);
 	dcp_hfi_cancel_pending(hfi, -ENODEV);
 }
@@ -864,6 +1105,10 @@ int dcp_hfi_restore_queues(struct dcp_hfi *hfi, struct virtqueue *cmd_vq,
 
 void dcp_hfi_deinit(struct dcp_hfi *hfi)
 {
+	mutex_lock(&hfi->caps_cache_lock);
+	memset(&hfi->caps_cache, 0, sizeof(hfi->caps_cache));
+	mutex_unlock(&hfi->caps_cache_lock);
+
 	xa_destroy(&hfi->pending_xa);
 
 	dcp_hfi_free_pool(hfi, hfi->cmd_pool, DCP_HFI_CMD_POOL_SIZE);

-- 
2.43.0

