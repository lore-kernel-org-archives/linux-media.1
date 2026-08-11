Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F206D37F8DA
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786473015; cv=none; b=EgLCP087SH5QSEAw7o7RlBZKnYJFfy4vXFckpO2maX/AsCpQzfwNHI62BG7pW+gpktoDlQqsKZ9qasgOC9WUaXanL6Id7rqxTvXFSTevPnJISVsLxOb+EyStAqQcTneKtYxZbGv1zOcFxrCzDkvBa86wG1LYNolVN/in348Bj1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786473015; c=relaxed/simple;
	bh=aYg1KsEO1BMPI1NvrP0QlCY+oFgndNkDbagsl25qYmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gm9bBZoQuGujujvJT261MoIcI65D5oISDvZ2kR5ONFm5WkG+yMvFseGXuXJOqr77/cWj5NcO/BxIVtQeKqxQDkvbC0ymtpX6+0W0iBvqrDHQ2568ncs2zPVOouooW5ZELgPolmwaQdfxFtK9edBWReG58sUI+Dj2m9oCfCR0KxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sjfr3C9C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7CCS8J1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sjfr3C9C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7CCS8J1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BGOXZJ1165554
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wsd3AcTjBlyGfb//EcpMQsX1Atw/JeAXEdL+9Stg4F0=; b=Sjfr3C9CK2eDxFM/
	jx0csmWfkjKcvcdAMtk5x4ke49I2fHXH7OM++sgLL46kf37t0oNX47Q9SvUkZwlP
	jH9dbT05ohfV0r4U+OVSC/ik15sEwyaYKu1wo/b0Ix0WjBOBjS6UbTg+XjXRhmw1
	ooZQMLZ/Seqdmcq3FuYZ/NKq8H0Az5XZBVakZ/Unl54WvQQ56F9wVBwp21L9xnzM
	fQfJUBNYk+4dCQdDqY1GemA+cRQiVu+b32qHlDn/tJT5CGTQSlVY3k27bl8jf81p
	x30e/KEA3Q1cKBBl5r6ZBcNQ3EhfTN3tFu8Sh4D7/hw+ZkIeXhyIejtskl54DUMc
	sdzWLA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q123d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc98d6a88bso546305ad.0
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 11:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786473012; x=1787077812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wsd3AcTjBlyGfb//EcpMQsX1Atw/JeAXEdL+9Stg4F0=;
        b=g7CCS8J18yDIiMmI9meT6Tm0oeHbHtbf2rfCqRRoLwlGoYOdzetZjiSf8M3PDDR6qt
         8MI31nehomTBHAekV1BeK8tO2zWuXmwLxZQfiNCGODYL+5UNSP+tCDdfqmlbgqmUMSD0
         PtR6H0VzTLv7Iu29DVJRM2BivbZ8V9phwglg1am0iKbPRNtvPwoccKyasXoLaX+TE44X
         JS+mC5kPrSBAMMrl7T8BcfrWaPUJpMYojzd+R2pZhedOPOlVU0pCUcd8ztc0VHc2CvyZ
         Bppt03FIASV7WrczcE9aXzp6+/hLmWjURCNXRCdFmrwgHlK6hy7b5Zysp+5Lx3Wf6T4a
         23dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786473012; x=1787077812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wsd3AcTjBlyGfb//EcpMQsX1Atw/JeAXEdL+9Stg4F0=;
        b=MzOiuq4aizPZ+ShrUNo3Df9Oy0Sce6M2FgPUVkao6IfphAxRo0k0M0X3XAqFO6pvC8
         QMg/TL3RNWBQF0FyAQKaq6CbU0Sif1o3iKHbXbyNig/O53SCnXkVxp4VVd8bZsiIFf9l
         yQph7Cp5Glwt4WrSBvuTmoNuWtVWstNqRYYlf2Ne8ZVUxb57CVfQPoVLqIhueUNFfcLz
         UXuL/UtW9Q+ftLg40jg2Htw/cAa0y4xPlIE9W1igc/oJ4x72rWIs+glZ/8zVXZNn9tq0
         /eSWQoxEVwXZqzOu0j1vG89f4Z4E4uE/hqD/RPnLP5nqbLKaNaGnJb5vopd5dCHSHPSu
         L7XA==
X-Gm-Message-State: AOJu0Yxn55uSVkPD0l8ewGKXmFfMouKAAUrZW2YGCxHFrFBRnHNBHfnv
	S0mWNUS4syqdtl7Uw0OnUuYFFlS8xL4R4eE5sDlbldeV40RjFlVDlwo8ZDRnpTv7xp7ei9WbRDR
	02cRkV5AgIPw1iuC8P+LJPc2d113wr6MqMrTI93b8PagS8Wb+y1KlfpWxgEYG72MRyQ==
X-Gm-Gg: AR+sD11Ic3DIYJK6iYvW5qL0CHCvLh2bgTSgLD1v/2d/XjcXHJ9xofxc5nvdOoQefKz
	AuXf2OGdFUwKZQiDLLx3/yHiFfJssURwkkimpTpOH9wcQMMyn8Sv1Dvh4DfB2GfP95vnKWSK2bb
	azjN8hBY2wf6o1AKy3HSd2Fiud8MiyVxTj4zmrrcoECG5zxT1nyjbAMCkCT66OjVn1Pb8+ZXtEP
	Sf0ZpwpGQLlRf2wPB+vsp4kYMPV9wYF5j+c0pBNrxHElKXxBe1O97yeirHjPJDEKDmep0IsqWE3
	uPN+t/DqaKkyCQ0X/zeyJPOEYpHMfqx78GarEKS58Ic5FdcCArQBgmDKDvlYNlTn0+YVBUtJISY
	xLqc+Of23x+jfNZxpmz2MQ0XBHfb8HMzm6al5h9snimUHic3OXvxnus467P7e
X-Received: by 2002:a17:903:950:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d317790400mr48625805ad.1.1786473011525;
        Tue, 11 Aug 2026 11:30:11 -0700 (PDT)
X-Received: by 2002:a17:903:950:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d317790400mr48625285ad.1.1786473010991;
        Tue, 11 Aug 2026 11:30:10 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315d829c4sm11759955ad.0.2026.08.11.11.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:30:10 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 11:30:06 -0700
Subject: [PATCH v4 1/5] media: uapi: Introduce new control for video
 encoder ROI
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-enc_roi_enable-v4-1-1c9ea2405bb8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786473008; l=7406;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=aYg1KsEO1BMPI1NvrP0QlCY+oFgndNkDbagsl25qYmI=;
 b=dCcjUhAXR7ouv/YMKkVTKT2cLSFqH8cGBxmEqBQ5VyDGeYpg58JqHPfnW6n9A28Wwe/ABs+l7
 TJWfJbq5owoC0xsjSpu6Ebp1y8mNHnbz0K9g+bqBg+ARo8b0TVpHtZT
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: uLWv_pXTKkZ0rZwTOeF3hL63RZhON8DP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfXwWH4WKErPB5s
 k4yRzuKu65Zbrnv5cNb+0RoWgEurqI/FolIsDLiq8z2TRlVQSHn62UIz0mkpMHYKWQ8tEM+057H
 28IXw2/qvg6bhZRgD/j6cGvqpQYOJwJAJnossmpbcOzF0fbE7ocS8bvZ+8UYGFpOTseXb8jB1aP
 DXnUy9Qw+fy/jMu+Xw/+AGFCHvYCRd67TXivgs+sHGwuyj+0g2eB4VLXfWrMcGneBSniA8Gpu+r
 NeedwD+FBbYsKbMd1DJXiLqXCpjXYJI7KKkPFta5nFVfKBm4rsDyQ95sEDcTcGAAjp/J09Oi2dz
 /os81YsA+ixEfqe0NsDVZIrSwciIA0uxQJUu4BBFxLH5TrpY/aYmCDn0N+t9fTuiX9a5Ftkkrz/
 O0FXpjQMmcbpIP0lCH4i5knqn3/QBHDaYsvRwGfEsQutokooIY3vfEj51iZLC/Te/lZfeT35evW
 J8IeRzWKiVlj5N/2v+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfXyI41Yssprr1n
 AcVFm7KZrrm6cqi9ffiwR1rQndpMql4y9vvdNoSZKizQtTV0j+tqMedrnfuP9+QCBgbBzffRyPR
 pdRdf+G28wc76D8BOMxSwEsImwxi/yo=
X-Proofpoint-ORIG-GUID: uLWv_pXTKkZ0rZwTOeF3hL63RZhON8DP
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b6a34 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=o2p6THidDhOa5OcZzacA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110155

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

