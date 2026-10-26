Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995852;
	b=k2Pia5naSmDJW0veLflBGqNcHvtA2libpmExQEQRVpHCG1nzK51p2bGmxXa88T6zEfIo
	 QtLpIfTkOxTIkP20RU99BkxWipaNdKsaIjxs8wm+JWVx2FKlX7Kc7Z1JEHiU0Fc9RIlI6
	 REewayOOeNymhqKQApV7QKpcQNEW4JnVchB0DYPXQJh4YMB3liPgJwCkACdHGB0s2IGRh
	 qGoY/KM4y2OpRnBSuM6mn4bzKkQ+Johenzk8bhOhbHeukDX6FihguMahnWVP++2mvMzoS
	 PB0RaUzhtWIqYkYskKeedl36vF6K1UFvY881hzyoDWsfNjIH8w53JCPsmUcPfAun8/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=;
	b=DYB4Lwh53Dc++Q4XmOoCJubOnqbRn+sifdNaaHUw/gO7vk/qxYbcpEbP28Tw4hkORUvk
	 YTY9AbHcMWqH5ndGnemQ/7gYZfiR0POcSwSTDH1NJYm/N8rxyGo2qEpvYLdR4FO+9Yoer
	 mZOG1JEtrZ5JWXCL7LRHj/9qfFLtUpSpf7kn75EHbZYd+y9w5upe+rFlCr9iqoetTR1HH
	 BKU3AtjDwu0i7jMeMgf7TmkqrZ/LsjP9GYQhXqv1yZ7o7d6hGgLFfYR02EkO3+7Re8WXr
	 LXCqMXH6AckTtH0FfHTIOsfSOg27vX16TfVeUlyJ/MXcc+NdOM8icTH830++JuAcZJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2CpUTms;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ft8d/0/n";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED4606A321
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84ED4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A2CpUTms;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ft8d/0/n
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4asBO1181808
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=; b=A2CpUTms71nD3qMT
	L4/4i1Uxo6TbXp+ULA2JOUWJq2RPs5f7/Is5LQtEIqUBqSyJwG5yTytIEXmlYRnO
	LlnaVPZUXEekEjDBabYAdzux3qlYkdyLq0g8l1+AvZZWmFLVO21gMmpWwEoVt1qj
	YsSmT283eahVnjKt0dFeClSdA8tZQU6rF5Gn+syDn5y98A4CjtkOzmeVfWv1onop
	UWGrWmNmrL5TfcN9N6C0sVttd2bdPucg+iCOMhT3yuWDzTo6Zlq0H9peHrL+DlC8
	iPvSEXoDaHTUTjKzgijekV06B18x+lZcNECmkQ5j6TXlKExQXExoHjPWjGHppbzU
	uXYOEg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27w29p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:24:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae62796dso12547335ad.0
        for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 23:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995849; x=1793600649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=;
        b=Ft8d/0/newVC9d89LHXpmUPlohQNak9h4/+zpkjzEOmPHPMc7ZCaPMBylqHblASNi5
         EHfoTRdFvm9RvSFQGyNEkuFq+UOn6OszCSWMTXpEIEPapVBhEhU5KKaYGCMmPMMhO6pN
         fL9kdxfvqDDz4qdmmSvE0iEjM3D0rhpxBOog5OMDdENKeAXSw+PhvSwZ/QkyqtSYmxqg
         84UccQcHaTPQ5eR88+maDpjvUCSz31QF67uHXUzKH5ZrHMonsh15QNnuzP6EksSvl3wA
         QswzmzV+6QTEDyK7N7kC91ICJUADYvMyQxeAdHUucc6TQlSUlfJy7PkVNASF5waQktl+
         E7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995849; x=1793600649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dbYNMN9z8CYSu3KpTs+t1qX2w1pkqwFymCUjX7ig2RA=;
        b=BO+CNPEft6zhiXRYBR53rlHF7tzfYs+MhP3iZ0or3llvXYgn/PE9kW1S5ga0zzNPGC
         yEtDkX8s8ssnqjL4ECLGweIyBd2menqNBSqYkPp2ytZfy7HcjYIzvHZ1pnGpP1EpZvNs
         OqrllIe9WmlRRz7EwfW7SyPYb+kOKdZa++XJm/0Bq6uEnLWQ6sVZtmxyukeVWqWhAcmE
         BbKc/1JKIFd7Sm5oWEcg0QriQfmmYLGTUI7ZYZkGm0ofywWDAlfOjgEOvmUXdhRTm40N
         VUdFiT33oIevIKp9MF5EJm5YKV7Q24/tEii/1EjuwQJ/xSNUas4bgUUj1ta+vXx3/JCb
         VK8A==
X-Forwarded-Encrypted: i=1; AKwUvBwWCoMaTLN4pjxg7yMHTyV57ga0oVk2HEJcIlKyPTt44ItXzpGn9VfD3/XmAEZqG9g3JkUB5fuBlRzi4Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIRP5cKcX0JzoOdxnBrBqVEK/bytklBlLYgQT77mhVcvLpwYYcf
	SD1+6FJtLdDHYivLzeVl2lj03UT1Oa4hXshhMusMRL25wzbnalG0+oLptxWNm0JR1SkOriRKkgn
	DYMRdBySiIa1O5FzteFITbsWWuWWoHe1Jv90Pkf2JM3bb0Je7ATkHalOrjQBhUR1lDw==
X-Gm-Gg: AYBFou1bPmFqziXjJ1+dchytjVtAn7gsWuR5lorKm9JN0x6oijwLnL8KOG47ZnAyccx
	61LTBVgMHEICqkn2MkP9Lbbw4uMdPOBueilEBQjrFm39d+mttpT0NmX/6W8iTEXL4IHwQLjiFTU
	AYrH1Y8xxx1q0RmG2ErCc+FWedmybCQLkPXA8mqLsGXjoDzSFF9eVZn/S1cCZy2vwKjnCmvYV81
	kLzzF4iS+qX1bRy/MJMvmrRoaf9rjfD3QdaEesHrqPw5YLJ6nTAJYNKBAbRIr/eVcLqNrO8DT6R
	HBz5hUwOCOUgd4kdfiObzoi0P7UCYbm9fSI2PWtWXrWOIHBpAiLqlgnhRxL8giCtqZcIP0q++Ap
	IeTaykY5aef9qpv9AN3l7ngCLlrFh3BoqRA==
X-Received: by 2002:a17:902:f60c:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2ea9c63d377mr43099015ad.36.1792995849358;
        Sun, 25 Oct 2026 23:24:09 -0700 (PDT)
X-Received: by 2002:a17:902:f60c:b0:2e7:12d5:cc3a with SMTP id d9443c01a7336-2ea9c63d377mr43098645ad.36.1792995848887;
        Sun, 25 Oct 2026 23:24:08 -0700 (PDT)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm12633415ad.44.2026.10.25.23.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:24:08 -0700 (PDT)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:51:24 +0530
Subject: [PATCH v2 14/23] drm/msm/dcp: Add DCP encoder
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
Message-Id: <20261026-jshekhar-dcp-hlos-v2-14-7cf014efdee1@oss.qualcomm.com>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        iommu@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792995687; l=2736;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=13ayK5iaWertmFXymKPgINfX7fwgPHD+tgYvEDAKLs8=;
 b=zmwgbeRZoqTMrzpI8+a/t3MlIu3IDSlRDVgwwS54kYHPLh7/+sgEF+x7gACCHhdFfzZZj8Vly
 V7W/Eljs9FoDWuakAW53sDKzOr21oUkTPeVA72jFeTstFMQfl57YL2J
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adef20a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qqiwZq75wgHyRPlt0ZYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: JSK5qmGKQF7ql1XjegGhh9KZYZq87rLl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX2o5ssSffLx2f
 pAOhkmd98VvdqTS/k8cKG4Jisg2JY4KKlwQT2hR7cUkt5rUZuVDduwJ7ybCPF4o227/jLFkttb+
 NXornbpSNM/j3mHeN/QiuiW0JCHdDBs=
X-Proofpoint-GUID: JSK5qmGKQF7ql1XjegGhh9KZYZq87rLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfXzMwis3V59jdy
 w2ruW9Ibh4WOjaB2Me4GkKDp75r1zRqw9XrADGAjULCZSTrf5ekBb8FXa4YNfVe5UUgLwJ//nKN
 +xpEuojOD/CkZ0N0dAUgsmFxj7Elpk2EDaI9/Ad/Y+G5AHLIvBPaL7M14o7ls/kMFLe4HsY5o4s
 7JeSxSG0aDHLsJGIREYIugGK+wwnHNihpJOuVnvpE37XJz/eoss6sapg4OXNpMVxHMKb+aHrHsU
 PS3KBrBgLdSmIdF3bCfDm7nMHliOIkO5iRbpRnpYH3EA8SybcfIVpHhcQ+iGrp9rW7hIpc+GGWu
 MGaCP2mhS8+u9Xg9olW+eI/+DNZWLUb6Ej/5SkjJu0oxwUnUyFamSGFQId4Y6Eqz5Y0vXtKBrQc
 +Wp9UZQ6ecyydq3cLVFvIbzUOvRrVjwnbx1LHL1ePcXeiKWCBDHYgWmWTSQzKT/PtQrEfWIavWS
 YHYo1JJnrULYniBMN5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260025

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
index b425fefda890..4024f6b1e3cf 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -83,6 +83,7 @@ msm-display-$(CONFIG_DRM_MSM_DCP) += \
 	dcp/dcp_hfi_kms.o \
 	dcp/dcp_hfi_plane.o \
 	dcp/dcp_ipcc.o \
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

