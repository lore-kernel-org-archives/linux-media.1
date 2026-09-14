Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F99481FCE
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390866; cv=none; b=SxFkgTNMsm01dvXm8ss0NOLeIwsyJoLeIdojYG91f3Kxpjra4NgBHSPa7cblF41NFCrf61KBPde438VIoYmifsBn9HErULK0xWrkaGepl7/YXGy0BHPzhX3Ael3dR6zczgC6VM+KjSIWOIZ9KkmKvI4/wcaDo0dwEDUxZ2tqVus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390866; c=relaxed/simple;
	bh=4CuIYeLNuqj4lS1nv6iZvXtszLauIqmb3dM3fu1zNVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mYNnLgDnsfW86xqG/lAQw7VeyYuh8skpoPDrfIwLHNNjzmVuTBc4cEvTtb73+3LZLhup4Ii2r7oaqe7d1uxlJXmFGu+dpdEUKm2f9Ovul5TtaHzY+P4HbNxlWjNa7V9bXraZSBQe205a0VdhnqNa1Q9KWtg+23Q7Bjm5yKZ4JIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYtwgCd0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SatZmTik; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYtwgCd0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SatZmTik"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0bPr3588221
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3bqFmHkhCGz5eiPjMG0auO0PisCfiqS8mjvQZaC9iYQ=; b=JYtwgCd0ranMmEqJ
	Lo0I4s6s/dosEFGfTMw4CjXw5PvASqWyW+21OqWp6l46Gha2kdLgzVgYPncJuvC2
	K7BPZg8Jg99SFgRG2rutHlnJtRHw0jzBllXEHqzZCpB6KXXpNoLUjwMn/T2NPIbl
	QHdJZoY9vlLlU2jK1hFbAbw7tj6eNCZoubIh3k1JPqMK9zz5CdfznicWPmh2gOOk
	ntzkUqD62+v/Xyou2BY96GbW+lFS+bjahNQA/3Zg90Etg1eSFFjzUQ0Y2bcTmbnj
	5uTUhx1Kp9+i3pWUfl649V5hFh8Lnt4aucmXn2UKVR0oNOTEalG7JJgzag0E3Jx0
	Yt37qw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8pys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:01:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfc52ddc55so49846375ad.3
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390863; x=1789995663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bqFmHkhCGz5eiPjMG0auO0PisCfiqS8mjvQZaC9iYQ=;
        b=SatZmTikLoic1XWc1wu7g12fd6PYMMkL0SxuRnRPnklqhbgmmA41krLPQAEtqPadU8
         MOark17Ppi6yYZ4vKf4FiNnArtMtVscMU4Lcl4k7Jdhv3MmZBT+a0WkjU7U3WuorH41Q
         slGTHJYZJqRpnplBkVlGriztrYbUgPmifLV6MGDxHRtXsYVa2H5mJ7cbxSjFZtXOJU3z
         fnW1QN2wF9ZJQtECj75gVg53UOZj52CY8OYfIgQLARmmlRcFSW1pWy6oO1ZxCeAUcF0x
         uWaj2HZJjMQu+3f8S1oeSgBF42SagovF4CqC3/wft+92LUGBSwUtx78Qcv+6se5DbgZv
         tV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390863; x=1789995663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3bqFmHkhCGz5eiPjMG0auO0PisCfiqS8mjvQZaC9iYQ=;
        b=C0xHhJmfRIyeRqJfDjrJB7U/bZ3WipmGIko7RSti5/vKS02dwNLVB8OGetLyCNpIC/
         UzFzZN6hbE/7EvTvPABLmpIEryZyNEXwsI6go6v8HyBlIyUUZdYVsSKRzU8AD5sExQI0
         2mqpk+t8O7JjIe4bo7VpIFNYzpa4KIBhqW1ll1/SYfL5v1lCyQIQxquwMDtaDRLaPvIG
         zF2ReutI/QGawvF2646HwFN+YLcVH6hfsOR1R5l5MMdPRjsQvc++zx/L2DqJoOc0Yo/i
         cM/2Ji3YDIee1tAS53Q328awvgDC2hOVerCMhClDK9FaRYV9GGSyrWHzAKTIgghgfLi3
         253Q==
X-Gm-Message-State: AFuF++nKdKscZZ6lhscw57mTyGl1XTdJ5IWYaDG49gUI3mfwJw6/LDeF
	DV3+6DMgYOFK5LABpGgm4sitlq71qU2xm+KO02ycQJwF4erxpB3YCPK07sF2PgoKv51kZYDS9c3
	VTspHYA9EQsQdyzEFdk6Nvd3lZvNxWJbEAm8hMe6gZic5Ia74WEDuBLxzk4Si7qWpew==
X-Gm-Gg: AYBFou1lMBdvqh050zkoldnw+90jwMJR/q2Sxa7JA0B2Ia4ErCuwxK/gsQYqcQLO9Eo
	9cb1P+nqvfyWIlOvBU7ZAnsn3PszvpAD6z9ixXLdgEu9jcLS6zGBCjRA4ltzRF2LP+5I55QPrRx
	WWaBnzub+Y723Txav8j2bPyyCOmDS2asw/iOKmqASie46oN32qXZnzEJvJIR3LA9umJNo6iYaCu
	E5TA6tM/c8O08TXLbCB/XYY6f+OYHgY16GgTEx4ZY4ZWZk6wV0tCgTDmRRZk4O3eVRCQKNoQGEy
	IJGpFhPCDl1DAoP+zhBwC3LYNbyBLZtm75xzbYti+wwxcZUiw3SMy70fsX87YESI2IqEtims0Ky
	TNZMYSnVsKVjTbs9jVz5DUkQykYSa22m83SVcILS0jNRVJ1GKUjCbOAvVeVf5pic3BSZfjPR5S6
	M=
X-Received: by 2002:a17:903:fa5:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2dd6c5bdd5amr56496335ad.1.1789390861011;
        Mon, 14 Sep 2026 06:01:01 -0700 (PDT)
X-Received: by 2002:a17:903:fa5:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2dd6c5bdd5amr56494955ad.1.1789390860432;
        Mon, 14 Sep 2026 06:01:00 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb6861sm47434965ad.36.2026.09.14.06.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:01:00 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 21:00:27 +0800
Subject: [PATCH 4/5] media: iris: fix VPU4x encoder line buffer size
 calculations
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_maili-v1-4-09df2b54c317@oss.qualcomm.com>
References: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_maili-v1-0-09df2b54c317@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789390835; l=2172;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=4CuIYeLNuqj4lS1nv6iZvXtszLauIqmb3dM3fu1zNVE=;
 b=hmO4WEwtyVRXwiuH9tfu7VUYrnOO2oOEADHxnP0ceI4IvbWB7Ncasq8AsbFNVePmiDrjwKvmv
 Khg8JxB5vZfAGFjpHbKDm51zTt3Bb/6Gj2PizdEFeyhTRx8t/uRfcps
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7f00f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZutslQBMatpZbJmTFbAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: lGmluH-P8n9G3nfhCfQQfUHfTs8i0J6b
X-Proofpoint-ORIG-GUID: lGmluH-P8n9G3nfhCfQQfUHfTs8i0J6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfX9xr97ZBzT+Av
 QfTk4CdQi2crx6dwSo5Sees6tRdBh7N7jaPiFXoqBRqPm1uFtMzMJC2lDQuTpmVhS1tBAuOErzl
 bqjZm11AI4HSM9AZ3SDnM2cxOqmZ84F9NGLLXHPU5RZfJjLSv5hArmS97u0Q3y6PRJJKNCS3CJp
 /ptP8LABLjIHMqQMbE45TvIbz7/5QYunDE6peF0QdtTBVMdqOutAjE5qp2Xi6PBFNtjpKvS5gjE
 SbkkDB5aRGVldPmN03QqGd+GbvdBcrO/s+0hN3lM19hbyv4uzalD6onLjtVm5e9Td6lWY5zLaAl
 Lzj3viQt36/OPwK/v+vr+GX2HQoB5Zxv5vQRUYUlJtJZ82P51Ou4oEIIMCXttrQ99qmzjUvGziV
 nUyePngFyxoQ0CQ5YbZJmwqYmypfORCRqjkFPD9hsB4r7oWnCTQ1yPsfk/2whDIgyzWXqpUBQRT
 bh0BcDkqzK3BMrPCENw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4NiBTYWx0ZWRfXzLg9qt8jQTsY
 yaH6Lj+XlzbN1NizMyTXLAmmY0hlUTMm5exUJtlWV6MjvE2cwQR2rBjr0VhEz+01VMP/wK6lmo7
 kFIe1bvct4Plz6+3FrYL0NAbqoZ/MZQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140186

size_vpss_line_buf_vpu33() expects (num_pipes, height, width) but was
called with width and height swapped, miscalculating VPSS line buffer
size for non-square resolutions.

iris_vpu4x_enc_line_size was reading resolutions directly from
inst->fmt_dst. Use iris_vpu_enc_get_bitstream_{width,height}() which
account for the 90/270-degree rotation case.

Fixes: df816dce1b01 ("media: iris: Introduce buffer size calculations for vpu4")

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 55996fd0d14c385ee63d2577b3e6d71b51d9e541..c4922a25b4501a851e31fcc85bc13735803be366 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -2059,8 +2059,8 @@ static u32 hfi_vpu4x_buffer_line_enc(u32 frame_width, u32 frame_height,
 	u32 dma_opb_lb_size = size_dma_opb_lb(num_vpp_pipes_enc, frame_width_coded,
 					      frame_height_coded);
 	u32 dse_lb_size = ALIGN((256 + (16 * (frame_width_coded >> 4))), DMA_ALIGNMENT);
-	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_width_coded,
-							frame_height_coded);
+	u32 size_vpss_lb_enc = size_vpss_line_buf_vpu33(num_vpp_pipes_enc, frame_height_coded,
+							frame_width_coded);
 
 	return se_lb_size + te_lb_size + fe_lb_size + md_lb_size + dma_opb_lb_size +
 		dse_lb_size + size_vpss_lb_enc;
@@ -2070,9 +2070,8 @@ static u32 iris_vpu4x_enc_line_size(struct iris_inst *inst)
 {
 	u32 num_vpp_pipes = inst->core->iris_platform_data->num_vpp_pipe;
 	u32 lcu_size = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
-	struct v4l2_format *f = inst->fmt_dst;
-	u32 height = f->fmt.pix_mp.height;
-	u32 width = f->fmt.pix_mp.width;
+	u32 height = iris_vpu_enc_get_bitstream_height(inst);
+	u32 width = iris_vpu_enc_get_bitstream_width(inst);
 
 	return hfi_vpu4x_buffer_line_enc(width, height, 0, num_vpp_pipes,
 					 lcu_size, inst->codec);

-- 
2.43.0

