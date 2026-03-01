Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115542BCF4C;
	Sun,  1 Mar 2026 01:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328706; cv=none; b=scydIaYtvJA8Jc85rIH6SmB45zePbJbLLwTjTWQ32cIuP2p/jNNpNxU7xM2CpIuDouhN/pPNYWthn3Gre4NaRRBjntHYVJYpVZVhFmhZv/UqrXzUtI6stg2zaUmpis6WKAshbPXKfuNm+KQXl1B7ADoF2HN1dDDK1D1Rg2CjyAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328706; c=relaxed/simple;
	bh=zETfYMYlU9W2MVZIIM2nL5K0LKDdNG4gnA8gy7cCgvU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U6bzGzGQVToRzR3Jg8tNPyhbbnCJLSI8/0rKBY2OMk4Y7hiW9AAYzqY3DND+ExlheZytYtcSDQ6N7fZhaoSyL35iYYaBNmBLLv2KgR19XzXzssrqyNuMQCSsFf4p4eDiSDJhsmI+SyDapsgFOFKIbSNKfqrxDdG8+phSB+FT/1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIZFf2si; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIZFf2si"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5E6C19421;
	Sun,  1 Mar 2026 01:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328706;
	bh=zETfYMYlU9W2MVZIIM2nL5K0LKDdNG4gnA8gy7cCgvU=;
	h=From:To:Cc:Subject:Date:From;
	b=PIZFf2siGsv12hBx5EZ0hejdaK+Mn7RqFEv2JY7cGF/okXL4JQS4vDWOh01Y5t1SZ
	 5ovAGotIE9va6uBJrmbBxWCpIvbS79SwDsZZ9uG3iY1VFnlrQhwEVk9tfEsIMyH+Qn
	 6gFPGQr+YzCE8uqL01/jOTkwKSiSwt0xCEnF/gqjhSJDffJ/GUQlN++PT/Ao9NTVKK
	 s/sdJHemCXAiSyyBcuT7mKymunC+B/sagp6RfJilzC2JOsSJZ7PlbkhtdCd3Id381u
	 c0fUs6RE+nCtLmLuiC7su0ZjcQvfPDF4+Unp3fq2v3edvX9dGI9SoBrlksE2wI6YzV
	 ElCJxpeZL4d7g==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hansg@kernel.org
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Fix analogue gain range" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:31:43 -0500
Message-ID: <20260301013144.1690403-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 109e0feacaeca5ec2dd71d7d17c73232ce5cbddc Mon Sep 17 00:00:00 2001
From: Hans de Goede <hansg@kernel.org>
Date: Tue, 14 Oct 2025 19:40:11 +0200
Subject: [PATCH] media: i2c: ov01a10: Fix analogue gain range

A analogue maximum gain of 0xffff / 65525 seems unlikely and testing
indeed shows that the gain control wraps-around at 16383, so set the
maximum gain to 0x3fff / 16383.

The minimum gain of 0x100 is correct. Setting bits 8-11 to 0x0 results
in the same gain values as setting these bits to 0x1, with bits 0-7
still increasing the gain when going from 0x000 - 0x0ff in the exact
same range as when going from 0x100 - 0x1ff.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
[Sakari Ailus: mention analogue gain and update the limit from 4096.]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 0b1a1ecfffd0e..834ca46acb75f 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -48,7 +48,7 @@
 /* analog gain controls */
 #define OV01A10_REG_ANALOG_GAIN		0x3508
 #define OV01A10_ANAL_GAIN_MIN		0x100
-#define OV01A10_ANAL_GAIN_MAX		0xffff
+#define OV01A10_ANAL_GAIN_MAX		0x3fff
 #define OV01A10_ANAL_GAIN_STEP		1
 
 /* digital gain controls */
-- 
2.51.0




