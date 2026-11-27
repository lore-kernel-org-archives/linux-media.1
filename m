Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779690;
	b=xiXnpXiQk/GdhuFO/cXTvF7RwzTaHfCabH/m4blfKsxI8fgtX3j3YjWe6p3nmzYVrA1z
	 fr43MhrZ5ajVJV/EtyVAbDG+iOGL9TBXDRfGya3n/ayEy0ulGJUv6j/81j3tQHexnq+++
	 ibp+1M8QKXWieGpG9yVsqOl6nKV624lSQnBasbaH7T0wujh0eZ//wsjZMR4ku8LIZ/+PT
	 /HdYV4+CeofIcIC+CaKt4QkilR1LyXh2rGg04qSzAkTBVkQxn0zK4hVHh3VxHxGD0B2oF
	 f2NmRGLC5noJk/eY/Yh+jrA1gjwQa1VnQ9deqTz9DVhne+h+xuAbfBgCIDrIFQ/bpJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779690;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=NNuD8/rD+CZ7LYGMl3ibAfsexedc4A/iD1FFwvCyjRs=;
	b=QiH0glLYAgDALkOccWEKguZqZFZ9WKRnxnvGL5AXU7CEAronYxC1o1ko8QhUUwetYKLw
	 ho51J6xWyy9b8ovGXjFKP+MAdEIXKj01Hs634ZlDM5pYfou/Q5g9jL5QAJVvGn7rlYJbl
	 Qepn92VVUaI1Aj8VD7isrfZu0lBRnoKwus49hp4Iu21mUXiEBcFP2aPVEQhyecaZwgWiv
	 0mwCtLP0ZPpTW+b5X1e81GkeYc7biarFMYpoh6puC4yGezfWhziLLu9iw22LjnfAcDw7w
	 VoTkyHmc4xR59gMB2U+mdA4M/3WiKbJHmvjfrXW3IA7PUmDMb5RJ13jQYnoABTq6fiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1E1606A31E;
	Fri, 27 Nov 2026 11:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C1E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1795779668te8a8b6bf
X-QQ-Originating-IP: qsSUy/zeJaXmnDwEj9xqT8wBZ7ebb7+1Mc0we8fEgz4=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 19:41:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2641158068435523113
EX-QQ-RecipientCnt: 20
From: Xilin Wu <sophon@radxa.com>
Subject: [PATCH v2 0/5] media: iris: HFI gen2 features and fixes for VA-API
Date: Fri, 27 Nov 2026 19:40:53 +0800
Message-Id: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ6CMBBEf4Xs2TVtJVA9+R+GwwKLrIlguthgC
 P9uwbPHl5k3s4ByEFa4ZAsEjqIyDgncIYOmp+HOKG1icMYV1rgzShDFSNjJzIreejamKImch+S
 8Au9BUm7Vj/VdP7iZtpGt0YtOY/jsh9FuvX/b0aLBPCdX+lNXeldfA7UzHZvxCdW6rl9sQRZ8v
 AAAAA==
X-Change-ID: 20261029-iris-va-fixes-818e0067aa28
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>, 
 Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Loic Minier <loic.minier@oss.qualcomm.com>, 
 Jason Pettit <jason.pettit@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>, 
 sakimidare <ssmzhn@163.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3881; i=sophon@radxa.com;
 h=from:subject:message-id; bh=iPhwtFpnpU2UaCAbG8CAkdvNEWSBR7PWJzlhi0bDqwo=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDNmcOb7VjrWtBcw61VYFu6sqMlnStISe5GzYy/hVYNnfb
 zyHdhR3lLAwiHExyIopsijEM8xlr8y99lSsVA9mDisTyBAGLk4BuMmzGBlWlgc8uVHsmfzgL8ft
 WMNDZScb11//7TPTMapXaOfjGb6LGX48L3K9FFtYkbPQ5HqG05zVrHYFO4Mu8cn+/FznxW8ozgk A
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OETN/NFvgZ2KibuvaaDtXyzv6Qty1neV99HfYRAEpn9GFQ+0oMJkxg1i
	YHkdIQkFTe/5S0cLXqEkRJf3xktf1mXfrhkCQUP0Cv2mkwmFqnlCPRAHkxuD7zeV9loXhKb
	av+5txycsgIgKd3/IBWvYOc5O2ynP+M6RUdeL8MYai/iGP0R5JGbIgVwMcgSjeU2wPJ8vvn
	XpMHR3J5XBmFOuq5OF6k6nBpVy6slXNgZ/4n/DuTp4m59rrK1/53ByXxOuu7d8+OamvOJ/7
	vC8uPcR6FoCI8IobOoOvLQyMu9aFdptXDXKgbZ5La5iR8LjPRZMDkcfcCnO/dkodBWDWJ9/
	UA0eZwD/DWiy9ml/xhmLfbIbpksiCPXCCHdrqCmTK+p6dusVbD27/r/OIxINNQGzQv1OT0p
	03yvlBTY8nZc1QRtLX4F+SMQRzRDynP7IdJwBzTlixjLRW0ixf8HrKx2NXy+pQatd9xZvh1
	N0WofGsAAwpE3oIhgx0YBYpLYaBOWMbOsyTtSvq8EaaoiJgF4DX5k67UbvReycSgqC1kcB4
	5mzQQQSBtf5Qyxr0AbBk8rKWdO6XG+n7m5xnzPBMlLupyEW0lBsPiTFgpbJBYCGR+yjbJsq
	wCZCxoqeLBZWCRk/H4xQ3oKVbe1As3jno8WaZL/9Ssr0KQqZszq/SwSHxLmKhXG2bhxHSDj
	OX8PZMVtXTnZgd0clvFM4P91lEEuWoSrA77z64t1YZwZQd+1X+m8kuSFzAHnYIZAr8GGP9h
	TbKv7kOH8CG3Fzm4jh8wRDahv0ze4tazyx3Q8uF/Y/01PKa+ZKw24cRL2dljsTSNUPGAnG6
	8XAFLbe7KqbzXXRsL5PLKJICdS5rbjfrgkUL9WjctzGcOZj35u3i1FqCQ4L/0dDGEZQgg9D
	D662kyvfi7Ai/eM6BB1jIzxCAoIvOUTfBxQ7lYo9GRDJO2WSue4dRSiZBAy5iAOMCV1L6Ik
	CKfIzFw/CDBTRP57WOcURzLA1FrG4IuU/t3IttxbwQ3SAR5VgNZzVt7QRvkpWaPP/JN9rA5
	vAVi/ONyOsjbKN/djmx+Kn4D7AQjMTIyogDZM+vSvIu4ErfQvnQYpf3SggliQq/PGuYOLum
	w==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

This series adds features and fixes to Iris HFI gen2 to support
qcom-va-driver [1], a userspace VA-API backend for the V4L2 stateful codec
interface.

It enables decode-order output and larger CAPTURE buffer pools for VA-API
clients, and exposes encoder deblocking controls. It also fixes
error-buffer timestamps and handling of non-display AV1 and VP9 pictures,
which affect both VA-API and direct V4L2 clients.

[1] https://github.com/radxa-pkg/qcom-va-driver

Fluster results on SC8280XP (Radxa Dragon Q8B) with the HFI gen2
firmware (video-firmware.2.4.2) and the GStreamer 1.28.9 V4L2 decoders,
on a v7.3.6 based tree carrying this series, with and without patch 5:

  Test suite        Decoder               without 5/5  with 5/5
  VP9-TEST-VECTORS  GStreamer-VP9-V4L2        201/305   232/305
  JVT-AVC_V1        GStreamer-H.264-V4L2       77/135    77/135
  JCT-VC-HEVC_V1    GStreamer-H.265-V4L2      141/147   142/147

Patch 5 fixes these 30 VP9 vectors, with no regressions:

  vp90-2-02-size-lf-1920x1080
  vp90-2-07-frame_parallel
  vp90-2-08-tile_1x2, vp90-2-08-tile_1x2_frame_parallel
  vp90-2-08-tile_1x4, vp90-2-08-tile_1x4_frame_parallel
  vp90-2-09-aq2, vp90-2-09-lf_deltas
  vp90-2-10-show-existing-frame, vp90-2-10-show-existing-frame2
  vp90-2-11-size-351x287, vp90-2-11-size-351x288, vp90-2-11-size-352x287
  vp90-2-14-resize-10frames-fp-tiles-* (all 14)
  vp90-2-15-segkey_adpq
  vp90-2-20-big_superframe-01, vp90-2-20-big_superframe-02

The HEVC difference is PS_B_VIDYO_3 timing out once in the run without
patch 5; it is not related to this change. AV1 was not tested, as the
SC8280XP VPU does not decode AV1.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Changes in v2:
- Patch 1: move the new caps entries and switch cases to the end, to
  match the enum order (Vishnu)
- Patch 1: describe the controls as feature parity with Venus
  (Nicolas)
- Patch 2: add OUTPUT_BUF_HOST_MAX_COUNT to the HFI gen2 decoder caps
  and size the CAPTURE queue from it, instead of checking the
  firmware data (Nicolas). Dropped the Tested-by, as the
  implementation changed
- Collect tags
- Rebase on next-20261126
- Link to v1: https://patch.msgid.link/20261029-iris-va-fixes-v1-0-44a2783f782b@radxa.com

To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Bryan O'Donoghue <bod@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
Xilin Wu (5):
      media: iris: support decode-order output on HFI gen2
      media: iris: allow larger capture buffer pools on HFI gen2
      media: iris: Add deblocking filter controls for HFI gen2
      media: iris: Preserve timestamps on error buffers
      media: iris: Recycle decoder buffers for non-display pictures

 drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +-
 drivers/media/platform/qcom/iris/iris_ctrls.c      |  93 ++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   1 +
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c   | 166 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_hfi_gen2.h   |   2 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     |  29 +++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  47 +++++-
 .../platform/qcom/iris/iris_platform_common.h      |   8 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |   8 +
 10 files changed, 360 insertions(+), 6 deletions(-)
---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261029-iris-va-fixes-818e0067aa28

Best regards,
--  
Xilin Wu <sophon@radxa.com>

