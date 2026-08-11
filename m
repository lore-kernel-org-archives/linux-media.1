Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F0D37F320
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786473014; cv=none; b=Dkifgb6dDwmEkVo0deB7QB2U3kTepiMwushnFIl5b8LviYYhmAhk+fvK+TybEffP/3RCTmx/z3RA9E87B7WscV/VE+I/AIkeqa5XSnC0PuOuX+WeHtpPx7M/LHERrHl5+ZYW5v0Vr+4bxN0ggBBmevf2Sb2kF7fOnzO+rXuMl8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786473014; c=relaxed/simple;
	bh=jrfKAbrqaql50Dxfi3g3HWzXHaSCM5UTS20Ytkj6gD8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I7Pl+wk9lFf/kw1NClR/cuVkYWBVt5nlrsvMuYz9h8wBQ+ec0pBWck4ZsuPPz9CADZ/X0dqUyMfBMxjf9T7hcnKoeXCNSXBreGdMdQulydc+zvJXdPHQQTJXo7x6zgW3A2vJD6E+4zXvTOtGAZUNxjEL1L6XhBM/oxRqObid2g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaukeMPy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NAsjwHTZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaukeMPy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NAsjwHTZ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BGO9014121161
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WQkw2jTHZ4aYxyg4SD9nlD
	t3DgP90hK9oWI6Zr+DAUU=; b=JaukeMPyTDgXshwUe5laNQxejKaWaILukHVbT1
	5sDTy2OX1nuLb26VGXOCBcN1efabSZP44svgf5C6lKthDyYZdfh0WWt8nolv01MJ
	Sr6gNPO4dr2gX/lhgDlrRZbqWsXUodFfmHFSJ+ran/+8BZyqhiIDcfQkOCdObvKJ
	Q8ut5am7GOuMUQT3I21uE2tgT8K5AnPV7Jo6SgUlY9kQvQPvrv3HzB9DRcpdz5pU
	aSB+1chWpN7l5AV3+ru3MIy/A7GoRe4RyEGCCLVWkE9kJLIAYOxTPdT0rlboH4y1
	lFg7T0eQoc1/zVlbqt4SIfsYhXbOJ8KDEW6WhVPDqUi+axnQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwetstb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ced1ed870fso470475ad.2
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 11:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786473011; x=1787077811; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WQkw2jTHZ4aYxyg4SD9nlDt3DgP90hK9oWI6Zr+DAUU=;
        b=NAsjwHTZ+AQQ8ooVCM2ZmHjGceEubqpVModbGOMJaJBE3dd7KZdrmr0+/frTNuOjO0
         3LrfIsjWRnzdhm9unlqCDTQGWJ/fLx8qJMz/PzNQo8scG/YJ3NJl9L3dI+te8KA0QKG5
         CDy3gh9KYkY5Uueqm9RWZyhHJSn3rolr4QvPXZ60fxpbdFEnDDvfjKj8LU6QJ10jQd53
         0ldLkXMgGT6w2eCMp/ZLEX/0OiwkXA6ZjU8TE4X13hnjecWCihTjpbdx/uccUZ26vtUq
         YiaOWMjjoyrHqnNgVqrDTq91DYfmJi4Sv7iR/kVnyJxghT9QA9i1YCmBafkQ86zeeiU1
         j3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786473011; x=1787077811;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WQkw2jTHZ4aYxyg4SD9nlDt3DgP90hK9oWI6Zr+DAUU=;
        b=cuaB9EP1h4exFiFjJ1L6rah4/PTZ+LwjF0HHvMWwlPPmRAOUnGP77mJvbgVpb9byG7
         ArPlQNGYDe0regqnxfFMd6qB9nB1kU6aMVpPDTl+EsjkXkmTHeTJSzuR5VcFXYUHFsdG
         CS16SkVENhFnfovhEQeCLuDzM+v73LsOSkbk6nuB+dUvYLtjjq+CGXAwqNRtdJkkfThP
         2xehOMQCbggt/qghneUMR/+wKIn1dCNY/Bf7lOX0aDhh5HjuSZsDIF9ADqDpX63mMlti
         jyydmDBCDpc0ugZH08lW4ZocxjClKdGy86tggR5rEe0CAz3eMowu/REiuSTqs3mgp9Ew
         kPFw==
X-Gm-Message-State: AOJu0Yyndq46vdDCIj+G6jOkwQHiL+1qlWDuXwhIUFSfCrSYvpSHmvQE
	Bp9D7wfHQiuAaO7WkpQ92Q3KcJ7k7BCUyjV1VFmvntgph0RQiYd6OtPJ0cE4llqYPa5sa3wsGQy
	B+7vyGrFFTC2GLhtShixrjwK5omvJqCkLkPss2ryt/SkzWg41+Twyryz1BBn5gg6RWQ==
X-Gm-Gg: AR+sD10QWeskEInUKIi4Osm1lOvdTCJJ1I0ZoaQXWI9XwH0cfIC5gPywTNRip/gizmZ
	mKKzUK8UCT7KsrWRkbBQHC0CMTAlqIKR0Avt83YlrNL52uMVxaoeu03vJR5RESUH0j53wV/oSS3
	Gn0QQ4ckom56tYR+INT1dE4WEFrNmp7VlXJCwI80J24NN7h3RZ7T0qiVOtrjXr/lDkQvnQC/RUA
	thjHH0jyEELfkCe3bEFiyfQPa5KOk0pWlNxyRUYrVb5t+65jFhcpBUsgNwwg76kezZHBVzUo8YJ
	cAUebb07wU87G9btLPj/esfsqdcWqxKfKjO+3FcjptNbSEdnvMk2pIW3ORoDA4f0N3v+ZtKGBSp
	AbAYbKsNOqK/8/P1Lebwfkq4fVVfcbnf3NYWfkz3Tq7dxFKgsBtC58LARAVm6
X-Received: by 2002:a17:903:2383:b0:2ca:ecf6:9115 with SMTP id d9443c01a7336-2d3178cc8b1mr52299555ad.2.1786473010433;
        Tue, 11 Aug 2026 11:30:10 -0700 (PDT)
X-Received: by 2002:a17:903:2383:b0:2ca:ecf6:9115 with SMTP id d9443c01a7336-2d3178cc8b1mr52299005ad.2.1786473009842;
        Tue, 11 Aug 2026 11:30:09 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315d829c4sm11759955ad.0.2026.08.11.11.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:30:09 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v4 0/5] Implement Region of Interest(ROI) support
Date: Tue, 11 Aug 2026 11:30:05 -0700
Message-Id: <20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC1qe2oC/3XMQQ7CIBCF4as0rKWhDFJ05T2MMRQGJbGgoETT9
 O6iGxfqZpJ/kvdNJGPymMm6mUjC4rOPoYZYNMQcdTgg9bY24YxLJjtJMZh9in6PQQ8npMKCWhr
 RK9BI6uic0Pn7G9zuah99vsb0ePule33/UqWjjDp0xgjspQPYxJzby02fTBzHth7yEgv/KH0nv
 hReFQlSgVvZwaD7o8BHUexbgaogg0FyrrkV6ocyz/MT2bwujD8BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786473008; l=5474;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=jrfKAbrqaql50Dxfi3g3HWzXHaSCM5UTS20Ytkj6gD8=;
 b=p1JI9O69SRsKqmQk4UcFpQKo5XPjE3v8DKWVSWocbHr6GpYQ9LRuJd/TZSzMd5SZ+cBcp/I6V
 +7jCz4yfCHiDAyZMsbrA5LryijFvWB7tzOGTico+/kATjkSlsRKPI6U
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-GUID: GQtUFW1cQoWIwTq3FJKZF7qohiH4aKod
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b6a33 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=M65a8TQjgKWshqU4mUkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: GQtUFW1cQoWIwTq3FJKZF7qohiH4aKod
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX9cl8P0C0mJu+
 hA1BL6fwfnF8B0Q8ve1qfda9W2T7Ax6/tWjry9UPsB5rfES83OKm7uFI0HORaPad3xA0NCkDv9+
 TdqD4R79kFXa3dquyXB5iPW6sJdy5mQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfXxY2Seq5H6umB
 kOs4QdIIQZYL5GecB7O3ASC2pt299o+vmJoz1wFJMnycbvluRZvfThxhodVtsYPtVNXc5u5+5//
 Zc4Z1sErfecJGaOPGvIETmAb51JKou4NCIjHT9nKE2yJ1On073RnkexB/MRXOCc8tbcGzJVzP67
 3N9D2WkP7iQL69LqIjcGpJpi4cPkKcvrHefyTLX2LYU55ttBj3AX3bdKTuA6ta9R0c/uyT0hBkg
 d5KZcKJpz9W9P9BsVASgFxdz64l26vK+AzC9gxvEqSikq/jEOdlQIhk3F3CLHtkIjxhDNUpwPKu
 yoMMC/DSgJmYyvKFTlSwMQTF4R6AnWS8KsQMHJh4FeeJOUXTNFouwoKzvFv0DDf7Ydu4lIP47Db
 FmLlt7SyuUE7xrRerNCOFc/wl9ZE/qgq+BRNNn1vML33XFG27FIAXnMJR2uIbwN4U+tSLXgrOEj
 8TXMD88Xj6MNA1untTA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110155

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
      media: uapi: Introduce new control for video encoder ROI
      media: v4l2-core: Add support for video encoder ROI control
      media: iris: Add ROI delta QP control support for HFI Gen2 encoders
      media: iris: Add HFI metadata buffer delivery support for Gen2 encoders
      media: iris: Add BUF_ROIMB_DELTAQP metadata buffer for ROI delta QP

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  19 ++++
 .../media/v4l/videodev2.h.rst.exceptions           |   1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   4 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   6 ++
 drivers/media/platform/qcom/iris/iris_buffer.c     |  98 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 +++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 104 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   2 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  14 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  63 +++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_venc.h       |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  23 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   2 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   2 +
 25 files changed, 423 insertions(+), 5 deletions(-)
---
base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

