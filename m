Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F084A3871
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 07:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050012; cv=none; b=UvceMY/bp/yKf295d5qMDmvzJmVE/pLB+HklSOlpTsZtCx8B2kjNEH4JKtzsaFZ4OffyTO0YN3B+OIdx/wGTd1PDiIlwWOJYmS/yrC51P7lam2HZtHr+0Fr407npLmGJ0XRI3ZwYFh7MLNXbwT6f22CET1UUwrsEN83z/RwN9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050012; c=relaxed/simple;
	bh=UJhftP8nMB+QwFfi+IKmgq66mzPjGJcFwEcVUt7DekQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLUhEjbxqAw6BVO8n1qcQibb1keUxID4gjermi8wXzoZ7GB+CWqe7bgD+uEKsBu8ywgnrulUMYAHGSdNQnfimDF6AILibZ2w4dzkswAhnRHS1viFk21Ktp3PBLBfmlcP9VsrFfSq4d73P7AUVmNhjF0q8TcsytR03hVirLQo/SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgxATm/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdVU71ok; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgxATm/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdVU71ok"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F765v91672232
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 07:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E25GlgOVqzhPXuSoArfl/adEZQk2DbN/hy7GjVs7DnI=; b=kgxATm/22HPZ15zr
	i/9dIfT64+dfIF2htZawUp6yGFnwxT2jyj+ax6b9jY6zScwkiqwAX7GSpM+CABjy
	+UCFO0D5GWYwOkQFmGUVkj9fYqi7PyT/uAigi0ck6KHfu55GwJeYp932PcqeoLLR
	hG/wLgWxyxS+AFzaCm7IgQpoJn9K9Vu9DUYbbHzF1lWtjblxnxs1VD5td/JAN7XK
	dIYNy13EHh1M7egL4bXRxe79Skukj1iQ4aC8JAmp0HeDIALCXcOJC4Eanu9BSeTs
	tji1X3+m+cKkLETDmhHsO/gTL92iLEBR2YUz2px0qzSuAX626MGtVefrRMlyACzT
	3YNGGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhb63d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 07:40:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so18985585ad.3
        for <linux-media@vger.kernel.org>; Thu, 15 Oct 2026 00:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792050001; x=1792654801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E25GlgOVqzhPXuSoArfl/adEZQk2DbN/hy7GjVs7DnI=;
        b=OdVU71ok95KB1mZ0/lnbSFUCtFGXCE837bKBy+n/zlIC2370zawSyiMsLw6WyJNYvx
         WbSjCjHP20N7Ukps1gM46zu4qdj30rywyfld5YJgmU0ABDIsM+/YmPTeukJnzNAN0V5R
         t2e1l0Ga5vOmWOShrpBsIXPdzIqEU0kwWrTkJqsSQVmwf0Brv+S31QJxloAmEkm/aNxy
         0xsln1LON1IRVN3lKszzNo7xA509B1oD2yolDVPV5BATsBjCOVWK68cpkCW+ZJ/I8c3O
         e8KfYfrTjBt9jEpAmvB5tRpoyNjjUzRFcQw53YHKkGrHSAAqHYbkYnMpWJFgu7QB9IoD
         rzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050001; x=1792654801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E25GlgOVqzhPXuSoArfl/adEZQk2DbN/hy7GjVs7DnI=;
        b=tlnVqB1yWFE8zh0z5DYmOR5LlxZfU5AWeBjog31brIDhbc0Jmkw4hrlkBSAOKLtWY2
         VivuIOqtu5Thjg53TKOpYJa8sEFKJxhNjxIc8cY5SBd59tir9OpKurNVggMSZrnOZWWu
         y3c7RZjShE6Y08olFobYt1oOhYLvsVV8mD8zoyET1eLSNW5oLkytLzQYFSW/OZfZAiEr
         DBbNwZE1wYlpcGBZMJ7c1dUUpdE1ZUFQcPY8sF7TjNWfvDX8bcXXxBPqTxUnG0DkQnK9
         /1W028M+jwf+JyTNquopZfvE7Nx8KUtJPnhyd+F6rjwDzizfvoPwHCL5Jr1Z5lhPyOYG
         VdYA==
X-Forwarded-Encrypted: i=1; AKwUvBxqmEyyLbinsDVZtZbFTf9tGtm+VBG61s3C8I/UW70GpqZIEJtP7TAQimhV3lb3EkV4qABBfKAMHBHRKg==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0KGjsfClcs0NrsXtkf5Klb8rvIfJwD/nHHe6qZSNkqsUlLS1K
	+mTZPkqs/rnp554TyWJPbr8zzESx5G1caL0b+gUrmcIr/K5lmuy0tEYjTVd5jJv/7VG8/gsW4qW
	Y4pXl4nzx9RShpfy3c8PcSsyqiwSbQa3l7ynYUlj0xnWEeGO+QWsZUdgHs7d7YzQPWA==
X-Gm-Gg: AYBFou2lyGH4mExmhUGD++z1fB87zYvET6XElmeUmm/KZruwtH4CBX/1u1xU2c0tfNm
	3vf0ECkKvnSgjIa8j7T5il9djWPmRAKNNheyJMMdYxRMBewFSiPp+UjfiwvcF7IrF172a7SXDPR
	DgXD/P1l81MV5M2JoA+99h770jXTqbRtXA5+M8PSxP/4omxOhzBcLFCy4vty8NlBQaAjjsVpMR1
	92mzPXh1fat5lfkrqSc0ZjG4dk0Xp5jNZ5yXlt2337oJGO73ya1nO9Y7ECyAUYQd3BWlinrg7MT
	fDOmLQlHb21EkI2+iE5+FAONOjKRkNu/HaFPb+fLVCNgHW78d+XuSEX4LHga5OCWKclx9IEFsWy
	mlLsVUC1Q8b8FsWQL4BRIq8WOFVNXybW9xro=
X-Received: by 2002:a17:902:e844:b0:2e9:3dd2:a90c with SMTP id d9443c01a7336-2e93dd2c030mr38660355ad.20.1792050001456;
        Thu, 15 Oct 2026 00:40:01 -0700 (PDT)
X-Received: by 2002:a17:902:e844:b0:2e9:3dd2:a90c with SMTP id d9443c01a7336-2e93dd2c030mr38659915ad.20.1792050000969;
        Thu, 15 Oct 2026 00:40:00 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e944c23f17sm14014825ad.27.2026.10.15.00.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:40:00 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:27 +0530
Subject: [PATCH 07/13] drm/msm/dcp: Add DCP encoder
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-jshekhar-drm-msm-dcp-v1-v1-7-48aad0fe4f72@oss.qualcomm.com>
References: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
In-Reply-To: <20261015-jshekhar-drm-msm-dcp-v1-v1-0-48aad0fe4f72@oss.qualcomm.com>
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
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792049920; l=2785;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=UJhftP8nMB+QwFfi+IKmgq66mzPjGJcFwEcVUt7DekQ=;
 b=1raZEztaPazQAIhOuIyFmobIDPV0NJEw6iVxWR4ayn+cdx3GwNnRCG9NkdgqZhOKICYdscJ+b
 6wUMufXyB2rA0y6L1aTSwcM9oS3i5LoCoN/F68NtBdMu9OJQ8UtuBrS
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-ORIG-GUID: 5UChnA3H041XbySv0kBR9LshFF1cvr26
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfX/WvO+j0ulzEd
 Huo6XkWWI5QSIVuzFvgF3tbvBa9cQX/sDsEl0y2JrKoChbKj/yvYRmb1qYd46UAyxyhDwH//ZdP
 Q+MzP+cJL8ZXHxlUYm/cmnacJDTkhq4=
X-Proofpoint-GUID: 5UChnA3H041XbySv0kBR9LshFF1cvr26
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMCBTYWx0ZWRfXwXUVT7XYta0L
 VUZCTSGnfkGCqWtc6t/cZj7GSw6CzYt1TBbGFJspzNLfWQc8vYE0yXyngHR4EPxjBR/NbRR8UDO
 iToLqlp9EoMr8GV8mKoUDHd9FtOovh5Bn0OqjU7C6lF2APcr6wqC2rDBZcIiuB/o4ztCLYD14sO
 Rpa3Be44PbVpNDv+wxRVkqBv3HD08wyb0YnECF2E6cEhv5FBclRayfvgp9aktKFN2rKVQJvkGWC
 +Co0vyD8ySD+YS/5cNyZXpPr4fi3gFiDbB5cbDrBH1l5Q5pmwEiQAKLhNSpkZsjo8oDphmJsxa7
 xWCBcjC1ppb7Y3wARye4muIjziFofwMLUWC32nb/keawFH7A+nJTA+rjTOBsgwb4ryYPXyufeXc
 g7eGiFTeSe36z+oRtNJiA9qJSdwH1HCepn6peMhxJHURXj5IoKuWSSunmZ5Xy3sciAFX/W0EPnP
 Rtw96EostaK4w2lu4hg==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad08352 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qqiwZq75wgHyRPlt0ZYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150030

The DCP display pipeline needs a DRM encoder to connect a CRTC to its
firmware-backed output bridge while reusing the existing MSM DRM object
model.

Add the DCP encoder wrapper and keep encoder allocation and DRM object
initialization independent from bridge and KMS registration.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Assisted-by: LLM
---
 drivers/gpu/drm/msm/Makefile          |  1 +
 drivers/gpu/drm/msm/dcp/dcp_encoder.c | 31 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_encoder.h | 16 ++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b7c1a2e9a19e..e7d24be72113 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -81,6 +81,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_plane.o \
 	dcp/dcp_ipcc.o \
 	dcp/dcp_plane.o \
+	dcp/dcp_encoder.o \
 	dcp/hfi/hfi_packer.o \
 	dcp/hfi/hfi_unpacker.o \
 	dcp/hfi/hfi_utils.o
diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.c b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
new file mode 100644
index 000000000000..bc173fffb325
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DCP encoder wrapper for the CRTC-to-bridge connection.
+ * Hardware programming and mode sequencing are handled by the bridge and HFI.
+ */
+
+#include <drm/drm_encoder.h>
+#include <drm/drm_managed.h>
+
+#include "dcp_encoder.h"
+
+struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type)
+{
+	struct drm_encoder *encoder;
+	int ret;
+
+	encoder = drmm_kzalloc(dev, sizeof(*encoder), GFP_KERNEL);
+	if (!encoder)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drmm_encoder_init(dev, encoder, NULL, enc_type, "encoder%d",
+				dev->mode_config.num_encoder);
+	if (ret) {
+		dev_err(dev->dev, "encoder init failed: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	return encoder;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.h b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
new file mode 100644
index 000000000000..de40c9bca4bb
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * DCP encoder interface between the CRTC and bridge chain.
+ * Hardware programming is delegated to DCP firmware.
+ */
+
+#ifndef __DCP_ENCODER_H__
+#define __DCP_ENCODER_H__
+
+#include <drm/drm_encoder.h>
+
+struct drm_encoder *dcp_encoder_init(struct drm_device *dev, int enc_type);
+
+#endif /* __DCP_ENCODER_H__ */

-- 
2.43.0

