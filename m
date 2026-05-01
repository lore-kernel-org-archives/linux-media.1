Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091F3D1CD2;
	Fri,  1 May 2026 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649979; cv=none; b=sOLwmyWsX+BDUEWtxK42LJWKjOBeuycR0/XvDAd9PsSf8Zqb3arOM5W9giuE1T7HNqPD2HR1FPBMV774hVMFyNgOe7rdXcfgteSTR/FeVoKzMjhYh0Q23VkiPjCpdIcm+SmRbHS52bpGlBoVp3xAFwNHqSumHvKQ23KHOTpLcc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649979; c=relaxed/simple;
	bh=H0+s9bGtbc+qAdvqWBzge9Hq3+hGPxbdSEbGobjqmeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xc3HLhtsrRf0DXToXS+XD9pYUT6engU6bwb/y2jS0MYgpqgwQj/VRjU5pUvwWLFFlaQuCUc9oOERVHYrpslO8lqxkEmReszVCAMnF1OvDqUjTEEKl6gIVfbPifJB5JXVN/KRW/viKlzQkxPchzyOQP2HhFLr1xQn0yln+EVtNGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L26sPWp9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L26sPWp9"
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1AB0C99F;
	Fri,  1 May 2026 17:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777649856;
	bh=H0+s9bGtbc+qAdvqWBzge9Hq3+hGPxbdSEbGobjqmeY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L26sPWp9OZVrf8JTp1WTpmRoPF92lpd0U31u42NfYKwNAusSyMAuhheFZRMbD6Cut
	 kXtiq5xKQOdmkQm4QL/aXLKkaksgBX4ysqPhAyS3w5gseiZmg/4CRPJdG7LLMMqyeS
	 an334Buzg6NYI8rh4uvrjp9v1uhQTZddRRrwC6wk=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 01 May 2026 16:39:06 +0100
Subject: [PATCH 04/11] media: i2c: ov5640: fix error path in
 ov5640_set_mode
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-ov5640_cleanup-v1-4-0869a7802a33@ideasonboard.com>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
In-Reply-To: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777649959; l=849;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=H0+s9bGtbc+qAdvqWBzge9Hq3+hGPxbdSEbGobjqmeY=;
 b=QFKFyghTzzm09YpgOWaebBMF/UbZGBzcN3mE1Fzn8q5LFn8rICrWOHBHqAHhfEtV4ZyCEvCyG
 oyvGUHG1jm2BNiQBH3VxGGSOhgpyUhvmNtGaefYagjhfr5f4+OudQz0
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=

During ov5640_set_mode if the call to set the pclk fails, we should
correctly restore the state of the auto exposure
and auto gain if they were modified on entry into the function.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 0dc4f4272d05..244c341d0e77 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2349,7 +2349,7 @@ static int ov5640_set_mode(struct ov5640_dev *sensor)
 	else
 		ret = ov5640_set_dvp_pclk(sensor);
 	if (ret < 0)
-		return 0;
+		goto restore_auto_exp_gain;
 
 	if ((dn_mode == SUBSAMPLING && orig_dn_mode == SCALING) ||
 	    (dn_mode == SCALING && orig_dn_mode == SUBSAMPLING)) {

-- 
2.52.0

