Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308DB4DE731
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605940; cv=none; b=sUWTiM5I0NtvEJ57h5VYukW6yidG/Gf8a1qN7khaMsDBsjutNCu1/6J2b1BB/6VYHGL0tbKUVDoNW9mx8ot4DRoRwHgVdQJotOwen1cuGOBOPnU5uhRXzK+m7qegt3Lnlog9FMS6iKGahRQpOuY0fwIhxyfqky/Al+izF19BWWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605940; c=relaxed/simple;
	bh=4xsFsq6UI1uMBaGJq5oiBxB4qejVSgh74V4L6/cQvzY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J0tQAB9NYvdBHSniptZNNIyiAutRU9C3fejgyPs30K7zYEvWYOhlYT7UqkjudgbV8TARmffJgrWhwSC+pYvAskM8nWMmtkm9/nuH9EmEAC/OJZqHlgE4Z/5ZR5pa4vEVTEJbfBmg9kSBlcHCs24WGiSh9g9pB+ZvTcxcHaWQviw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oabPQtPd; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oabPQtPd"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c7a1aeecso2797694e87.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790605930; x=1791210730; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/VflUiPNajJnp0ayxU8tq6LKcc1Q82tg7jHSnkHrkjs=;
        b=oabPQtPdHPZh/N6BPkRoRzoaDx2aXUofRIKFqCZj5MLG1UOlbat/PLIOHth8UqJIBp
         TCoY3e/ArdbcaNQsct0oGgR4GggntoUsJW7hgXrRO2ww2qfAGln2iib5yVKJ7SJNvtWC
         0zuwGLl5ibjxrp5l3kZc4itELt54mHEeQHf2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605930; x=1791210730;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/VflUiPNajJnp0ayxU8tq6LKcc1Q82tg7jHSnkHrkjs=;
        b=h77aT6k/I3jmegFwghbEZo/8LEEvj2gseNXCpRzE/qWeLI2fzx8mErq6yjtQDXLKWk
         yJUWeaq582jpe4ElrI/FjgwCMduvGNLlquoP/Sz0DxX29n3BbRv5YyDG/c/jnmdilDA5
         1w/2UTqfCXv7W3uoBC9M7XhBBh+adCffad/kSZCPP+YsQDhSUIJnXVgb+OXdE5mUt2gb
         M05E56cdtDgLETyWJzR/1/YB1z/2liloDE596WCwlMZcp2qg8O6ytC8SjlOkTx3GBVdE
         DeUGmBP1/CnFobMdYNWP3vRWyg2QUuu7+ePILRbozj0i8/wjEXBLZ1xbPRlEkE4CDai1
         uzIA==
X-Forwarded-Encrypted: i=1; AKwUvBx7oGcmG7YBt9OI1fgzqV9uxF62Lsbgff0GlDWYU7LpGi90/0CgmVouIeTo7PDWiuY7ynnKlFh4L6Gipg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLR0ziv0rOyzXfwIlWtCarKhuznqQaTd4fyv8Pl05IFLBaHFb97
	AdNid0gzbp7cg9joLMhRQzAf8TeBDaEq5pKDj4M2VuleabgHy89WgqDkyzeSOc8/HQ==
X-Gm-Gg: AYBFou1oti5AX28axEs9LQtwsD3n13F5m787ij1mUuUxguKkQNpuYQ8JH7j2G0lzJLU
	QaRijoZ6kyP8oDY5Eb4iR5g5Nk17SjM4x9HtnuSSq0lk+GgtX+67a+pRBgxb8O1afsk8tBoATH0
	0YgOny6kRY/bNEToOV/wuivNEfgh9oKj3s5QWfIVhvuelDLkQ36WDxw+OjKEGSXBvKjnmAnFfOT
	zJgRhfyaWYWNtxmUwcxEBpLZeJF08QSCBVl9TRCvWow6dAQBlOxupI+2sfc3TiEQnpXceYxue2s
	FHAytL1IddHR10rPmeLzzl8WSpVGI1AoSixUkMExp0sc3RgdEodx3svtT7kOhSTvgrBPDLQhKkm
	mXhkHQ4I+AQ2E+opV/w4QQR9jjJoFlkqPED9zTIp5ftufIIxuFeAh7daXlN9Mpk/iwaLUE50V2t
	lGhNmLj6SY/+a77LLLvdO12DBnjbbYpEBxc151gADB+Ct4y7fnIt23Zenp07s/54nw0HpPcZC2z
	u+e8/a/BUKEGcfexe0hWMiHppDKbMA0QhOqguusbAB6LvTAAA==
X-Received: by 2002:ac2:4646:0:b0:5b6:67b3:9f74 with SMTP id 2adb3069b0e04-5b8df0d4463mr3705125e87.5.1790605930461;
        Mon, 28 Sep 2026 07:32:10 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb098dsm603606e87.38.2026.09.28.07.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:32:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v4 0/5] media: uvcvideo: Automatically handle invalid
 uvc_versions
Date: Mon, 28 Sep 2026 14:31:59 +0000
Message-Id: <20260928-uvc-version-v4-0-da0e983fcb95@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGB6umoC/33MTQ6CMBCG4auQrq2ZtsOfK+9hXGA7hS4A00qjI
 dzdwkoNcflN5nlnFsg7CuyUzcxTdMGNQxp4yJjumqEl7kzaTIIsoIaST1HzSH794w0ZshpVhZp
 YEndP1j232uWadufCY/SvLR7Fet3vRMEFV0iYG0uAhs6682Pvpv44+patqSg/uBDfXHLgqs6tL
 G+AiHqHqz9cJV4AKlmZqgFjfviyLG8EGPfBJwEAAA==
X-Change-ID: 20260907-uvc-version-aedefc4384ce
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Edwin Gatier <edwin.gatier@protonmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

This series changes the way we handle invalid uvc_versions. Instead of
just failing it will try to continue probing.

Now that we are at it fix the way we handle device warnings.

Thanks!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v4:
- Handle invalid dwMaxVideoFrameSize.
- ctrl_size -> video_ctrl_size
- CTRL_SIZE->VERSION
- Link to v3: https://lore.kernel.org/r/20260911-uvc-version-v3-0-604328d8a0dd@chromium.org

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

 drivers/media/usb/uvc/uvc_driver.c | 17 ++++++++----
 drivers/media/usb/uvc/uvc_video.c  | 56 ++++++++++++++++++++++++--------------
 drivers/media/usb/uvc/uvcvideo.h   |  6 ++--
 3 files changed, 52 insertions(+), 27 deletions(-)
---
base-commit: 58348f64125e9a3e44d3abb275ca7f4e6c9641e5
change-id: 20260907-uvc-version-aedefc4384ce

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

