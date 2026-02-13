Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB9D364E9D;
	Fri, 13 Feb 2026 14:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991373; cv=none; b=c9csZOAa/jFctDoFngmaZS3065QeIi7b4U9RhM30HdeT+5VzwuOnmLqSV7tkxuv0tt7/VNwVUOCoZQyyFToQUvotp6QnS33o532MiEmtv95BJUk98jYY/mkQSco5ZuJ0ejab4ZBEN/98N1WS2iSVN/9wNta7VBu4yFMuqOvMYqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991373; c=relaxed/simple;
	bh=5E+i6OeSBSm+YNxRnxiGTUFafcPI4TSJvS5gEf+Dl6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pkav2sF8RGHfTEScMu5odov/wvp5tUzWLviWQ2Gdph3Habc4V1vsI3XSWx+JRJxz9X5gEV629JmoyxM16nPp3/LBXZa9CG15fSZcCQxjqDU3Ix7hErY8VRIwp9u9a+zX7i/GbqZdihk06Ct4+QT6nSJGnTH2wQEQfpAu5i9ya5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kCdQ7E39; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kCdQ7E39"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 255D3324;
	Fri, 13 Feb 2026 15:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770991285;
	bh=5E+i6OeSBSm+YNxRnxiGTUFafcPI4TSJvS5gEf+Dl6E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kCdQ7E39opwUuK+sFIzgq1sO1kI0+hJaEJgCzngmPHiv1mXHEsvV1Kisnl0u3DcPN
	 KyWJ8G72mEvDf2U+7aoKE+TzVhHbeLlPpfNB3IXf/oQrJzWVzk1TXEkITusmYkugc4
	 PJXkdChA0dzLwTX4LaXeaWb6WRi4N4tRbE2qCdY4=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 13 Feb 2026 14:02:01 +0000
Subject: [PATCH v2 22/25] media: i2c: imx283: Recalculate SHR on blanking
 changes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-mainline-imx283-v2-v2-22-be40a3770ebf@ideasonboard.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991325; l=1599;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=5E+i6OeSBSm+YNxRnxiGTUFafcPI4TSJvS5gEf+Dl6E=;
 b=d99PGnrRQaFpC7wzWdLpvtZbg3Sir6wf0071UlTKs4QgM5/S/vWpYR1H7y8NEUQHuRXIbS/RV
 zEYNHATpKnlAvlTUgCMUphyGTiPjwYxTxag/d1/GLJAglZo80X17RNK
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

The exposure control on the imx283 is handled through the SHR register.
This value is calculated based upon the hmax and vmax registers as a
property of the total line and frame length.

Ensure that the SHR is updated whenever the blankings update and adjust
the frame intervals to ensure the correct exposure is configured on the
sensor.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/imx283.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
index 75a35d9db05d..7fb654512c20 100644
--- a/drivers/media/i2c/imx283.c
+++ b/drivers/media/i2c/imx283.c
@@ -909,6 +909,11 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 		dev_dbg(imx283->dev, "V4L2_CID_HBLANK : %d  HMAX : %u\n",
 			ctrl->val, imx283->hmax);
 		ret = cci_write(imx283->cci, IMX283_REG_HMAX, imx283->hmax, NULL);
+
+		/* Recompute the SHR based on the new timings */
+		shr = imx283_shr(imx283, mode, imx283->exposure->val);
+		cci_write(imx283->cci, IMX283_REG_SHR, shr, &ret);
+
 		break;
 
 	case V4L2_CID_VBLANK:
@@ -916,6 +921,11 @@ static int imx283_set_ctrl(struct v4l2_ctrl *ctrl)
 		dev_dbg(imx283->dev, "V4L2_CID_VBLANK : %d  VMAX : %u\n",
 			ctrl->val, imx283->vmax);
 		ret = cci_write(imx283->cci, IMX283_REG_VMAX, imx283->vmax, NULL);
+
+		/* Recompute the SHR based on the new timings */
+		shr = imx283_shr(imx283, mode, imx283->exposure->val);
+		cci_write(imx283->cci, IMX283_REG_SHR, shr, &ret);
+
 		break;
 
 	case V4L2_CID_ANALOGUE_GAIN:

-- 
2.52.0

