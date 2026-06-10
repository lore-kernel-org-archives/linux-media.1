Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1503176FD
	for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 16:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781108419; cv=none; b=Fp6GpEgiul4bEcYWoJjqShLyKjX/iIzvPvwob6OQ6ss5obaYuvYetmI+meoOjWU5SJJAuLD7KaERw02yRRo0iUortJVltuwZ1GfrMK9vXW1jU4RsTEHfzjq/7SE9gYGgXTV+XN9caFfK4zfbqMkDTtjx2aaUPfil0zpr+00dBFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781108419; c=relaxed/simple;
	bh=3GHWLgVi4O6MHuVeCDFDILAsiSrstOJOGFbUkyNdosY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zt8g88jErOXRLKwI9ghu0MkePuyz4S8miTFC9nj7tSeA1hfNccwd2Z9cK2KVsxFfWP6L+QYkr9J1gJOSbnF1mqPwS/RdUuBSW/Ru9IlQjTht3iJjO7SItGwjPSt0TNO1YII2ZoxeHEkBMRMWiTRFdhkiwyMbpzGZKuUchuW2+yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i0BqOKlH; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i0BqOKlH"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa61503fdaso36116e87.0
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2026 09:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781108417; x=1781713217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcKwx3Y0vpiKLPOc/ceAdo24aVg4L3qrYl1AkV20myY=;
        b=i0BqOKlHrcmmbaQTPXMaZTZ42Wi6Jg7eupokLg80ue3J/DOTX8nmqaJ2C+mtgQ2DjJ
         ttS55y2my7vl/GGnkw4B7+WkNRgItlngF22/K2nolsCaieZdmMluiOYctqniRuq62blr
         rDY15xrf/8r0miHuYs9VGq5nB8r075UDiUsAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108417; x=1781713217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WcKwx3Y0vpiKLPOc/ceAdo24aVg4L3qrYl1AkV20myY=;
        b=ARyCnrSv/ZtyLGeAPmsFjZH21tOHZWwvx0LJmqSftQjiY8ADDTDLu8i5PZxm3QzQS5
         G13NOiTNnxybZA4+IdYikcXMdhwdZMytmOyumZlOJh6hBJeQMfv6GNnr7X3L9FBY8EHl
         UBFTbebJOkWGz8HQwSZGaSY2vPIUiRpRRNRypfDYEssYKFDJozNrLh9oIaMbgHn6U5h4
         Iaj4lCXmjtSWIoarH1DL5qP+ssTmM3zQjql21IbWm6g2iB3hTin+bPaV1Fk8ES9yogUy
         +UI4vUZPiZZs9alB9tyUt9Suob0oWeZXn6dbCdL4lduDXRMgh++ZmFvCAH8Y4rDwoq+W
         i15w==
X-Forwarded-Encrypted: i=1; AFNElJ+DvvJ4D4muKQOu7PCN8B5pawNUP1SdgAbX33Gdh2mbQyPp6F29gwgX0nH7zIUgsuBb0QR+LI39hxBM6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVDvylBJkG3WRmQwndRNWkiTYdTTEsW4wcxoniBHtquWJIjIDm
	WtVfASjCH9IJq0KsJ6Rz8VDnxgz2HaSQRxWUKWud9wbhLCnAfy39WMhFS5VfObXFxw==
X-Gm-Gg: Acq92OHZQgryKglk3g0edAu7aQuNKluf+m2x6yci/Qk82+H15DJuZz5bNgYeLmNZTcm
	qfmc868/byhFMJCK5DejfwLZWkw3jGjXUAKrSMR4o4jibV8v0zjBf9kwlZzgsXx6nB0paASQ/3Y
	I6BwTL8HHwTkyXQtrNIGIdapMPd3I9miK/F+lU/CcS9PvSFPSWFYA+u0deL7kMmM1N7/8FUVWD9
	ShvDY6Ydi22HwhFG/VN3pvuFXKKGRVDPPzqSGnp2kCo758PhmnZUU5eOuMQtr8stltj1S5gv34Q
	Ol6U6oGkKQnR6twf3duV3Qw3SYoEdT7pbgOSkfR45O1jU/yNpst9oYVu4NsreEjJGIyPrJtv5UN
	NwVDIMKCiWVbj7WLokAjLFxJ97AIQcWdFP0IlqMa3o/iDrcaqcTQEfk2abnPghFyozqiIQHIKoH
	+MMAPk7MtR7sstY0oIi+4GDnhULoyB2rt/9OUwnrjck00O9k/Dm2B3wnNbk32kQHHtDBTx3rz1W
	b9AjajcnG6M3i++pg==
X-Received: by 2002:a05:6512:6093:b0:5aa:7005:125c with SMTP id 2adb3069b0e04-5aa8866c7c5mr6164799e87.8.1781108416632;
        Wed, 10 Jun 2026 09:20:16 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ee219sm5608915e87.15.2026.06.10.09.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 09:20:15 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 10 Jun 2026 16:20:07 +0000
Subject: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
In-Reply-To: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Xiaolei Wang <xiaolei.wang@windriver.com>, 
 Tarang Raval <tarang.raval@siliconsignals.io>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 linux-renesas-soc@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

The variable has been previously removed but not its kerneldoc.

Also remove the leftover reference to state in the description of qlock.

This patch fixes the following warning:

Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
Excess struct member 'state' description in 'rzg2l_cru_dev'

Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 5bf334e173d2..b426bc7898bf 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -116,11 +116,9 @@ struct rzg2l_cru_info {
  * @scratch_phys:	physical address of the scratch buffer
  *
  * @qlock:		protects @queue_buf, @buf_list, @sequence
- *			@state
  * @queue_buf:		Keeps track of buffers given to HW slot
  * @buf_list:		list of queued buffers
  * @sequence:		V4L2 buffers sequence number
- * @state:		keeps track of operation state
  *
  * @format:		active V4L2 pixel format
  */

-- 
2.54.0.1099.g489fc7bff1-goog

