Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910AF30F7E8
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786821756; cv=none; b=NrmL7tOrtPKTwnNcysoEKXJgDilqwqMQHBzJtczhGJ4BVk+GgyeLZrfHW8NrWHvFy0c5vREoMwk6TW25z9v+UFBvm+95HDJbF8lM1c8WXEmrDjJnfGqC/lfk9p6vGFVS4NQahLXHAhgszAXfBYT6uCryVK+BXd42xgkx1YjWdCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786821756; c=relaxed/simple;
	bh=aYg1KsEO1BMPI1NvrP0QlCY+oFgndNkDbagsl25qYmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B16xndu/KVphPDMu/AnsF6PQgL0ks61KKhrHD8OAxIl3bmbhErMTOvotRK5TdjhipCWICiy5/nSeYmiYD3cND0QBKkgmNWm7dzbzJuI/owaJUv207DL6SdK2QRM+eRjpcdq/snRK9OAIhBzRaFyLO2SkfMDsKJEPRiSI3mdLr1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2zFZVIL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXY5lZej; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i2zFZVIL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXY5lZej"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FGTSrm3999618
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 19:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wsd3AcTjBlyGfb//EcpMQsX1Atw/JeAXEdL+9Stg4F0=; b=i2zFZVIL+JS0C/Ro
	S2gSFfwGREQx2l1l6dK0FGy2dmv7Sf6d47c0fHZZubcEZciB28lEA7CmbqW62cTI
	68JmpHWt+YebcftRlhGkk+XPrbVpbT5fBk0CbF1INjndpk+bpSTIoE4Gdq2BDPVA
	Oh+Hu4hIIzez9lieK2fdMuuNzZ0Kdp/x1EB0biaklxj9XDSuKpSbPwrkrg3JWJgg
	Ar8ZlG+ml9oiUWaqVz8LKxjVzLyb0SeH+M4N+iJsMZ+HWYzeE3miO9Ij9y3H9FU4
	xNs7bUeBQju6qxUDGrvg5xpDxq/ponNQnsL1qUTBZudFxXXgca13ITfS6UtzRZAV
	Eid5dQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghq1sag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 19:22:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f005ae3d1so446916a91.3
        for <linux-media@vger.kernel.org>; Sat, 15 Aug 2026 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786821752; x=1787426552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wsd3AcTjBlyGfb//EcpMQsX1Atw/JeAXEdL+9Stg4F0=;
        b=PXY5lZej0xNjX/5L9VxvtCQl9vVfGwPefiZstYn4iixUC2RWJrV4fJVypetu4QQrcS
         Pv2BliPdrl68byKk4tS914rU6QSldY3lbefeTH3ZFhoGCKduLgg+WLVhiH74+cYCa6pL
         LLim78dJq4qlY3wWhTrsF8ANJ62r4+jxeUeLHa/6t3cTugcWiYjwoHQvNJkSCE7YscVv
         f4XCSgwlXBNBs/qTG0dWe89vqrCBekimwwwX6ShCqDQGLfTRVSWtx9xV8XE7rUGfTc0u
         PyBFhyQQll8jBjZT4u9Qy7jN3iX7g/t74/W6g9kWdFV2EvzqrDZR9v3omNxMqYnWqVpS
         XNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786821752; x=1787426552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wsd3AcTjBlyGfb//EcpMQsX1Atw/JeAXEdL+9Stg4F0=;
        b=WdrHGjM/pRMRaBIhAg7k5l8e5Y2ClVfzHNJuIn0MdN/aFdvh44DRpEHAVQATBH61EF
         k+TZ5f/Bqr2QkNFEoGD1Bgrm/0Xf4UFNpSgJRHo8aaELWFCa0TcFblhg4nVCCiUP/hFz
         y8BGh6gZbxsZJUZGMafnZ5bmghm/wLl+iSqsmzSLTH0l/Bdb/9zChOV0UCW8AH1l43zr
         tUJEzQflcyGQAA4weL3odIZg39T/tmGtoX9HzHrgtx0fdzsbsJ2VrN9VvpbKtU3Nzldp
         P0qQ3XO8KKeqBYvaIlTT/7/SJY8PTRjhGJlgSuZrLxl4Gu6EgzbcMpNzcIokPK/KuWgV
         6Frg==
X-Gm-Message-State: AOJu0Yx8yJLzAipey/uE0Gxa4l6LTvllqaKEXhsadtJ3oehvuDNBbRTz
	Nzef1Zmxo7NhcG8ldQ0fhbqb4GTVtZUsFuskBElFiPeTGDslvRki4wgolJSQLPvFBOYyeFQBbld
	AwrtkdBZISN59/64APYzRivOMq1oz1OI1W7xFaF+O9+VVrO9Lv/4SHj6Sekm0pgqg0A==
X-Gm-Gg: AR+sD13N/0MLGGxvmcTD+3PDP2L9+UvbYszBRxFtJxgA1OWTaYtXTG6jsyA/CNJZgmc
	Vkcb7W2nv0Gs1PnPu+P9KSjwQcUtdSuIR287/aAiAj2BakrvZFaXh4GR9z57t6uMphlACe2Lk4r
	k0FOaj4rXPQoBR+sb2DmGamVzTi7UcYjFMNuRuoa/H6IJLzg4HDtvjDD43o9o50YizAGyruDjEX
	FPknd2fHPZ8mavdZ9ud9rGAMBEFBQLXslPFmjmkgSbK8k8V5pb99XJ/hwIwhHbqxmqQNBHvnDEz
	myyUai+ED7UFpWUtuySnDxw+JmDt88o2c54AI76ea90FRS4kniLCaTIZV7reklpO6tSfhTlY8RJ
	wyzBB/bSVDdTPCaVht1hpV8OtFYvYsA8LSf/iilzlpAPS/JjvbIurrWDpAoUr
X-Received: by 2002:a17:90b:1651:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-3933e6465ccmr10274949a91.3.1786821752357;
        Sat, 15 Aug 2026 12:22:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1651:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-3933e6465ccmr10274929a91.3.1786821751813;
        Sat, 15 Aug 2026 12:22:31 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1cccsm15889350eec.8.2026.08.15.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 12:22:31 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Sat, 15 Aug 2026 12:22:24 -0700
Subject: [PATCH v5 1/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-enc_roi_enable-v5-1-ded944f0fc7f@oss.qualcomm.com>
References: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
In-Reply-To: <20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786821749; l=7406;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=aYg1KsEO1BMPI1NvrP0QlCY+oFgndNkDbagsl25qYmI=;
 b=Ff4xyMmIWAofHoBypL63V04/g595uILkcHQU7iRadj5QzHv2XrrRl/MKnn88rx7eYJB9wb9uB
 3fYXbXT5kSPCI/cP5FXulxVOb29mvJmXKCnkJT0lBfWzCp0b5DppR9Y
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDE0NiBTYWx0ZWRfX50CSHCx6AFcv
 F8l9WW9elVKt706vnR2FqT3kNVZhxpa5hYAPcKc6d2T3g+zGUl/4Ztg5BYwYhmqVUWuRaNx93XN
 sENLKMdSPsqVJ+JojEMDg/rwVn9ocEUPcGLKp2wgwa3NUoDyF4rPOBYwy/sp8A0b1WKdx4/W7bO
 /IPB6BbkxHITeVCHvwvf0x0hdnR0xe9At1sOp3lb77fLRTKfIfoKOP8mJxyBlfZEGZ41QOOm1Gx
 CY1NnrkzFb4GM8s3+Xwy21oulfbmjpCX4QXeJmBHiO4l4rxiOwYwLAFDcSEoGrcNEMrcm7vranT
 QeXI9K/17GQq6zJdmFQeI4BJmVTLSyMkgQ2E/WKi5slqVp+/lWj8M7xSVMbgTPmRClCTGTMMZz+
 7PnxpMktbD9WtDUGX8Pwt0uqxb4MlE7EUO7FcH9UwkZpzNWIFtlJCGrRDws7lYw7Ga8mi9Bmwc1
 JJn2mHe4E8zENj1UqZA==
X-Proofpoint-ORIG-GUID: fXr_qIKb8iZOcj_PAbYjeBEazNsWQUkb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDE0NiBTYWx0ZWRfX8EAN7anetX34
 9/Z0gBkz3pXrQtWljW/PWOiJsFv3kFu+XAf8caffPIIIfNwlMFE+awQBHu0Co6y+m5zbIdRBc24
 D1/Qf7e5hsfcg3+2zIftzFgdwLrSKZ8=
X-Proofpoint-GUID: fXr_qIKb8iZOcj_PAbYjeBEazNsWQUkb
X-Authority-Analysis: v=2.4 cv=dvHrzVg4 c=1 sm=1 tr=0 ts=6a80bc79 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=o2p6THidDhOa5OcZzacA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150146

Add custom control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 19 +++++++++++++++++++
 .../media/v4l/videodev2.h.rst.exceptions              |  1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst    |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst      |  6 ++++++
 include/media/v4l2-ctrls.h                            |  1 +
 include/uapi/linux/v4l2-controls.h                    |  2 ++
 include/uapi/linux/videodev2.h                        |  2 ++
 7 files changed, 35 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..c16b1c5cd1c02b7f66b5f13433eb039eb615b35e 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,25 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8)``
+    This custom control is used to set ROI MB map delta_Qp for the whole frame.
+    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
+    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
+    is configured with delta_Qp in raster order. The valid range for delta_Qp
+    is encoder dependent.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
+    A read-only control that reports the MB Size used for the ROI delta_QP map.
+    The supported MB Size depends on the encoder codec.
+    Only square MBs are supported. The value returned represents the
+    width and height of each block in pixels. The ROI delta_QP map provided
+    through the ROI control must use the MB Size reported by this control.
+    The number of entries in the ROI delta_QP array is determined by the
+    frame dimensions and the reported MB Size. For example, for a QCIF frame
+    (176x144) if reported MB Size is 16, the delta_QP array must contain
+    99 entries (176 x 144 / 16 x 16).
+
 .. raw:: latex
 
     \normalsize
diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -188,6 +188,10 @@ still cause this situation.
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
+    * - __s8 *
+      - ``p_s8``
+      - A pointer to a matrix control of signed 8-bit values. Valid if
+	this control is of type ``V4L2_CTRL_TYPE_S8``.
     * - __s32 *
       - ``p_s32``
       - A pointer to a matrix control of signed 32-bit values. Valid if
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
       - any
       - An unsigned 32-bit valued control ranging from minimum to maximum
 	inclusive. The step value indicates the increment between values.
+    * - ``V4L2_CTRL_TYPE_S8``
+      - any
+      - any
+      - any
+      - A signed 8-bit valued control ranging from minimum to maximum
+	inclusive. The step value indicates the increment between values.
     * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
       - n/a
       - n/a
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..a1806ddbc797efa52e83cd3f685ef70d5b5483d2 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -64,6 +64,7 @@ union v4l2_ctrl_ptr {
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
+	s8 *p_s8;
 	u16 *p_u16;
 	u32 *p_u32;
 	char *p_char;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index affec0ab4781507be761cb791ff737460acf9cb7..00a2c48630bd198faa9a2b833a9aa346d8357555 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -920,6 +920,8 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..95d8369e0d3d1e434978b9e576e0ef122691c65c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
 		__s64 value64;
 		char __user *string;
 		__u8 __user *p_u8;
+		__s8 __user *p_s8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		__s32 __user *p_s32;
@@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U8	     = 0x0100,
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
+	V4L2_CTRL_TYPE_S8		 = 0x0103,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
 	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 

-- 
2.34.1

