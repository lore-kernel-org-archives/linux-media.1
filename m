Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9164A4779BB
	for <linux-media@vger.kernel.org>; Tue,  4 Aug 2026 20:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873950; cv=none; b=G+su1VMTcpXeqURJqfUBZHfNdPCY0ce+j6eyRbaDiH9MDwaH61YZR8/E//nSfm5hQ9RS2i4NjYCdhc2ZgCUrXZwcovqiPNeGfuLJ2cvNSN64XuB3q0LifM3pxY5nni6+d7I7eEriIIPUsL/Jdgu1/uVhkKhvS43qpFiTgvOq78Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873950; c=relaxed/simple;
	bh=F4eRom+mPRM8WPl4zLEIBCtxYZUV9K0AiT2pLQPIlZ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C5PbJ96ZQJ8aYOTfQMsFGJP41FypSUsxdvXvPbJdPK4wooSv4m7pwkB3xim8GPo3NnSEZgjpz6FJaXUtlhk2jlpLatgblMN/vabHGnYL7huq64ObF9Xyptdusj60qNBGeSKIrdedNhPluGkKoWMQc+wYjTfwYcmmkU66hZEtYHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K46G3buN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKOYKVbC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K46G3buN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKOYKVbC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JmF5K953037
	for <linux-media@vger.kernel.org>; Tue, 4 Aug 2026 20:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XTGknLvikyR+GyVgHHN1w5
	ngV6oc7nT0mEeTgJzXIno=; b=K46G3buNeoJubdqJn6yznSGyU6fclo0paXEucZ
	nVMWpuIRD7h3VCMa+v3cVnXiQ0qIGykd28o6Yer+ARBHJypYwY99dp8bpzeog9+B
	l0njbscT8WkpITtDC8FsEYv8VrL36zjg4jIFlPih/poy9umTrVciX0subzHp9UOX
	03t/PNrjNOItc4+hTbB+E0iBvzHBOhdItoPe3yR1iTuDRUJmjW4r3NXOPa8yHNNg
	q5kRUELnHsz8ezrfv7Jf2uVY+eKT+zEmHyc24SLgn4uv1sxYnenULfQP2/jL4ROH
	7GRgxaJET8un8ZGolGlqox9oMkOWJGHGNywDdyiWYJvQKklw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum3q8u8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 20:05:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca0ed258cso795165ad.0
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2026 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873946; x=1786478746; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XTGknLvikyR+GyVgHHN1w5ngV6oc7nT0mEeTgJzXIno=;
        b=DKOYKVbCSOvDaRkMSi/7FcaKBJLIBQ/j7nnzSLMhYneTd4WbWM+YKzSLuw1moiFIgn
         q2WEu9dq/CE6IVKIQ+kq6bVRPVdnduSJH8vG+G+mlc9lCGuBFBKwftKCRfsJHW+GXUsH
         HLn0zHmATTfVOZmDgwr0nR6OEM/PpBmsM/ZdrEZiFffPS4ZEDFTA0NzGmZT3UsLmJfXE
         luKFdV0Gfrj5Emaspn9N9QQJ+RYG3hbEJIH36Lft9lbGhvpvIIwm09Y9Xdrg68KIP4ZH
         PzLKeShp0az4W6kx7Viukq4KmYLrE5Zr1AfSzyXXCMYa5jTwx14yhbqDu0/byUpYxODY
         NYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873946; x=1786478746;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XTGknLvikyR+GyVgHHN1w5ngV6oc7nT0mEeTgJzXIno=;
        b=gGdTBRT80wOkEGiZIglQiasNbVYjmDAlAgyuLiTZYdopKIzM9dUAf8Yu/1s0cIZLYJ
         i+7B8l0JVWmf5rGYXbIYAGj7CS/C5Q5YN0Md3uFMEOgG1RLpxp9AGCVef2P81gbgkKyh
         G2d2dbkTpbpMsz98A4NeOVCnx8cvgloWK5AZgYpyVmpVXt2UJzb12loFqWiQeJFlAEcJ
         xMZ62qr5s2yUS/F3bUgwBXbp4dbW7zBbyrU1v+cXkj07DTPDZRXDZq0T+ECpbPyMoiDA
         XuGVSMb6yQBq1DkZ5EHkJ21rDor7vCVeoPe4Gjq8qwnCX8rYLoOnq/X8HLb5R/6k3v/b
         IWjw==
X-Gm-Message-State: AOJu0YxayVODEtyCyMnMjxF9hAUWhTM+xLtxJkFqqZumzy5mAr19HIUD
	q5wBzwYKWcM3/gmoRLSfomaXdHxpl9bbu7oPVJERQ+tW0K45/Y9dYswVSvZUFPXvJzDKOiTHG7j
	QtQYil7VA1tq3uq0DuzQAQTT++feNwK+GPj35PVKtNCWg3w92g5dSpAdPR1JQbi6CXQ==
X-Gm-Gg: AR+sD11uAL9vl+/SpTwnAHZuQQSR2AlRoYShdjYGa41LoD52TZlQk/6JbntFBl/Oika
	3kIqTfFp8gwFbhqxPfsJm+6LC78/nIJHjzMSUY7EwVnqPvI2ZGG8EGXayEtjiWEzg6vwD7Pf4Md
	V4ZZsrZCBjGzAmRlhzVW9Qt8zp8DQjTscc1+7u0Jr/w3T7YZO8fBXpXENPhNRrFSn4GrBDU7ZIP
	qzHWgcWOy6u+YYa90bTkukBoIVvON4E5b9EEhTDuz6jUzvpLjCt1P+XzldwrZZPx6Y7D/fViPh6
	1aH2YwifSlAMqUBVklHNR5Uwdqm/iYeYb2RsVlMG0pmByvGDzz/LKl/vf4BvKEUjC+x3XLa1OmP
	dndhhcp0ParaTVpAxFpslHmgvfkeym3VEQ85qiplmb49Ri9tPjFsmUhxbL88H
X-Received: by 2002:a17:903:184b:b0:2ca:ecf6:9105 with SMTP id d9443c01a7336-2d0ca6010d1mr10364195ad.1.1785873945981;
        Tue, 04 Aug 2026 13:05:45 -0700 (PDT)
X-Received: by 2002:a17:903:184b:b0:2ca:ecf6:9105 with SMTP id d9443c01a7336-2d0ca6010d1mr10363785ad.1.1785873945396;
        Tue, 04 Aug 2026 13:05:45 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be99sm14457146eec.15.2026.08.04.13.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:05:44 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: [PATCH v3 0/3] Implement Region of Interest(ROI) support
Date: Tue, 04 Aug 2026 13:05:35 -0700
Message-Id: <20260804-enc_roi_enable-v3-0-e03b622a2d48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA9GcmoC/3XMTQrCMBCG4atI1qY0P6bVlfcQKWk6sQNtookGp
 fTupt24UDcD78D3TCRCQIjksJlIgIQRvcshthtieu0uQLHLTXjJVamYouBMEzw24HQ7AJWdqHd
 GVrXQQPLoGsDicwVP59w9xrsPr9VPbPn+pRKjJbVgjZFQKSvE0cdY3B56MH4ci3zIIib+USomv
 xSeFSVULey+aw3YH8o8z281SFMt+QAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873944; l=4974;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=F4eRom+mPRM8WPl4zLEIBCtxYZUV9K0AiT2pLQPIlZ0=;
 b=hop2ocVt5yrIRsyiqPYiZJuklclVcxfpgELAUIR2qvbFlTAflLVkwC8LjQCaZ9t0K/DSe9gDS
 +IBe5ciz5geA+dt4tc6saVHjylBSPgGLWu96OZ80s18Tx+M1uGpmFL7
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MiBTYWx0ZWRfXzPQadQC2XkNd
 rN22YbztcpcR1EYirL+aZiJ0CaBsuKbbZlJzadaylUyWkQ1Lr9sSu15Hz5hadgj7PiTTbm7s554
 8VMi8jhyd/HJsmHQdqeEdclXBKHMMvT8fpPixh2Uz+pEsKwv1/UvTtflKxtbfRm1PrtFZjEXJbA
 duOTOIPffu4OKc263w7N+Rs5DEv21jT9XeyJRYmg68+qsvMiRT1XRs2OyHH/qfSwLgIqPHgjWz6
 WAc/WqtAUjrcKsZVHQ8Z3ST6Ajj9CtY4CQ3JRNysRNUangM3o4jsBtVZgjP2AoVOmFVB3/wCL2Z
 1tuPKbpnPHrddWLBVzgsjwt8gt8EZCu0S0KcK6m3bDSLuNzGdg8M+yymqqGGGqeVKyLocLjpNxO
 lxgCoEIV13DJqp2tmnVfqiULcMv/e/AExgUa3zDPlNC9CSTsto2SEJLC1SpLNTKEK/90/H+/lEP
 xFFrp4SqQ9WY/fatFFw==
X-Proofpoint-GUID: WixUENAyUALKoUoMAWZeMnGXMrnInNKD
X-Authority-Analysis: v=2.4 cv=LsiiDHdc c=1 sm=1 tr=0 ts=6a72461b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=Um9VFfwTIzMb-0Dl9GAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: WixUENAyUALKoUoMAWZeMnGXMrnInNKD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MiBTYWx0ZWRfX+vgNDZ3oFwLd
 IfJD+kDcrm3Ndj/oFQn3SkfRFymWhRlGmRqWXFvu4EqCkjItAkbrdh7XBBiQfeGzsjowG/oxHbo
 ZPIN7y+13l2Dk4eqvUCz28d3oLdO3dY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040162

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
Deepa Guthyappa Madivalara (3):
      media: uapi: Introduce new control for video encoder ROI
      media: v4l2-core: Add support for video encoder ROI control
      media: iris: Add ROI support framework for iris video encoder

 .../userspace-api/media/v4l/ext-ctrls-codec.rst    |  19 ++++
 .../media/v4l/videodev2.h.rst.exceptions           |   1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst |   4 +
 .../userspace-api/media/v4l/vidioc-queryctrl.rst   |   6 ++
 drivers/media/platform/qcom/iris/iris_buffer.c     | 101 ++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  22 +++++
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 104 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   3 +
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   |  14 +++
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  62 ++++++++++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_packet.c      |   6 +-
 .../platform/qcom/iris/iris_hfi_gen2_packet.h      |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  29 ++++++
 .../platform/qcom/iris/iris_platform_common.h      |   5 +
 drivers/media/platform/qcom/iris/iris_venc.c       |   4 +
 drivers/media/platform/qcom/iris/iris_venc.h       |   2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   2 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c           |   1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c          |  25 ++++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  10 ++
 include/media/v4l2-ctrls.h                         |   2 +
 include/uapi/linux/v4l2-controls.h                 |   2 +
 include/uapi/linux/videodev2.h                     |   3 +
 25 files changed, 428 insertions(+), 6 deletions(-)
---
base-commit: 31152f5b0f8719f92063b8c6196cd5e34106c73d
change-id: 20260616-enc_roi_enable-4d385c4783ae

Best regards,
-- 
Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>

