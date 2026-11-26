Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674681;
	b=uSgRNUJnHU9vHZmmnvlvoavD1K0BdGytB+JS3uNFqKU/SxbvEVRggTm4c9ugNBntxdnk
	 ENmr4rECt8BwPvobmR8RkjUxn0xH22X22tzr7gT5Lb5pg3O4beFtO5CfuOZn95c+EIdSo
	 GY9JtXrTyc3yBwUfIY4poYFKwN6mj4kKP3Ydz6ukajp2z06bF9zmHgG2FiyR1+Wt1hB74
	 MziunLNjzelfyTAARVQx28CiPI18sx8se3Bz0AhCRjn8N+H3RRkXDLfrxGJxM8IyBwrN3
	 S4XDZETdd/a8ERT6Z+jgQNjrfgsuNKutgVEKgBs7OSCyea6NnQkQKjny6W2oIRaFiVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=;
	b=KB7v1XHF/R+fv1dxBW8I5Gd59rF35xT0zMRSLifJUpdGI75BDjw99NDBfWAzU3+c/0WA
	 +llnH3fUw1VSYC8z4rzo8dn0bIphb7qp5faMPSKMZxiQi8MEfLR07YSfnjvtHh4xqWkE2
	 SxrOD6tQAs5PpUePTbGZrW5WS/QaI2PrBiRtTl59xWiFmQlnmYiAsIPKVUoiY+WzQaDx2
	 n60Iw8CcBH5N3v2uaKexmwmfz3edce8iwsWcuoHjf8IJQP/5YcdPkZrTp3yl2QcABpoaS
	 Jv4/QWh9xpzeM0BYIRIiCnLl4hlOP4UxjNRzOIbRjFYzd9lcAvb6PKZ6guPCmMZ4maQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyxZAyeL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRVuhtEe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059D3606A31E
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 059D3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dyxZAyeL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jRVuhtEe
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36X7u2791265
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=; b=dyxZAyeLoXziSVdw
	iC+yD/BhrmXWs2Mz2znH4Q01zluMofdlXIxR8MV4t018xpMrfk29vykrKGoBUbjU
	f2KKzPVfy1YMtD/4lI3s7W/3GKUckaDZl+Dsiw5IW/mHCgBUoWbCeXknA9G1vFC9
	HWk9OgkSU+uIOwInOx1JlnNfUAB7gyVKZudqR/kLVUvgnCThtMKyyuAEp1W6ayR4
	9s/3owaeohBfYuXEKomSpIGxrA8Y7UQX7IU3sB+jcmVZ1MIVA4cAFFGEjoCB/0N1
	SM6aqc8pMmSfGNsTaCSKm77cAXs9ZobXeo9LGi6jSyf1hFV9NX2Li8C15GU5TGtM
	yBSlDQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnv6t1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 06:31:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f05c68629cso44331605ad.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 22:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674679; x=1796279479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=;
        b=jRVuhtEewchBlGFwxGsGSfrPG1EfDyfgZ+9Qy5hkL62a2nyUFJUA0++aacHqw+iBPb
         e+h0xwhqe1s/DRYtfxVcn2Kns6qQf74ECfyR+zYrjU3mm3SUD/lkfud5ua9a9tZdz+sX
         vuwW+DcXUcsszvxom+uTmqaa2xW3QvSeLvt0gc0An5zZDQne985TcXzDdHkAS+if9X/6
         yD/ptyr35ZQrHTp0dR0dLNDTSXyrng+cvFprxl4gstW1UcpiSFT1NvGZyluUe9q30V/b
         T2YNwFjtY7CqkfrFERpIPjqn1bvxdmONncY5ktGbosX8SMzql09PxwAlfS8BPPGqzUnb
         HDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674679; x=1796279479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRPs9xTWWhDxmrjGF62QzR1B12YtZbs2NVjgVgUhkyY=;
        b=ApU6dXrLQ88pUotCiVFgNRsUzuoN7s8wK9930fLCtIRekeBGoqPdwtGVQFAwB9KeUK
         4skQlOaureezdyKo55BMzvZdBvJo15agDlmSmazFSpzM6AFHrC1PuaSEOsM8GaTk+5Pe
         lg7xkQOw60IzKxLrpAw997VtERJB07IAkJ6HIZSY4kKwFI9aWoMH3ezzAOke4fMiQwdu
         7nvc+rUL1ciZFiHQBJvdAimm/rO6ukN976d9NDSkIVvq4QnN/1PuU+hVgqnbJ5U1IBKc
         6V7JAjn+Hz1vtxx8sCNvVaHck3qdwkuyVBkjGnU/lcdcmUT44YGhDd9acbLPRneMATMM
         C4Xw==
X-Forwarded-Encrypted: i=1; AL+hErFhiAXdXu6KqoIB69ATy7qdR0HAM4wcThZUUtJlfWvUvNed3Rte3RXREmPvSuWrDMlbQnn+xF8cvsV2jA==@vger.kernel.org
X-Gm-Message-State: APuU4Z86sm62pblsGA6ghxJygioEPhiHRqURT/7y5JKkz6FXin0G3Gy/
	HDaoHOHwE6EWGu/NE6sG7SHb+o4ZocFWCMHgDxLFQN4OjydiifttoA9mZfS2YA11R6cBx4ztH7Q
	S2bc7T9QlkL8lUr4sQE1KryfvpyfLPe3ThaVMI7VffSeeOaw5U3zvop8S8A5bZs08tQ==
X-Gm-Gg: AZFdTZf0F3LN2s7UC6A+R2BhrHk1fJRkITz4UPAontoekG5vdLuT6ith0j2N9a66W9W
	l3sLRlfkf3flZcJylK/2w6Fx7dgBU6uOkvQZT3HAArFQeeB9Hizg7FlvhnjO+7ozoh0cHlUyTDt
	LJvwoEgLZl7ZQb99+Ky57Qk/37CBprsgm8zwleVJD8vWZ1Q8cpB9tK6N579hGzqOq4MwJ67yq5K
	fo1zbYwQ/m30jOOC/EiUaXI3D4M+6x32EH/C1L+Et2XuUTwfaZxGJNzMXVjz18PKK6frw0ymMzn
	MbXdMZxtr6e7SBMFvWTIZNKQ5gbBa20BB+3MRj2h5S5CRwOxBIBxjHm1yXAZglMD0Jit6WjVHJz
	pOlAXVtjbUXTVVQdNCWYr7MTkvWD6rZBfvW3xQ1HPjhEBV5JbSLy/J0zCjcRGj5GLz8DNiVT0KG
	LQTiynUGRu
X-Received: by 2002:a17:903:2f87:b0:2e4:a360:fcc6 with SMTP id d9443c01a7336-2f03f1b6f35mr208059505ad.35.1795674678891;
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
X-Received: by 2002:a17:903:2f87:b0:2e4:a360:fcc6 with SMTP id d9443c01a7336-2f03f1b6f35mr208059285ad.35.1795674678428;
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:18 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:21 +0530
Subject: [PATCH v3 13/21] drm/msm/dcp: Add DCP encoder
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-13-f1e9d7505039@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=2743;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=PpQi3TK+4EMt9gGh4o3vbPSYlayx+DPAkJNGb6fSOT4=;
 b=rHX9dvqcJ5W/eFlpMpuncVY8cgdFvTmHcaNskFjZ1eUytMoYcapCuNhf2aQIK4txbmq7pybgW
 S5L86OZ/fOgCrflKIlH4nYxM8RLbY9i8OdHBkuuUSBl4OU4ccmJC+7Z
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX9qdf/Nsfa/HE
 wuXJSBzfDRbvNemD8jPZrN3gSaJAIblHCsDMSBemnyZNtAHq/iNDqNacOZ+7APp8iQWAkvrH6RJ
 TuIkhlt6+2mBc3BxHQHYIQ6Hdljr2/+t5RrjNr7Npw57iKfxX9Nq8nf+KiLfx7dWxXc8nfFF2Ua
 0tvAhryKsECYKOt5+xzVgCyT6BwrBQ9VlDy1VRRUYGJXtKCwo7opCYEhs/NA/6DLDnjAPiosOP3
 /XiFgF9h9ht1+/LkQBaLF6L5THG8eattxqF1xciOm3rpAyxmpE6PH5pp9IqVaAnGyrCDFFnG+7G
 0SDXgWVoeG6xgwIJVEtA6xXexC9w3ujCmtuU+bPojddX+p00VUlVXRa3Ly6s13HmtLXqN9en84Y
 mMlCWnvUNNUaoO8P+rfTKmTowRyebWhovLz0IbxBeco2y+sX2IxbyHm6sXTzDiXbViLPv5eJC21
 YKx9m+xWRGUHV2Wp4Jg==
X-Proofpoint-ORIG-GUID: R9u9n19d7oWLW_1pwY3FhEpe1wJw_Pmi
X-Proofpoint-GUID: R9u9n19d7oWLW_1pwY3FhEpe1wJw_Pmi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX/IjE/aZ8TGh4
 WhnmJLatBYvXTEBpd5Ud3V5zIos8C2TxNzZOye6q8bnqhp89zg0U+HmGmU8kQeueptB8kHIhhaO
 4kvEvdLRH1MTL5cAPzqL2NpLeViNeac=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07d237 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qqiwZq75wgHyRPlt0ZYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Create the DRM encoder required to connect a DCP CRTC to its
firmware-backed output bridge. The encoder must fit the existing MSM
DRM object model while remaining independent of bridge discovery and
KMS registration.

Implement the DCP encoder wrapper, allocation, and DRM object
initialization.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile          |  1 +
 drivers/gpu/drm/msm/dcp/dcp_encoder.c | 29 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_encoder.h | 16 ++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index d0fbd8bdd49a..7fc4861d19df 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -82,6 +82,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_encoder.o \
 	dcp/dcp_hfi_kms.o \
 	dcp/dcp_hfi_plane.o \
+	dcp/dcp_encoder.o \
 	dcp/hfi/hfi_packer.o \
 	dcp/hfi/hfi_unpacker.o \
 	dcp/hfi/hfi_utils.o
diff --git a/drivers/gpu/drm/msm/dcp/dcp_encoder.c b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
new file mode 100644
index 000000000000..e7a64c960bdc
--- /dev/null
+++ b/drivers/gpu/drm/msm/dcp/dcp_encoder.c
@@ -0,0 +1,29 @@
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
+	if (ret)
+		return ERR_PTR(ret);
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

