Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3209259C80;
	Sun,  1 Mar 2026 02:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330470; cv=none; b=cVRXYTUaedGs1k0ePXAMGdK+3cerZI1GcchiR157CuUQoN1btvHIkgKDpsTQJecIgybfN/1LFGAY0KFOgGN9fk6q16yB6cVBqI2BQSaICJpWu0puYijiDBoCHv363LLfyLoaBDgtvAWMk4nYmhh4GDQz99nYK8t5XM4lAQI0DaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330470; c=relaxed/simple;
	bh=VNgtfyLuC85mr4lkWgNIm5pBbPO3UbsQR9KQa+gnq6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sqMWmf+w/7tLnHKvaIYUne0PEbLeQctUKPI6iAau8MGBfTf0xR0bLMD3UDxIp0D1ORpWN5YuJMbMisVob9UXQQGdCNemX0EK+RI1LS2U4WQf8nsoF29UOdeav1VOQpXz4B9xzawIinLiJB3meJTvUOSgrw12j7sfPgnprLw7Rq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFVKl1Jw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFVKl1Jw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD71C19421;
	Sun,  1 Mar 2026 02:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330470;
	bh=VNgtfyLuC85mr4lkWgNIm5pBbPO3UbsQR9KQa+gnq6c=;
	h=From:To:Cc:Subject:Date:From;
	b=pFVKl1JwR3JC+97DqHhIdOz5apZMp1aPJmlRBtyiB1AIJiXsosCjnOA1resM8/HP6
	 0sjWY9ik+i6IFYw0hMX2+BdtwBWREM3ZSWB29xjdUdRqVwT6HL14FX+a6+1SWnQHVZ
	 rShmIBDg/TxCDhjb2jK83fR37dSLvhNEdWj1QY8KEAyH5rM8pbZPrV94sdb/12D1DA
	 I5cXRLUNjo5mixCmPAu3eiCp1lpbIwtZnVd/egDRYwsElIpBgnixrNn2wAcHBrHhgz
	 J/2obskNEZ3nBU/nKbErXaamdT9aFEZYC8ScO5KXyFWdXGK9cu0TYA+w9+cWVIQR9i
	 wu7N3kbmyQJoA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	renjiang.han@oss.qualcomm.com
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "media: venus: vdec: fix error state assignment for zero bytesused" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:01:08 -0500
Message-ID: <20260301020108.1728168-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.10-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 93ecd6ee95c38cb533fa25f48d3c1c8cb69f410f Mon Sep 17 00:00:00 2001
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 15:20:39 +0530
Subject: [PATCH] media: venus: vdec: fix error state assignment for zero
 bytesused

When hfi_session_flush is issued, all queued buffers are returned to
the V4L2 driver. Some of these buffers are not processed and have
bytesused = 0. Currently, the driver marks such buffers as error even
during drain operations, which can incorrectly flag EOS buffers.

Only capture buffers with zero payload (and not EOS) should be marked
with VB2_BUF_STATE_ERROR. The check is performed inside the non-EOS
branch to ensure correct handling.

Fixes: 51df3c81ba10b ("media: venus: vdec: Mark flushed buffers with error state")
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: stable@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 4a6641fdffcf7..d0bd2d86a31f9 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1440,10 +1440,10 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 				inst->drain_active = false;
 				inst->codec_state = VENUS_DEC_STATE_STOPPED;
 			}
+		} else {
+			if (!bytesused)
+				state = VB2_BUF_STATE_ERROR;
 		}
-
-		if (!bytesused)
-			state = VB2_BUF_STATE_ERROR;
 	} else {
 		vbuf->sequence = inst->sequence_out++;
 	}
-- 
2.51.0




