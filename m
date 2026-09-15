Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E622F4ACC9B
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 22:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509625; cv=none; b=tROsyiw0W+r3bduoBB4SH+a2n9uoKUDBBKvY9m2B+whFqyFmokyX6uLVjijlu9etHJ+IT1IG4rVoBln6yO7UqYbQDYfnHtQnrxGPnNsFRcimN0GHBkgxH2+0ElSBLxv90EH+hb/zhb3zO2Xke/6NynefMFQshAvamCEHKQovvlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509625; c=relaxed/simple;
	bh=wNVHPxkaB4vrAU5ZuZlGBH1cLJwrMzXxiccFlSIQZNA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hrbv1DP9WhPl0lLjnOUAFplLWQHMJElrp9zTux1IwaciFhzXNWjhbfl2a8W7QhgExEq+fH0YPAJPpvhmArUy7qTaRr8EBJ/eY8kNPuou7di8uHiBklxa9YsDYgOqhCd0bmYTEGYJSh4BoKVT+JUWXVBjxNzxoOXraM+snAiMAk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fuHy8eyT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JvHQpKR1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fuHy8eyT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JvHQpKR1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLYsFi1152278
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 22:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BTDWLVoCVpMxiIxViCU2K9
	N7MVy4z71iBiixkHSPnCI=; b=fuHy8eyTiPWYb6Wb4HmV14kuOJaD2yyjbkivhj
	FsGdp4ywIv24yI9TGtqetdiGNm7N3Vyb5uIBc1tVcuJvF9XXrH9V1nFaeK4rYnoS
	vya7R+q8u5wlCdBUo5lHMGLsxzx0i5+0KmoOOYIyYdgnkqvPFOUsjlwms+XlIuim
	x7RECpYD9Nd3ddha1t7zRkppKHoXwuZo27dfg9uxUhjkdcLqzQOIp9Uw5rYrxlva
	JFt+LvnRR0V5XseObELQEVSzTxk6t9i0blvkGAFQ0yIn45IBV2BnqkJ5JKfyRCnF
	gTvGXLudVynqsZ8zvVJ5AYQFVFa/toHLO+331vP29xmUkvlQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux4aub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 22:00:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86c1109ab74so803220b3a.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789509609; x=1790114409; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BTDWLVoCVpMxiIxViCU2K9N7MVy4z71iBiixkHSPnCI=;
        b=JvHQpKR15vY7+t8LOIDxwPid6qi9PmOQENSbt7dM8sTkspo9QhcE+xo333mnYe21cB
         Omt9EOWMgnyYRt90y+EP41cz9okQgsLyn5D0IPWJ6lfG4f9PszFdDx9T6raKRoQ1UuMK
         VJzTdc6h8REpME3uFNSfD46+FPfEqLglDaG1WoFJPFCjfx96JpqQV+xX+WBgQiFZ2W0c
         BSiTeX1AzJ2/ca+GH5Q5ATY07yMoLZJ5gKSbIg9xPVi/IJbmZCWkLRiwcRrOTMFdmbXM
         Hlex+Sjf9GaueUyWhCy+QZHkeQMfLEEwXQcCGP9H2//XJ4S/MgMAz/RYpt03i+Zj6BMJ
         PURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509609; x=1790114409;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BTDWLVoCVpMxiIxViCU2K9N7MVy4z71iBiixkHSPnCI=;
        b=j8o0eoo60SOugaFd+aNKZlXOLAHTisp9lLksCP27QG0PNCt0Mf4xYaOATPAs5KlwKx
         duBLO/ihX2RNyYPOAYbGFw4IqYvc9Jhy0HOI20fvCC+r0/J1o+pgCHyW8SzWOfpBpQwb
         ZjdN5csFq/k17cMecoB72+ddhArwO78mI4CtwG61PKhFD+hFvvETp7B3DBg9X/sHBpIk
         kXxlqEzZPTTxVNDgfGOA+9VrfwBAAvPd5K9nJZDv5g5DCXu5g+PUYPM/hm7OghP1MuA+
         E60FovUTzik9N5g+derlcwTDewiHH2DRXRecnPl2e6gzNnoqFMYeJcU2PxjPJlCmv2Gi
         GIew==
X-Gm-Message-State: AFuF++kU7/xLaHHmzb/rzejpeQn29+012d9KlXA8qfOMjBYJ1KYOay/y
	oLRR0SZ/hG3d6HdbCd4s9/lv60XVby0s2T9U758AyyFC5THQWEb7+Yi8e+MQ6sJ8UTRqJS4GPqk
	7NnwCwiNy6UVJ7CfqG2JhzPujDaflPZ2pgzK/VE1O2GMVwLfueHZSf6vYjt5H4Y+uhg==
X-Gm-Gg: AYBFou3SzVTieLArMBxPBriAPtjNna6TBCHdR/uisfohZtrO04HV3lNKDVQ2aLTMaA0
	RhVW4rI7SAmz32ULgiJi76D0LkfTGhot12i+i7UulwZYb/VZHGy7s6GJoZxCDLjNIAhBz9snCj3
	Ggpk+NYKGuPKMkQN2Q3sHFSxUv5hYD2GaI19VNJpPruw78zjERDDGrFFZ3pduDlJLNtceAK6wBK
	0uUnnmM/dxWA+3fXfbc5fG5UINtTXIeWaIOvXUk/p4gk/gg1oOMnrhx6HRowF6aXJ259xART4CQ
	gIOE41H1IXthhUgQFD9U1iNIsg9lPbApJHpV7i42wg+M5L+LHVQtVyVZubZJPiwHYPS41Dol2HF
	XmuxfI0sGkLg/BsPZkNqvExjxDquFo/wKkJ+d7f4shsukMgiYlVH9zffoHAjA
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e1e5285d8mr292892a91.5.1789509608953;
        Tue, 15 Sep 2026 15:00:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2250:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-39e1e5285d8mr292844a91.5.1789509608258;
        Tue, 15 Sep 2026 15:00:08 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm1878345eec.16.2026.09.15.15.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:00:06 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v6 0/5] Implement Region of Interest(ROI) support
Date: Tue, 15 Sep 2026 15:00:02 -0700
Message-Id: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOO/qWoC/3XPzWoDIRDA8VcJnmtQZ3TdnvoepQQ/xkZI1lbbp
 SXsu9fkksB2LwP/gfnBXFijmqmx592FVZpzy2XqYZ52LBzd9E48x95MCWWEkYbTFA615ANNzp+
 IYwSrAw4WHLF+9FEp5Z8b+PrW+5jbV6m/N3+W1+0mNUsueKIUAtJgEsBLaW3/+e1OoZzP+z7YV
 ZzVXRkkrhTVFQPGQhqjD5Q2FLgrVqwV6AoJ8EYppyLaDQUfFClXCnZFhpGcQqG931L0o6JXiu5
 KpDgiJpHC8N9Hy7L8AUIImljLAQAA
X-Change-ID: 20260616-enc_roi_enable-4d385c4783ae
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789509606; l=6023;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=wNVHPxkaB4vrAU5ZuZlGBH1cLJwrMzXxiccFlSIQZNA=;
 b=8ORqJ5QfpIv+SeERrouPNTQp/qLHNtcNnZjlisJMPTVyFTkL7Ft0nDHbfRdVdjycSkQFm+Squ
 HaV4E3UONZwDDn1vHyGcfCscTC1tySdFX+THuQxedUyhzx4srtDTR+1
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX5Rkvyf9Kn1vw
 b3LVX6OzUQn1HNmWouuOO0enV9CVt4OfFvQsJlq7i03G6y9qC2oWbA59ywp08NEFQY5At/h9gJm
 2L9mWZMWxBEGKkSq9EKNH7o3nvgVnSIGrLTzvkT3YUvXD+L4ahZRtpBLE26TQqjo2Zw0cvWSnlj
 J8Qa+pMgDTHN2n07i6YGvr4KhA7RYWATIBXbMTnDVytCGG2sI2SQB6Xz4BGabzXzFIOuVmz2EG0
 1g5j1xqzX/l0X/ygvkjLoVEmdldpidNb7/0d+CkRhEhBxNEhLtqoTSYyajadWP08aPos33g+/zb
 YxWeGJQ3veGlH7uRPgeStFxFGb3Dp41xsG3Gug/AHq3iv+2gnGSPgBxT1SNXAGvCpGX6JNOsfNa
 4dG9DoWPjbsbLLSXdXoLgcoNGpPpZlL4M6AOF5npmypxBeqRHD3VFS0pZRVGHqoFpbNqGUdJUhZ
 B1NQQrWwPVVhlks/EZg==
X-Proofpoint-ORIG-GUID: A_7vGqvzUw2klbLwu4CPWKoc-QHUYXD1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX9319FMXFVPHB
 nw8FLPqNvEFMOrGbVzs1V1Wu2YeKoDYgtUOC/HxII9rnBA8WbbraI54RzFFSoBGF5Y2AgFH/8gh
 Hd+bfFasxqF+EMFJrW7gPXCFTb1Yn/c=
X-Proofpoint-GUID: A_7vGqvzUw2klbLwu4CPWKoc-QHUYXD1
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa9bfef cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=M65a8TQjgKWshqU4mUkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150321

Hi all,

This patch set implements region of interest(ROI) support for
video encoder to be configured as a MB based delta_qp for
the whole frame. Custom controls V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP
and V4L2_CID_MPEG_VIDEO_ROI_MB_SIZE are implemented to achieve this. 
Corresponding support is added in iris encoder to implement this
feature.

This submission and design is based on the feedback received
from community for the RFC[1] series posted earlier. 
Initial testing is done by adding support to v4l2-ctl[2] to test this
control setting and its functionality.

[1]https://lore.kernel.org/linux-media/20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com
[2]https://lore.kernel.org/linux-media/20260616-enc_roi_enable-v1-1-252792d27894@oss.qualcomm.com

Results:

v4l2-ctl -d /dev/video1 --list-ctrls
...
enc_mb_roi_delta_qp 0x00990b92 (s8)     : min=-31 max=30 step=1 default=0 dims=[139264] flags=has-payload
        roi_mb_size 0x00990b93 (u8)     : min=16 max=32 step=1 default=16 value=16 flags=has-payload

v4l2-compliance -d /dev/video1
...
Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)
        test blocking wait: OK

Total for iris_driver device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0

./v4l2-ctl --verbose -d /dev/video1 --set-fmt-video-out=width=176,height=144,pixelformat=NV12 --set-fmt-video=pixelformat=H264 --set-ctrl=enc_mb_roi_delta_qp=-20,-2,-22,9,-16,-2,14,-9,-19,3,-26,19,-23,30,1,0,-6,-7,7,2,-2,15,-15,-24,-24,-26,-26,5,-1,-1,9,-11,15,-25,-11,26,-11,7,-26,-27,-8,-18,7,-4,-12,-23,-11,22,-7,7,-14,24,6,-8,-7,2,7,-26,2,-25,-1,-3,-4,-6,-26,-11,7,16,-30,-22,-15,30,-14,-29,-11,-8,8,6,19,15,-17,21,-27,30,-17,-28,-10,-20,1,22,29,-19,-2,28,10,12,-10,7,-4 --stream-mmap --stream-out-mmap --stream-from=/media/foreman_qcif_nv12.yuv --stream-to=roi_try.h264 --stream-count=10

Validated on SM8550 MTP.

Thanks,
Deepa

Signed-off-by: Deepa Guthyappa Madivalara
<deepa.madivalara@oss.qualcomm.com>

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
Changes in v6:
- Update documentation from custom to array, __s8 to __s8 array (Hans)
- Update documentation and handling for non MB Size aligned frame resolution (Hans)
- Rework patch 1 and 2 to add V4L2_CTRL_TYPE_S8 type first followed by ROI control (Hans)
- Simplify handling for V4L2_CTRL_TYPE_S8 in v4l2-ctrls-core.c (Hans)  
- Link to v5: https://lore.kernel.org/r/20260815-enc_roi_enable-v5-0-ded944f0fc7f@oss.qualcomm.com

Changes in v5:
- Fix Media CI errors.
- Rebase onto media-committers next.
- Link to v4: https://lore.kernel.org/r/20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com

Changes in v4:

- Updated Documentaion, clean stray lines (Bryan)
- Use BIT(16) for header version (Bryan)
- Split patch3 in the series to reflect enumeration of
  the platform and adding metadata support and implementation (Bryan)
- Link to v3: https://lore.kernel.org/r/20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com

Changes in v3:
- Updated Documentation (Hans) 
- Reuse ROUND_TO_RANGE_RANGE for p_s8 (Hans)
- Rebase onto media-committers next.
- Link to v2: https://lore.kernel.org/r/20260714-enc_roi_enable-v2-0-63683f9dbcef@oss.qualcomm.com

Changes in v2:
- Fix issues detected by Media CI robot and kernel test robot.
  Reported-by: kernel test robot <lkp@intel.com>
  Closes: https://lore.kernel.org/oe-kbuild-all/202606171554.03yt9utn-lkp@intel.com/
- Rebase onto media-committers next.
- Update to handle p_s8 in std_validate_elem correctly. 
- Link to v1: https://lore.kernel.org/r/20260616-enc_roi_enable-v1-0-fefcc4e76f33@oss.qualcomm.com

---
Deepa Guthyappa Madivalara (5):
      media: v4l2-core: add new control type V4L2_CTRL_TYPE_S8
      media: uapi: Introduce new control for video encoder ROI
      media: iris: Add ROI delta QP control support for HFI Gen2 encoders
      media: iris: Add HFI metadata buffer delivery support for Gen2 encoders
      media: iris: Add BUF_ROIMB_DELTAQP metadata buffer for ROI delta QP

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  26 +++++
 .../media/v4l/videodev2.h.rst.exceptions           |   1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   4 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   6 +
 drivers/media/platform/qcom/iris/iris_buffer.c     | 114 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 ++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 123 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  14 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  63 +++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 +++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  14 +++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   2 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   2 +
 24 files changed, 455 insertions(+), 4 deletions(-)
---
base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

