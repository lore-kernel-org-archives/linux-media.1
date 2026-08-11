Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609BE455178
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 17:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467870; cv=none; b=lMgj2/7JuLYepNWjf60ogVLyd9uDKa/t6wBDvBFRUj6fPbVOGk+kKxtuwJZTk7h4X2n5PEtxd3I81ywkF1+PvyOs8TcNCMuJeAjov3OywoRzWROz2TplJQLBBOJi6+z/kHjJJQClpZedTmWBoIQRRmk85aiXaBVmdPvzTHvJm0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467870; c=relaxed/simple;
	bh=vdpP61MCm5bXU8A6Q4MnoD3bcymNzPoF5FLuM2SvQfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lhVIWSTucSDdNwdEv058qVWZ0G/GP6qSUuIbSdgrvwEGbJVgl3H1sZP8u8zWgjtGxLeEhIrvrIvixwNcGtXq1PhmO/diT27rqschNbDbmFheuoYAcFlx4D8Z3sMBzHV8tRkJsjwGV6wWTrdfFDQ8B+ISsbXNonEd5/C493u4OhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wixsu3tF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wixsu3tF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf27856f9cso1648145ad.2
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 10:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786467868; x=1787072668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAJoskou5n92Phcb8worIh9SYlutPE/5OAZ04N2Fcs0=;
        b=Wixsu3tF1FmcSb2ncGCV49zz0CgT/HB2n56T9RT3Q+emjt7N30DMp25OH69PllMPTB
         dxowWBb/uv68sjXVd22h9f1iHlaR0NIN/IoE4gQ+H28luiblLBykpQZRJCltJjGISWpE
         SfrsBcgbhslRl0hMz/vfhyVtmrpcf/83fzh+54CTqk89PUaJlt7AGVBa9usN1zN4JzL4
         KwLfeRd9qALBiiaAjHqApdNKb+UysqzMHWpO/7UcTGzg14wB47e4qIaEeZyLf7VOk5Ot
         hMCj9dOqCjDwtdKHayp5a2AgcBHhEorloM0u0CfgiLWLnxi49IP0AAMw5Aqb37EZxNJf
         UsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786467868; x=1787072668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAJoskou5n92Phcb8worIh9SYlutPE/5OAZ04N2Fcs0=;
        b=NwAy0By/gLj63bZ7wNFroMNwOGk7pIpQ0mjqfJIWpOZC5C/LOYYRIvIGKr64N+jQ3x
         kx7sbZlYpXnAvqQQs3zYVm82vw39b3wFUzuXGdVx++MCaCKOwkw6qCqNelkr4evnn6Sq
         XcUuXDNhgyYKFnBmhza8PSgok7jRJLnIySdgMgh4qpoMy/xigjxTYODIb4PLpqwA4Jeh
         GN0ZcAqkHC9UBQF3GIeiNh1qpAdFjqRNxpuH6sfHvO1pRdLkv1swF3RqNIFvYpV6iajz
         HF0X5yJXMeqX/siFDb5WDL+ePRnhvLr0g3CbnyXVsSqMTI5Gvix9VczNU4O9qdYaOoS0
         4YvA==
X-Forwarded-Encrypted: i=1; AHgh+RqE40I94xlQjm3JJJQ1ID4GRCptn5wPUMhP20j8hSPw9LfmjgeeVG+DWURKp2k/8GVeiluZp/ayHp36pA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+4gSZv7na/aYy+2OSjetNEeJO7cn0Cphm673qMEKFVUaInId
	7IJdwjRcCN+dm+dmNlkffu3eB9pFJNxRY7ehU+MCQCJHGRYVXlkxk+lC
X-Gm-Gg: AR+sD10JSZkpakpXI2KgQhTX19B6UZK2N2m0vH/O7ZboQR+hg/ng58moVaY90BnekKc
	A4yCPiQF4HdmqMU5W5JvADHE/ctXCXqEuD9/SjbvLLWMbBTbC+DOedLMNfzDczJ6ZVlZvliR9Pc
	VYfZ+JP5nPQtx9vy5O63/mkfg5OY7anK7aJEXXTVULr6Oyx0gQnfbkoHDMyIXKU5uR3CW1jkKUC
	wT/GvOzuSOhL6R3iDu6qVrUIyTDKJ/VMZ4UTQ5xJvqoqEMFx1Kldb3JlKo1gtcZ6zSfOEnbhLra
	0wR4dNRqwMHzSoXwYv8CIfjH4Sa4nQq4nKeBx0Yf8xkOElqtsxO5s9WuJ7+tWyMnYeZJS3+tLhG
	Qd6JfRJATBwlX/d3oJLeya2/GikCri1v/kR4UYEZIVVbLHsnz6CPZJhyiyQ74RYjz0u4yEnflAr
	LFdOp5wdRoEFsWBcELXpulajQu3KXPoLjyQ82nod++0iqShcFXx+tCVa6k5mUnHVLL8aCPC0sWp
	i4xA6pQr5jdg+zkooj9YFQULYxfDQz+bA+/qYCiQ8hM
X-Received: by 2002:a17:902:fc46:b0:2cc:6329:b7ba with SMTP id d9443c01a7336-2d32c0a887bmr25417615ad.16.1786467868392;
        Tue, 11 Aug 2026 10:04:28 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([27.130.14.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f29d82sm11371855ad.20.2026.08.11.10.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 10:04:27 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Pavan Bobba <opensource206@gmail.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH v2] media: v4l2-ctrls: default HEVC SPS chroma format to 4:2:0
Date: Tue, 11 Aug 2026 17:04:14 +0000
Message-ID: <20260811170414.644-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com>
References: <3cfca6fd11f39c6ce161d5a2e7fb650b2e9289ec.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default value of a compound control is zero initialized when no
explicit default is provided. For V4L2_CTRL_TYPE_HEVC_SPS this results
in chroma_format_idc being set to 0, which represents monochrome video.

Most stateless HEVC decoders do not support monochrome video. In
particular, the VDPU38x variant of rkvdec fails v4l2-compliance in two
tests related to V4L2_CID_STATELESS_HEVC_SPS.  The Control ioctls test
reads the control with GET_EXT_CTRLS and writes the same value
back; TRY_EXT_CTRLS then returns -EINVAL because the VDPU38x
rkvdec_hevc_validate_sps() rejects sps->chroma_format_idc == 0.

    v4l2-compliance 1.33.0-5491, 64 bits, 64-bit time_t
    v4l2-compliance SHA: b32589c51481 2026-07-16 08:51:38
    Control ioctls:
        fail: v4l2-test-controls.cpp(942):
	try_ext_ctrls returned an error (22)
      test VIDIOC_G/S/TRY_EXT_CTRLS: FAIL
    Buffer ioctls:
        fail: v4l2-test-buffers.cpp(3102): node->streamon(q.g_type())
        fail: v4l2-test-buffers.cpp(3157): testBlockingDQBuf(node, m2m_q)
      test blocking wait: FAIL

Set the common HEVC SPS compound control default to
chroma_format_idc = 1, corresponding to 4:2:0.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Changes in v2:
- Move the HEVC SPS default from rkvdec to the common V4L2 control core,
  as suggested by Nicolas Dufresne.
- Default V4L2_CTRL_TYPE_HEVC_SPS chroma_format_idc to 1 (4:2:0).

 drivers/media/v4l2-core/v4l2-ctrls-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index ba047d7d8601..d7adf334a0ad 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -112,6 +112,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_fwht_params *p_fwht_params;
 	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
 	struct v4l2_ctrl_av1_sequence *p_av1_sequence;
+	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	void *p = ptr.p + idx * ctrl->elem_size;
 
 	if (ctrl->p_def.p_const)
@@ -185,6 +186,12 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		 */
 		memset(p_h264_scaling_matrix, 16, sizeof(*p_h264_scaling_matrix));
 		break;
+	case V4L2_CTRL_TYPE_HEVC_SPS:
+		p_hevc_sps = p;
+
+		/* 4:2:0 */
+		p_hevc_sps->chroma_format_idc = 1;
+		break;
 	}
 }
 
-- 
2.47.3

