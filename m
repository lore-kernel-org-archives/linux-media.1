Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0CA397E8A
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326419; cv=none; b=oW7apQUGDOU1Srp0n5t/IqmZm0tpVCHmGbyZveGNtzNVqBEgDO4z293wke4JRdS2c/7LzcYjSf7uC2ST0OhTylALuGrCtVjt9PGw9mgxBrzI+gnIfJPZRScCMlAxUwXcBY69qp4iwwxORXS2pFFmojWvMTyIXxRE8OW0oCHVaeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326419; c=relaxed/simple;
	bh=D1R0UyjykaYjgiod8/JAxtW7VvuDrgjttlF6MslAR3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f9z4Dcuh2dnO4wSRFyhUAO0or6+ClTmeDDfao0x7IHNcyDLMtsJl4ymdlIEG0GtyQtwTwUceouhpTGVHatho9rSRtAliBgX5sLQbK1Ba9mRHCqILNkFnDZDBCnJQfDGK8ohnmm+gzQd3d1c346y0WkblZwx9GIkBYXvpl5AtUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZOc2CJvT reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZOc2CJvT"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeYSb2514095
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dFUl6McPWbe
	yyHjy+QLJlWLySCZPq7THnDdDROUWcaE=; b=ZOc2CJvTCwupkVjt7+insBWUoET
	g9SnzdPOLTVsiKEgoNsRuuroxmz4yMJsytsjYpWvNoZqCdOokiZoJsa5dGOp7kcY
	6oqtZXmETPjt6Qqz5M0L4C8vLIj8wGcxYCdpqeM+zlrtd68IGc3nI/uySuavk2Hi
	CusWTkU15WssaicdodNCwAbgue3ZVhsEddaUHjFVFoBXmxmB8duUwFB+3QZbmvys
	yvL/oi1j0jhxxJaq/7Pbp2qOtJSKSZDFHWTPS11sRp7429smQcnlMBHKAd1mqD07
	3m/0wKT9pXqxIQrwcCMbXIWHCENWfV/UlnSeAk35v3voJwfuYNe22Y2ALfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xwwtw6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:40:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca4a2b9c4so744955385a.0
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326415; x=1791931215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFUl6McPWbeyyHjy+QLJlWLySCZPq7THnDdDROUWcaE=;
        b=nUUMR+4HbBdLcoDEtkRSodWHWDQGsEzLdfaO+J9aVgnmL3BFxWvTeDcISPvJMsUaJH
         xXWzwHJ9Koazk5T1pEgDzOh+riN+5HxBBSEIx/eLgD8EMsxwUFRAJKCQEWeDE5YGGqbm
         X7vZtSw1e0F2m8/RcYddpIZ8s1ZhP8CyFuyELXRJD3ajuDe5mbDyHDpEvXmOmhS9j0uZ
         kmqa7zzucJ1QRv3B5raVxDNDE3b3XKkEz2uVHPk29IaKGaKOuryMOISAlagoBaEfDzgj
         bzGFAV8RzGsumTXUEL8B1o8Y0tSX9wNgyEmwDJwNPDgw0YPq6aqkMYo/+hclSVkMEJUb
         x/xA==
X-Forwarded-Encrypted: i=1; AKwUvBwD+KXlANLytFJSo0r2A6DspzJH4OBPg+yY+VjRCpuKDSbBPpTQxbzTqllQ0kha5gWw0iWnCvkCsVtf8w==@vger.kernel.org
X-Gm-Message-State: AFuF++lXU9/WB5XJJNTDLcoym8K+CsKRPn9CQfXSc98JIhZGz6v0N83w
	YSY+risw7wKbS1Pr2e9Qi+c9Au3bQHInaQFIq8QSwt0m6W48DRpBrwWgrCUsQfaA/fg0Npo9EnZ
	5BL482Jv0O83G0QPfLXjmNT0/IdwHWoyCSq0CArcNP1Wh0oj+IuSt9gQscIDrWQD0Cg==
X-Gm-Gg: AYBFou1+N04wadtPVuomJ0cJxxzvrz3+VbvmhRC9vj7JBty9PQ9YCunC2qEIWo9LZVu
	AF1nuXtMDe+R1xI5dC1MnMnhuR2+Vikd4R9RosdnHblB9fTaXwAhv8Z4BI2OjgR6/3N7xHdNVo2
	cny/2GeN81gAuRBRi1up9j3SasoIoam89LE2N0RZcFHElDhrgQVpTMAcOjLsSN2hMxGMztCC+Hy
	Fhmo/abAKQHNrtBM9Zl+d9XZcmMiHKprQt1vfijbDGBfHbRaFMRvIe/WzuUQHm23spFnUdCbJNX
	aHp4RPwm8BUI9qKzbjQRbCYzMM3XbiXj9tRwNiSicPxDtkTq6O0eOUk9BZ8=
X-Received: by 2002:a05:620a:4090:b0:93e:722b:1f79 with SMTP id af79cd13be357-93e9b8081c8mr67962885a.53.1791326415090;
        Tue, 06 Oct 2026 15:40:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4090:b0:93e:722b:1f79 with SMTP id af79cd13be357-93e9b8081c8mr67957585a.53.1791326414493;
        Tue, 06 Oct 2026 15:40:14 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:13 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 01/45] media: qcom: camss: support CSID streams on one source pad
Date: Wed,  7 Oct 2026 01:39:09 +0300
Message-Id: <20261006223953.3382273-2-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX6/o7JARBrm3d
 mCKPfzeQSzo4N8Yn+JlgIYlWTZxrb5+L3sIWrWO5cy/9o2hrLE6N1vq56mVlJ/JwIVIhD3HD5CY
 /0y7Dw1VojvQ8A+kYYCt9XM0fJ92TGx3I4ZbMvINItxEu5AkYndKDS7nsrQuRO+HsfC3kEPZVeR
 /i8tYD5ZqCHomgrojPHGIG2uXcj3utLbw2Dz3ONEwiH3x/Isszio1YM60NtKXbeWBovecjLvhoa
 98D7Us3RNBt+7yBWtzEAJ9JDxiYvuXTfUOW2XgEoqH+LhOAH7etUhUq7Qnc6N7rjgy5u48hMOQC
 a8eSan5AxYk2Wa+VAIgmuZmiM6bYJgX/yGdNCY3DOUH3FJz3Ynp6rcOPnxnAuScVuLzTDmjBQeH
 lnZ1k9BvAmuyhLWWZFKlPSXVxYfSy4hA+C8DQiatjxv0YJJnc9QZe8gblVIFkkZimdSaI9j5pUi
 T4suVuOdzPn+BVSwV8g==
X-Proofpoint-ORIG-GUID: paBHdt_3prtVV33PEfo91wGGI7VJ4c-4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX2E1GODs/Az6P
 fKUDYhWvOSUmoAMYZKmP8dmbY53CEoVsyDYoExNGNihm/YSNZxqavR31BUCPQ//hnDSOGqS5fGf
 ckEvuUjZ2a2aSAsQXAfVDYy7W6RpFDc=
X-Proofpoint-GUID: paBHdt_3prtVV33PEfo91wGGI7VJ4c-4
X-Authority-Analysis: v=2.4 cv=SJXXx+vH c=1 sm=1 tr=0 ts=6ac578d0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=snf5ID3PIsyufCWJ1dEA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Allow a CSID resource to expose hardware outputs as streams on one
source pad. Keep the existing one-output-per-pad layout as the default.

Translate V4L2 stream IDs to hardware ports. Keep shared sink streams
enabled until their last source stream stops.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid.c    | 129 +++++++++++-------
 .../media/platform/qcom/camss/camss-csid.h    |   6 +
 2 files changed, 83 insertions(+), 52 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 2aab9104ac5b..bdac29b7af86 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1385,6 +1385,7 @@ static bool csid_get_stream_csi2_desc(struct v4l2_mbus_frame_desc *frame_desc,
  * @state: V4L2 subdevice state
  * @remote_pad: Remote pad linked on the CSID sink pad, or NULL if unlinked
  * @pad: Source pad number the caller is enabling a stream on
+ * @stream: Source stream number
  * @format_dt: Data type derived from the sink format, used as a fallback
  *	       and sanity-checked against the discovered data type
  *
@@ -1393,7 +1394,7 @@ static bool csid_get_stream_csi2_desc(struct v4l2_mbus_frame_desc *frame_desc,
  */
 static struct v4l2_mbus_frame_desc_entry_csi2
 csid_get_stream_vc_dt(struct csid_device *csid, struct v4l2_subdev_state *state,
-		      struct media_pad *remote_pad, u32 pad, u8 format_dt)
+		      struct media_pad *remote_pad, u32 pad, u32 stream, u8 format_dt)
 {
 	struct v4l2_mbus_frame_desc_entry_csi2 desc_csi2 = { .dt = format_dt };
 	struct v4l2_mbus_frame_desc fd = { };
@@ -1404,7 +1405,8 @@ csid_get_stream_vc_dt(struct csid_device *csid, struct v4l2_subdev_state *state,
 			     pad, get_frame_desc, remote_pad->index, &fd))
 		return desc_csi2;
 
-	if (v4l2_subdev_routing_find_opposite_end(&state->routing, pad, 0, NULL, &sink_stream))
+	if (v4l2_subdev_routing_find_opposite_end(&state->routing,
+						  pad, stream, NULL, &sink_stream))
 		return desc_csi2;
 
 	if (!csid_get_stream_csi2_desc(&fd, sink_stream, &desc_csi2)) {
@@ -1422,6 +1424,14 @@ csid_get_stream_vc_dt(struct csid_device *csid, struct v4l2_subdev_state *state,
 	return desc_csi2;
 }
 
+static u32 csid_get_hw_port(struct csid_device *csid, u32 pad, u32 stream)
+{
+	if (csid->res->source_streams_mode == CSID_STREAMS_SINGLE_PAD)
+		return stream;
+
+	return pad - MSM_CSID_PAD_FIRST_SRC;
+}
+
 /*
  * csid_pad_enable_streams - Enable one or more streams on a source pad
  * @sd: CSID V4L2 subdevice
@@ -1442,9 +1452,8 @@ static int csid_pad_enable_streams(struct v4l2_subdev *sd,
 	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
 	struct media_pad *remote_pad =
 		media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]);
-	unsigned int hw_port = pad - MSM_CSID_PAD_FIRST_SRC;
-	const struct csid_format_info *format;
-	struct v4l2_mbus_frame_desc_entry_csi2 desc_csi2;
+	unsigned long streams;
+	unsigned int stream_id;
 	u64 sink_streams, propagate_mask;
 	int ret;
 
@@ -1478,12 +1487,19 @@ static int csid_pad_enable_streams(struct v4l2_subdev *sd,
 	csid->enabled_streams[MSM_CSID_PAD_SINK] |= sink_streams;
 	csid->enabled_streams[pad] |= streams_mask;
 
-	format = csid_get_fmt_entry(csid->res->formats->formats,
-				    csid->res->formats->nformats,
-				    csid->fmt[pad].code);
-	desc_csi2 = csid_get_stream_vc_dt(csid, state, remote_pad, pad, format->data_type);
-
-	hw_ops->enable_stream(csid, hw_port, desc_csi2.vc, desc_csi2.dt);
+	streams = streams_mask;
+	for_each_set_bit(stream_id, &streams, BITS_PER_TYPE(streams_mask)) {
+		const struct csid_format_info *format =
+			csid_get_fmt_entry(csid->res->formats->formats,
+					   csid->res->formats->nformats,
+					   csid->fmt[pad + stream_id].code);
+		struct v4l2_mbus_frame_desc_entry_csi2 desc_csi2 =
+			csid_get_stream_vc_dt(csid, state, remote_pad, pad, stream_id,
+					      format->data_type);
+		u32 hw_port = csid_get_hw_port(csid, pad, stream_id);
+
+		hw_ops->enable_stream(csid, hw_port, desc_csi2.vc, desc_csi2.dt);
+	}
 
 	if (propagate_mask && remote_pad) {
 		ret = v4l2_subdev_enable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
@@ -1492,7 +1508,12 @@ static int csid_pad_enable_streams(struct v4l2_subdev *sd,
 			csid->enabled_streams[MSM_CSID_PAD_SINK] &= ~propagate_mask;
 			csid->enabled_streams[pad] &= ~streams_mask;
 
-			hw_ops->disable_stream(csid, hw_port);
+			streams = streams_mask;
+			for_each_set_bit(stream_id, &streams, BITS_PER_TYPE(streams_mask)) {
+				u32 hw_port = csid_get_hw_port(csid, pad, stream_id);
+
+				hw_ops->disable_stream(csid, hw_port);
+			}
 
 			return ret;
 		}
@@ -1502,18 +1523,17 @@ static int csid_pad_enable_streams(struct v4l2_subdev *sd,
 }
 
 /*
- * csid_sink_streams_in_use - Compute the subset of sink streams still
- *			      referenced by a source pad other than @pad
+ * csid_sink_streams_in_use - Find sink streams used by another source stream
  * @csid: CSID device
  * @state: V4L2 subdevice state
- * @pad: Source pad to exclude from the check
+ * @pad: Source pad being disabled
+ * @streams_mask: Source streams being disabled
  * @sink_streams: Candidate sink streams to check
  *
- * Return the subset of @sink_streams still referenced by some other source
- * pad
+ * Return the subset of @sink_streams still in use
  */
 static u64 csid_sink_streams_in_use(struct csid_device *csid, struct v4l2_subdev_state *state,
-				    u32 pad, u64 sink_streams)
+				    u32 pad, u64 streams_mask, u64 sink_streams)
 {
 	u64 in_use = 0;
 	unsigned int i;
@@ -1523,7 +1543,7 @@ static u64 csid_sink_streams_in_use(struct csid_device *csid, struct v4l2_subdev
 		u64 other_sink_streams;
 
 		if (i == pad)
-			continue;
+			other_streams &= ~streams_mask;
 
 		other_sink_streams = v4l2_subdev_state_xlate_streams(state, i, MSM_CSID_PAD_SINK,
 								     &other_streams);
@@ -1540,12 +1560,8 @@ static u64 csid_sink_streams_in_use(struct csid_device *csid, struct v4l2_subdev
  * @pad: Pad number
  * @streams_mask: Bitmask of v4l2 streams to disable
  *
- * The v4l2 core only calls this on a source pad (v4l2_subdev_disable_streams()
- * rejects sink pads with -EOPNOTSUPP before reaching the driver), so @pad is
- * not checked here. Each source pad only ever carries stream 0.
- *
  * A sink stream is only disabled, and propagated upstream to disable it there
- * too, once no source pad references it any more.
+ * too, once no source stream references it any more.
  *
  * Return 0 on success or a negative error code otherwise
  */
@@ -1557,16 +1573,18 @@ static int csid_pad_disable_streams(struct v4l2_subdev *sd,
 	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
 	struct media_pad *remote_pad =
 		media_pad_remote_pad_first(&csid->pads[MSM_CSID_PAD_SINK]);
-	unsigned int hw_port = pad - MSM_CSID_PAD_FIRST_SRC;
+	unsigned long streams = streams_mask;
+	unsigned int stream_id;
 	u64 sink_streams, disable_sink_streams;
 	int ret = 0;
 
 	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSID_PAD_SINK,
 						       &streams_mask);
 
-	/* Keep a sink stream active as long as any other source pad still uses it. */
+	/* Keep a sink stream active as long as another source stream uses it. */
 	disable_sink_streams = sink_streams &
-				~csid_sink_streams_in_use(csid, state, pad, sink_streams);
+				~csid_sink_streams_in_use(csid, state, pad, streams_mask,
+						  sink_streams);
 
 	if (disable_sink_streams && remote_pad) {
 		ret = v4l2_subdev_disable_streams(media_entity_to_v4l2_subdev(remote_pad->entity),
@@ -1576,7 +1594,11 @@ static int csid_pad_disable_streams(struct v4l2_subdev *sd,
 				"Failed to disable stream on remote pad: %d\n", ret);
 	}
 
-	hw_ops->disable_stream(csid, hw_port);
+	for_each_set_bit(stream_id, &streams, BITS_PER_TYPE(streams_mask)) {
+		u32 hw_port = csid_get_hw_port(csid, pad, stream_id);
+
+		hw_ops->disable_stream(csid, hw_port);
+	}
 
 	csid->enabled_streams[pad] &= ~streams_mask;
 	csid->enabled_streams[MSM_CSID_PAD_SINK] &= ~disable_sink_streams;
@@ -1606,6 +1628,8 @@ static int csid_set_routing(struct v4l2_subdev *sd,
 			    enum v4l2_subdev_format_whence which,
 			    struct v4l2_subdev_krouting *routing)
 {
+	enum v4l2_subdev_routing_restriction restrictions =
+		V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX | V4L2_SUBDEV_ROUTING_NO_N_TO_1;
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
 	unsigned int i;
 	int ret;
@@ -1613,14 +1637,15 @@ static int csid_set_routing(struct v4l2_subdev *sd,
 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csid->enabled_streams[MSM_CSID_PAD_SINK])
 		return -EBUSY;
 
-	for (i = 0; i < routing->num_routes; i++)
-		if (routing->routes[i].source_stream != 0)
-			return -EINVAL;
+	if (csid->res->source_streams_mode != CSID_STREAMS_SINGLE_PAD) {
+		for (i = 0; i < routing->num_routes; i++)
+			if (routing->routes[i].source_stream != 0)
+				return -EINVAL;
+
+		restrictions |= V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING;
+	}
 
-	ret = v4l2_subdev_routing_validate(sd, routing,
-					   V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX |
-					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING |
-					   V4L2_SUBDEV_ROUTING_NO_N_TO_1);
+	ret = v4l2_subdev_routing_validate(sd, routing, restrictions);
 	if (ret)
 		return ret;
 
@@ -1635,9 +1660,8 @@ static int csid_set_routing(struct v4l2_subdev *sd,
  * @stream: stream from which format is requested
  * @which: TRY or ACTIVE format
  *
- * Same as __csid_get_format(), but honors @stream for TRY-state lookups.
- * For ACTIVE state, csid->fmt[] is indexed by pad + stream. @stream is
- * always 0 and @pad selects the RDI channel (0-3).
+ * Same as __csid_get_format(), but honors @stream. For ACTIVE state,
+ * csid->fmt[] is indexed by pad + stream.
  *
  * Return pointer to TRY or ACTIVE format structure
  */
@@ -1750,16 +1774,8 @@ static const struct v4l2_subdev_ops csid_streams_v4l2_ops = {
  * @sd: CSID V4L2 subdevice
  * @state: V4L2 subdev state
  *
- * source_stream is always 0: each source pad MSM_CSID_PAD_FIRST_SRC + i
- * links to its own independent downstream subdev, and a link's sink side is
- * validated against the implicit stream 0 exposed by any subdev without
- * V4L2_SUBDEV_FL_STREAMS (see v4l2_link_validate_get_streams()) - every
- * downstream VFE line is such a subdev.
- *
- * All source pads route from sink_stream 0 by default, fanning the single
- * incoming stream out to every port; a multi-VC source is supported by
- * remapping each route's sink_stream via .set_routing, leaving
- * source_pad/source_stream untouched.
+ * Multi-pad mode exposes one stream on each source pad. Single-pad mode
+ * exposes all output streams on the first source pad.
  *
  * Return 0 on success or a negative error code otherwise
  */
@@ -1780,8 +1796,13 @@ static int csid_init_state(struct v4l2_subdev *sd, struct v4l2_subdev_state *sta
 	for (i = 0; i < num_routes; i++) {
 		routes[i].sink_pad = MSM_CSID_PAD_SINK;
 		routes[i].sink_stream = 0;
-		routes[i].source_pad = MSM_CSID_PAD_FIRST_SRC + i;
-		routes[i].source_stream = 0;
+		if (csid->res->source_streams_mode == CSID_STREAMS_SINGLE_PAD) {
+			routes[i].source_pad = MSM_CSID_PAD_FIRST_SRC;
+			routes[i].source_stream = i;
+		} else {
+			routes[i].source_pad = MSM_CSID_PAD_FIRST_SRC + i;
+			routes[i].source_stream = 0;
+		}
 		routes[i].flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE;
 	}
 
@@ -1821,11 +1842,15 @@ int msm_csid_register_entity(struct csid_device *csid,
 	struct media_pad *pads = csid->pads;
 	struct device *dev = csid->camss->dev;
 	bool streams_api = csid->res->streams_enable;
-	unsigned int num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM :
-						       MSM_CSID_PADS_NUM - 1;
+	unsigned int num_pads;
 	int i;
 	int ret;
 
+	if (csid->res->source_streams_mode == CSID_STREAMS_SINGLE_PAD)
+		num_pads = MSM_CSID_PAD_FIRST_SRC + 1;
+	else
+		num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;
+
 	v4l2_subdev_init(sd, streams_api ? &csid_streams_v4l2_ops : &csid_v4l2_ops);
 	sd->internal_ops = streams_api ? &csid_streams_internal_ops
 					: &csid_v4l2_internal_ops;
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 30674eac51a7..f079956bae8e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -29,6 +29,11 @@
 
 #define CSID_RESET_TIMEOUT_MS 500
 
+enum csid_streams_mode {
+	CSID_STREAMS_MULTI_PAD = 0,
+	CSID_STREAMS_SINGLE_PAD,
+};
+
 enum csid_testgen_mode {
 	CSID_PAYLOAD_MODE_DISABLED = 0,
 	CSID_PAYLOAD_MODE_INCREMENTING = 1,
@@ -166,6 +171,7 @@ struct csid_hw_ops {
 struct csid_subdev_resources {
 	bool is_lite;
 	bool streams_enable;
+	enum csid_streams_mode source_streams_mode;
 	const struct csid_hw_ops *hw_ops;
 	const struct parent_dev_ops *parent_dev_ops;
 	const struct csid_formats *formats;
-- 
2.34.1

