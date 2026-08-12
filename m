Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703ED322B6D
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564907; cv=none; b=OdhI5GhgdXWRyMeQ9DHmWMdbDIqw/2VFLqex+iuOne98e6QKTfXYSpnyN56+IwOTJWuxJq0azu3JlSB4iBE1aYks2KWEZJL1w2/rv1SioxQ+NQ2q95Xb1j1/YVkTTvANhQyJxqV5sPZVNs5Vdl08uPGnySYYSCFkYyWWHK+AVkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564907; c=relaxed/simple;
	bh=5TydX6YikVp1Sc2sSWcsXlwWC7g4cca4nfCeQ4bD1Rc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MUx+/O5MC2HovGTJoseiJd52X4IB3PXce+lwAkcKAg2cgQfbhbXDFH89dUz+Ute+H9Wrnf1htdcD8fd6vjyQvoSIyeOxWfBxF3sDiFU9+c6nfk9GhifKNXxuq2UEZOdnAwacRERurb86tla++RFx1ueNeghmXmQfKR4codTDsO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ejK8hlVI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9nwhkE5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ejK8hlVI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9nwhkE5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI9DEE057113
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NAAK+dVxkbm/up/widEbGwaEg5Z5O0NAGPsT/Irywtw=; b=ejK8hlVInCwO3kMX
	OwlsGhri9rkwqmiHE+Vkh25HTmyAX/jHtzDq5wEzg8Dds/MIjKq/2s744Iqcvcq5
	d3IG4uWtAVIq8d/iBIWTaNqZZHtFWVPcU3HfuODwE/TNz0bvmXmdFGXsqVFWcIF3
	vVLHZS9cL8YBCmP30pBtzEypC1MNmEUQYnx9gnMsRkg86YAJLrmVdO153/oXLHSd
	a/T41alC/t1tlkXVZlfKc+/fDsARzmRRQHAl8kRI+KwUrexK5nUZdMQfNTrM0v13
	y5j0aOLMeJD4YWj7opoGw58ZlEkcihxo/jhUznK6HZD+7L0Y3o1DWYz78iW1kqYq
	3mopFg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmytnar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 20:01:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c21c01cf3so23444801cf.2
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 13:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786564904; x=1787169704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NAAK+dVxkbm/up/widEbGwaEg5Z5O0NAGPsT/Irywtw=;
        b=j9nwhkE5fgPyPYGDwhm89RBZ2et5zg+O8UQcE+zkV9rn9LlGoKW+pofsnTwBfljaXN
         NaC55YiOrM9zvTnKDuGhosfD92V4UVDzdJ9g+/CiB71VrNp/rwTTIMDKS1w7Ha10f+YT
         nSs5OmEr3G7PxLglDZLzJNfHSJvqb7L0WwSoJI/eQ8tl88xVs9KV+oD81C7zfHBuBa1O
         GWiIdJqk1TMXlI8xxYaSpq2QRgRDuxaLN/jwWV6I2wRb90RIhpX8POIcaXZL34yIemBd
         cG8ZC84l+07KX2YO9u1ppWzRDuxuxb2iAgei4EqJHzvaGF17h+VE2ufHXWHzKWrb6Z6k
         6zUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786564904; x=1787169704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NAAK+dVxkbm/up/widEbGwaEg5Z5O0NAGPsT/Irywtw=;
        b=afqC6hFsHK4ttVZCfqusFm1VTsGQtib9paYEIpgsmMI98rkscIA1y5PNAWjVYFpFJq
         heKhW/BWd2rQTCDo6wLws4zHaTr2stH+MOaHZW5l8V5GVLZcmi8X3JhZcKUEQa5nYV1S
         iJzWYl5yKyFBktUlTtLsGSEPet4ZZI11xCvh3c+y8fTIXs35L6VXnqfW/LHrRsT/5wGX
         fHd/vHvt1DSIafYvcmuG5MJqeZ884Xz2ssQpet3F9D2CygGBL8mDC7Wf12fUtAKAq8LD
         VhZuqAtOaY1JLRLVKs8eTTbWGIORpXyfGnJa+MosCcGilj3tGvSWWcjVULlckOugPC1Z
         LzHw==
X-Gm-Message-State: AOJu0Yzte8GxHeka4763dNNs9dXtuBVgcET0+voh8RXsAySR3/ydeer/
	+dphRNauFJgfdw8imu9/J5F2IfoSD5mQmYB71eNl29Jb5+dIc1XxZLTdA7323NXFJOij7sUyYhu
	0csw4qCjWp2P3V1c4XWyoYCBTISvOCDTLhcF4UJovhxJjeLTXi2cbDvELx3iQB/SajCvtbRXpqw
	==
X-Gm-Gg: AR+sD12Nrj9rhpAptz6he5CL74+RxaNh7ardadhSpLmQhHGVl7CdhXQ75ZNRKDv7qMH
	eN5wYCCowy4tS4WLI48M+DXgBZ3RhRzrqYTcMQ53GyMHvRYigIAaKdsRvnRlLLx1tiNRAUWyUGI
	ldoeZYE0Pknu4lVpb8KZl/a0fNoJCNJVAwuCNPjyXb3IzOJqzft00ZFioC4lwq8m7iQ163/du/L
	W76UiwA0fZKfpRRBldARGCN55m64MzNaA87PIqiiLn4f6BoUlsV2N1TbJ0b+LghHMwP2r+LDgbS
	wp9EnLzZ7gfWDjs4IuJW7V2qh6de26hvLCQ9eU5KmMjVmYZn0EqgZx3nRGXU2qxTVLJmAFB1AYm
	QmkPIoREsbp+GWx3vKo2NJfgv+dQEl2HelqXvNoQelUWX/bmV1jjbQlrJ/AIPTWNuaV2sUVnt+p
	kIurW4kRrUE1yr
X-Received: by 2002:ac8:5dc9:0:b0:527:7842:72cc with SMTP id d75a77b69052e-52d73dee51cmr5592371cf.39.1786564902442;
        Wed, 12 Aug 2026 13:01:42 -0700 (PDT)
X-Received: by 2002:ac8:5dc9:0:b0:527:7842:72cc with SMTP id d75a77b69052e-52d73dee51cmr5589561cf.39.1786564900440;
        Wed, 12 Aug 2026 13:01:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a11b2acb0fsm354561fa.12.2026.08.12.13.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:01:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 23:01:25 +0300
Subject: [PATCH 3/3] media: venus: report the frame size of the codec being
 enumerated
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-venus-8996-v1-3-6615f82a63b8@oss.qualcomm.com>
References: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
In-Reply-To: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8427;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5TydX6YikVp1Sc2sSWcsXlwWC7g4cca4nfCeQ4bD1Rc=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGp80RbIJFmZPxfq+64dIRgRSIMojefUFZVzmLmlOa3N7HE4v
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqfNEWAAoJEIs8ij4CKSjVjEsH/R1X
 6wClTtjkrFSys/pP4seh5XFIWo4p8E2MA70s8hV0PkDjMdln7WZkKb/l1CWkBEuw/GghEAAkQ3x
 ml+pr1VmRipzqTmYyDBhFQ6NP5+yDzgQTxX0iSg3DxLMDfPXSPqrLgzZTsjEcq8XGpk7JGVok+R
 D4kiJLhXo90DATMi6PfCFTsmXqED8Ufka0nEduSV3XgglDWiRYTLoTREoyP9v5vZExak2D0XQHi
 tS3956SPQ83xGM3e67xvLbfXijzw5Z6KYWzGz+U1xZ3OXVXoSVsGtsZ3XfQp51xeH366d725i/i
 RaBisAx263SE1yfRkWn+mfjzRftxX1XUIOUUvJ8=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfX98S2OURzsIJ2
 04XW2XbopDSx3KstAWKR587NI3wG8ACfSMoXv1MQ0137bS/7IYvsSj8z9N/b5LdUskkgMlBd8pX
 nbgIdRUmQ4YscmpuiczOK/amMSDo2vY=
X-Proofpoint-ORIG-GUID: AmzNENDuM70A83s_ilw7GCYHcApQelsW
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7cd129 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=BhK9gz1YmpFySvrNxgUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: AmzNENDuM70A83s_ilw7GCYHcApQelsW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfX3sMSyWpUA7nN
 cIvsFSeUDaaScer93mptH1JR+MMVHYtHT3qIq8ZM7tsrmxC5AhJsNp/tyGDtL6eE/d1CMyei9h4
 OTK1nZx/PBtf9tIoFG/elTaoUCN9RGPIevIMkfDa3T9PgkOVstgrcVuH4QCdsVnEFHj0b4sPi96
 9jXAsTA4yVA3RZex2IpsyqchNQPQIuZ+2NujfYPEoxyzS9X7Z1rK+eVlfZMZsVye4DTI4Hcdb0b
 HSDJs0TnM7ee5ywLtaV+F4rU6vKkjnR7OxEWXeDL63wms/XJOLWYHW1LjO1Z1sluW6C8h0p4Rm+
 sfHXZuHLMiHeeOjhN7prynv3csII7ItI4xubQ0yyLZNsxpWU+Be3G6DBBZjK+GmBXVjqS9upGNY
 T3iopNJVL7Le+UAjDNbjyXtnE28NONykx4RkZlzkonV6oGSpKY5f5a6MqRWhWjdPOc7I+GzO444
 /Wt4up6FZRz3bBukxwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120160

VIDIOC_ENUM_FRAMESIZES takes the pixel format to describe from
userspace, but both vdec and venc answer it out of frame_width_min() and
friends, which resolve the capabilities through inst->hfi_codec, the
codec the instance is currently set to.  Enumerating any format other
than that one therefore returns the limits of an unrelated codec: on a
freshly opened decoder, which starts out as H.264, asking about MPEG-2
on MSM8996 reports the H.264 limits where the firmware describes MPEG-2
as 16x16 to 1920x1920.

Resolve the capabilities through the format being enumerated instead,
falling back to the codec in use for the raw formats, which have no
codec of their own.  Both drivers now share one helper, alongside the
pixel format to codec mapping that venus_helper_check_codec() already
carried.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/helpers.c    | 75 +++++++++++++++++---------
 drivers/media/platform/qcom/venus/helpers.h    |  2 +
 drivers/media/platform/qcom/venus/hfi_parser.h | 12 +++--
 drivers/media/platform/qcom/venus/vdec.c       |  7 +--
 drivers/media/platform/qcom/venus/venc.c       |  7 +--
 5 files changed, 62 insertions(+), 41 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 59eee3dd9e06..17415d0cdf8e 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -38,47 +38,43 @@ struct intbuf {
 	u32 dpb_out_tag;
 };
 
-bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
+static u32 venus_pixfmt_to_hfi_codec(u32 v4l2_pixfmt)
 {
-	struct venus_core *core = inst->core;
-	u32 session_type = inst->session_type;
-	u32 codec;
-
 	switch (v4l2_pixfmt) {
 	case V4L2_PIX_FMT_H264:
-		codec = HFI_VIDEO_CODEC_H264;
-		break;
+		return HFI_VIDEO_CODEC_H264;
 	case V4L2_PIX_FMT_H263:
-		codec = HFI_VIDEO_CODEC_H263;
-		break;
+		return HFI_VIDEO_CODEC_H263;
 	case V4L2_PIX_FMT_MPEG1:
-		codec = HFI_VIDEO_CODEC_MPEG1;
-		break;
+		return HFI_VIDEO_CODEC_MPEG1;
 	case V4L2_PIX_FMT_MPEG2:
-		codec = HFI_VIDEO_CODEC_MPEG2;
-		break;
+		return HFI_VIDEO_CODEC_MPEG2;
 	case V4L2_PIX_FMT_MPEG4:
-		codec = HFI_VIDEO_CODEC_MPEG4;
-		break;
+		return HFI_VIDEO_CODEC_MPEG4;
 	case V4L2_PIX_FMT_VC1_ANNEX_G:
 	case V4L2_PIX_FMT_VC1_ANNEX_L:
-		codec = HFI_VIDEO_CODEC_VC1;
-		break;
+		return HFI_VIDEO_CODEC_VC1;
 	case V4L2_PIX_FMT_VP8:
-		codec = HFI_VIDEO_CODEC_VP8;
-		break;
+		return HFI_VIDEO_CODEC_VP8;
 	case V4L2_PIX_FMT_VP9:
-		codec = HFI_VIDEO_CODEC_VP9;
-		break;
+		return HFI_VIDEO_CODEC_VP9;
 	case V4L2_PIX_FMT_XVID:
-		codec = HFI_VIDEO_CODEC_DIVX;
-		break;
+		return HFI_VIDEO_CODEC_DIVX;
 	case V4L2_PIX_FMT_HEVC:
-		codec = HFI_VIDEO_CODEC_HEVC;
-		break;
+		return HFI_VIDEO_CODEC_HEVC;
 	default:
-		return false;
+		return 0;
 	}
+}
+
+bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
+{
+	struct venus_core *core = inst->core;
+	u32 session_type = inst->session_type;
+	u32 codec = venus_pixfmt_to_hfi_codec(v4l2_pixfmt);
+
+	if (!codec)
+		return false;
 
 	if (session_type == VIDC_SESSION_TYPE_ENC && core->enc_codecs & codec)
 		return true;
@@ -90,6 +86,33 @@ bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt)
 }
 EXPORT_SYMBOL_GPL(venus_helper_check_codec);
 
+/*
+ * Report the frame size of the codec being enumerated, which is not
+ * necessarily the one the instance is currently set to.  A raw format maps to
+ * no codec of its own and is described by the coded format in use.
+ */
+void venus_helper_get_frame_sizes(struct venus_inst *inst, u32 v4l2_pixfmt,
+				  struct v4l2_frmsize_stepwise *fsize)
+{
+	struct venus_core *core = inst->core;
+	u32 dom = inst->session_type;
+	u32 codec = venus_pixfmt_to_hfi_codec(v4l2_pixfmt) ?: inst->hfi_codec;
+
+	fsize->min_width = get_codec_cap(core, codec, dom,
+					 HFI_CAPABILITY_FRAME_WIDTH, WHICH_CAP_MIN);
+	fsize->max_width = get_codec_cap(core, codec, dom,
+					 HFI_CAPABILITY_FRAME_WIDTH, WHICH_CAP_MAX);
+	fsize->step_width = get_codec_cap(core, codec, dom,
+					  HFI_CAPABILITY_FRAME_WIDTH, WHICH_CAP_STEP);
+	fsize->min_height = get_codec_cap(core, codec, dom,
+					  HFI_CAPABILITY_FRAME_HEIGHT, WHICH_CAP_MIN);
+	fsize->max_height = get_codec_cap(core, codec, dom,
+					  HFI_CAPABILITY_FRAME_HEIGHT, WHICH_CAP_MAX);
+	fsize->step_height = get_codec_cap(core, codec, dom,
+					   HFI_CAPABILITY_FRAME_HEIGHT, WHICH_CAP_STEP);
+}
+EXPORT_SYMBOL_GPL(venus_helper_get_frame_sizes);
+
 static void free_dpb_buf(struct venus_inst *inst, struct intbuf *buf)
 {
 	ida_free(&inst->dpb_ids, buf->dpb_out_tag);
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 358e4f39c9c0..80d623db106c 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -12,6 +12,8 @@ struct venus_inst;
 struct venus_core;
 
 bool venus_helper_check_codec(struct venus_inst *inst, u32 v4l2_pixfmt);
+void venus_helper_get_frame_sizes(struct venus_inst *inst, u32 v4l2_pixfmt,
+				  struct v4l2_frmsize_stepwise *fsize);
 struct vb2_v4l2_buffer *venus_helper_find_buf(struct venus_inst *inst,
 					      unsigned int type, u32 idx);
 void venus_helper_change_dpb_owner(struct venus_inst *inst,
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.h b/drivers/media/platform/qcom/venus/hfi_parser.h
index 5751d0140700..bcd11e7a9c1c 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.h
+++ b/drivers/media/platform/qcom/venus/hfi_parser.h
@@ -12,14 +12,14 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst,
 #define WHICH_CAP_MAX	1
 #define WHICH_CAP_STEP	2
 
-static inline u32 get_cap(struct venus_inst *inst, u32 type, u32 which)
+static inline u32 get_codec_cap(struct venus_core *core, u32 codec, u32 domain,
+				u32 type, u32 which)
 {
-	struct venus_core *core = inst->core;
 	struct hfi_capability *cap = NULL;
 	struct hfi_plat_caps *caps;
 	unsigned int i;
 
-	caps = venus_caps_by_codec(core, inst->hfi_codec, inst->session_type);
+	caps = venus_caps_by_codec(core, codec, domain);
 	if (!caps)
 		return 0;
 
@@ -47,6 +47,12 @@ static inline u32 get_cap(struct venus_inst *inst, u32 type, u32 which)
 	return 0;
 }
 
+static inline u32 get_cap(struct venus_inst *inst, u32 type, u32 which)
+{
+	return get_codec_cap(inst->core, inst->hfi_codec, inst->session_type,
+			     type, which);
+}
+
 static inline u32 cap_min(struct venus_inst *inst, u32 type)
 {
 	return get_cap(inst, type, WHICH_CAP_MIN);
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 6a43ea191da1..0f62931eea4c 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -512,12 +512,7 @@ static int vdec_enum_framesizes(struct file *file, void *fh,
 
 	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
 
-	fsize->stepwise.min_width = frame_width_min(inst);
-	fsize->stepwise.max_width = frame_width_max(inst);
-	fsize->stepwise.step_width = frame_width_step(inst);
-	fsize->stepwise.min_height = frame_height_min(inst);
-	fsize->stepwise.max_height = frame_height_max(inst);
-	fsize->stepwise.step_height = frame_height_step(inst);
+	venus_helper_get_frame_sizes(inst, fsize->pixel_format, &fsize->stepwise);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 79acf7c1ec9a..e0f7b9817ccf 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -456,12 +456,7 @@ static int venc_enum_framesizes(struct file *file, void *fh,
 	if (fsize->index)
 		return -EINVAL;
 
-	fsize->stepwise.min_width = frame_width_min(inst);
-	fsize->stepwise.max_width = frame_width_max(inst);
-	fsize->stepwise.step_width = frame_width_step(inst);
-	fsize->stepwise.min_height = frame_height_min(inst);
-	fsize->stepwise.max_height = frame_height_max(inst);
-	fsize->stepwise.step_height = frame_height_step(inst);
+	venus_helper_get_frame_sizes(inst, fsize->pixel_format, &fsize->stepwise);
 
 	return 0;
 }

-- 
2.47.3

