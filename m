Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB17365A1D;
	Fri, 13 Feb 2026 14:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991376; cv=none; b=r2XfSzi59wxxSuZUfFbFbLy+nDORQwN0YtqU1+veSlExlGw2bQwekyxpwgBA119wuCIQj1Lzyv+Jd/cm7nXqzCr7laN4lf9WtEYq2bQBsV8HZTLLjtQp7oghOBtFDY0K7lRUVTBujoVE78qanRnZ7mm8mmZ0zbEVHhUD0dPMowo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991376; c=relaxed/simple;
	bh=B2+mnY4v53oT04OEjZEhPLs9RbHaRADSTAazzCmBfFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=crZJpmYC73kzenkUYBlTGSWOYmJEDT/irkUdV/Dm+B300y1IvFX+j0V/TBJdfSxZ9138gFYc/4ueiw+SLuGNj5cZ8cW16zMjlJ9nJxYEiylTJL0APIHPCfI3wnud+TZjEeKL3mVHEtqf0LT8iiOlEcki4ku2qh9tx4ljkbeITJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BRt1BHAk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BRt1BHAk"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42F6927FA;
	Fri, 13 Feb 2026 15:01:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991286;
	bh=B2+mnY4v53oT04OEjZEhPLs9RbHaRADSTAazzCmBfFU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BRt1BHAkPqfg5Fgrz+LL1Z5WCr8zBCiNHUId1C1fynizUYu98g740WLTducdDt5zV
	 pYpkWw1m4kWBwnM8VKyKjxKIaCXaiVNT163cjCTyMFeaeUX7EZMkhSpv1ZvrnIhf7n
	 sN3yB/iKJGO9GifR+AHModqIRUfIhyMRb6VYH/tQ=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:02:04 +0000
Subject: [PATCH v2 25/25] media: i2c: imx283: Simplify VFLIP control
 setting
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-25-be40a3770ebf@ideasonboard.com>
References: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
In-Reply-To: <20260213-mainline-imx283-v2-v2-0-be40a3770ebf@ideasonboard.com>
To: Umang Jain <uajain@igalia.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=1276;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=B2+mnY4v53oT04OEjZEhPLs9RbHaRADSTAazzCmBfFU=;
 b=hgWjzzS2f0ZNLX9MnlCT6m2SKJO1lF96PRLDXurSzSYcNJuZgPc5HOs/11W1l7cUNetSn2/RO
 FNmutEtPFpIALzmfQtRmZLwKpxSKEp60o4rH1KKWhJJbm8GWAykLTBW
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

The VFLIP control is configured through the MDVREV bit of the HTRIMMING
register.

Simplify the conditional branch from 5 lines to 3 by determining the
trim value which must always include setting the HTRIMMING_EN bit,
and conditionally set the MDVREV before applying it to the hardware.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index f0ede67921d9..1698754ea059 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -948,13 +948,11 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 		 * VFLIP is managed by BIT(0) of IMX283_REG_HTRIMMING address, hence
 		 * both need to be set simultaneously.
 		 */
-		if (ctrl->val) {
-			cci_write(imx283->cci, IMX283_REG_HTRIMMING,
-				  IMX283_HTRIMMING_EN | IMX283_MDVREV, &ret);
-		} else {
-			cci_write(imx283->cci, IMX283_REG_HTRIMMING,
-				  IMX283_HTRIMMING_EN, &ret);
-		}
+		u8 trim = IMX283_HTRIMMING_EN;
+
+		trim |= ctrl->val ? IMX283_MDVREV : 0;
+		cci_write(imx283->cci, IMX283_REG_HTRIMMING, trim, &ret);
+
 		break;
 
 	case V4L2_CID_TEST_PATTERN:

-- 
2.52.0

