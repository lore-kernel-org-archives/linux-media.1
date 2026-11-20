Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218318;
	b=qubGb5Rp/O1NWw7lMXKv49o40eYNVHwaicJ0I3dwbmGuCOiKuZEXynL+xfrRCyB/Ax+w
	 zmRPjvnxIfi54J6rN/gJcwjuYARdX1yhr6X11DM1Bkd3deizFOc+PIRwPa14yHHAeoFm7
	 JdihzJ080ZCMosU9ggaG9VCjoaDZvSGaFPoNEMysje9fQHpQv7b28xepRzeaU7gZ68brz
	 zidaoo5FsadfbD9UrZeTh3LMYnWIuDlYlZz+wUKU3jcM/Wz3LRwvejEVUIYFoOCVwtvxF
	 1SUvytkyP6GrbpgHJonujE3AIcXD/ZMjQ3EBtLMcYWfLLPUrjBbUwCl8Wl8ESnPaNQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218318;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g2xB28x5tFq/i+P+yjee3msopUUOoQ+g80Z96/sxrIE=;
	b=g4wzyXyy5KUuYEtkP4nRcl1I+0PxUc1jRX2xASA7aAiCCLJVO5ZcEx9MiJDnxJKvOWAU
	 35N2LthhlYtt8WTUpu2YSntv11XnD6GLrjI4H8tQ8lxmNkCWjyur4/ob2tYMdfcNVPm1k
	 qtztRm6VjvLSgpqwUqo2p/5wOeLf5ec+dP2fsPHc44rNPtXgsItRr0xacSF7WPssqA1zP
	 lTVBBi5bnnlG3TNTLHlLOt9cRui/8YqKcw6mEdr5MmUcnr2gI5r9X1OzXTo0S0JXB2LsH
	 Ax7z2WcLlrOWY6PspFKZkyxBLW1WDWymh6eyAe3lzx7bwjQYft7YayrzxRA1FNaYHUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B7XWVpwS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dYO/F47i";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F6760A2602
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9F6760A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B7XWVpwS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dYO/F47i
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKI1c4u1507155
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g2xB28x5tFq/i+P+yjee3msopUUOoQ+g80Z96/sxrIE=; b=B7XWVpwSC5sy5DHa
	p1/ws7vkO8AN6ukIZ3Epl/T9zbGuJLI+hMn7ZviOikwcGSo/Hp3ofzON0BlkXUrX
	U+C2xAEYcCEshU94jgkhJuLxlcAAoN/kf7DVZeyyErVAS8SymBFSWHFT3tMaqZHo
	jhLaov8DMztq6F7Vn6osGvRmVFUjJQMmXHUI3F64Il7Tbqw8W22w/cwcdXHhYJmI
	2DJvfF7YogedCmAN/RmJLuwf10LwcqefAhSULTUFm/a97mt1o2ZS1VHu0xOGoQw9
	R9uUNJwHKgDKve0veT2Ii7uqOFWSFExR1+4fvYucU3fY6BB/WneVjS7XMf7YTub4
	VkyQCA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2u4fs4s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c58d35c0aso222697eec.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 15:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795218308; x=1795823108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2xB28x5tFq/i+P+yjee3msopUUOoQ+g80Z96/sxrIE=;
        b=dYO/F47ibYxVlh2U6PisnM6nF/pIkLWRo8jLegpOgXz/wbdJdm86yzAfGR9LP+QYrj
         Y++NMjoZcWf/5YMmw/HcsW9gkZs35zkCwwHd9kRHK+iEMyc+xwAFHbiQs5RAAQc2QVfU
         Xni23cRdaxt1ZMUpgVXCyIrI92aEwTyBFH6PnYM7pcREu4f9zaDvakRcco4AXdMf09KU
         XC8St52+ytrMwqbD4wgb53CpCbKFVQA68Lt8wOQi2PkFo/npCqTmvMlmUrs/RM2jlaCe
         AWTbeIduG2AL5O8vnxSOSkqxauw9kn4ABjKnugzHlB06QV906ZZBiwo6pVOFBA1XsaPx
         LxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218308; x=1795823108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2xB28x5tFq/i+P+yjee3msopUUOoQ+g80Z96/sxrIE=;
        b=n0GJ9uRmz7qKa4FwcfmZjsfzBT9JED7FoR89TrYrW/NrXolejo1SLsiaYmSuthklFi
         Udsy5sJdV9M6XR5AK94O7SQVkKEjx0xTjOjnLbBBD8z021gKbm3GdQ/d3o5bVl94C4tT
         A/CvUgf+Li6wxsECck1Ka7IoGlOs9Pla/j51uaHlo5YTd0MdQo08su7mYAz1j0LBMOck
         MfISbaUUbOrPNB6PV5ned2et5SfqUOQIWUQ0Of0dEOpMvK5yQZK6Volr+xYcBGhxF3fy
         IBfTRPcQvw5VaphQyS+51l3EwR1In2eGxVIeW293IWpwTYi8qeTqDmUbbxqWiOV/gYLh
         h1eA==
X-Gm-Message-State: APuU4Z9ig5xcXmZMTRLxrq35WGiIBlXqyPEDcSyvJOLFRW9Lg+ujijBw
	icguB0nQmlukHlzlimNStLqNcIMgpxB1L90L2OPURXCPnCbBSany+9k0lUyguZZH9crryYCg2p7
	XvfhnJxosPdr6o7QosXnf3PzI0rujnNQSIu5ijvLriZru/8yHLM8YWGrqEtXPes0Q7x8iDSaenw
	==
X-Gm-Gg: AZFdTZdlLDyqKRmBOsTMWqPC4eB5VZ3Vt0SwiHKS46s0SF/Cb/ACnfLY7qlrIgfXO93
	Snchj54qE9VMkczHL9yQziIZdBRoIBi2hylUfvPIhVIKSnHwM8/2MAca4pgNiTyW2VLxreohZhN
	HD1NLU49VEcd2AwTf6X/bnCpwRsNGMD6w9b7ifxLGULOTlCvDJr2Xjtin0Va39CQd7BYp44bjo4
	cIh43YoVXh2WePd1eCVpFGw9dPrReauP92JxMEqY+5DuSYanHxYcNy/vIcWoyKS6pzg+l1P4oCW
	XPeqTYxgD6mFr8swhW8Mi0y45uhNqdVJAUgH1zO5SwnQqjAcnEbZTeEs7SK6McTgedWlQKjb7Gc
	9+HU+8nc0P9KYPYAtr8+MqQx8oIrxoz1ludwV6/8kip1czSqWO2lpPX8kK5Y4pdClTbYJMPyZTd
	1ql9eFcCgUEzwH9Xpi0D5QlRizm9ZnaDP1Vw==
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr6548276eec.0.1795218308189;
        Fri, 20 Nov 2026 15:45:08 -0800 (PST)
X-Received: by 2002:a05:7300:6025:b0:384:cea9:a109 with SMTP id 5a478bee46e88-3856925debfmr6548202eec.0.1795218307597;
        Fri, 20 Nov 2026 15:45:07 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm14669862eec.4.2026.11.20.15.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:45:07 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:45:03 -0800
Subject: [PATCH v11 2/5] media: uapi: Introduce new control for video
 encoder ROI
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
Message-Id: <20261120-enc_roi_enable-v11-2-c00b95ea1b81@oss.qualcomm.com>
References: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
In-Reply-To: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795218304; l=5949;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=sv026//BjLrrFT/a9FBRofcr2RzwFWoIJXG9YvN4haE=;
 b=GPdo08XMXBhrsVhP1Mfv0+cL54ZKQwTZRMU8lIJEu/neT54Q/BlEcaCsyXWp/c3aQeJyDeYka
 cHI2ve0npSMD/BiWkt05UVTXI7QfiT+XEUDbebwRk/5YrGasS5cLckA
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=VJBIDNPX c=1 sm=1 tr=0 ts=6b00db84 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ap6q5WERqFDIfUOaLDQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 8T_ouvA6NDPam3NHe__jicQ9thicP_eJ
X-Proofpoint-ORIG-GUID: 8T_ouvA6NDPam3NHe__jicQ9thicP_eJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfXylIjgB5P53Xd
 x46glYdm8sMzeHYlcK2PSbv1nikrt0dlX27ZeOIrx+zoVEUyjZSmyjdIvzxBwjKi1zvYvxNLesl
 QglDUyvzN8GaArJxyHvRMukEUy4zhWU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfXzBcfYotCuVwz
 JnWW0xiFzSX7Ki2nEQJyUyyZ94EUnLnNA6RoGASfco3Mbp3avu4wvPTGqgUAK71ccfoZ82mK7Td
 i9GAWHyFbgTFn+LOnWeS4gLd+Cb8mMR+w2TMI73KZ5Px4moPafl3Eh5tSqLeSiAb/4KgXHVVESQ
 UwvULvPoz3TRjJMKDKGv1ji8ryv19dRCdsMWPxoUGQfslU6wN89EHmcC6mKolHrImTsVK2C7Q7h
 Lh7FDz8dngug7AMLRuzkp7JOqCsIs9wIMXchDIzYkIa3kCaq2CiHYBMr/VigEsXnPBEAfCfNv2f
 upRYdVvKloOkAw7/uHPIXoejnegj9Sj/wQ7Vjwwky7fjKVfmcjP02hGcLVtHQrGKxHCjt16Ewqe
 0U2nZ19EccTz9xhKQy1eUaxftf9aSS12iBprlVx/JBNpfnekGbO5FgDKc26S21xMM/sOQXFP94S
 zpoQqeb0WIIlLH72Qnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200094

Add array control, V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP for
video encoder Region of Interest to allow applications to specify
different quality levels for specific regions in video frames. Define
V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE to retrieve supported MB size based on
codec from the hardware encoder and set the corresponding ROI MB delta_qp
map that adjusts quantization relative to the frame QP's base value.

This enables use cases like prioritizing quality for faces in video
conferencing or important objects in surveillance footage while reducing
bitrate for less critical areas.

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 27 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  3 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          | 10 ++++++++
 include/uapi/linux/v4l2-controls.h                 |  2 ++
 4 files changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ab865a1a6ba929f1725ce2ab0fd3aeee4a69329a..28a47ca7b14397d3b7358c6a105f13092c6770f7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1674,6 +1674,33 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     Codecs need to always use the specified range, rather then a HW custom range.
     Applicable to encoders
 
+``V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP (__s8 array)``
+    This control is a dynamically sized 1-dimensional array,
+    V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
+    This array control is used to set ROI MB map delta_Qp for the whole frame.
+    The frame is divided into a grid of MB Size by MB Size pixels (MB Size is
+    obtained from querying ``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE``). Each block
+    is configured with delta_Qp in raster order. The valid range for delta_Qp
+    is encoder dependent. Driver can ignore the control if it is not set
+    along with the current frame.
+    Applicable to encoders.
+
+``V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE`` (integer)
+    A read-only control that reports the MB Size used for the ROI delta_QP map.
+    The supported MB Size depends on the encoder codec.
+    Only square MBs are supported. The value returned represents the
+    width and height of each block in pixels. The ROI delta_QP map provided
+    through the ROI control must use the MB Size reported by this control.
+    The number of entries in the ROI delta_QP array is determined by the
+    frame resolution and the reported MB Size. If frame_width or frame_height
+    is not MB Size aligned, they must be ceiled using ceil(frame_width/MB Size)
+    ceil(frame_height/MB Size) for calculating the array size.
+    For example, for a QCIF frame if reported MB Size is 16,
+    the delta_QP array must contain 99 entries, ceil(176/16) * ceil(144/16) = 99.
+    For frame resolutions that are not aligned to the MB size, for example
+    1920x1080, if the reported MB size is 32, the delta_qp array
+    must contain ceil(1920/32) * ceil(1080/32) = 2040 entries.
+
 .. raw:: latex
 
     \normalsize
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index a34eb2a21abafe7b0f1e9509939edb9fbedf8030..7eeea60aeab174b89a621dd46375b5d6914dfaac 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1442,6 +1442,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		break;
+
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e062f2088490470c42d6c579ff7675be454a29b0..8f895060799ea13443143edd398dfb97f4ba0085 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -974,6 +974,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_AVERAGE_QP:			return "Average QP Value";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:		return "Encoder ROI MB Delta QP";
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:			return "Encoder ROI MB Size";
 
 	/* VPX controls */
 	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
@@ -1622,6 +1624,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
 		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP:
+		*type = V4L2_CTRL_TYPE_S8;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE:
+		*type = V4L2_CTRL_TYPE_U8;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2ec1ccb9e8ceb3ccc89ebc4381a4cd..be484156ed35a19229be23ad24fd224cb5a8a0cc 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -941,6 +941,8 @@ enum v4l2_mpeg_video_av1_level {
 };
 
 #define V4L2_CID_MPEG_VIDEO_AVERAGE_QP  (V4L2_CID_CODEC_BASE + 657)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP  (V4L2_CID_CODEC_BASE + 658)
+#define V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE  (V4L2_CID_CODEC_BASE + 659)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)

-- 
2.34.1

