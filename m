Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A8632B10B
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786942193; cv=none; b=tVOHs5CespFfuhlC6uYTrVauMPJapABnFsWH/aX3JeOX/l4KZ+95vV1MQy8nLLAv5/1elhe0YSi+gLJbtVb7zrOvoucBmzx7cjQb/Q46RPQHq9R04p4/0wlsbxRmo0gWMSuNnl2vqVIhi30Yh8dcvKSQNcq9TD9gurv5qtgj/ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786942193; c=relaxed/simple;
	bh=bgw14BFHPFIoY5A7ZS7MaQSGYbj2NkI30v3H5TVFLLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SwBdcGGlxCnx9UnGehstkJ5CjfoOblAsP3FTPnntqjBgirDpI6LgfiZ+8CQWJ6+Nz/r7tsNyF/0LOj2NIqyFAoF4DOuZJcj/3uva8FZMZZPr/+pnzlb3zuuUpO/CAo5BgAxvifqbLNEZROnISmyCeiFvMOsvgvb0sYItu1NQopY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZrOK7LfC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isOke9PN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZrOK7LfC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isOke9PN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67GLCgSm663012
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FrfL64kJYZh5HPEZI2wdda+/4ACO5iqKRMp1ZpUe38w=; b=ZrOK7LfC2DoNZY0d
	w0XFNKL7PHwKV80Td233SPNTE4lWdz90ByuMH5eN68gXLZPd/Lp0Tbu7IhkvSI+6
	k9/KbSIvIFmX1Cal7b7/523qVZHoDDoDqt0EnheD95ZEdlGIVqCVkWxC4ENzfadr
	Jubgbpr/wp5aMQEom4be3AT4b7FQ9rslsLyXcTYhv4n8w8DzWOX9aajQqRcXvUmc
	aW2gxCqbHntt6t8z5spjiMtgtFA56rpITeHLe/pqCtHqWG4g2pE3+dvN+m7Nw6JY
	rFKdFEu/F6SIDOOjlDfM8A+4TFfK2xLRBe2rC7DEOZb/LEf97gLMiGkNdJJSZBFh
	Meibeg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghnw6n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 04:49:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2515259a12.0
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 21:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786942189; x=1787546989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrfL64kJYZh5HPEZI2wdda+/4ACO5iqKRMp1ZpUe38w=;
        b=isOke9PNkfZVF1gZhOBUsg/h4zmO2xVNs8esfUq7amC0U4qSF/yL9kcKSFWZNKuSK8
         rWkcAMnnYFAAXDe4Q3BBkcMqg6WgZ0IxyRE5AbdEA1xNwAHdEw7S8e3vAu+sJaRqYobL
         63uT4hkxc6gcy6mVRGU0VDPLaNK0TP6n06shkITgs141Uu0F8cemqQkRSdo+tk087UVI
         4ie+9lza8acjaIXE+bowGl9TX+RrM6ogjKGpV0nTpCfG81lZO1z0mH9G1yl815A7PZPG
         HC6I9AI6vNY96Ll7D4u1FgJtSmgLSTgrxz/FlT5wbeWZQ4rN+xky7szgM6jHKVUFDZck
         +dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786942189; x=1787546989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrfL64kJYZh5HPEZI2wdda+/4ACO5iqKRMp1ZpUe38w=;
        b=PcKVwnPweHXdAv3syPI0XmOcxKtI2MF9drbYMCFI4NU5JMJNto5cmRBehTU4eBYvt0
         /0IBgOIzN2ZKBCHj+GDfi9UvmjWm6BNqeWUQDj+NFnju560pnX9qnjRFVFY930OzfdlE
         YPsQF+c7TlmIPdWYsQ4ki7QvL6v5AJ+DZx5bkIzQmd6AbjMjpU8zPQAZ8S0Z8Vo2UwxF
         Xv+rexQn8/VNRdoy4kROzxFfmhNTLefw5t6AMLNwQpxaSuGzlY5h1Q8LVkX30W7FnOS5
         6qNUsDlk0doO4/r2n/CpLrrqbZ35/pJx7H/iZY9YOA4KA2ifJV+kC6EuTIgc7SnP2Kz8
         743Q==
X-Forwarded-Encrypted: i=1; AHgh+RombHkdCJoOh0p4CpdbAoWLmVWF0Bs7prqawBLATyopCrEWupM7eCdkxIf1aMV+n/tIf0f9UeGLhM4uMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ9aI0i9ZB2rq8dzI8BPtX8wk0HvOEszl34NyweSpD5uoQh7Gd
	gGmM83Aa16c4ZDo7WYwFELOOvI7PZFF8P1ITfa0CZ1nbgdC3WMLp7f6COUlKKIKufC+C1xZCToC
	Y1PMBICvEYMnnXItzot1Xg3iWZQD5EXYP1JAOYqd7SYr8x2NtkfJnky9ad5q06j/OQQ==
X-Gm-Gg: AR+sD10Dt0fI+6X9TyKmcecXhwq+s2Z+jciLegUzol9UISg5ykHenbUM6e4yDOtgLnT
	xdNKx5YrmrzmDY+5O6aUIuAUfi7lHq1h0x8AULtrbiQYIKKTbHIr8Yir3rzMnunLMu1kc6Lxlc+
	eUpkbkAs3DJao3zO/NC6c2ozvy/vMC3dG9gVRegnQNk9o5uGMM8Rao6XvoP8Msy5jRDmpoh5iSC
	2ldFSmmASg3WsQRx2P4wTkF+f4HuNe8b8pF8Mb6lSq/+2yCHMp5FiBIQMB66H249l2+/ghW6LOH
	msWXGmyaduphYlrrfbPNpQS1wxoOIpMpoD+H/nA7FJUDiq2Xxp1Cr2aBInoCTWKXXBGHZkxM2j4
	j/8pMUTQtPBlNksDd4Kan3LdTrqlImSXU
X-Received: by 2002:a05:6a00:ae18:b0:851:8394:1696 with SMTP id d2e1a72fcca58-851839417c1mr13339203b3a.12.1786942188329;
        Sun, 16 Aug 2026 21:49:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:ae18:b0:851:8394:1696 with SMTP id d2e1a72fcca58-851839417c1mr13339146b3a.12.1786942187714;
        Sun, 16 Aug 2026 21:49:47 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d046638sm2149250b3a.27.2026.08.16.21.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 21:49:47 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 10:17:49 +0530
Subject: [PATCH v2 14/15] accel/qda: Add remote memory mapping to DSP
 address space
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-qda-v2-v2-14-69a02e9090d4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786942058; l=19115;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=bgw14BFHPFIoY5A7ZS7MaQSGYbj2NkI30v3H5TVFLLA=;
 b=V1b32EUKKC8BwxWObwp2qu61W5BHdE1eTpwT2d6KuzlV9gwIRnSTUm8/CiTbTWsq+QrEvTR9z
 KFqlF36+FoIALZDWDvjWev114dOrMj9oGL1HiLIKGzDOdT9SIRMKpdZ
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfX7yw0HiZr+cgs
 BrYCXNuUBw26QuqzSHM0jajphQvKnpPkEtPmwC8Ii5RWxbb1aODZsirniG3XFld3G+5Ue+lV0Za
 JzsG8913MhFSUbgKvMvjWAJqG59oCExntuQpw5oWgQD4fVIgWl6LbeWb+z/JgRQnRRQWMH8IOOW
 hvJzOBcD1QitSOJhQf+YsH42/IWTDLMSTyN0M3kasihS6V0ARnABZAzxj6tP6xbWT/2r0qq/uwt
 /RIEGuSQUtAm50jr66u/0xNXRcKqfRDX03K4FZfD42+G2LasUaHNpj9FisrypGN54UZbAw/QVS8
 K7Em8lwx2f3GhWj+/Vi9Vyh6f/+AI2+ej6q9vFcchqTr/cw7qLpySIadehXLEfu2s97qMVSLfDC
 QBje+5fB7tjFTXeWIYYQbupbrK5Hz9PNYa6rWEY/buFiHf0OZekAK30m/jNJBTZWFDkmyOVT5M9
 ezgZmh/JUoZ9NvqjEzQ==
X-Proofpoint-ORIG-GUID: iZlsq_mBhRHqm-FIcfplq8w67PgWiVsP
X-Authority-Analysis: v=2.4 cv=QN5YgALL c=1 sm=1 tr=0 ts=6a8292ed cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=PW8XSVTZ-sbVurbGbLUA:9 a=za0tUL9sr70ECSv5:21
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDAzMyBTYWx0ZWRfXzeBl4/Dgwwez
 GzuHWaL2ByhbOFQdlFLvHuv+O+nOcunnHke6dYz5/W7RfltXWxrerLir6zfA8ZNqpz94t5bm64O
 t2ujN/ZcpnkayWa6ZH1zp8QDkMb6qyU=
X-Proofpoint-GUID: iZlsq_mBhRHqm-FIcfplq8w67PgWiVsP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170033

Add DRM_IOCTL_QDA_REMOTE_MAP, which maps a GEM buffer into the DSP
address space of the calling process so the DSP can access it directly
during a remote invocation.

The DSP exposes two mapping operations, both reachable through this
IOCTL and selected by the request field of struct drm_qda_mem_map:

  QDA_REQUEST_MMAP maps a whole buffer, optionally at a caller-supplied
  address hint. It uses the handle, flags, vaddrin and size fields.

  QDA_REQUEST_MEM_MAP maps a region of a buffer with caller-specified
  SMMU attributes, and additionally carries a DSP-side buffer
  identifier. It uses all fields, including attrs and offset.

In both cases the buffer is identified by a GEM handle; user space
imports any DMA-BUF fd to a GEM handle before mapping it. The driver
resolves the handle to its context bank address, describes it to the DSP
as a physical page descriptor, and returns the resulting DSP virtual
address in vaddrout.

The requested length is validated against the size of the backing GEM
object. The offset is validated by the DSP against the region it maps,
since it only ever resolves within the context bank assigned to the
calling process.

qda_fastrpc.c gains a prepare_args builder per request type, each
documented with the packed argument layout the DSP expects, and the
response handler stores the DSP-returned address back into the caller's
argument structure.

Assisted-by: Claude:claude-4-6-sonnet
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |   1 +
 drivers/accel/qda/qda_fastrpc.c | 243 ++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h |  56 +++++++++
 drivers/accel/qda/qda_ioctl.c   |  23 ++++
 drivers/accel/qda/qda_ioctl.h   |   1 +
 include/uapi/drm/qda_accel.h    |  45 +++++++-
 6 files changed, 368 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 4c3a37cbf49e..a29037bf8d63 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -61,6 +61,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_SESSION_CREATE, qda_ioctl_init_create, 0),
+	DRM_IOCTL_DEF_DRV(QDA_REMOTE_MAP, qda_ioctl_mmap, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_INVOKE, qda_ioctl_invoke, 0),
 };
 
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index 2c72f86130aa..6bd706b9dad2 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -410,6 +410,70 @@ int qda_fastrpc_invoke_pack(struct qda_fastrpc_invoke_ctx *ctx, struct qda_msg *
 	return 0;
 }
 
+/**
+ * qda_fastrpc_return_result() - Propagate invocation results to the ioctl data
+ * @ctx: FastRPC invocation context
+ * @argp: Kernel-side ioctl argument buffer owned by the DRM core
+ *
+ * Every buffer argument is GEM backed, so the DSP writes its results straight
+ * into DMA-coherent memory that both sides can see and no copy back is needed.
+ * Only the mapping calls have to surface a value from the response buffer.
+ */
+void qda_fastrpc_return_result(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct fastrpc_map_rsp_msg *rsp_msg;
+	struct drm_qda_mem_map *margs;
+
+	switch (ctx->type) {
+	case FASTRPC_RMID_INIT_MMAP:
+	case FASTRPC_RMID_INIT_MEM_MAP:
+		rsp_msg = ctx->rsp;
+		margs = argp;
+		margs->vaddrout = rsp_msg->vaddrout;
+		break;
+	default:
+		break;
+	}
+}
+
+/*
+ * Fill in a physical page descriptor from a GEM handle.  The reference taken
+ * by the lookup is dropped again here; the handle table keeps the object alive
+ * for the duration of the invocation.
+ */
+static int setup_mmap_pages(struct qda_fastrpc_invoke_ctx *ctx, u32 gem_handle,
+			    u64 len, struct fastrpc_phy_page *pages)
+{
+	struct drm_gem_object *gem_obj;
+	struct qda_gem_obj *qda_gem_obj;
+	int err;
+
+	if (!gem_handle) {
+		pages->addr = 0;
+		pages->size = 0;
+		return 0;
+	}
+
+	err = get_gem_obj_from_handle(ctx, gem_handle, &gem_obj);
+	if (err)
+		return err;
+
+	qda_gem_obj = to_qda_gem_obj(gem_obj);
+
+	/* The requested region must fit within the backing GEM object */
+	if (len > qda_gem_obj->size) {
+		drm_gem_object_put(gem_obj);
+		return -EINVAL;
+	}
+
+	pages->addr = qda_gem_obj->dma_addr;
+	pages->size = len ? len : qda_gem_obj->size;
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
+
 /*
  * INIT_RELEASE packed layout:
  *   [0] remote_session_id	sizeof(int)	IN
@@ -573,6 +637,179 @@ static int qda_fastrpc_prepare_args_init_create(struct qda_fastrpc_invoke_ctx *c
 	return err;
 }
 
+/*
+ * INIT_MMAP packed layout:
+ *   [0] req_msg		sizeof(fastrpc_map_req_msg)	IN
+ *   [1] input_pages	sizeof(fastrpc_phy_page)	IN
+ *   [2] rsp_msg	sizeof(fastrpc_map_rsp_msg)	OUT
+ */
+static int qda_fastrpc_prepare_args_map(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct fastrpc_map_req_msg *req_msg;
+	struct fastrpc_map_rsp_msg *rsp_msg;
+	struct drm_qda_fastrpc_invoke_args *args;
+	struct drm_qda_mem_map *margs = argp;
+	struct qda_gem_obj *kernel_gem;
+	u32 nscalars;
+	int err;
+	u8 *gv;
+
+	const size_t off_req = 0;
+	const size_t off_pages = off_req + sizeof(*req_msg);
+	const size_t off_rsp = off_pages + sizeof(struct fastrpc_phy_page);
+	const size_t total_size = off_rsp + sizeof(*rsp_msg);
+
+	ctx->sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
+	ctx->handle = FASTRPC_INIT_HANDLE;
+	nscalars = REMOTE_SCALARS_LENGTH(ctx->sc);
+
+	args = kzalloc_objs(*args, nscalars);
+	if (!args)
+		return -ENOMEM;
+
+	ctx->gem_objs = kzalloc_objs(*ctx->gem_objs, nscalars);
+	if (!ctx->gem_objs) {
+		err = -ENOMEM;
+		goto err_free_args;
+	}
+
+	kernel_gem = alloc_kernel_gem(ctx, total_size);
+	if (IS_ERR(kernel_gem)) {
+		err = PTR_ERR(kernel_gem);
+		goto err_free_gem_objs;
+	}
+	gv = kernel_gem->virt;
+
+	req_msg = (struct fastrpc_map_req_msg *)(gv + off_req);
+	req_msg->remote_session_id = ctx->remote_session_id;
+	req_msg->flags = margs->flags;
+	req_msg->vaddr = margs->vaddrin;
+	req_msg->num = sizeof(struct fastrpc_phy_page);
+
+	ctx->input_pages = (struct fastrpc_phy_page *)(gv + off_pages);
+	err = setup_mmap_pages(ctx, margs->handle, margs->size, ctx->input_pages);
+	if (err)
+		goto err_free_kernel_gem;
+
+	/* Already zeroed; the DSP writes vaddrout here */
+	rsp_msg = (struct fastrpc_map_rsp_msg *)(gv + off_rsp);
+
+	assign_kernel_gem_arg(args, ctx->gem_objs, 0, kernel_gem,
+			      gv + off_req, sizeof(*req_msg));
+	assign_kernel_gem_arg(args, ctx->gem_objs, 1, kernel_gem,
+			      gv + off_pages, sizeof(struct fastrpc_phy_page));
+	assign_kernel_gem_arg(args, ctx->gem_objs, 2, kernel_gem,
+			      gv + off_rsp, sizeof(*rsp_msg));
+
+	drm_gem_object_put(&kernel_gem->base);
+
+	ctx->args = args;
+	ctx->req = req_msg;
+	ctx->rsp = rsp_msg;
+
+	return 0;
+
+err_free_kernel_gem:
+	drm_gem_object_put(&kernel_gem->base);
+err_free_gem_objs:
+	kfree(ctx->gem_objs);
+	ctx->gem_objs = NULL;
+err_free_args:
+	kfree(args);
+
+	return err;
+}
+
+/*
+ * INIT_MEM_MAP packed layout:
+ *   [0] req_msg		sizeof(fastrpc_mem_map_req_msg)	IN
+ *   [1] input_pages	sizeof(fastrpc_phy_page)	IN
+ *   [2] zero-length	0 bytes, required by the DSP	IN
+ *   [3] rsp_msg	sizeof(fastrpc_map_rsp_msg)	OUT
+ */
+static int qda_fastrpc_prepare_args_mem_map_attr(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct fastrpc_mem_map_req_msg *req_msg;
+	struct fastrpc_map_rsp_msg *rsp_msg;
+	struct drm_qda_fastrpc_invoke_args *args;
+	struct drm_qda_mem_map *margs = argp;
+	struct qda_gem_obj *kernel_gem;
+	u32 nscalars;
+	int err;
+	u8 *gv;
+
+	const size_t off_req = 0;
+	const size_t off_pages = off_req + sizeof(*req_msg);
+	const size_t off_rsp = off_pages + sizeof(struct fastrpc_phy_page);
+	const size_t total_size = off_rsp + sizeof(*rsp_msg);
+
+	ctx->sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
+	ctx->handle = FASTRPC_INIT_HANDLE;
+	nscalars = REMOTE_SCALARS_LENGTH(ctx->sc);
+
+	args = kzalloc_objs(*args, nscalars);
+	if (!args)
+		return -ENOMEM;
+
+	ctx->gem_objs = kzalloc_objs(*ctx->gem_objs, nscalars);
+	if (!ctx->gem_objs) {
+		err = -ENOMEM;
+		goto err_free_args;
+	}
+
+	kernel_gem = alloc_kernel_gem(ctx, total_size);
+	if (IS_ERR(kernel_gem)) {
+		err = PTR_ERR(kernel_gem);
+		goto err_free_gem_objs;
+	}
+	gv = kernel_gem->virt;
+
+	req_msg = (struct fastrpc_mem_map_req_msg *)(gv + off_req);
+	req_msg->remote_session_id = ctx->remote_session_id;
+	req_msg->handle = margs->dsp_handle;
+	req_msg->offset = margs->offset;
+	req_msg->flags = margs->flags;
+	req_msg->vaddrin = margs->vaddrin;
+	req_msg->num = sizeof(struct fastrpc_phy_page);
+	req_msg->data_len = 0;
+
+	ctx->input_pages = (struct fastrpc_phy_page *)(gv + off_pages);
+	err = setup_mmap_pages(ctx, margs->handle, margs->size, ctx->input_pages);
+	if (err)
+		goto err_free_kernel_gem;
+
+	/* Already zeroed; the DSP writes vaddrout here */
+	rsp_msg = (struct fastrpc_map_rsp_msg *)(gv + off_rsp);
+
+	assign_kernel_gem_arg(args, ctx->gem_objs, 0, kernel_gem,
+			      gv + off_req, sizeof(*req_msg));
+	assign_kernel_gem_arg(args, ctx->gem_objs, 1, kernel_gem,
+			      gv + off_pages, sizeof(struct fastrpc_phy_page));
+	/* Zero-length entry required by the DSP protocol */
+	assign_kernel_gem_arg(args, ctx->gem_objs, 2, kernel_gem,
+			      gv + off_pages, 0);
+	assign_kernel_gem_arg(args, ctx->gem_objs, 3, kernel_gem,
+			      gv + off_rsp, sizeof(*rsp_msg));
+
+	drm_gem_object_put(&kernel_gem->base);
+
+	ctx->args = args;
+	ctx->req = req_msg;
+	ctx->rsp = rsp_msg;
+
+	return 0;
+
+err_free_kernel_gem:
+	drm_gem_object_put(&kernel_gem->base);
+err_free_gem_objs:
+	kfree(ctx->gem_objs);
+	ctx->gem_objs = NULL;
+err_free_args:
+	kfree(args);
+
+	return err;
+}
+
 /*
  * INVOKE_DYNAMIC: the argument descriptors are supplied by user space, which
  * is also responsible for having imported every buffer to a GEM handle.
@@ -625,6 +862,12 @@ int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
 		ctx->pd = QDA_USER_PD;
 		err = qda_fastrpc_prepare_args_init_create(ctx, argp);
 		break;
+	case FASTRPC_RMID_INIT_MMAP:
+		err = qda_fastrpc_prepare_args_map(ctx, argp);
+		break;
+	case FASTRPC_RMID_INIT_MEM_MAP:
+		err = qda_fastrpc_prepare_args_mem_map_attr(ctx, argp);
+		break;
 	case FASTRPC_RMID_INVOKE_DYNAMIC:
 		err = qda_fastrpc_prepare_args_invoke(ctx, argp);
 		break;
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index 6beaa9538983..0c1264380085 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -250,8 +250,10 @@ struct qda_msg {
 
 /* Remote Method ID table - identifies initialization and control operations */
 #define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP process */
+#define FASTRPC_RMID_INIT_MMAP		4	/* Map memory region to DSP */
 #define FASTRPC_RMID_INIT_CREATE	6	/* Create DSP process */
 #define FASTRPC_RMID_INIT_CREATE_ATTR	7	/* Create DSP process with attributes */
+#define FASTRPC_RMID_INIT_MEM_MAP	10	/* Map DMA buffer with attributes to DSP */
 #define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFFU	/* Dynamic method invocation */
 
 /* Common handle for initialization operations */
@@ -266,6 +268,59 @@ struct qda_msg {
 /* Maximum initialization file size (4 MB) */
 #define FASTRPC_INIT_FILELEN_MAX	(4 * 1024 * 1024)
 
+/* Message structures for internal FastRPC calls */
+
+/**
+ * struct fastrpc_mem_map_req_msg - Memory map request message with attributes
+ *
+ * This message structure is sent to the DSP to request mapping
+ * of a DMA buffer with custom attributes (ATTR request).
+ */
+struct fastrpc_mem_map_req_msg {
+	/** @remote_session_id: Client identifier for the session */
+	s32 remote_session_id;
+	/** @handle: Handle of the buffer to map */
+	s32 handle;
+	/** @offset: Byte offset within the buffer */
+	s32 offset;
+	/** @flags: Mapping flags (cache attributes, permissions) */
+	u32 flags;
+	/** @vaddrin: Virtual address hint for the DSP mapping */
+	u64 vaddrin;
+	/** @num: Size of the physical page descriptor array in bytes */
+	s32 num;
+	/** @data_len: Length of additional inline data */
+	s32 data_len;
+};
+
+/**
+ * struct fastrpc_map_req_msg - Legacy memory map request message
+ *
+ * This message structure is sent to the DSP to request mapping
+ * of a DMA buffer into the DSP's virtual address space.
+ */
+struct fastrpc_map_req_msg {
+	/** @remote_session_id: Client identifier for the session */
+	s32 remote_session_id;
+	/** @flags: Mapping flags (cache attributes, permissions) */
+	u32 flags;
+	/** @vaddr: Virtual address hint for the DSP mapping */
+	u64 vaddr;
+	/** @num: Size of the physical page descriptor array in bytes */
+	s32 num;
+};
+
+/**
+ * struct fastrpc_map_rsp_msg - Memory map response message
+ *
+ * This message structure is returned by the DSP after successfully
+ * mapping a buffer, providing the virtual address for future access.
+ */
+struct fastrpc_map_rsp_msg {
+	/** @vaddrout: DSP virtual address assigned to the mapped buffer */
+	u64 vaddrout;
+};
+
 void qda_fastrpc_context_free(struct kref *ref);
 void qda_fastrpc_cleanup_handlelist(struct qda_fastrpc_invoke_ctx *ctx);
 void qda_fastrpc_flush_pending(struct qda_dev *qdev);
@@ -273,5 +328,6 @@ struct qda_fastrpc_invoke_ctx *qda_fastrpc_context_alloc(struct qda_dev *qdev);
 int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx, void *argp);
 size_t qda_fastrpc_get_header_size(struct qda_fastrpc_invoke_ctx *ctx);
 int qda_fastrpc_invoke_pack(struct qda_fastrpc_invoke_ctx *ctx, struct qda_msg *msg);
+void qda_fastrpc_return_result(struct qda_fastrpc_invoke_ctx *ctx, void *argp);
 
 #endif /* __QDA_FASTRPC_H__ */
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 34b71b82a020..3ff6b598ee78 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -177,6 +177,7 @@ static int qda_fastrpc_invoke(u32 type, struct drm_device *dev, void *data,
 	}
 
 	qda_fastrpc_cleanup_handlelist(ctx);
+	qda_fastrpc_return_result(ctx, data);
 
 	/*
 	 * The DSP has torn down the protection domain, so the initialisation
@@ -231,6 +232,28 @@ int qda_release_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv)
 	return qda_fastrpc_invoke(FASTRPC_RMID_INIT_RELEASE, &qdev->drm_dev, NULL, file_priv);
 }
 
+/**
+ * qda_ioctl_mmap() - Map memory to DSP address space
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_mem_map)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_mem_map *map_req = data;
+
+	switch (map_req->request) {
+	case QDA_REQUEST_MMAP:
+		return qda_fastrpc_invoke(FASTRPC_RMID_INIT_MMAP, dev, data, file_priv);
+	case QDA_REQUEST_MEM_MAP:
+		return qda_fastrpc_invoke(FASTRPC_RMID_INIT_MEM_MAP, dev, data, file_priv);
+	default:
+		return -EINVAL;
+	}
+}
+
 /**
  * qda_ioctl_invoke() - Perform a dynamic FastRPC method invocation
  * @dev: DRM device structure
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index 192565434363..457ceccede08 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -13,5 +13,6 @@ int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *f
 int qda_ioctl_gem_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
 
 #endif /* __QDA_IOCTL_H__ */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index d12b8dc44fdd..046a1ef1872d 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -21,8 +21,9 @@ extern "C" {
 #define DRM_QDA_QUERY		0x00
 #define DRM_QDA_GEM_CREATE		0x01
 #define DRM_QDA_GEM_MMAP_OFFSET	0x02
-/* Command number 0x03 reserved for INIT_ATTACH; 0x05-0x06 reserved for MAP, MUNMAP */
+/* Command number 0x03 reserved for INIT_ATTACH; 0x06 reserved for MUNMAP */
 #define DRM_QDA_REMOTE_SESSION_CREATE		0x04
+#define DRM_QDA_REMOTE_MAP			0x05
 #define DRM_QDA_REMOTE_INVOKE			0x07
 
 /*
@@ -41,9 +42,15 @@ extern "C" {
 #define DRM_IOCTL_QDA_REMOTE_SESSION_CREATE					\
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_SESSION_CREATE,		\
 		 struct drm_qda_init_create)
+#define DRM_IOCTL_QDA_REMOTE_MAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_MAP, \
+					  struct drm_qda_mem_map)
 #define DRM_IOCTL_QDA_REMOTE_INVOKE	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_INVOKE, \
 					  struct drm_qda_invoke_args)
 
+/* Request type definitions for qda_mem_map */
+#define QDA_REQUEST_MMAP	1  /* MMAP operation */
+#define QDA_REQUEST_MEM_MAP	2  /* Handle-based MEM_MAP operation with attributes */
+
 /* Query type definitions for drm_qda_query */
 #define QDA_QUERY_DSP_NAME	1
 
@@ -155,6 +162,42 @@ struct drm_qda_init_create {
 	__u64 file;
 };
 
+/**
+ * struct drm_qda_mem_map - Memory mapping request structure
+ * @request: Request type (QDA_REQUEST_MMAP or QDA_REQUEST_MEM_MAP)
+ * @flags: Mapping flags for DSP (cache attributes, permissions)
+ * @handle: GEM handle of the buffer to map (used for kernel buffer lookup)
+ * @attrs: Mapping attributes (used for ATTR request)
+ * @offset: Offset within buffer (used for ATTR request)
+ * @dsp_handle: Handle forwarded to DSP as the buffer identifier
+ * @vaddrin: Optional virtual address hint for mapping
+ * @size: Size of the memory region to map in bytes
+ * @vaddrout: Output DSP virtual address after successful mapping
+ *
+ * This structure is used to request mapping of a GEM buffer into the
+ * DSP's virtual address space. The DSP will map the buffer according
+ * to the specified flags and return the virtual address in vaddrout.
+ *
+ * For QDA_REQUEST_MMAP (value 1):
+ *   - Uses fields: handle, flags, vaddrin, size, vaddrout
+ *   - Legacy MMAP operation for backward compatibility
+ *
+ * For QDA_REQUEST_MEM_MAP (value 2):
+ *   - Uses all fields including attrs and offset
+ *   - Handle-based MEM_MAP operation with custom SMMU attributes
+ */
+struct drm_qda_mem_map {
+	__u32 request;
+	__u32 flags;
+	__u32 handle;
+	__u32 attrs;
+	__u32 offset;
+	__s32 dsp_handle;
+	__u64 vaddrin;
+	__u64 size;
+	__u64 vaddrout;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

