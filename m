Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177B130CD82;
	Mon, 16 Feb 2026 12:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771244930; cv=none; b=Tv+pTg1K5NFwDwZEm8LZeSBamEDMFTO+u1SlDZzW2laLhGRX0IW3nrg4S5uaOIGLaRW8Dp3/kIthwWqaL3eIvdwEchO3VOvVXw4mfbZzugt889XyGOe3hi74BNuzM9o7uuboO1m0GTP30Xk4K9k+u+v6ZJy5HE06JOolQ/nwgrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771244930; c=relaxed/simple;
	bh=ZZUX9p6IOXZgUk7kYidtxF0lYrWErz/TC16nwHKCul4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4cVxfJ+IqPKgpRpX9rFHIEb/HzKR0HSQbbk5jcK9iWrlgqAEH2/1gcSAuvWenPKKARvKziHsYWTsHuN/z2Mp/INZVs/a7YFghEBbuxp5YBpNacvYiE1aMDyAYpm9NxrX2SRdg43TzSCw/6kBpgSLc7xHUuu0/4L4F/5Kkgx7ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kX78jiPh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kX78jiPh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6EA2C19424;
	Mon, 16 Feb 2026 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771244929;
	bh=ZZUX9p6IOXZgUk7kYidtxF0lYrWErz/TC16nwHKCul4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kX78jiPhTkQKZYYC2Gbk287ciXXi+wOLY129/Tid7HPF6H/qbA0Qn6qygSamRARJz
	 DSSLEtftPOIQzJ2PN3+yDGki74LwX2YJ2R438rkfz9/K56I7tieGWVsWIYBIw3HKW6
	 ExE9adosDiP0RdPa+JDWzgnWG0xPWT0ZOjzdN3iSYyqVBMM7ik8HJts2uydRb2dOUF
	 T8UZkiQDY69udMo7JGqGr+kRpBN8JpUNp0fycwT8o1r/f/jrZCECQNtJ5nYLphURSD
	 lEYmsjA6UtptoUf7fcCEwT4YB2LWPRmpfmsTlo/NqfDFZGyi9MYoPef5dECn56JyQ3
	 L6Pphk5mFuf5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A8BE7BDA9;
	Mon, 16 Feb 2026 12:28:49 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Mon, 16 Feb 2026 13:28:47 +0100
Subject: [PATCH 1/2] media: synopsys: csi2rx: fix out-of-bounds check for
 formats array
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-snps-csi2rx-v1-1-747bc7408f87@collabora.com>
References: <20260216-snps-csi2rx-v1-0-747bc7408f87@collabora.com>
In-Reply-To: <20260216-snps-csi2rx-v1-0-747bc7408f87@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Collabora Kernel Team <kernel@collabora.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771244928; l=989;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=VteqfxDD/ymX3hwze8jlu6vilo9kqUzwk/5uLNi6ndw=;
 b=8D3CCwTA9LPe0iN54HoRh3Q7IW8Bi2aUBpaxDlFGRVU/CUvLLJ0T1+PKX4kSSFM0dfT8ev2lE
 AlTZOfw90GICUpaDA3y6R8EFiHtpH0ligqLkYMdjfm/2C3V0w7bENOY
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

The out-of-bounds check for the format array is off by one. Fix the
check.

Fixes: 355a11004066 ("media: synopsys: add driver for the designware mipi csi-2 receiver")
Cc: stable@kernel.org
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 170346ae1a59..4d96171a650b 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -301,7 +301,7 @@ dw_mipi_csi2rx_enum_mbus_code(struct v4l2_subdev *sd,
 
 		return 0;
 	case DW_MIPI_CSI2RX_PAD_SINK:
-		if (code->index > csi2->formats_num)
+		if (code->index >= csi2->formats_num)
 			return -EINVAL;
 
 		code->code = csi2->formats[code->index].code;

-- 
2.39.5


