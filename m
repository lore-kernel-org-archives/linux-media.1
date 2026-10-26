Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013043;
	b=mgecEw2GsGcpaPt9DGwvr1nfDh//KVQVQkW/cqOcqXePlCFgi5qmiWTgh5mfVjSquAct
	 HbsvD9iFIDnrWoAvYGp9ABKvtuRgKz+5WaRkzWksC7Vc+fSxbJHiph0kDsqDVShf/s81R
	 p9BtFHu+gDm24qOtkTnsFaws360deB4e5qls3Sp19sOhJJHtIct+ovFwpgsFZQU+12rN+
	 S23jgMri4cL4ACedWe2BYGEcoX3MNufe3LEmwFhIAQblMDTmZRlt2+uIpOipuv+nmxFn/
	 1OzMkmpZeUP+HXvyleOYbvb45/IMkUwOc03s/zGBrXhinkEseGLskcI8fTQAGa28rNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3skT80xn6avHnOifeNCjAY8wDgJalatgrsaykd9zQa8=;
	b=MBCJDanz8eV2JB+uiIXCQTjInpAMhJ9NCw/GIb1ka/bLIPoZVCMsyYBUwhVa3PExh3IN
	 MpSkFpzdJ+ZZZ9DkT0RSfE2uyVr2L0/h8GwDqXP9box6dWv1o4+kRS16vcnodjr9cqDWA
	 OzSECZ2tLOzUegQoIiGTItCVzsn+iPT+om7H2myQVy2UIyHvqOJ+g66Xf//1b1mqpdTLU
	 0ptwrIlE3ShazMJGo0qtnDrNlBjLX3SIuSO5ZmCSGV89l9zduVAkWXI3D7nYRcd1rNzTm
	 3o6TYqCYSkCVaQxqTx1svNX9d4+Nr4zEpBNpIiaYpQbSoESPfwCnEWGCa2wDXFnOEBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=joSZ1tRi;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA7D60A6F6D
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 11:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA7D60A6F6D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=joSZ1tRi
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd69a51d767so58485a12.3
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 04:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013042; x=1793617842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3skT80xn6avHnOifeNCjAY8wDgJalatgrsaykd9zQa8=;
        b=joSZ1tRizUp8DRq6YgfdH7JbuA96xkUqa5EhhOTrX79uFoMSZfbkUIOGjxlqdP2tR/
         PgjQEXOxtHrVprFB8/GrGpZMI0hX8BP+ghvr5c4aJ8dnle+Kmn3JDhkpBswpQ6333a8o
         QaJO5SuID+ZqtcSX07Fe2sLLYIFPnXzsUb6M/YdAv+bqS7feqsdfbVGUQdaBhlJArkkG
         WnTvRJ5GcHiUnx5gTCCDjB0kdMNzUCKiCKRWlvIkNO1R2dtHt6xZ9zBzbSkfYFv+ufGR
         4kWjIWu4bRuSSWJhCyCe6c9SYd9FLyxvDihiKfhj0WFl9ObCe5In5pqX0XYkHZ6vq5fz
         4N6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013042; x=1793617842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3skT80xn6avHnOifeNCjAY8wDgJalatgrsaykd9zQa8=;
        b=HahTTR06Zl6CL9dKFpLPDKk9rJ9b3M8leEXDHSOZZ12aYFe84NyLTXy0W//vvQ7/iO
         QzRE2iUBOL2mZSz308AXwe8pI9vdGug9h4BDYrFD6W8//9W9nq4x1ip41OrqFwZu6X3X
         IIUbY4Qyhi5fucpq5BPNyBV+Qum6TPOzqi7Rst2U76lrrg21KNTYYeSdASZ31hmo+zRl
         wfgCarhFygu0hJliySs3/zPyaKsIRSNXqrqWaBxE4GftTcxrmFOwbCGw+hIPHUR0HnaA
         53mzXmKudosnbr4yY7f94j6NBzRAA9DIPtXAh9hv/GMNd2rrwxoDOuIt66thO4sl/f07
         GNjQ==
X-Gm-Message-State: AFq9FYJKbLUiCFqQhM3VkeUy3LPlCwFitKBn3ewIIz8ygXzBayGo9O12
	tM7z+RSLnW3zK8oSCvIO7sVypAiU32qXPKevhNgeOKT+xTWq/kWJ1ZCb3xJ1VsICWMI=
X-Gm-Gg: AYBFou2JUDo8Ezh9uKqydyO6botaK3foaojj69mhsQXS64UKGqDUWMXgbmfUcFdEsr+
	VpELoWEfjkHPTmHHWSBM9n1+GSNHZPWbv727Ijjed7etAZcs7hDOxIJesniBa6OiMR1J7DqMrSd
	71D9Az75duxKEL2/8+gTk++Y2sw+nb8ygRnezXkgkZ6ytol6Aofp9tJG+CsTeLDdo4L1B+AP3UY
	JV/1pCm9kl4GZioI1CnYev7rQviLoiXqGeykyn9uTaayidVLIfyyGQIxsritSEKD9SvTlssPS90
	FHFyx3FT0k1JrDnIHth+Cc7KBOACY+iFKMrKTLZfMPN2XS12BeH5hFiDcDBVmqy7VCkkaU98Jtp
	NKw73kJnVcvYOm0XFle1kcblOwykkbMNjSAVwmg7sLhQSfvXYBXgknEo4LSII2Wcx8pJGaUom0r
	9YoBBpHTvmvBvUCzqSvgCFHY8Jb7xz2PsXve5wpFaeWCF+7bUm8fU9NkgTCL/ojp103qOhLI952
	0uw1BmW0xXqPN8ZDEjj3sBkPJKcSjpPSjBS7MD0TmwZh64L6q25sQDJVf231hOOZHi3QX88dBmJ
	74Gzsj/NizzvFNKgzhLE6NqLNFTUmUAZAF7KMK2vuC3NVx5yg0XVVd5u2KhV69rnNuPLd+KmjIB
	Yp8LW8lpYl9jP9gORYV+P5bp7HB36XLJOpZxaX9gYCT7Oxw==
X-Received: by 2002:a17:90b:52cd:b0:3ac:9e76:aa96 with SMTP id 98e67ed59e1d1-3adead00d90mr8351812a91.3.1793013042309;
        Mon, 26 Oct 2026 04:10:42 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:41 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/7] media: i2c: ov7251: Reset vblank when the frame interval changes
Date: Mon, 26 Oct 2026 20:10:27 +0900
Message-ID: <20261026111032.88355-3-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
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

Setting a 60 or 90 fps frame interval is accepted and read back, but
the sensor keeps streaming at 30 fps.

The three modes differ only in their frame length (VTS: 1724, 860 and
572 lines), which each mode's register table writes to 0x380e/0x380f.
Since the V4L2_CID_VBLANK control was added, s_stream() applies the
controls with __v4l2_ctrl_handler_setup() after the mode table, so the
VBLANK control rewrites VTS. ov7251_set_frame_interval() switches
current_mode but never updates the VBLANK control, which keeps the 30
fps value (1244, VTS 1724) and overrides the 60 or 90 fps VTS at every
stream start.

ov7251_set_format() has the same issue in the other direction: it
updates the VBLANK range and default for the new mode, but
__v4l2_ctrl_modify_range() keeps the current value when it is still
in range, so after a 60 fps frame interval a format change would go
back to the 30 fps mode with a 60 fps VTS.

Update the VBLANK range and default in ov7251_set_frame_interval() too,
and set VBLANK to the mode's default in both places, as is already
done for exposure and gain. The VBLANK handler then also restores the
exposure range for the new frame length.

Tested on a Microsoft Surface Book 2 (IPU3 CIO2): after
v4l2-ctl --set-subdev-fps pad=0,fps=60 (90), v4l2-ctl measures 60.15
(90.45) fps instead of 30.01, with vblank 380 (92).

Fixes: 1b598f413c7a ("media: i2c: Add vblank control to ov7251 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/i2c/ov7251.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
index 1413f1856e..8dad747f77 100644
--- a/drivers/media/i2c/ov7251.c
+++ b/drivers/media/i2c/ov7251.c
@@ -1261,6 +1261,10 @@ static int ov7251_set_format(struct v4l2_subdev *sd,
 		if (ret < 0)
 			goto exit;
 
+		ret = __v4l2_ctrl_s_ctrl(ov7251->vblank, vblank_def);
+		if (ret < 0)
+			goto exit;
+
 		ov7251->current_mode = new_mode;
 	}
 
@@ -1414,6 +1418,7 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 {
 	struct ov7251 *ov7251 = to_ov7251(subdev);
 	const struct ov7251_mode_info *new_mode;
+	int vblank_def;
 	int ret = 0;
 
 	/*
@@ -1442,6 +1447,19 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
 		if (ret < 0)
 			goto exit;
 
+		vblank_def = new_mode->vts - new_mode->height;
+		ret = __v4l2_ctrl_modify_range(ov7251->vblank,
+					       OV7251_TIMING_MIN_VTS,
+					       OV7251_TIMING_MAX_VTS -
+					       new_mode->height,
+					       1, vblank_def);
+		if (ret < 0)
+			goto exit;
+
+		ret = __v4l2_ctrl_s_ctrl(ov7251->vblank, vblank_def);
+		if (ret < 0)
+			goto exit;
+
 		ov7251->current_mode = new_mode;
 	}
 
-- 
2.53.0

