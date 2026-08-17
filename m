Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F7E32B133
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942139; cv=none; b=LpXI6G15yNy+usFFjYOQkg5sGt1l/NBgJ8cX/xNHCsI36A5HJCwx4f9zZ25IS253UlmnTAT4UfidANPV/TJC1e/L2d3vxCeSJfoDxBjPyI9r65rc3janEvMLklgcJkv9AybobVelVHKHBPkcLuRPYXc6moEac6qeaJQdmBguZP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942139; c=relaxed/simple;
	bh=HryfLUSzYfOSihZ2yYCxpjSQhD0XgSu5HdZLWNDT3u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZawIVJVvzHHKbmQlnVAjQrG7s8aus90Vq2qXKgbaT5tEFTkx6Qto8UcI73S7i6WohkAXz9J1gnObZPI08nSwyINJxq2aT2oPE99gdi31uzhUvfPuHoxG4nyJHEcDqP3EbOfrSUbq3vrvt1YiUiDTYBjjAGVGAZQeazDGEzTY2Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZRH80dUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d3sPVmUl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZRH80dUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d3sPVmUl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLDTb9856670
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KWdK6qCL0RqvkILEEB3YURSKbabo3L45W/kg4lUsZ+0=; b=ZRH80dUnbye2hipf
	GinfdofhsP/2qme+RLJapLhK7hafmF5Nc5JnzKJH89rgIdbGtiARWff0oE7kBJo9
	g2Z/VjJxNl9uBiCQJlT9m5tEeZg44Nao2MrWWN+o+/FU7AzA+kfsfCkwGIO8gQHY
	BMuuGuXzR0lmYgIEcGD4By+pArkHojzzLduYfWIKO3QdcH/SPjO/jwWl+/tY267G
	Egb9qzokMuiqX8u6MhzHehZRtvgKhTYbVxnoTLD2LksX2U0Xi1WZzh4TzVdqKhTF
	HvrOXYPsFbEqpUJXpYt3yyoTtiSfmjCBmGfA4EIrRyeoJinPiAcJUpwGlSum4nEh
	iQrqsA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghwn56a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:48:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbef1d25500so2983037a12.1
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 21:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942136; x=1787546936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWdK6qCL0RqvkILEEB3YURSKbabo3L45W/kg4lUsZ+0=;
        b=d3sPVmUlnfF1oPh8Q0EvaYEdo52Muis/TNFRk9ZCI1hkYfqAxil7E6xYp6Ysk54tR5
         xbBufR8ZisHY3e0wgm0xpChugmhWfYsFD7+HowlkFH61OqhCts/gXKNEVnQnEhdojRb0
         NxeH3riRe3vNYoJ0UI13sEG7ySRUg0sQOR/6XLM7x4157kDLRCm+dJeg0CAibXu5eBdn
         wixbIFXhDPEdqQWcEZey7yXAfrIKptdxORWByt8aOS6Qx3ci5S/xoytAwRd1PsqyzP7H
         lpK7WbtsiWponuQgZ2eKNdiarOOys519a4Fr3PtNt5oXgDe7r35NQdA7fjYuBnUivGmO
         xAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942136; x=1787546936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWdK6qCL0RqvkILEEB3YURSKbabo3L45W/kg4lUsZ+0=;
        b=Al+VzPWk2tS5UAkkkCbxbTUIMkKAbidI9ai7YSAjOS+rdvF9AkpIcHIhB8qSqe7w7C
         JNCJB5jGmmFG64l7x3kVrIHy+L3BePtuUIO/z8OIavHmUB1DXyscKS457Wik/h2tpnco
         ahEpQTxLTalhkfTeFst4Z4aR/JeXZAkOAgLHtdyJ09Ys67Ni89vR6b5klokJLGfyIHgR
         vOSBxzQrrLNyECDnFnsi9yMI++I4UqqXdOLbgHI8bzDdvmN9ps8Pz15ERmwrNErJ8zvq
         QYtMvGnk4sGPWbYpm4A6GSGI/GLzOR8swcbv+HmCZfxGvGP2z5WZ8ZhMJnj4qexr6gac
         NbSw==
X-Forwarded-Encrypted: i=1; AHgh+RoByT41Njg0lYqe6YhTYcJ8+cpjNwZWRkuY7uCyewqWDHvWn/LC7QAPmbN14/+dAU2F2DJQj1jDThPPnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YytGV9iLJB23mFAr1in+k9jjSocQymikbRA/8rlJpk5EhMzBKwM
	4PpjZaXAu7hh+qgvCuGgnN1EPDUw/Cg+vyZEfcm4JnkCZaARL+C42Jm0EVZh37R5Rb3LocN+2H2
	N7GcAPNrYyIXJnjaJ4OK4ImKfN9kRoYglCdjk/adiIozkSVPiGRaxusHLTl7TGQAd7w==
X-Gm-Gg: AR+sD10TWHQ8D59jbIZzJpgjP/yW85UV4WO9xCJfEpCb5Xdsx/gMN60WIGk+dTP78ke
	i/4o+vWfrR5dHM0uW75kEZqf8uhJuocCGLaJyhJQ6lzo+HUtf6UYInSmDWA1u3+edELmhAfK4K8
	VLaGqowVHaidleNwiAiS6IrZmeSS8ABp9DYagwQx+bevNus01RlipfLkMw5M8afbFYIW/Wl7oY1
	5FTpYz+S4AccQA1qqNmyzvurDz+bsxsdHGVtWRtwNUPzCqGObE2vbvkenXcjxFxhPi5WCVvuRIN
	zM95yDkTk/1e5zmd0tnoBFwLx7WZ3klyxqpQgH8cZpOi6gPXNGkxhVoZSr3f6NcKfuxPNUdbUSw
	vgiQIyb22GIR/B3y/JfpDODcT/J6SCjEq
X-Received: by 2002:a05:6a00:4c1a:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-84fde00137dmr21176308b3a.9.1786942136047;
        Sun, 16 Aug 2026 21:48:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c1a:b0:848:6447:e0a6 with SMTP id d2e1a72fcca58-84fde00137dmr21176263b3a.9.1786942135512;
        Sun, 16 Aug 2026 21:48:55 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:48:54 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:43 +0530
Subject: [PATCH v2 08/15] accel/qda: Add QUERY IOCTL and QDA UAPI header
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-qda-v2-v2-8-69a02e9090d4@oss.qualcomm.com>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
In-Reply-To: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=6616;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=HryfLUSzYfOSihZ2yYCxpjSQhD0XgSu5HdZLWNDT3u4=;
 b=5HADVLVN5lGTFZ9UeILGBmzRpc1Heah8/zNUOHlR0SsZM2QupNwPalwofSLkeR6L3t6rmu1FR
 qeDXX1eA5nqAhCunMGLV8+3heCm+nel9Ymani3iC3X4j6e4UGrtFwW5
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: mHhFLzUTYeu5jFNgIaeUZXhT_PjgeGOj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfXy6Lbq8hurecQ
 p1uswHEFap962kwoToneHs4bygLBGjY0xJFJ/sIZX6T7lCQSPdg2A/edfYfNnkSJaObHDZWNuIB
 3M/uDaZU0/EXxdDMdRuh/vbkVxCBA7vkDR2Lf4ta7lv0JBWH1fbHcmXgDmunjTfcnuyJMboooUZ
 Kt6pYfj1ejRXrntKVw8DgfkUFFJZo7/Da5lTZqOmHSiCUShFwDtjLnhMhIwDsAap70cTjweCWcx
 lkZkbEHwQrsWSdLn/WMeT8fr/oPb8YbrS64MnliyZ+5CdzDxUto6P67yFxeX7dTA8idjvJJf5WW
 9f+I2kV4IsToMfTCGgroK+2Rrv/b2l8SU+U/i5GkDh+Hvek8aFUvQXYYlDTUNC5oGFOSulI1Oeg
 S1klnO0ker2ctoEVFA1ecy76UvzaXeHmXQvp6RgsOWUpgmqC2yRhVJ0CAjpa9GWzZhv+Ps0WqrX
 qsApgHheHXyIV46GIPA==
X-Proofpoint-GUID: mHhFLzUTYeu5jFNgIaeUZXhT_PjgeGOj
X-Authority-Analysis: v=2.4 cv=DdknbPtW c=1 sm=1 tr=0 ts=6a8292b8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=50c3GPANBYZkxQ3LsMsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX43d0MzDwNKBc
 mUnCoxjC03av6NsV/rFWKaTsWnmQ5lfkxn0jGZZMFIrCxnpIEIpn+IJuOn6oR9bLTwwJ0KPxPcO
 gKOz1jLPx2kheLx+IVQKgUI3vgmADBo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170033

Introduce DRM_IOCTL_QDA_QUERY, a query IOCTL that lets user-space
retrieve information about the DSP a given /dev/accel/accel* node
represents.

The IOCTL takes a query_type selector as input, so it can be extended
to return additional parameters (capabilities, attributes) in the
future without adding new IOCTLs: drm_ioctl() zero-extends the argument
structure, so new fields can be appended to struct drm_qda_query as
long as they go at the end. The first supported query,
QDA_QUERY_DSP_NAME, returns the DSP domain name (e.g. "cdsp", "adsp").

The UAPI header include/uapi/drm/qda_accel.h defines the command number,
the DRM_IOWR IOCTL definition, the query_type values, and struct
drm_qda_query. It follows the standard DRM UAPI conventions: fixed-width
types, a C++ extern "C" guard, and GPL-2.0-only WITH Linux-syscall-note
licensing.

qda_ioctl_query() validates the reserved pad field, dispatches on
query_type, and copies the DSP name from qda_dev.dsp_name into the
user-supplied buffer with strscpy(). Unknown query types are rejected
with -EINVAL.

qda_drv.c registers the qda_ioctls[] table with the drm_driver so the
DRM core dispatches DRM_IOCTL_QDA_QUERY to qda_ioctl_query().

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
Changes in v2:
- Add a query_type input selector so the IOCTL can return different
  parameters in future, and switch DRM_IOR -> DRM_IOWR so the input
  reaches the kernel (Dmitry Baryshkov)
- Reject unknown query types and a non-zero pad with -EINVAL
---
 drivers/accel/qda/Makefile    |  1 +
 drivers/accel/qda/qda_drv.c   |  8 +++++++
 drivers/accel/qda/qda_ioctl.c | 35 +++++++++++++++++++++++++++
 drivers/accel/qda/qda_ioctl.h | 13 ++++++++++
 include/uapi/drm/qda_accel.h  | 55 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 112 insertions(+)

diff --git a/drivers/accel/qda/Makefile b/drivers/accel/qda/Makefile
index 701fad5ffb50..b658dad35fee 100644
--- a/drivers/accel/qda/Makefile
+++ b/drivers/accel/qda/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DRM_ACCEL_QDA)	:= qda.o
 qda-y := \
 	qda_cb.o \
 	qda_drv.o \
+	qda_ioctl.o \
 	qda_memory_manager.o \
 	qda_rpmsg.o
 
diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index fdc909facd95..e1fd8bfa12d7 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -8,8 +8,10 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_print.h>
+#include <drm/qda_accel.h>
 
 #include "qda_drv.h"
+#include "qda_ioctl.h"
 
 static int qda_open(struct drm_device *dev, struct drm_file *file)
 {
@@ -35,11 +37,17 @@ static void qda_postclose(struct drm_device *dev, struct drm_file *file)
 
 DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
 
+static const struct drm_ioctl_desc qda_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(QDA_QUERY, qda_ioctl_query, 0),
+};
+
 static const struct drm_driver qda_drm_driver = {
 	.driver_features = DRIVER_COMPUTE_ACCEL,
 	.fops = &qda_accel_fops,
 	.open = qda_open,
 	.postclose = qda_postclose,
+	.ioctls = qda_ioctls,
+	.num_ioctls = ARRAY_SIZE(qda_ioctls),
 	.name = QDA_DRIVER_NAME,
 	.desc = "Qualcomm DSP Accelerator Driver",
 };
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
new file mode 100644
index 000000000000..c1d6c9bc0465
--- /dev/null
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+#include <drm/drm_ioctl.h>
+#include <drm/qda_accel.h>
+#include "qda_drv.h"
+#include "qda_ioctl.h"
+
+/**
+ * qda_ioctl_query() - Query DSP device information
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_query)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_query *args = data;
+	struct qda_dev *qdev;
+
+	if (args->pad)
+		return -EINVAL;
+
+	qdev = qda_dev_from_drm(dev);
+
+	switch (args->query_type) {
+	case QDA_QUERY_DSP_NAME:
+		strscpy(args->dsp_name, qdev->dsp_name, sizeof(args->dsp_name));
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
new file mode 100644
index 000000000000..b8fd536a111f
--- /dev/null
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_IOCTL_H__
+#define __QDA_IOCTL_H__
+
+#include "qda_drv.h"
+
+int qda_ioctl_query(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
+#endif /* __QDA_IOCTL_H__ */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
new file mode 100644
index 000000000000..fe695347762c
--- /dev/null
+++ b/include/uapi/drm/qda_accel.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __QDA_ACCEL_H__
+#define __QDA_ACCEL_H__
+
+#include "drm.h"
+
+#if defined(__cplusplus)
+extern "C" {
+#endif
+
+/*
+ * QDA IOCTL command numbers
+ *
+ * These define the command numbers for QDA-specific IOCTLs.
+ * They are used with DRM_COMMAND_BASE to create the full IOCTL numbers.
+ */
+#define DRM_QDA_QUERY		0x00
+
+/*
+ * QDA IOCTL definitions
+ *
+ * These macros define the actual IOCTL numbers used by userspace applications.
+ * They combine the command numbers with DRM_COMMAND_BASE and specify the
+ * data structure and direction (read/write) for each IOCTL.
+ */
+#define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
+					 struct drm_qda_query)
+
+/* Query type definitions for drm_qda_query */
+#define QDA_QUERY_DSP_NAME	1
+
+/**
+ * struct drm_qda_query - Device information query structure
+ * @query_type: Type of query (input)
+ * @pad: Padding for 64-bit alignment (must be zero)
+ * @dsp_name: Null-terminated name of the DSP (returned when query_type is QDA_QUERY_DSP_NAME)
+ *
+ * This structure is used with DRM_IOCTL_QDA_QUERY to query device attributes
+ * based on @query_type.
+ */
+struct drm_qda_query {
+	__u32 query_type;
+	__u32 pad;
+	__u8 dsp_name[16];
+};
+
+#if defined(__cplusplus)
+}
+#endif
+
+#endif /* __QDA_ACCEL_H__ */

-- 
2.34.1

