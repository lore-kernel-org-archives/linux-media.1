Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43E1385D7E
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786473020; cv=none; b=J52Y8lLqq3KxYAA28qdsxwYMLNFK5S5kkqCG+Tigu9k5eNbGikViXw1MLbKmFUTPp8ml9wFIbNq/QmP/3awVJP4DuG39n0sGoKBWHUbtm3jRu1d1g2pLdJx97wk4ubFzm2GjGr8Ie4BhdPGW/ATi0AAEvFt7WcPnD0L0pNqhQrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786473020; c=relaxed/simple;
	bh=pQeZtimMHqJPExLAmSEyBS1Afbv4KJbY1bYUloUTAkc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiJZNANDwXLt+btyru8lhq1czZDxkJKiueJV/KXCHSSbx6dQ2j+fyZIAVf2P5qmfp2d1sFvzEDQipGSfUtY/F4VHI3ZPl5TT1cUUPKBagztrlW81jyjSRrLyVECQhkzvuGcw5JC/Xk1/b9bKTiq+dpAseKYEWXTfxREeX33eDc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSTpCz1b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KFG0i/2m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSTpCz1b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KFG0i/2m"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BGQXoJ1174623
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuLRsnML95fTSfbhKUc8uKyLGWmwAzwh/IZnRiZkzLU=; b=YSTpCz1bnpW2a9Ak
	3spWtUsyklxncj2A8zdFhB7ok0ugZLElLtIZrGLTJtl66ZX64reCv3VAOXcRh3pJ
	+wt64hIyyqzuWWe9sQqvS/Pa/44aHgukiV42fO6//C7c9eC1RshgT+/1fnrDk8Mj
	yQysItNaS0r9gabz1HKrbEtvXQVaLu4hYbHYa4oF8vr2duWZGRI/z5GaixQYzkiX
	GTrb+N0F5haM/Cwe4lwEFutZgpnElhxYVjxkn/GDmmdk5MRnWTOYG6Nfp7ZsqM10
	+VMzS9lDTrHZaW3KGhcLfXyPEj1qGP/js0XUbOhTmBjvTwygLcZmAN+7KZg1FH1N
	YwP/cQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc22v2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf74ab63easo471635ad.2
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 11:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786473016; x=1787077816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yuLRsnML95fTSfbhKUc8uKyLGWmwAzwh/IZnRiZkzLU=;
        b=KFG0i/2mOB4HB9uLz4vNkSVRgLasakZZbNkQwbcXxXh5UP3VVToP1kOAoJntuO551J
         iqLS4kvRPbHb93zcHhLtYygrYsYLN0RO4QxCuj9XGVvuGkqah9Wn98wFNUbnUeBB7Qpe
         Nky9OHBxyo6H237jkT2bM5/sii8HElhlAvN3mtYk8Mz+vftzJNo7dQlkrzXjgqanmauG
         cQ0XG0FURMh/B+Edu0GfYOf+gaam0OEDaomFcPGrggeETBJyufFQKy2G5u/lJxK2Ow2S
         BwHU6vOSuwy+b8Wkxm9RHvybF2K4POfw1uKFHo5oV7nQXtJjEKg/UNVuJv9deKURDj62
         pW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786473016; x=1787077816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yuLRsnML95fTSfbhKUc8uKyLGWmwAzwh/IZnRiZkzLU=;
        b=pi8M+KynBBIHT7MQGwXV7lj7lLxA8IYygwNcdg+lpcFrFo0Wl3BWoLAbYsnHj/QYgd
         UGufXoLYn5NsZltuqifuTRSmn8MtA+ocIZu38mSLKnDXzqzixqr+wpYlTci2IX0vjebZ
         m7Tc3ctUnwJPO9SY61HttwMdixYU/76jPdv1XfNDIaQk8aKNxuKFrKHdGgJAvpG6gHzQ
         Cd+U4ez65lcwqcCRt6gFJFPRBalMKR8aOTyYut6TK8CCygY15BHwXi/wny1UxNljh6cX
         EAU7mmW9fKEvo1z3Tlfg/fp8F6CO4Do5hei3tL2Ds1j6uJxIzIrwwJiQrpR/3mXGGhp3
         Sj+g==
X-Gm-Message-State: AOJu0YzofVGCG5X0dyL2GEqhd/AQME7UANsGCY1tDTyOIvS3IKfIj8SX
	eaj+EribfQNDTLoFHqbaGygOuqNyhQW7m9ehXMzia4MYHytz9jiVvt7FjLh/OX7YAneXII1jPMj
	0pG/5TsPR2CJisJPCv127iyAYz2EmBkBloWcKKq3K+GyRtMWepUWkaD9C+ejpEyJCxQ==
X-Gm-Gg: AR+sD13ZWa/5LuqymycrsCUwP008ccoL/5n0sVHZlJYmUH0aLaRme7hJpGJKMHAxrme
	XDD2dUnOcs5yrvzb8nY7ymR+Jipw4sMYFzmbzpUXnDyTKHqHo17hd6opMrqPR3sXk3pa9EQmsMM
	yDJYhPpTgKJIbVlFV5D8dQVtE0v5Vzs+TFVRQnZZo3a/Cq3Tym/v/mq3ZxegIWckE4Aks4QEese
	xrF6yOa8XoV+cvQFPxvQOujAelbgEWgE2vaGDQvw3540r1I39N2DtwYqC8e/w0ThNuxcH8uI7qB
	aQ0bIKYsYOGsFDkQiw0B+GhoCPC88CQQ277osJhCeOS0Bg6f9o/xjnT2JRhSJFxw4hWnDzdQo11
	fPPvc3gSpvZBwDgp/+wf39VfY8s23Mzy7t9cPLLQDay3UI/xS62T8b9sqtfsI
X-Received: by 2002:a17:902:e80d:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d317ab0841mr47385585ad.4.1786473015560;
        Tue, 11 Aug 2026 11:30:15 -0700 (PDT)
X-Received: by 2002:a17:902:e80d:b0:2cf:9e90:8be with SMTP id d9443c01a7336-2d317ab0841mr47385205ad.4.1786473015091;
        Tue, 11 Aug 2026 11:30:15 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315d829c4sm11759955ad.0.2026.08.11.11.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:30:13 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 11:30:09 -0700
Subject: [PATCH v4 4/5] media: iris: Add HFI metadata buffer delivery
 support for Gen2 encoders
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-enc_roi_enable-v4-4-1c9ea2405bb8@oss.qualcomm.com>
References: <20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com>
In-Reply-To: <20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786473008; l=14338;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=pQeZtimMHqJPExLAmSEyBS1Afbv4KJbY1bYUloUTAkc=;
 b=tmRivfiFrWKf5QAR0EvhgSSyXvKihELkxBqJ5MrqRWf/0XRsn4Yahw32ry0ZN70p/+ySykaNU
 MT60fBRCqmWBe1HVIlOThFxdLHP88hU1d+GYaY7+ny/xKXv2R+1aoDk
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX5HsrgoG6ahsk
 v7TKk5vdYeCK1ZbuaVTViEsz3vSKL7hMt1C56xvSC3AJIOWmj7TzSnmSlJfFmvsi3LWIXPtA8l4
 6UZ39Q2JqrIDdK6QE38kgzClSLAQonY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX2WehD6rx18e+
 HXJCCkl6CRtgsbZHl9tyg67bF8NPGjiJ9KReiREz9UL5wKwxuBhzT6RJs3acqgYzdPDrkWivSNN
 Q60KLkBs+0hgP50gKkS+RnSTWSvCfxcwBpsTKyPAwmcqYZ2zaYrMq51hglM5f/8uNyMIUSSUtXr
 39eKR3aN4gDDKpDGZhZWGvbv0N29+sxtGllulBcuj/6NT8jseat9JulSA9HaCnPpat6L5N+7SL/
 Uq4PlO0oCGBU9nxl1xKCBs6LRZDR/t8PfupL8+pfyA74HTzk9EghjPtouvnqJA0pZR2fT7+f6aq
 PVcbIOJCaOoHV38jKPfIjtxk6iPvLs2zmSaePhVbJyaGzR0WF2lKDWNObldUSLe7m24TaPcGvtf
 9HfaabAbzTl0Dms/VfEba0HUH8ygNos47ep/jwWFajK3O/f9qjaqMVhptKibY6NzJGRMy9dhysV
 cj+eFWwDCMbCt+Ef0ww==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b6a38 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=HXZOsHZbktv8MLOhIAwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 9eQXVU4GVJaOXUs8rFIIRwcElGTC1sgz
X-Proofpoint-GUID: 9eQXVU4GVJaOXUs8rFIIRwcElGTC1sgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110155

Add the infrastructure to deliver metadata buffers to the HFI firmware
on HFI Gen2 based encoders, used to carry per-frame ROI delta QP data.

Metadata buffer structures (iris_buffer.h):
  - Add metabuf_header and metapayload_header structs describing the
    metadata buffer layout as expected by the firmware.
HFI defines (iris_hfi_gen2_defines.h):
  - Add HFI_CMD_DELIVERY_MODE (0x0100000A).
  - Add HFI_MODE_METADATA (0x00000004) to hfi_property_mode_type.
HFI command side (iris_hfi_gen2_command.c):
  - In iris_hfi_gen2_session_queue_buffer(), after queuing a RAW
    (input) buffer, check for an available BUF_ROIMB_DELTAQP metadata
    buffer and, if found, append a second HFI_CMD_BUFFER packet for
    the metadata buffer in the same command, tagged with the same
    buffer index.
  - Add iris_hfi_gen2_subscribe_metadata_delivery(): sends
    HFI_CMD_DELIVERY_MODE with HFI_MODE_METADATA and HFI_PROP_ROI_INFO
    to instruct the firmware to expect metadata on the input port.
HFI response side (iris_hfi_gen2_response.c):
  - Add iris_hfi_gen2_handle_output_metadata_buffer(): locate the
    metadata buffer by device address and transition it from
    QUEUED to DEQUEUED so it can be reused.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.h     | 18 ++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 16 +++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 42 +++++++++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |  6 ++--
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |  3 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    | 27 ++++++++++++++
 drivers/media/platform/qcom/iris/iris_venc.c       |  4 +++
 drivers/media/platform/qcom/iris/iris_venc.h       |  2 ++
 11 files changed, 118 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index ab8e5d953101a786ade20540ee3c3ed226160cbe..ee2d24bb69c57220b0a735d9b4aae4434a33daf6 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -107,6 +107,24 @@ struct iris_buffers {
 	u32			size;
 };
 
+/* Metadata buffer header */
+struct metabuf_header {
+	u32 count;
+	u32 size;
+	u32 version;
+	u32 reserved[5];
+};
+
+/* Metadata buffer payload header */
+struct metapayload_header {
+	u32 type;
+	u32 size;
+	u32 version;
+	u32 offset;
+	u32 flags;
+	u32 reserved[3];
+};
+
 int iris_get_buffer_size(struct iris_inst *inst, enum iris_buffer_type buffer_type);
 void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
 int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index de48b6e65d2ef6c7939455d28c08db88a8a0fda0..c450ea5068eb400f347336fe27992f7d2b9a44c6 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -1626,3 +1626,19 @@ int iris_set_roi_params(struct iris_inst *inst, u32 plane)
 
 	return 0;
 }
+
+int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane)
+{
+	const struct iris_hfi_session_ops *hfi_ops = inst->hfi_session_ops;
+	int ret = 0;
+
+	/*subscribe to metadata delivery only if ROI is enabled */
+	if (!inst->fw_caps[ROI_PARAMS].p_array)
+		return ret;
+
+	ret = hfi_ops->session_subscribe_metadata_delivery(inst, plane);
+	if (ret)
+		return ret;
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 4eb632c923e961de3679a8b049fa264d0ad88621..2f047553a75833d39e5d0b7c14afd4a3fce8a04e 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -51,5 +51,6 @@ int iris_set_req_sync_frame(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 int iris_set_time_delta_based_rc(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 int iris_set_roi_params(struct iris_inst *inst, u32 plane);
+int iris_set_metadata_delivery(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519962cb958b0e330a6d018310c3450..5692375cdd357f9b00760053ffff5af4bd9cce9c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -131,6 +131,7 @@ struct iris_hfi_session_ops {
 	int (*session_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_resume_drain)(struct iris_inst *inst, u32 plane);
 	int (*session_close)(struct iris_inst *inst);
+	int (*session_subscribe_metadata_delivery)(struct iris_inst *inst, u32 plane);
 };
 
 struct hfi_subscription_params {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 388a36ff2b07b7bcd8db21d4345bc900356b4ec3..c08926609a3b7f5bb63df369da519accdd490121 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -1307,10 +1307,29 @@ static void iris_hfi_gen2_get_buffer(u32 domain, struct iris_buffer *buffer,
 	buf->timestamp = buffer->timestamp;
 }
 
+static struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
+						       enum iris_buffer_type buffer_type, u32 index)
+{
+	struct iris_buffers *buffers = &inst->buffers[buffer_type];
+	struct iris_buffer *buffer = NULL;
+
+	if (list_empty(&buffers->list))
+		return NULL;
+
+	buffer = list_first_entry(&buffers->list, typeof(*buffer), list);
+	if ((buffer->attr & BUF_ATTR_QUEUED) || (buffer->attr & BUF_ATTR_DEQUEUED))
+		return NULL;
+
+	buffer->index = index;
+
+	return buffer;
+}
+
 static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iris_buffer *buffer)
 {
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
 	struct iris_hfi_buffer hfi_buffer;
+	struct iris_hfi_buffer hfi_meta_buffer;
 	u32 port;
 	int ret;
 
@@ -1330,7 +1349,7 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 					     HFI_PAYLOAD_STRUCTURE,
 					     &hfi_buffer,
 					     sizeof(hfi_buffer));
-
+	}
 	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
 					inst_hfi_gen2->packet->size);
 }
@@ -1359,6 +1378,26 @@ static int iris_hfi_gen2_session_release_buffer(struct iris_inst *inst, struct i
 					inst_hfi_gen2->packet->size);
 }
 
+static int iris_hfi_gen2_subscribe_metadata_delivery(struct iris_inst *inst, u32 plane)
+{
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	u32 payload[2] = {HFI_MODE_METADATA, HFI_PROP_ROI_INFO};
+
+	iris_hfi_gen2_packet_session_command(inst,
+					     HFI_CMD_DELIVERY_MODE,
+					     (HFI_HOST_FLAGS_RESPONSE_REQUIRED |
+					      HFI_HOST_FLAGS_INTR_REQUIRED),
+					     port,
+					     inst->session_id,
+					     HFI_PAYLOAD_U32_ARRAY,
+					     &payload,
+					     sizeof(u32) * 2);
+
+	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
+					inst_hfi_gen2->packet->size);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_open = iris_hfi_gen2_session_open,
 	.session_set_config_params = iris_hfi_gen2_session_set_config_params,
@@ -1372,6 +1411,7 @@ static const struct iris_hfi_session_ops iris_hfi_gen2_session_ops = {
 	.session_drain = iris_hfi_gen2_session_drain,
 	.session_resume_drain = iris_hfi_gen2_session_resume_drain,
 	.session_close = iris_hfi_gen2_session_close,
+	.session_subscribe_metadata_delivery = iris_hfi_gen2_subscribe_metadata_delivery,
 };
 
 static struct iris_inst *iris_hfi_gen2_get_instance(void)
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 08fc1036013de29e51747a6425ae7bb805ca3e0f..d0661f5fe6a6f39295dad8950edb2f1a85893216 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -20,6 +20,7 @@
 #define HFI_CMD_DRAIN				0x01000007
 #define HFI_CMD_RESUME				0x01000008
 #define HFI_CMD_BUFFER				0x01000009
+#define HFI_CMD_DELIVERY_MODE		        0x0100000A
 #define HFI_CMD_SUBSCRIBE_MODE			0x0100000B
 #define HFI_CMD_SETTINGS_CHANGE			0x0100000C
 #define HFI_CMD_PAUSE				0x01000011
@@ -175,6 +176,7 @@ enum hfi_flip {
 enum hfi_property_mode_type {
 	HFI_MODE_PORT_SETTINGS_CHANGE		= 0x00000001,
 	HFI_MODE_PROPERTY			= 0x00000002,
+	HFI_MODE_METADATA			= 0x00000004,
 };
 
 enum hfi_color_format {
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index 0d05dd2afc07d830cc8502ab5f28001312991ba8..aeb0426a05694f219f82145cd84a28287ed3075e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -100,9 +100,9 @@ static void iris_hfi_gen2_create_header(struct iris_hfi_header *hdr,
 	hdr->num_packets = 0;
 }
 
-static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
-					u32 pkt_flags, u32 payload_type, u32 port,
-					u32 packet_id, void *payload, u32 payload_size)
+void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
+				 u32 pkt_flags, u32 payload_type, u32 port,
+				 u32 packet_id, void *payload, u32 payload_size)
 {
 	struct iris_hfi_packet *pkt = (struct iris_hfi_packet *)((u8 *)hdr + hdr->size);
 	u32 pkt_size = sizeof(*pkt) + payload_size;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
index 25b9582349ca1a0ce6efc0b146a3abb798485c45..613eb500609f745daebdcbdf9a25b85cb9465a79 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.h
@@ -121,5 +121,8 @@ void iris_hfi_gen2_packet_session_property(struct iris_inst *inst,
 void iris_hfi_gen2_packet_sys_interframe_powercollapse(struct iris_core *core,
 						       struct iris_hfi_header *hdr);
 void iris_hfi_gen2_packet_sys_pc_prep(struct iris_core *core, struct iris_hfi_header *hdr);
+void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_type,
+				 u32 pkt_flags, u32 payload_type, u32 port,
+				 u32 packet_id, void *payload, u32 payload_size);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 8c2644c7f6e85983d7ad7584fc0cb570e4813ae4..84b629b957442c024dccc18b354ac9a7e541abaa 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -77,6 +77,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
 	case HFI_BUFFER_PERSIST:
 	case HFI_BUFFER_VPSS:
 	case HFI_BUFFER_PARTIAL_DATA:
+	case HFI_BUFFER_METADATA:
 		return true;
 	default:
 		return false;
@@ -452,6 +453,30 @@ static int iris_hfi_gen2_handle_release_internal_buffer(struct iris_inst *inst,
 	return 0;
 }
 
+static int iris_hfi_gen2_handle_output_metadata_buffer(struct iris_inst *inst,
+						       struct iris_hfi_buffer *buffer)
+{
+	u32 buf_type = iris_hfi_gen2_buf_type_to_driver(inst, HFI_BUFFER_METADATA);
+	struct iris_buffers *buffers = &inst->buffers[buf_type];
+	struct iris_buffer *buf, *iter;
+	bool found = false;
+
+	list_for_each_entry(iter, &buffers->list, list) {
+		if (iter->device_addr == buffer->base_address) {
+			found = true;
+			buf = iter;
+			break;
+		}
+	}
+	if (!found)
+		return -EINVAL;
+
+	buf->attr &= ~BUF_ATTR_QUEUED;
+	buf->attr |= BUF_ATTR_DEQUEUED;
+
+	return 0;
+}
+
 static int iris_hfi_gen2_handle_session_stop(struct iris_inst *inst,
 					     struct iris_hfi_packet *pkt)
 {
@@ -499,6 +524,8 @@ static int iris_hfi_gen2_handle_session_buffer(struct iris_inst *inst,
 			return iris_hfi_gen2_handle_input_buffer(inst, buffer);
 		else if (buffer->type == HFI_BUFFER_BITSTREAM)
 			return iris_hfi_gen2_handle_output_buffer(inst, buffer);
+		else if (buffer->type == HFI_BUFFER_METADATA)
+			return iris_hfi_gen2_handle_output_metadata_buffer(inst, buffer);
 		else
 			return iris_hfi_gen2_handle_release_internal_buffer(inst, buffer);
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa8a0c40b8d6bc473d0bc90270e6cd..21ba9639d17b2c64e8fa33b4aacbd1946fc4dae2 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -498,6 +498,10 @@ int iris_venc_streamon_output(struct iris_inst *inst)
 	if (ret)
 		goto error;
 
+	ret = iris_set_metadata_delivery(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	if (ret)
+		goto error;
+
 	ret = iris_alloc_and_queue_persist_bufs(inst, BUF_ARP);
 	if (ret)
 		return ret;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.h b/drivers/media/platform/qcom/iris/iris_venc.h
index 00c1716b2747c7e840c2a3317800d83663744bf0..df97011636740be6cdfe5867f273c5f93408f570 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.h
+++ b/drivers/media/platform/qcom/iris/iris_venc.h
@@ -22,5 +22,7 @@ int iris_venc_streamon_output(struct iris_inst *inst);
 int iris_venc_qbuf(struct iris_inst *inst, struct vb2_v4l2_buffer *vbuf);
 int iris_venc_start_cmd(struct iris_inst *inst);
 int iris_venc_stop_cmd(struct iris_inst *inst);
+struct iris_buffer *iris_queue_metadata_buffers(struct iris_inst *inst,
+						enum iris_buffer_type buffer_type, u32 index);
 
 #endif

-- 
2.34.1

