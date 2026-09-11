Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E743CAA2E
	for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 09:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120229; cv=none; b=sgeJjBE8k3/GAFgU9VITSDlra1WeAu1gPpHCEc5/gmL3XLyApNL00ZD7rJAFXXRWGyHU19oS06EflYTIww1jmaYbeen0OQSklRZO7nG8gXjM9cgdVxtZj7TG4K6f3cA6H6n/O2QTfhm+9O5Smz2I4M7UeTKTrbeKY9i5OdeYbSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120229; c=relaxed/simple;
	bh=No71cd5buUUHeBE48TQG44YiouRm3taIpFkpoL0GdvU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FWf56Lxxl/ZDRgkCdZilR6lfKPoR3HkF9XmPZ8cN79DYUWIC3j4JtEck2iYpPl0z4fU0v5A+4bKckJJUhEUpvzPNXyzzLlt4iG2VbtV6L9NJriZCCQEUvtPzDJjbdtw5XfEzKn1y5c9PqBTfLJusuBP8iyq/+mkA3GDw1U8Ih6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=miewqeWi; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="miewqeWi"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a4fc78b556so6463391fa.0
        for <linux-media@vger.kernel.org>; Fri, 11 Sep 2026 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789120225; x=1789725025; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hdzbs4lJ5S888JvEnLEEzWnpR79iP4hGYQ+NNaIqwIk=;
        b=miewqeWi19LXZgrZS54WPwI3F+kFKrDhmNZl/OVZnMLPmPvUbNXxJw3Kk4GW1bhSRG
         FT6VBU4+IHZ4eKF+heZqkJTqXtnzbpD95u0sfsVLrjtLInRzhOEZsGIODO0Ox0QaK7Ur
         oBEL90BLETJou+W8Fc+mGgXxWyYmqNsUnH1hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789120225; x=1789725025;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hdzbs4lJ5S888JvEnLEEzWnpR79iP4hGYQ+NNaIqwIk=;
        b=Y5ZBXw/KVZo4Lq1BbIulkhTWMBZnuqt8dHHUia+oKunH5m96NktRyd9PCHcpQBuXy6
         Diggt4f7OCMdSPmkY7B/9rOXdhgzbj78kAmuoh5/omQMZUK0oTqk48YI84F6ZUyvQqWP
         /QXfmiRBXewgYVuUT8NvoSkb4YKgoISXi2Ix1TPN7+pDWftvaZVwP4CzDCspe3DMfeCU
         35ayHEhTKFLlg8znsfGaT4Sbu2dTt345O6As7uGkRgPKGj81XLFjjZKxIseuQGIc+zfh
         GX4Eb4qp5JPJjdblgI0kPRwlNTl4scV5UvwzCsleXRenlxjn5a6f9rrgGP64bsMaveiZ
         KXNA==
X-Forwarded-Encrypted: i=1; AKwUvByzz5lS6w6catEq6wjmhJimgVpz//ztoPLzG5zW2fnNvWJBDq3xEJ9LerVzwM7mebaGViP3uznL3xcz/A==@vger.kernel.org
X-Gm-Message-State: AFuF++kLJksLbueRqwd3ulVoOtU+NRbgm5dvaZ/WQA9hyOXVgLvYTaXN
	jPco9rCbehAJ+hugfiTpdJRflaG2X2RfKMiRt9Cvxld2R1yjpVxJEmBxE9/mdreLBQ==
X-Gm-Gg: AYBFou1No7HK46tRdd4Q2XtJDU8ntoC95+tfn6hHFCs1Vaad25uHoHYWCsRxwgvm/hS
	1jazgq3AVIGpD/H0NPm6kFyMBKdJmIrJDHw6xPBNA6ehgVvgiY5j7m5SNrYeg1Ip21/U+YrNfMn
	Nd2cG/iEpq0zbmW26LQ0ivSGmgyKqOgg23sug5rggpuGkbPz7mKOiFLQS0kAo0WGQcNoms5cN/i
	uOdpCfEY61hn9h5Kg8XqxwwyX07ulguE3PxghLX1FIhorVLMdtvhZelADsMxxRX9MbG51OhHFX0
	7hAC+FES02OUWnQGazmq6740gs7eepMCcL64E/2X9Jhe7xxYt0gsgDIZA804wL/SY23T03eati4
	u7iem29MG+Y/lqrLHjAiclxs1jT/mEEXWscln1PP3FUdm89DPSxzhJ0xI4EzsGG5xOGdCz96oLc
	igJWrwwO61ByxeArI5BjU3rsHZy6wjgXS/nZvK+z57AjuCcTa0CGbWadl9mPbekS4VExD3qmDsP
	QQo0fx2wO3TLulesQoTn8S3ppC/DgU95JG7mTUknS0CS0hCGA==
X-Received: by 2002:a2e:a551:0:b0:3a3:7741:b43c with SMTP id 38308e7fff4ca-3a5a5082d76mr3491941fa.7.1789120225152;
        Fri, 11 Sep 2026 02:50:25 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a33263ebsm5138231fa.17.2026.09.11.02.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:50:24 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: uvcvideo: Automatically handle invalid
 uvc_versions
Date: Fri, 11 Sep 2026 09:50:21 +0000
Message-Id: <20260911-uvc-version-v2-0-395f27b0444c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN3Oo2oC/22MOw7DIBAFr2JtnY0wJt8q94hcWLCYLWyiJUaJL
 O4e7DrlPL2ZFRIJU4J7s4JQ5sRxrqAPDdgwzCMhu8qglT6rm7rgki1mku2HAzny1nRXYwmq8RL
 y/Nlrz75y4PSO8t3jud3W/53cYoudIXNynpRx9LBB4sTLdIwyQl9K+QHsbC9MqQAAAA==
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

Now that we are at it, add a quirk to fix an Avermedia device affected
by this error.

Why keep using the quirk? Because I think it is more correct to handle
them that way and the quirk system can give us an idea of what vendors
are more respectful with the spec.

Thanks!

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Add quirk for Avermedia
- Change the way the compliance error message is printed and cache
  ctrl_size
- Link to v1: https://lore.kernel.org/r/20260907-uvc-version-v1-1-34e45dfe04de@chromium.org

---
Ricardo Ribalda (2):
      media: uvcvideo: Force UVC version for Avermedia GC515
      media: uvcvideo: Automatically handle cameras with invalid uvc_version

 drivers/media/usb/uvc/uvc_driver.c | 22 +++++++++++++++----
 drivers/media/usb/uvc/uvc_video.c  | 44 ++++++++++++++++++++++++++------------
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 49 insertions(+), 18 deletions(-)
---
base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
change-id: 20260907-uvc-version-aedefc4384ce

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

