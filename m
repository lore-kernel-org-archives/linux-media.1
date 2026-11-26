Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674648;
	b=cwTPNmKWjgxESd6rYfGRdugTso8ySaLvOVDh4bWQeSZMfx2GBKts/RrxBD03xbV8XQtx
	 pyJlaiOr0t26PZ42Pl6aXlaRY/Z1RGAbH1BrMx5fZ2/b+r2bV6z8YQ5uDd0slnsiYQuQ9
	 xaFNP2pdrVhfS+fX+jdHrCq7fnxlIG55GSgf5+mhi6MeA+Z65Hcmqp+9pmbIo/E1c0Sf8
	 0D9MzKWXtY6oGHm7GItZn0zXswgTkvu4uGFNpnazXYdykN+ffVs3TDwzW9um37IGGnQYm
	 CsBxtMA2ZxfXzBjMvWuGWs2i2az0gUxGMH76XO3kNzharSCnyLrOmewNeAsbxc5yLiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XTpr7J/pVVPMid7XMJXRJDpa+IDEl4bFZ8gv0AnjgYY=;
	b=jCvvJ7Nvgk/SLUNtCI+qOODmv5NiCDW3MyYYOYG0pcBJQBfaTgikuYeS4e6zTzWbKrlP
	 27il+e3B2XfzqSB8lO61Wzk3Aq3Setjs//OHTqlO2gi6hdeoSmr2ihj9EU4USWhntjrOq
	 m4KNzOiAtGOOsBVsIhvxG8z+j0nMMB9SU564ZifkhYdRfiMrFZxoomB5ZWNZtxKEUMON3
	 kOQCHrEqrgK86Es+ixsiJ6a5jl1d5ewj7xsJ4T39BO3RI6wotjjfRitsigp/MpLlCOEH6
	 X7JUcMBq4TKGjNk/5vLPm0GFt+dhYlr2eRFULB/8UfTd5qRWte46GfMr1srUkfqvKqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=llo93vim;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNmHj3sq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4B7606A32A
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E4B7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=llo93vim;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PNmHj3sq
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ37TYJ3731071
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XTpr7J/pVVPMid7XMJXRJDpa+IDEl4bFZ8gv0AnjgYY=; b=llo93vimdbEj2dP9
	9VXj5ipedbu4sTa/joZ1eQs3QPkW6vBMy4roHRXQhQ2oPJ0mThF/tK7EhU9VsYz+
	SlHT7kKYu0bzzFRXN945uyW/kbNpUeQxYhRWyS53eqNQK5oRSR6ig4rTcodGjM39
	3BZ7arRGf5o+gNZV38JQ2aq7uK858S52z9EvsqGfbipGVqXk9yvREViGizfRB6b4
	F571ScfMoDuAMRbvNDYtfKd6NNEwpayaEZKWBQWVBMzFnO1d0gzlchDSwbdG+iAn
	Fzz9N6IIMguRNkNzIMyv+p3z5ddtnQtnrXNBaPTfNEZkPfC1dp33H84DZr6Dnj+E
	pJPN4w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ark0w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:30:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f04004edf1so43481515ad.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674645; x=1796279445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTpr7J/pVVPMid7XMJXRJDpa+IDEl4bFZ8gv0AnjgYY=;
        b=PNmHj3sqXC7uRPzH01nxmKuioTSW0JOPfuxCDlBZfSyZnSBUVPm4BdfA/fyufSzyEy
         nC5zB3tpirgXROyq9+NIfMm0Ki8b3NpoPG0TXH5eX96KNhUCMSvMmA4OlHxe8Qk8wCsk
         wy8Qbz44zWCsKgY3/lanuE/YJJs6yEtbkjRSYjEmd+ohNpWZoaN9L3bYPKbkHtE7e7mG
         L4EpmqCr6L5GFR043ia3VSNInnbs2BR7jnI0FNiZeHZLuB5+wfWXBoyZRRstasnx+RKM
         BWQzld1Gups71z+MHCGdizKumAvVM485xtyeFznZqlcLdWNCWMCQU+EXNo8yqH/5wGF2
         mlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674645; x=1796279445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XTpr7J/pVVPMid7XMJXRJDpa+IDEl4bFZ8gv0AnjgYY=;
        b=VyGDeffQ21dBwkYHnwbyWAisARVVcCl58o8aLqjchlRM52yzXs9kBKCFa+GumK8VPy
         /C7XH02LQx2GLpNCvFMtKkrqVJ/23zuBf8gEcLslBdU75eJlZDOwBac0yl0lmNN26HE3
         07t8JlXuG0iTJTNlttVn2vl4Q+fj/7avtdUgcO6CEqZoSEjaU9vdLTRQ8Xpyk3GC7hBG
         36ANS/0bTUUgXll02QGHO8+p8ryPGMjfC1RBy3oRj4jf+Ir15z0799XEise5zz1cYsyo
         MeBTCcE4tGNPto8BxlW6ydyvHp1xUtIRg10mgMm5qURcoAnEyfejfN8uxo8NXhAlSNLB
         AvsA==
X-Forwarded-Encrypted: i=1; AL+hErGL6RddVkdzYw4eVt5bnyqq9PrgK+gzlIEf7fvuNkxYYzvhKm1oa8sHOKRYD1GSYOdKOIF697fjQUCPbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8z2RUd14mZkj607uXEGJR0C6ManUZq5bj4KV9MtWUvxSMUw4YM
	k+LLYk+ektLTn16eHjZD8cQAjnkIQDo+s+QktLnQWqQsGos2TxiTlhLFcguH+jrvBO1QK8iwya1
	kTBe+eZB8uCz7NaSKOFU3AEorFryMmOuskDkyxZ3JMvWmYEvcsFeashmHET9NJnwjvQ==
X-Gm-Gg: AZFdTZff2Ak1aFPbFlVYePqz9sbxNcrTmkQh9JQr2XQMnuZlc1zbJk554k73RUBlymw
	0xzzedehX44950LLbvJeifdl+cYpuV6GyU9XNhbPd5UyvOauJKTu9ZRbtS3o95bH9aOyLRaFbSG
	yrVN65+hPrY1/MZfZGw7P9Wc0pCGACftPdCPKuykYk/459YPRiZagcBBse5Pz/10nCBjVCusL+o
	IulmVAY8T6Pr6woxq80azrJhT44jHovJSGLye5ohHBZ7IYryXjJO2tFOyOSX3cPGN3782ou1a3k
	9G+Ea4NZ3h3AKBuet8BHvbuOY0QvUHzWs2NmGcj089jgZ7bSP20zcE3iYgSSFxptLjwMdWukL9y
	tVyAjnn4l61AtTTVLvp41ylIvAMmOgkwBnfHJH8Q+am1LIBfHXT902HF1tJeYbSjbhITStkyuaW
	F0GDbL32Kw
X-Received: by 2002:a17:902:dacc:b0:2ea:19bc:2fe2 with SMTP id d9443c01a7336-2f03ef59bf0mr200938225ad.10.1795674644748;
        Wed, 25 Nov 2026 22:30:44 -0800 (PST)
X-Received: by 2002:a17:902:dacc:b0:2ea:19bc:2fe2 with SMTP id d9443c01a7336-2f03ef59bf0mr200937675ad.10.1795674644051;
        Wed, 25 Nov 2026 22:30:44 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:30:43 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:17 +0530
Subject: [PATCH v3 09/21] drm/msm/dcp: Add HFI DSI and panel commands
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-9-f1e9d7505039@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=30510;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=Pa4i5dK1uqJebhb4OH7q9E+oR7vnoLBJtY9AUBrpZOk=;
 b=p4vcoSXMTCNncG61hFEGsrIYbwNdGr57NU3fqxfbJaYgfApvlni+v+0tlb58SIO8secTqu1Zr
 WcpGEsSxc//BAXuXMKweSllYNTc9LBC77hfNc8mD8iiNfhhlRWXDdUp
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-GUID: xc0yKwF0WcDUT1gq4iHsi_46y64a71gK
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b07d216 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Um52liGsam6oDUn3MNwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: xc0yKwF0WcDUT1gq4iHsi_46y64a71gK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX+EVf43++YAND
 2LNE3cx7rVBTgLC1VN9+1XUixGGxW9xWF8K5MEMRewFouUrPCkZxU60QIkWSXUaM6jc4cx+CM74
 8+ln4dF2Jp2hT7y4orqn8FYx58n2nr0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX5NzayNbxU0RN
 4vZqRFg8nHUILFof660z2ePNAjUXDxoEQPJbCJFC+6n2M8Ekj9M8PS3TqhznIZ656z+rCo9I9nK
 lEYtlSShMhOD3U11ccTpmYJsMQWsSQrixJv8EUwQyF14KyIbUvjmUa6efH5I6ZlOKIU5GjgjFA+
 QtQf9mA2jCtaMX8EzhBiPwRpJcf3CR9iGJGDs49GIhtuvp4m6B1To6ZrGJxHkfVFqcVbwiDTaYl
 Ee/WZocE9xiZ6GCvhwwhTKmMbghIT53/1PpczFqdzxD4459tN3PVQ4RKOlC7PjU1i1ZlYqpQ6hD
 NpOVntmN2bd6X+Ext8nrvyZUmsj7lDISADhqgqC7cRXedZm92qvZAaoDHgzt7LXENVEFpx4oEE5
 WOBsjDuatEL7sxMTeZfITu41z8PEF3AK6IsgsOxXaW+k/ZxmuLNAiGETINzqkLQ95RBPfVvmii7
 UbRevMplv0glh2UjO8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Translate DSI host and panel operations into HFI commands. Firmware
owns the DSI hardware, so mode validation, display power, panel setup,
and DCS transfers must cross the HFI interface instead of accessing
controller registers from Linux.

Implement DSI mode validation, display session and power management,
panel initialization, and DCS transfer helpers while keeping them
separate from generic display commands.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile                 |   2 +
 drivers/gpu/drm/msm/dcp/dcp_dsi_config.h     |  67 +++
 drivers/gpu/drm/msm/dcp/dcp_hfi.h            |  21 +
 drivers/gpu/drm/msm/dcp/dcp_hfi_dsi.c        | 166 ++++++++
 drivers/gpu/drm/msm/dcp/dcp_hfi_dsi_config.c | 597 +++++++++++++++++++++++++++
 5 files changed, 853 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 08edb1c38a81..6a75bec4e95e 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -74,6 +74,8 @@ msm-display-$(CONFIG_DRM_MSM_MDP5) += \
 msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_core.o \
 	dcp/dcp_hfi_crtc.o \
+	dcp/dcp_hfi_dsi.o \
+	dcp/dcp_hfi_dsi_config.o \
 	dcp/dcp_hfi_encoder.o \
 	dcp/dcp_hfi_kms.o \
 	dcp/dcp_hfi_plane.o \
diff --git a/drivers/gpu/drm/msm/dcp/dcp_dsi_config.h b/drivers/gpu/drm/msm/dcp/dcp_dsi_config.h
new file mode 100644
index 000000000000..5f2013739edf
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_dsi_config.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DCP DSI output configuration shared by the HFI implementation and the
+ * DRM DSI bridge.
+ */
+
+#ifndef __DCP_DSI_CONFIG_H__
+#define __DCP_DSI_CONFIG_H__
+
+#include <linux/dma-mapping.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+
+struct drm_dsc_config;
+
+#define DCP_DSI_MAX_PHY_TIMINGS	32
+
+/**
+ * struct dcp_dsi_hfi_config - DSI configuration passed to HFI.
+ *
+ * This contains the DSI output configuration plus mode-dependent values
+ * assembled before the HFI configuration commands are sent.
+ */
+struct dcp_dsi_hfi_config {
+	u32 display_type;
+	u32 num_ctrls;
+	u32 ctrl_indices[4];
+	u32 num_phys;
+	u32 phy_indices[4];
+	u32 vsync_source;
+	u32 te_dcs_command;
+	u32 dma_trigger;
+	u32 stream_trigger;
+	u32 wr_mem_start;
+	u32 wr_mem_continue;
+	u32 dma_sched_line;
+	u32 dma_sched_window;
+	u32 phy_type;
+	bool cphy_mode;
+	bool lp11_init;
+	bool ulps_supported;
+	bool bllp_eof_power_mode;
+	bool bllp_power_mode;
+	u32 lane_map;
+	u32 color_order;
+	u32 esd_mode;
+	u32 jitter_numer;
+	u32 jitter_denom;
+	dma_addr_t dcs_tx_dva;
+	dma_addr_t dcs_tx_iova;
+	u32 dcs_tx_buf_size;
+	u32 phy_timings[DCP_DSI_MAX_PHY_TIMINGS];
+	u32 num_phy_timings;
+	const struct drm_dsc_config *dsc;
+	bool dsc_rc_override; /* Send the DRM DSC rate-control ranges to HFI. */
+	u32 topology_mixer_count;
+	u32 topology_enc_count;
+	u32 topology_intf_count;
+};
+
+/* DCS buffers use IOVAs directly in the firmware command descriptor. */
+#define DCP_DSI_DCS_TX_BUF_SIZE	SZ_4K
+#define DCP_DSI_DCS_RX_BUF_SIZE	SZ_4K
+
+#endif /* __DCP_DSI_CONFIG_H__ */
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi.h b/drivers/gpu/drm/msm/dcp/dcp_hfi.h
index 2b2c92daf18f..2408fcc59d65 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_hfi.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi.h
@@ -240,4 +240,25 @@ int dcp_hfi_get_capabilities(struct dcp_hfi *hfi, struct dcp_caps *caps);
 int dcp_hfi_set_display_property(struct dcp_hfi *hfi, u32 session_id,
 				 u32 prop_id, u32 value);
 
+struct dcp_dsi_hfi_config;
+int dcp_hfi_dsi_configure(struct dcp_hfi *hfi, u32 dsi_idx,
+			  const struct drm_display_mode *mode,
+			  const struct mipi_dsi_device *dsi,
+			  const struct dcp_dsi_hfi_config *cfg);
+int dcp_hfi_display_enable(struct dcp_hfi *hfi, u32 intf_idx,
+			   u32 display_id, u32 *session_id);
+int dcp_hfi_display_mode_validate(struct dcp_hfi *hfi, u32 session_id,
+				  const struct drm_display_mode *mode,
+				  u64 clk_rate_hz);
+int dcp_hfi_display_set_mode(struct dcp_hfi *hfi, u32 session_id,
+			     const struct drm_display_mode *mode,
+			     u64 clk_rate_hz);
+int dcp_hfi_display_post_enable(struct dcp_hfi *hfi, u32 session_id);
+int dcp_hfi_display_disable(struct dcp_hfi *hfi, u32 session_id);
+int dcp_hfi_display_post_disable(struct dcp_hfi *hfi, u32 session_id);
+ssize_t dcp_hfi_dcs_transfer(struct dcp_hfi *hfi, u32 session_id,
+			     const struct mipi_dsi_msg *msg,
+			     void *tx_buf, dma_addr_t tx_iova,
+			     void *rx_buf, dma_addr_t rx_iova,
+			     u32 post_wait_ms, u32 ctrl_idx);
 #endif /* __DCP_HFI_H__ */
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_dsi.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_dsi.c
new file mode 100644
index 000000000000..2f8aaca6f347
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_dsi.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * HFI commands for the DSI display-session lifecycle.
+ * DSI configuration and DCS transfers are implemented in dcp_hfi_dsi_config.c.
+ */
+
+#include <linux/device.h>
+#include <drm/drm_modes.h>
+
+#include "dcp_hfi.h"
+#include "dcp_hfi_priv.h"
+#include "hfi/hfi_commands_display.h"
+#include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_defs_display.h"
+#include "hfi/hfi_packet.h"
+#include "hfi/hfi_packer.h"
+#include "hfi/hfi_properties_display.h"
+
+static void dcp_hfi_fill_mode_info(struct hfi_display_mode_info *info,
+				   const struct drm_display_mode *mode)
+{
+	memset(info, 0, sizeof(*info));
+	info->size            = sizeof(*info);
+	info->h_active        = mode->hdisplay;
+	info->h_back_porch    = mode->htotal - mode->hsync_end;
+	info->h_sync_width    = mode->hsync_end - mode->hsync_start;
+	info->h_front_porch   = mode->hsync_start - mode->hdisplay;
+	info->h_skew          = mode->hskew;
+	info->h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_PHSYNC);
+	info->v_active        = mode->vdisplay;
+	info->v_back_porch    = mode->vtotal - mode->vsync_end;
+	info->v_sync_width    = mode->vsync_end - mode->vsync_start;
+	info->v_front_porch   = mode->vsync_start - mode->vdisplay;
+	info->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_PVSYNC);
+	info->refresh_rate    = drm_mode_vrefresh(mode);
+	info->clk_rate_hz_lo = lower_32_bits((u64)mode->clock * 1000);
+	info->clk_rate_hz_hi = upper_32_bits((u64)mode->clock * 1000);
+}
+
+static void dcp_hfi_dump_mode_info(struct dcp_hfi *hfi, const char *cmd,
+				   u32 session_id,
+				   const struct hfi_display_mode_info *info)
+{
+	dev_dbg(hfi->dev,
+		"HFI %s s=%u h=%u/%u/%u/%u v=%u/%u/%u/%u p=%u/%u r=%u clk=%llu sz=%u\n",
+		cmd, session_id,
+		info->h_active, info->h_back_porch, info->h_sync_width,
+		info->h_front_porch,
+		info->v_active, info->v_back_porch, info->v_sync_width,
+		info->v_front_porch,
+		info->h_sync_polarity, info->v_sync_polarity,
+		info->refresh_rate,
+		(u64)info->clk_rate_hz_lo | ((u64)info->clk_rate_hz_hi << 32),
+		info->size);
+}
+
+int dcp_hfi_display_mode_validate(struct dcp_hfi *hfi, u32 session_id,
+				  const struct drm_display_mode *mode, u64 clk_rate_hz)
+{
+	struct hfi_display_mode_info info;
+	int ret;
+
+	dcp_hfi_fill_mode_info(&info, mode);
+	info.clk_rate_hz_lo = lower_32_bits(clk_rate_hz);
+	info.clk_rate_hz_hi = upper_32_bits(clk_rate_hz);
+	dcp_hfi_dump_mode_info(hfi, "HFI MODE_VALIDATE", session_id, &info);
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DISPLAY_MODE_VALIDATE,
+				HFI_CMD_BUFF_DISPLAY, session_id,
+				HFI_PAYLOAD_U32_ARRAY,
+				&info, sizeof(info),
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_MODE_MS);
+
+	return ret;
+}
+
+int dcp_hfi_display_set_mode(struct dcp_hfi *hfi, u32 session_id,
+			     const struct drm_display_mode *mode, u64 clk_rate_hz)
+{
+	struct hfi_display_mode_info info;
+	int ret;
+
+	dcp_hfi_fill_mode_info(&info, mode);
+	info.clk_rate_hz_lo = lower_32_bits(clk_rate_hz);
+	info.clk_rate_hz_hi = upper_32_bits(clk_rate_hz);
+	dcp_hfi_dump_mode_info(hfi, "HFI SET_MODE", session_id, &info);
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DISPLAY_SET_MODE,
+				HFI_CMD_BUFF_DISPLAY, session_id,
+				HFI_PAYLOAD_U32_ARRAY,
+				&info, sizeof(info),
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_MODE_MS);
+
+	return ret;
+}
+
+int dcp_hfi_display_enable(struct dcp_hfi *hfi, u32 intf_idx, u32 display_id,
+			   u32 *session_id)
+{
+	int ret;
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DISPLAY_ENABLE,
+				HFI_CMD_BUFF_DISPLAY, display_id,
+				HFI_PAYLOAD_NONE, NULL, 0,
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_DISPLAY_MS);
+	if (ret) {
+		dev_err(hfi->dev,
+			"HFI DISPLAY_ENABLE intf=%u display_id=%u failed: %d\n",
+			intf_idx, display_id, ret);
+		return ret;
+	}
+
+	*session_id = display_id;
+
+	return 0;
+}
+
+int dcp_hfi_display_post_enable(struct dcp_hfi *hfi, u32 session_id)
+{
+	return dcp_hfi_send_sync(hfi,
+				 HFI_COMMAND_DISPLAY_POST_ENABLE,
+				 HFI_CMD_BUFF_DISPLAY, session_id,
+				 HFI_PAYLOAD_NONE, NULL, 0,
+				 HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				 HFI_TX_FLAGS_NON_DISCARDABLE,
+				 NULL, 0,
+				 DCP_HFI_TIMEOUT_DISPLAY_MS);
+}
+
+int dcp_hfi_display_disable(struct dcp_hfi *hfi, u32 session_id)
+{
+	return dcp_hfi_send_sync(hfi,
+				 HFI_COMMAND_DISPLAY_DISABLE,
+				 HFI_CMD_BUFF_DISPLAY, session_id,
+				 HFI_PAYLOAD_NONE, NULL, 0,
+				 HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				 HFI_TX_FLAGS_NON_DISCARDABLE,
+				 NULL, 0,
+				 DCP_HFI_TIMEOUT_DISPLAY_MS);
+}
+
+int dcp_hfi_display_post_disable(struct dcp_hfi *hfi, u32 session_id)
+{
+	return dcp_hfi_send_sync(hfi,
+				 HFI_COMMAND_DISPLAY_POST_DISABLE,
+				 HFI_CMD_BUFF_DISPLAY, session_id,
+				 HFI_PAYLOAD_NONE, NULL, 0,
+				 HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				 HFI_TX_FLAGS_NON_DISCARDABLE,
+				 NULL, 0,
+				 DCP_HFI_TIMEOUT_DISPLAY_MS);
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_dsi_config.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_dsi_config.c
new file mode 100644
index 000000000000..8c4855334caa
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_dsi_config.c
@@ -0,0 +1,597 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * HFI commands for DSI configuration and DCS transfers.
+ * Firmware owns the DSI controller and PHY.
+ */
+
+#include <linux/device.h>
+#include <linux/math64.h>
+#include <drm/display/drm_dsc.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_mipi_dsi.h>
+
+#include "dcp_dsi_config.h"
+#include "dcp_hfi.h"
+#include "dcp_hfi_priv.h"
+#include "hfi/hfi_commands_display.h"
+#include "hfi/hfi_commands_panel.h"
+#include "hfi/hfi_defs_common.h"
+#include "hfi/hfi_defs_panel.h"
+#include "hfi/hfi_packet.h"
+#include "hfi/hfi_packer.h"
+#include "hfi/hfi_properties_panel.h"
+
+#define DCP_DSI_CTRL_CMD_READ              BIT(0)
+#define DCP_DSI_CTRL_CMD_FETCH_MEMORY      BIT(5)
+#define DCP_DSI_CTRL_CMD_LAST_COMMAND      BIT(6)
+
+static u32 dcp_bpp_to_hfi(u32 bpp)
+{
+	switch (bpp) {
+	case 16: return HFI_PANEL_BPP_16;
+	case 18: return HFI_PANEL_BPP_18;
+	case 30: return HFI_PANEL_BPP_30;
+	case 24:
+	default: return HFI_PANEL_BPP_24;
+	}
+}
+
+static u32 dcp_dsi_traffic_mode(const struct mipi_dsi_device *dsi)
+{
+	if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO))
+		return HFI_PANEL_TRAFFIC_NON_BURST_SYNC_EVENT_MODE;
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
+		return HFI_PANEL_TRAFFIC_BURST_MODE;
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
+		return HFI_PANEL_TRAFFIC_NON_BURST_SYNC_PULSE_MODE;
+	return HFI_PANEL_TRAFFIC_NON_BURST_SYNC_EVENT_MODE;
+}
+
+static u32 dcp_lanes_to_hfi(u32 num_lanes)
+{
+	u32 mask = HFI_PANEL_LANE_0;
+
+	if (num_lanes >= 2)
+		mask |= HFI_PANEL_LANE_1;
+	if (num_lanes >= 3)
+		mask |= HFI_PANEL_LANE_2;
+	if (num_lanes >= 4)
+		mask |= HFI_PANEL_LANE_3;
+
+	return mask;
+}
+
+static bool dcp_hfi_dsi_wait(struct dcp_hfi *hfi,
+			     struct dcp_hfi_completion *comp)
+{
+	unsigned long flags;
+
+	if (wait_for_completion_timeout(&comp->done,
+					msecs_to_jiffies(DCP_HFI_TIMEOUT_DISPLAY_MS)))
+		return false;
+
+	/* Serialize removal with response dispatch before the stack object dies. */
+	spin_lock_irqsave(&hfi->resp_drain_lock, flags);
+	dcp_hfi_pending_find(hfi, comp->packet_id);
+	spin_unlock_irqrestore(&hfi->resp_drain_lock, flags);
+	return true;
+}
+
+int dcp_hfi_dsi_configure(struct dcp_hfi *hfi, u32 dsi_idx,
+			  const struct drm_display_mode *mode,
+			  const struct mipi_dsi_device *dsi,
+			  const struct dcp_dsi_hfi_config *cfg)
+{
+	u32 bllp_eof, bllp_pwr, dma_trig, esd_mode, lane_map, num_phys;
+	u32 display_type, link_bpp_x16, traffic_mode, vsync_source;
+	struct dcp_hfi_completion comp1, comp2, comp3;
+	struct hfi_header_info hdr_info1, hdr_info2;
+	u32 num_ctrls, num_lanes, num_props;
+	u32 dma_win, payload[128], wr_cont;
+	struct hfi_cmd_buff_hdl hdl1, hdl2;
+	bool timeout1, timeout2, timeout3;
+	u32 phy_type, str_trig, wr_start;
+	struct hfi_packet_info pkt_info;
+	struct dcp_hfi_buf *buf1, *buf2;
+	u32 packet_id2, packet_id3;
+	bool cphy, lp11, ulps;
+	bool is_cmd_mode;
+	u32 packet_id;
+	u32 color_ord;
+	int bpp, ret;
+	bool tx_eot;
+	u32 te_dcs;
+	u64 clk_hz;
+	u32 vc_id;
+	u32 *p;
+
+	if (cfg->num_ctrls > ARRAY_SIZE(cfg->ctrl_indices) ||
+	    cfg->num_phys > ARRAY_SIZE(cfg->phy_indices))
+		return -EINVAL;
+
+	display_type = cfg->display_type;
+	vsync_source = cfg->vsync_source;
+	phy_type = cfg->phy_type;
+	num_lanes = dsi->lanes;
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	if (bpp < 0)
+		return -EINVAL;
+	is_cmd_mode = !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
+	traffic_mode = dcp_dsi_traffic_mode(dsi);
+	link_bpp_x16 = bpp << 4;
+
+	buf1 = dcp_hfi_buf_alloc(hfi);
+	if (!buf1) {
+		dev_err(hfi->dev, "HFI PANEL_INIT: TX buffer exhausted\n");
+		return -ENOMEM;
+	}
+
+	hdl1.cmd_buffer = buf1->data;
+	hdl1.size       = DCP_HFI_BUF_SIZE;
+
+	hdr_info1.num_packets   = 0;
+	hdr_info1.cmd_buff_type = HFI_CMD_BUFF_DISPLAY;
+	hdr_info1.object_id     = dsi_idx;
+	hdr_info1.header_id     = dcp_hfi_next_packet_id(hfi);
+
+	ret = hfi_create_header(&hdl1, &hdr_info1);
+	if (ret) {
+		dev_err(hfi->dev, "PANEL_INIT: hfi_create_header (A) failed: %d\n",
+			ret);
+		goto err_free_buf1;
+	}
+
+	num_props = 0;
+
+	p = payload + 1;
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_TIMING_MODE_COUNT, 1);
+
+	/* DCS TX buffer is described by both DVA and IOVA properties. */
+	if (cfg->dcs_tx_iova && cfg->dcs_tx_dva &&
+	    !(cfg->dcs_tx_iova & 0x3ff) && !(cfg->dcs_tx_dva & 0x3ff)) {
+		num_props++;
+		p += HFI_PACK(p, HFI_PROPERTY_PANEL_DCS_CMD_TX_BUF_DVA,
+			       lower_32_bits(cfg->dcs_tx_dva),
+			       upper_32_bits(cfg->dcs_tx_dva),
+			       cfg->dcs_tx_buf_size, 0, 0);
+		num_props++;
+		p += HFI_PACK(p, HFI_PROPERTY_PANEL_DCS_CMD_TX_BUF_IOVA,
+			       lower_32_bits(cfg->dcs_tx_iova),
+			       upper_32_bits(cfg->dcs_tx_iova),
+			       cfg->dcs_tx_buf_size, 0, 0);
+	}
+	payload[0] = num_props;
+
+	packet_id = dcp_hfi_next_packet_id(hfi);
+	pkt_info.cmd          = HFI_COMMAND_PANEL_INIT_PANEL_CAPS;
+	pkt_info.id           = dsi_idx & 0xFFFF;
+	pkt_info.flags        = HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				 HFI_TX_FLAGS_NON_DISCARDABLE;
+	pkt_info.packet_id    = packet_id;
+	pkt_info.payload_type = HFI_PAYLOAD_U32_ARRAY;
+	pkt_info.payload_size = (u32)((p - payload) * sizeof(u32));
+	pkt_info.payload_ptr  = payload;
+
+	ret = hfi_create_full_packet(&hdl1, &pkt_info);
+	if (ret)
+		goto err_free_buf1;
+
+	dev_dbg(hfi->dev,
+		"dsi%u: DCP mode %dx%d@%dHz clk=%ukHz ht=%u hs=%u/%u vt=%u vs=%u/%u f=0x%x\n",
+		dsi_idx, mode->hdisplay, mode->vdisplay,
+		drm_mode_vrefresh(mode), mode->clock,
+		mode->htotal, mode->hsync_start, mode->hsync_end,
+		mode->vtotal, mode->vsync_start, mode->vsync_end,
+		mode->flags);
+
+	te_dcs = cfg->te_dcs_command;
+	dma_trig = cfg->dma_trigger;
+	str_trig = cfg->stream_trigger;
+	wr_start = cfg->wr_mem_start;
+	wr_cont = cfg->wr_mem_continue;
+	lane_map = cfg->lane_map;
+	color_ord = cfg->color_order;
+	vc_id = dsi->channel;
+	esd_mode = cfg->esd_mode;
+	dma_win = cfg->dma_sched_window;
+	lp11 = cfg->lp11_init;
+	cphy = cfg->cphy_mode;
+	ulps = cfg->ulps_supported;
+	tx_eot = !(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET);
+	bllp_eof = cfg->bllp_eof_power_mode;
+	bllp_pwr = cfg->bllp_power_mode;
+	num_ctrls = cfg->num_ctrls;
+	num_phys = cfg->num_phys;
+	num_props = 0;
+
+	p = payload + 1;
+
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_PHYSICAL_TYPE, phy_type);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_BPP, dcp_bpp_to_hfi(bpp));
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_LANES_STATE,
+		       dcp_lanes_to_hfi(num_lanes));
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_OPERATING_MODE,
+		       is_cmd_mode ? HFI_PANEL_CMD_MODE_8_BIT :
+		       HFI_PANEL_VIDEO_MODE_8_BIT);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_DISPLAY_TYPE, display_type);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_VSYNC_SOURCE, vsync_source);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_TRAFFIC_MODE, traffic_mode);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_TE_DCS_COMMAND, te_dcs);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_DMA_TRIGGER, dma_trig);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_STREAM_TRIGGER, str_trig);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_WR_MEM_START, wr_start);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_WR_MEM_CONTINUE, wr_cont);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_LP11_INIT, lp11 ? HFI_TRUE : HFI_FALSE);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_CPHY_MODE, cphy ? HFI_TRUE : HFI_FALSE);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_ULPS_SUPPORTED,
+		       ulps ? HFI_TRUE : HFI_FALSE);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_TX_EOT_APPEND,
+		       tx_eot ? HFI_TRUE : HFI_FALSE);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_BLLP_EOF_POWER_MODE,
+		       bllp_eof ? HFI_TRUE : HFI_FALSE);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_BLLP_POWER_MODE,
+		       bllp_pwr ? HFI_TRUE : HFI_FALSE);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_COLOR_ORDER, color_ord);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_VIRTUAL_CHANNEL_ID, vc_id);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_LANE_MAP, lane_map);
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_ESD_CONFIG,
+		       10 * sizeof(u32), esd_mode,
+		       0, 0, 0, 0, 0, 0, 0, 0);
+
+	num_props++;
+	*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_CTRL_NUM, 0, 1 + num_ctrls);
+	*p++ = num_ctrls;
+	memcpy(p, cfg->ctrl_indices, num_ctrls * sizeof(*p));
+	p += num_ctrls;
+
+	num_props++;
+	*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_PHY_NUM, 0, 1 + num_phys);
+	*p++ = num_phys;
+	memcpy(p, cfg->phy_indices, num_phys * sizeof(*p));
+	p += num_phys;
+
+	num_props++;
+	p += HFI_PACK(p, HFI_PROPERTY_PANEL_DMA_SCHEDULE_WINDOW, dma_win);
+	payload[0] = num_props;
+
+	packet_id3 = dcp_hfi_next_packet_id(hfi);
+	pkt_info.cmd          = HFI_COMMAND_PANEL_INIT_GENERIC_CAPS;
+	pkt_info.flags        = HFI_TX_FLAGS_NON_DISCARDABLE | HFI_TX_FLAGS_RESPONSE_REQUIRED;
+	pkt_info.packet_id    = packet_id3;
+	pkt_info.payload_size = (u32)((p - payload) * sizeof(u32));
+	pkt_info.payload_ptr  = payload;
+
+	ret = hfi_create_full_packet(&hdl1, &pkt_info);
+	if (ret)
+		goto err_free_buf1;
+
+	buf2 = dcp_hfi_buf_alloc(hfi);
+	if (!buf2) {
+		dev_err(hfi->dev, "HFI PANEL_INIT: TX buffer exhausted (B)\n");
+		ret = -ENOMEM;
+		goto err_free_buf1;
+	}
+
+	hdl2.cmd_buffer = buf2->data;
+	hdl2.size       = DCP_HFI_BUF_SIZE;
+
+	hdr_info2.num_packets   = 0;
+	hdr_info2.cmd_buff_type = HFI_CMD_BUFF_DISPLAY;
+	hdr_info2.object_id     = dsi_idx;
+	hdr_info2.header_id     = dcp_hfi_next_packet_id(hfi);
+
+	ret = hfi_create_header(&hdl2, &hdr_info2);
+	if (ret) {
+		dev_err(hfi->dev, "PANEL_INIT: hfi_create_header (B) failed: %d\n",
+			ret);
+		goto err_free_both;
+	}
+
+	num_props = 7; /* timing properties; PHY and DSC are optional. */
+
+	if (cfg->dsc)
+		num_props++;
+	if (cfg->dsc && cfg->dsc_rc_override)
+		num_props++;
+	if (cfg->num_phy_timings)
+		num_props++;
+	p = payload;
+	*p++ = num_props;
+	p = payload + 1;
+
+	*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_INDEX, 0, 1);
+	*p++ = 0;
+
+	/* HFI PANEL_CLOCKRATE carries the selected DSI bit clock per lane. */
+	if (cfg->dsc && cfg->dsc->bits_per_pixel)
+		link_bpp_x16 = cfg->dsc->bits_per_pixel;
+	clk_hz = dsi->hs_rate ? dsi->hs_rate :
+		div_u64((u64)mode->clock * 1000 * link_bpp_x16,
+			num_lanes * 16);
+	*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_CLOCKRATE, 0, 2);
+	*p++ = lower_32_bits(clk_hz);
+	*p++ = upper_32_bits(clk_hz);
+
+	*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_FRAMERATE, 0, 1);
+	*p++ = drm_mode_vrefresh(mode);
+
+	/* Firmware expects numerator/denominator timing jitter per mode. */
+	*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_JITTER, 0, 2);
+	*p++ = cfg->jitter_numer;
+	*p++ = cfg->jitter_denom;
+
+	*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_RESOLUTION_DATA, 0, 14);
+	*p++ = mode->hdisplay;                       /* active_width */
+	*p++ = mode->vdisplay;                       /* active_height */
+	*p++ = mode->hsync_start - mode->hdisplay;   /* h_front_porch */
+	*p++ = mode->htotal - mode->hsync_end;       /* h_back_porch */
+	*p++ = 0;                                    /* h_left_border */
+	*p++ = 0;                                    /* h_right_border */
+	*p++ = mode->hsync_end - mode->hsync_start;  /* h_pulse_width */
+	*p++ = mode->hskew;                          /* h_sync_skew */
+	*p++ = 0;                                    /* h_sync_pulse (TODO: confirm) */
+	*p++ = mode->vsync_start - mode->vdisplay;   /* v_front_porch */
+	*p++ = mode->vtotal - mode->vsync_end;       /* v_back_porch */
+	*p++ = 0;                                    /* v_top_border */
+	*p++ = 0;                                    /* v_bottom_border */
+	*p++ = mode->vsync_end - mode->vsync_start;  /* v_pulse_width */
+
+	/* Topology fields follow the firmware panel format. */
+	*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_DISPLAY_TOPOLOGY, 0, 4);
+	*p++ = 1;
+	*p++ = cfg->topology_mixer_count;
+	*p++ = cfg->topology_enc_count;
+	*p++ = cfg->topology_intf_count;
+
+	*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_DEFAULT_TOPOLOGY_INDEX, 0, 1);
+	*p++ = 0;
+
+	if (cfg->dsc) {
+		u32 chroma_format = 0;
+		u32 color_space = 0;
+
+		if (cfg->dsc->native_422)
+			chroma_format = 1;
+		else if (cfg->dsc->native_420)
+			chroma_format = 2;
+		if (cfg->dsc->native_422 || cfg->dsc->native_420)
+			color_space = 1;
+
+		*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_COMPRESSION_DATA, 0, 12);
+		*p++ = HFI_PANEL_COMPRESSION_DSC;
+		*p++ = (cfg->dsc->dsc_version_major << 4) |
+			cfg->dsc->dsc_version_minor;
+		*p++ = 0; /* scr_version is not set by DRM DSC config. */
+		*p++ = cfg->dsc->slice_height;
+		*p++ = cfg->dsc->slice_width;
+		*p++ = 1; /* one slice per packet */
+		*p++ = cfg->dsc->bits_per_component;
+		*p++ = 0; /* no post-PPS delay */
+		*p++ = cfg->dsc->bits_per_pixel;
+		*p++ = chroma_format;
+		*p++ = color_space;
+		*p++ = cfg->dsc->block_pred_enable;
+	}
+
+	if (cfg->dsc && cfg->dsc_rc_override) {
+		struct hfi_panel_compression_rc_override rc_override = {};
+
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(rc_override.min_qp); i++) {
+			rc_override.min_qp[i] = cfg->dsc->rc_range_params[i].range_min_qp;
+			rc_override.max_qp[i] = cfg->dsc->rc_range_params[i].range_max_qp;
+			rc_override.offsets[i] = cfg->dsc->rc_range_params[i].range_bpg_offset;
+		}
+
+		*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_COMPRESSION_RC_OVERRIDE, 0,
+				sizeof(rc_override) / sizeof(u32));
+		memcpy(p, &rc_override, sizeof(rc_override));
+		p += sizeof(rc_override) / sizeof(u32);
+	}
+
+	/* DCP computes PHY timings unless an explicit override is supplied. */
+	if (cfg->num_phy_timings) {
+		u32 n = min_t(u32, cfg->num_phy_timings, DCP_DSI_MAX_PHY_TIMINGS);
+
+		*p++ = HFI_PACK_KEY(HFI_PROPERTY_PANEL_DPHY_TIMINGS, 0, n + 1);
+		*p++ = n;
+		memcpy(p, cfg->phy_timings, n * sizeof(*p));
+		p += n;
+	}
+
+	packet_id2 = dcp_hfi_next_packet_id(hfi);
+	pkt_info.cmd          = HFI_COMMAND_PANEL_INIT_TIMING_MODE_CAPS;
+	pkt_info.flags        = HFI_TX_FLAGS_NON_DISCARDABLE | HFI_TX_FLAGS_RESPONSE_REQUIRED;
+	pkt_info.packet_id    = packet_id2;
+	pkt_info.payload_size = (u32)((p - payload) * sizeof(u32));
+	pkt_info.payload_ptr  = payload;
+
+	ret = hfi_create_full_packet(&hdl2, &pkt_info);
+	if (ret)
+		goto err_free_both;
+
+	/*
+	 * Header A carries 2 packets (PANEL_CAPS, GENERIC_CAPS); firmware
+	 * ACKs each individually by its own packet_id. comp1 is registered
+	 * internally by dcp_hfi_send_cmd_async() below; comp3 must be
+	 * pre-registered here or its response is dropped as "no pending
+	 * completion". Header B carries only TIMING_MODE_CAPS (the topology
+	 * property that drives DCP's MDP resource reservation) — comp2 is
+	 * registered internally by its own dcp_hfi_send_cmd_async() call.
+	 */
+	init_completion(&comp1.done);
+	comp1.resp_data = NULL;
+	comp1.resp_len  = 0;
+	comp1.status    = 0;
+	comp1.packet_id = packet_id;
+
+	init_completion(&comp2.done);
+	comp2.resp_data = NULL;
+	comp2.resp_len  = 0;
+	comp2.status    = 0;
+	comp2.packet_id = packet_id2;
+
+	init_completion(&comp3.done);
+	comp3.resp_data = NULL;
+	comp3.resp_len  = 0;
+	comp3.status    = 0;
+	comp3.packet_id = packet_id3;
+
+	ret = dcp_hfi_pending_add(hfi, &comp3);
+	if (ret) {
+		dev_err(hfi->dev,
+			"dsi%u: PANEL_INIT: failed to register GENERIC_CAPS completion: %d\n",
+			dsi_idx, ret);
+		goto err_free_both;
+	}
+
+	ret = dcp_hfi_send_cmd_async(hfi, buf1,
+				     hfi_get_header_size(&hdl1), &comp1);
+	if (ret) {
+		dev_err(hfi->dev,
+			"dsi%u: PANEL_INIT caps/generic (header A) failed\n",
+			dsi_idx);
+		dcp_hfi_pending_find(hfi, packet_id3);
+		dcp_hfi_buf_free(hfi, buf2);
+		return ret;
+	}
+
+	/* Stack completions must be retired before returning after submission. */
+	ret = dcp_hfi_send_cmd_async(hfi, buf2,
+				     hfi_get_header_size(&hdl2), &comp2);
+	if (ret) {
+		dev_err(hfi->dev,
+			"dsi%u: HFI_COMMAND_PANEL_INIT_TIMING_MODE_CAPS (header B) failed\n",
+			dsi_idx);
+		comp2.packet_id = 0; /* never registered/in-flight, nothing to wait on */
+	}
+
+	timeout1 = dcp_hfi_dsi_wait(hfi, &comp1);
+	timeout3 = dcp_hfi_dsi_wait(hfi, &comp3);
+	if (comp2.packet_id)
+		timeout2 = dcp_hfi_dsi_wait(hfi, &comp2);
+	else
+		timeout2 = false;
+
+	if (timeout1 || timeout2 || timeout3) {
+		dev_err(hfi->dev,
+			"dsi%u: HFI PANEL_INIT timed out (caps=%d timing_mode=%d generic=%d)\n",
+			dsi_idx, !timeout1, !timeout2, !timeout3);
+		return -ETIMEDOUT;
+	}
+
+	if (ret)
+		return ret; /* header B send_cmd_async failure, comp1/comp3 now retired */
+
+	if (comp1.status || comp2.status || comp3.status)
+		dev_err(hfi->dev,
+			"dsi%u: PANEL_INIT failed: caps=%d topology=%d generic=%d\n",
+			dsi_idx, comp1.status, comp2.status, comp3.status);
+
+	return comp1.status ? comp1.status :
+	       comp2.status ? comp2.status : comp3.status;
+
+err_free_both:
+	dcp_hfi_buf_free(hfi, buf2);
+err_free_buf1:
+	dcp_hfi_buf_free(hfi, buf1);
+	return ret;
+}
+
+ssize_t dcp_hfi_dcs_transfer(struct dcp_hfi *hfi, u32 session_id,
+			     const struct mipi_dsi_msg *msg,
+			     void *tx_buf, dma_addr_t tx_iova,
+			     void *rx_buf, dma_addr_t rx_iova,
+			     u32 post_wait_ms, u32 ctrl_idx)
+{
+	struct hfi_dsi_cmd_desc cmd_desc = {};
+	static atomic_t seq_no = ATOMIC_INIT(0);
+	int ret;
+
+	if (!msg || !msg->tx_buf || !msg->tx_len)
+		return -EINVAL;
+
+	if (msg->rx_len && (!msg->rx_buf || !rx_buf))
+		return -EINVAL;
+
+	if (msg->tx_len > DCP_DSI_DCS_TX_BUF_SIZE) {
+		dev_err(hfi->dev, "DCS TX too large: %zu > %u\n",
+			msg->tx_len, DCP_DSI_DCS_TX_BUF_SIZE);
+		return -EINVAL;
+	}
+
+	memcpy(tx_buf, msg->tx_buf, msg->tx_len);
+
+	cmd_desc.size             = sizeof(cmd_desc);
+	cmd_desc.channel          = msg->channel;
+	cmd_desc.type             = msg->type;
+	cmd_desc.flags            = msg->flags;
+	cmd_desc.tx_len           = msg->tx_len;
+	cmd_desc.tx_buff_addr_lsb = lower_32_bits(tx_iova);
+	cmd_desc.tx_buff_addr_msb = upper_32_bits(tx_iova);
+	cmd_desc.ctrl_idx         = ctrl_idx;
+	cmd_desc.ctrl_flags       = DCP_DSI_CTRL_CMD_FETCH_MEMORY |
+					DCP_DSI_CTRL_CMD_LAST_COMMAND;
+	if (msg->rx_len)
+		cmd_desc.ctrl_flags |= DCP_DSI_CTRL_CMD_READ;
+	cmd_desc.last_command     = 1;
+	cmd_desc.post_wait_ms     = post_wait_ms;
+	cmd_desc.seq_no           = atomic_inc_return(&seq_no);
+
+	if (msg->rx_len > 0) {
+		if (msg->rx_len > DCP_DSI_DCS_RX_BUF_SIZE)
+			return -EINVAL;
+		memset(rx_buf, 0, msg->rx_len);
+		cmd_desc.rx_len           = msg->rx_len;
+		cmd_desc.rx_buff_addr_lsb = lower_32_bits(rx_iova);
+		cmd_desc.rx_buff_addr_msb = upper_32_bits(rx_iova);
+	}
+
+	ret = dcp_hfi_send_sync(hfi,
+				HFI_COMMAND_DISPLAY_TRANSFER_DCS_CMD,
+				HFI_CMD_BUFF_DISPLAY,
+				session_id,
+				HFI_PAYLOAD_U32_ARRAY,
+				&cmd_desc, sizeof(cmd_desc),
+				HFI_TX_FLAGS_RESPONSE_REQUIRED |
+				HFI_TX_FLAGS_NON_DISCARDABLE,
+				NULL, 0,
+				DCP_HFI_TIMEOUT_DISPLAY_DCS_MS);
+	if (ret) {
+		dev_err(hfi->dev,
+			"HFI DCS_TRANSFER type=0x%x len=%zu failed: %d\n",
+			msg->type, msg->tx_len, ret);
+		return ret;
+	}
+
+	if (msg->rx_len > 0)
+		memcpy(msg->rx_buf, rx_buf, msg->rx_len);
+
+	return msg->tx_len;
+}

-- 
2.43.0

