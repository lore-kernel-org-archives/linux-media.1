Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593624;
	b=R8dstMPBzpb7BhPz0M/6lju/qUdEavsiDs9laYuHSLtfe+LMWx72scg5YeYhgkxIKXoL
	 YEVGFwY3KVdu7aYqspkaz7Zh9q1MqlvLEV2jhLoYqcxGatq3ZSaHCA0ge8y1wp9bMFa8d
	 n0/iN47dJT4H0YU3GNiGP2PBxvpwfGB8x7MlTPQcDXHuXugO4tnQaV4N0/3EC/Qn9lzXW
	 malY2BOMmA8bc7pcz0uRmhPK8/xoDcs5cjspw8Iy4XRw89ISqaO7VwOKeh5p5W0UncBjh
	 Mabf6wV5+tkDNT1v4PlwkD1yKRulEgXuOMhJbbdfplbcHTD7rUlqfUy/2Jz6UUsNzLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6Az0ZEisfGMhLBU+LYkmiUzB/VTC2+4g27sIUuCvPg4=;
	b=lCqkv5nHg03K0JvxsL0PGlIwTnersz9jap9gk1+E8JQZuoaSS8mLM7UPur3OpoAQ+dWO
	 41NMLUM4gBvSoEav7EBtx7xX56XsfNFZqqVSr5qaO/pnpTpM1N7/Ut10rqmChybViKiO7
	 cSOuCbmOkZCW87XMLWdupA/gWMwaaPxinpCisgrkdKq88OGku30pLMRQse9tI1Jl3iIfW
	 raang9gw8GfJ64YpAbq+dV0HVtntfRJft7Bt+QwNiNYcbrKQc+lFY2CVmbS+8YMqtmnL+
	 nvQ4tae+d+kEIusOiv0QfZ5/aS2SpmKHWYGDPa1C+tH4/Ts5mta4u/M0jG+DtkqROdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PfaQvwGo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA652606A329
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA652606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PfaQvwGo
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP7v4w23382488
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6Az0ZEisfGM
	hLBU+LYkmiUzB/VTC2+4g27sIUuCvPg4=; b=PfaQvwGo9BPO+PnDAq2q50QaiSx
	2/qvqsNCB74JPmabwSMpUeXyjHAbUOddzXjUBKs3ySe2+N0TD6H1tQwBw/axeZ58
	grVQxntJya38yF1aMrbhgVdBmPlc+Oxq2OXw2gSgu1vYNRlDZPgA725+6OH3YK5V
	m0hQgB0vDwm4lKj4BQ2DgeicE3lO3KybvsZ4eNMKvywQBeNedPJ3jDkim3bkLVQF
	pi7CPQWCh5wjAVx7wnI3PbqlYMPlC1wrRbYW13fy3+n4wkSdwU6BpaW6rCcINJP5
	3QYi2B4B3l3mDpzgM5USI+HBznYqoKy5t64TcO5DlFcRsTt7pT/09IILhpw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc29m0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:00:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94967c6d4f4so594894885a.2
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593622; x=1796198422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Az0ZEisfGMhLBU+LYkmiUzB/VTC2+4g27sIUuCvPg4=;
        b=b05OzqmqLX8TpchjTSaQf43vQKBMVDF6WnAINJk2rGnn7JH9Y4B2leezpuZHJRNa2Y
         z+a4gF6fzUzZ+KD+3BQj2eVaeZWrPiPZBxZKEfFJAoYQvkhbIKZ+4v6sxbUy1B4A4qqu
         LGvQCZoi/PeYESqMbDUmqQdf06wwGlRML49U2lvBqkM6K4fe3hOzNRuaaIdmeLz8ROGg
         T+iVKjo6PhyDGoDDRP75Oh4PLU3mwyxlDYOdDRZXd3fp4nrKTsFDxJASAKRhaxrBgSKu
         +iOrJUPWBSI8RYeGzAppgOSFX/DxG1kYuU8/ngDBGugKLYSgc+bi6PWe69tl5FjmNC3X
         7kIA==
X-Forwarded-Encrypted: i=1; AL+hErGFoXVijHdUU5h117UmoPDXL3zJcAUkSVRkdQbkPBMO/Owb4ReU6LRpMufJXQbEiYOLAe/zSCFTmYa5QA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+LMi6s8Qf+qaxU1Sr7Z1SzlmVyxtMhG6tWfN75/YUCzwCvHibr
	kK79+radHVMR/lcX9le5b+Z5GQqRjdiBwco9HWbO5npbGiZQ8pHdQP8zwDesD1fpt/W03TZeVbE
	4RK72OMM5JXOkWGqboF9TQsMJwqRKXy7CctTZL/8oSd0YueZGlvDfzP37NHBIAc45fA==
X-Gm-Gg: AZFdTZfBR9lDVy+hLXr45Dr51ZI/9YbKFcfAzSvAQnONLLIRW+3bLzbsCQIW3mGQMtf
	XaViSqCUWmxKK+3LYrPR1lEyKIBlQ4U7Dq19qbF8iLa1pllD+AZrrc0zXSxDLHFjMo8a2Ep6F3P
	qy/6tyc5L4Yt+V6gQZ5NLh0pwLSVgBDtJ3Sz8r3rcDeV2poaPQYBVMZJQ1vINFUGubTwXnJM/Ud
	Gd1tXvJnOfvw8F1nce1d9c/P6qhlqy7Y0h3Uzyqnvc8k1b6JNTYfSxaJBlqwyoaoIatPgwetdFa
	XASaQca3Vjmjx7KGk7jbBbpESWOy4WaFzEKl/oZpiBa2pKha0I/GNzt+yQPTaoOCu6vgIDmji5s
	Hkp/fPHkbq67MDM4OxKbuHhteBuDdAre2
X-Received: by 2002:a05:620a:538c:20b0:949:c271:8a93 with SMTP id af79cd13be357-949c2718c9bmr2149679485a.27.1795593621548;
        Wed, 25 Nov 2026 00:00:21 -0800 (PST)
X-Received: by 2002:a05:620a:538c:20b0:949:c271:8a93 with SMTP id af79cd13be357-949c2718c9bmr2149669085a.27.1795593620488;
        Wed, 25 Nov 2026 00:00:20 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:19 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 08/12] media: qcom: camss: Add streams API support for VFE
Date: Wed, 25 Nov 2026 09:59:57 +0200
Message-Id: <20261125080001.2540101-9-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b069596 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=ZovgdgjKAAAA:8
 a=438iDOIm_x07lpJRoXgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-GUID: FiC_p4N4h3kqVTLthDFlNDdZxQ-opZU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfXwHSzYQFjrtQR
 x5oZk1R6SHWjz+jLp4+6LrOAAV6+SGsh6kBLD4gjVuLPo2bV18r43Dio21s/bxSdLbt0f4S4W0c
 bE5ZWNIR5ai6ZaCDn6RGQHLvbR/lf9cTMZZrn4yMSWTIR5ZcjuBd2lCLKVol0b3IVAV5IGgV91l
 fMhiUvISQKs7zqQgG6hakaUNZCNGhu+dwHVSRKasNpkCDz639AvfyBiEHj+Sj7Xswa/WoBzT3iq
 XBPe//FC+Lf/RlWhp3zQtwslujg+foaIBl+o/HEX9SYaKKBaD2HW9GrMNqsjBGLzxat1rV06ptM
 0aWG0xRsn2u6DqMCsO2e8MugCX7WhhqnbFlFiVCHL8bKrHdLYMpaCtk6xNpgZgQrCvFOX40UaYv
 zRVy1+GwWXSWh7dLOV9ZSsFGM+vmXN3CfweD90ugRkt6OdMDRFxLtkxDtMIbD6llNCDl4GoGgwr
 1gBaU4pi/AODHSUE5CA==
X-Proofpoint-ORIG-GUID: FiC_p4N4h3kqVTLthDFlNDdZxQ-opZU-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfXwdUw6qObBMb3
 0ilYjU5oC8Ty/X3dySQ4mlME8cxkdffGyklfJuybr56LGp758BapW/rLpfx8fR04zRn0CoE3fWa
 aJiFsfgbqi7SdpEDnjP/nWbtxFn1Tic=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Implement the V4L2 subdev streams API (enable_streams/disable_streams)
on VFE lines, selected per SoC via camss->res->streams_enable.

VFE lines are inherently single-consumer (vfe_link_setup() enforces
one link per pad, and each line exposes only the implicit stream 0 of
a non-streams subdev), so no local refcount is needed. Local and
remote teardown are both attempted unconditionally on disable, on a
best-effort basis: a failure on either side is logged and does not
skip the other side's teardown, since there is no way to roll back a
partially disabled pipeline.

Co-developed-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 119 +++++++++++++++++-
 1 file changed, 117 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index da373024c847..31ee3a0d3717 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1996,6 +1996,104 @@ static const struct v4l2_subdev_ops vfe_v4l2_ops = {
 	.pad = &vfe_pad_ops,
 };
 
+/*
+ * vfe_pad_enable_streams - Enable one or more streams on the source pad
+ * @sd: VFE V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to enable
+ *
+ * VFE lines are inherently single-consumer (vfe_link_setup() enforces one
+ * link per pad, and each line exposes only the implicit stream 0 of a
+ * non-streams subdev), so no local refcount is needed here.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_pad_enable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
+{
+	struct vfe_line *line = v4l2_get_subdevdata(sd);
+	struct vfe_device *vfe = to_vfe(line);
+	struct media_pad *sink_pad = &line->pads[MSM_VFE_PAD_SINK];
+	struct media_pad *remote_pad = media_pad_remote_pad_first(sink_pad);
+	int ret;
+
+	line->output.state = VFE_OUTPUT_RESERVED;
+	ret = vfe->res->hw_ops->vfe_enable(line);
+	if (ret)
+		return ret;
+
+	if (remote_pad) {
+		ret = v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
+						 remote_pad->index, BIT_ULL(0));
+		if (ret) {
+			vfe->res->hw_ops->vfe_disable(line);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * vfe_pad_disable_streams - Disable one or more streams on the source pad
+ * @sd: VFE V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to disable
+ *
+ * Local and remote teardown are both attempted unconditionally on a
+ * best-effort basis, matching the convention used by other streams-API
+ * drivers (e.g. dw-mipi-csi2rx, ds90ub960, cdns-csi2rx): a failure on
+ * either side is logged and does not skip the other side's teardown, since
+ * there is no way to roll back a partially disabled pipeline. If the local
+ * disable also failed, its error takes precedence in the return value.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int vfe_pad_disable_streams(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
+				   u32 pad, u64 streams_mask)
+{
+	struct vfe_line *line = v4l2_get_subdevdata(sd);
+	struct vfe_device *vfe = to_vfe(line);
+	struct media_pad *sink_pad = &line->pads[MSM_VFE_PAD_SINK];
+	struct media_pad *remote_pad = media_pad_remote_pad_first(sink_pad);
+	int ret;
+
+	ret = vfe->res->hw_ops->vfe_disable(line);
+
+	if (remote_pad) {
+		struct v4l2_subdev *remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+		int remote_ret;
+
+		remote_ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, BIT_ULL(0));
+		if (remote_ret) {
+			dev_err(vfe->camss->dev,
+				"Failed to disable stream on remote pad: %d\n", remote_ret);
+			if (!ret)
+				ret = remote_ret;
+		}
+	}
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops vfe_streams_pad_ops = {
+	.enum_mbus_code = vfe_enum_mbus_code,
+	.enum_frame_size = vfe_enum_frame_size,
+	.get_fmt = vfe_get_format,
+	.set_fmt = vfe_set_format,
+	.get_selection = vfe_get_selection,
+	.set_selection = vfe_set_selection,
+	.enable_streams = vfe_pad_enable_streams,
+	.disable_streams = vfe_pad_disable_streams,
+};
+
+static const struct v4l2_subdev_ops vfe_streams_v4l2_ops = {
+	.core = &vfe_core_ops,
+	.pad = &vfe_streams_pad_ops,
+};
+
 static const struct v4l2_subdev_internal_ops vfe_v4l2_internal_ops = {
 	.open = vfe_init_formats,
 };
@@ -2067,6 +2165,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 	struct v4l2_subdev *sd;
 	struct media_pad *pads;
 	struct camss_video *video_out;
+	bool streams_api = vfe->camss->res->streams_enable;
 	int ret;
 	int i;
 
@@ -2077,7 +2176,7 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 		pads = vfe->line[i].pads;
 		video_out = &vfe->line[i].video_out;
 
-		v4l2_subdev_init(sd, &vfe_v4l2_ops);
+		v4l2_subdev_init(sd, streams_api ? &vfe_streams_v4l2_ops : &vfe_v4l2_ops);
 		sd->internal_ops = &vfe_v4l2_internal_ops;
 		sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 		if (i == VFE_LINE_PIX && vfe->res->is_lite == false)
@@ -2107,10 +2206,18 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 			goto error_init;
 		}
 
+		if (streams_api) {
+			ret = v4l2_subdev_init_finalize(sd);
+			if (ret) {
+				dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+				goto error_reg_subdev;
+			}
+		}
+
 		ret = v4l2_device_register_subdev(v4l2_dev, sd);
 		if (ret < 0) {
 			dev_err(dev, "Failed to register subdev: %d\n", ret);
-			goto error_reg_subdev;
+			goto error_subdev_cleanup;
 		}
 
 		video_out->ops = &vfe->video_ops;
@@ -2154,6 +2261,10 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 error_reg_video:
 	v4l2_device_unregister_subdev(sd);
 
+error_subdev_cleanup:
+	if (streams_api)
+		v4l2_subdev_cleanup(sd);
+
 error_reg_subdev:
 	media_entity_cleanup(&sd->entity);
 
@@ -2164,6 +2275,8 @@ int msm_vfe_register_entities(struct vfe_device *vfe,
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
+		if (streams_api)
+			v4l2_subdev_cleanup(sd);
 		media_entity_cleanup(&sd->entity);
 	}
 
@@ -2187,6 +2300,8 @@ void msm_vfe_unregister_entities(struct vfe_device *vfe)
 
 		msm_video_unregister(video_out);
 		v4l2_device_unregister_subdev(sd);
+		if (vfe->camss->res->streams_enable)
+			v4l2_subdev_cleanup(sd);
 		media_entity_cleanup(&sd->entity);
 	}
 }
-- 
2.34.1

