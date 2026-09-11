Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A01847728F
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 13:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132958; cv=none; b=Vz3UDIpijFpOhk6+zdS1gDOPBmpkgTB114vH1OKnAgX/4/Uthq9wTktLrLnI23CvCOdBT3o0tl20AoMGAgW8Ia4+u2I6KY63HleKUrH1Vi0UIfc6rgOuQNfyiaMfaEleBCRzF3fl6+Wnr0gUsX0SzP1AHQgnh2Qdx6Ol5VeHXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132958; c=relaxed/simple;
	bh=xHZhA3szZA1hZVZbOIyn030oF1VwprWMhW3TO6nzBXs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YTeK+1RALQEI8/9gYeJhJYZr1NOF/x5s0FN9zePRfOFTe9to13MtkddWAgZH55ew5a2Z8VR1Y7X+3F7TBSs8wp5VKPWwN2CWGRSjNNM6unMa+3hRbfvjohz63biLKROA6q0lID4QkQPVPC4ASVwRui854fOUCu5+WA3XBxgKwvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ebYRm1O/; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ebYRm1O/"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so7104721fa.1
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 06:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789132954; x=1789737754; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hazyrIg4ggyFOS6emaQbu6dOwEnHBIR0x34bXl3xik0=;
        b=ebYRm1O/ZBSDz+sc7zIULNyFSbzcYFd9j2tfRtNjaaEns6fXbDP3TRjVzNDC2hRcRN
         4nRyIQ1RIaJqNgLW1JsglZcdeVDFm3AwGQY4v+5zNjV1rGYaycG/d7cFHt0VWZRmfvJb
         FHiC1EP5XfI8RmSpsaMeUAs4KNjDvkXCmmlDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132954; x=1789737754;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hazyrIg4ggyFOS6emaQbu6dOwEnHBIR0x34bXl3xik0=;
        b=g+92efXrdQJwYszPjjpl12WddiEMjM7sN2zGuldihmTMN+GCrcZA6v1KijMLi/DP3f
         mRQH/CtdI6r9e/sh25JfOw3B31QPY+kOPB8uwiieXYbbA25LhVruP/La6Ch6JktEkppc
         o/UtDka4UNG7GA3JGhsdKv63iVZoIbDEg/1681WR9Mn2NijkQAqWofAcWB3X0btutWix
         ThtEh1/1mKIhh9pLyA6Sl3dS9Rx9UWKsZmqiDnG5+WVD+mqq146sBNYjWgodZMUVCVC5
         GI8cSrTQWzS4X+ztz1iGqgLFYILqkISSfrV5vFtehXpMeJ7PlB9YiEoJ8U8J1uUYv5AH
         rtnw==
X-Forwarded-Encrypted: i=1; AKwUvByb4WJ9Q8TTBYpGgH2Xfg165bH1kQ9VTv9YkuPzzbXsnkpr5c8dfOHbYsEakztYld5dlQj3lzVvEYVcoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lWyey2Zm+IOPPYHUxxWHw3ql4ODdbp1JN0RQPlbZJvjkFeO1Or
	+dDmx58y9kZ94T957w4ZBvfYTNaUFyVnMid+0BcE/a2X02Rw0CwzYCXDmW3VhRmrpA==
X-Gm-Gg: AYBFou1L4C4BObsmXnZYRva5X99+eoq3kz9hbAA0fDbCzlJhzbPn2xkJfSPcSh44gUO
	zTJ8zYL4GII0XhOfSh7J+wnyFLfm21lIWF6do4kkVni+uUra3U0Vl2jvH6KfJ8dfbZxdbVgfnhw
	QTbhNEqkXDDzMg5FMNKaGXf7tMAwXccAjIokS/zTvhKsUhcrZN6S8EqSWUCamU4cvyqaRpbwT6e
	rbjgWtqXXP2ddiDhfWLhj6VP1irmcQdRYGB8Z4HpDi+lXF5eadLCsbrfhWqVPc/KATNLuhhcyNg
	k9pPEJFrYytKsYCwpsfLYkFg/zXqTgz+2W6J2dz5qELPzAoBKV17E1CXr/X0SibPDKq4swyGzc/
	/aQn4Dy/bxfa7UrYrGFmIAf2Ysvgnb9c+nLg3K54oDSVhFSZF9aYZfnPB1HaJUQc0b2sEZGGwc+
	fM+kAitbBFhjq61Y3jhA4e3xLqm50NaX2FgVdpAA7gw2AmrJFlnUI4BYJnySJUjvT3fhVhsRizj
	lyLggxGGW/KRXLIBepLZ5C8Q3/QKRzyYmr489DDkdfyDirnzQ==
X-Received: by 2002:a2e:a801:0:b0:3a3:61ec:43c2 with SMTP id 38308e7fff4ca-3a591260d4dmr12294851fa.19.1789132954319;
        Fri, 11 Sep 2026 06:22:34 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3303fc9sm6677511fa.6.2026.09.11.06.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:22:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/5] media: uvcvideo: Automatically handle invalid
 uvc_versions
Date: Fri, 11 Sep 2026 13:22:24 +0000
Message-Id: <20260911-uvc-version-v3-0-604328d8a0dd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJAApGoC/22Myw6CMBBFf4V07Zg+BhFX/odxge0UuoCaVhoN4
 d9tWalxeW7uOQuLFBxFdqoWFii56PyUQe0qpodu6gmcycwklwfe8gbmpCFRKD/oyJDVqI6oiWX
 jHsi651a7XDMPLj58eG3xJMr6v5MECFBIWBtLHA2d9RD86OZx70PPSirJD12Ib10CB9XWVjY3j
 oj6R1/X9Q3hdEN06AAAAA==
X-Change-ID: 20260907-uvc-version-aedefc4384ce
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

This series changes the way we handle invalid uvc_versions. Instead of
just failing it will try to continue probing.

Now that we are at it fix the way we handle device warnings.

The last two patches are "optional". Feel free to ignore them.

Thanks!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- Move uvc_video_ctrl_size to uvc_video_init()
- Fixes for uvc_warn_once
- Remove bmVideoStandardParsing parsing
- Link to v2: https://lore.kernel.org/r/20260911-uvc-version-v2-0-395f27b0444c@chromium.org

Changes in v2:
- Add quirk for Avermedia
- Change the way the compliance error message is printed and cache
  ctrl_size
- Link to v1: https://lore.kernel.org/r/20260907-uvc-version-v1-1-34e45dfe04de@chromium.org

---
Ricardo Ribalda (5):
      media: uvcvideo: uvc_warn should warn not info
      media: uvcvideo: Use uvc_warn_once when it make sense
      media: uvcvideo: Automatically handle cameras with invalid uvc_version
      media: uvcvideo: Do not parse bmVideoStandards
      media: uvcvideo: Force UVC version for Avermedia GC515

 drivers/media/usb/uvc/uvc_driver.c | 17 ++++++++++-----
 drivers/media/usb/uvc/uvc_video.c  | 42 ++++++++++++++++++++++++--------------
 drivers/media/usb/uvc/uvcvideo.h   |  6 ++++--
 3 files changed, 43 insertions(+), 22 deletions(-)
---
base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
change-id: 20260907-uvc-version-aedefc4384ce

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

