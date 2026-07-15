Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECC83B1ED0
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 03:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784086721; cv=none; b=Xv4lvIXa9KUWG4Zrp/UvxCLS4c7IEr3uxzTg9yi6Xn1K69jvOtvVr3IpCvoTXa9a9Fl4bL3TCh4mT7aQhKjhyWpQn7yrd6cXmalgF2f+LS0UYlmeTNSeF0UsX175DNjhJPn73JWbxVWzUXHJE2ZSzO1FC/wRkqGSuLcmz+hRXUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784086721; c=relaxed/simple;
	bh=5U7SmpzpVIKh7rS8a5jgA+QAAnNVPVnXmTOxayAM/P0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qe6VycwaaFtI+R3OpL7g2yMj6nBWqxLRVo44dch2jyHTEGDRT/MxFL3smy5uirx4s24jM6owhFXCxIOUdlSUqfmL251rOkg06cfolKmb06rjPgsmgtKlvEjplQGGCLkJGYd3AiofMDMhpiOiZ7pWiy/aZm4TeP/E7QmweaWxJks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGX1HgnS; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGX1HgnS"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso3604873a12.0
        for <linux-media@vger.kernel.org>; Tue, 14 Jul 2026 20:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784086707; x=1784691507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ImXKgbl3lS6qZxDXyQxtMh8z7XxH+IHMoyh8vOWuhow=;
        b=LGX1HgnSGKo5+zxAvvznzQ65WNpTqm6ef68A1noxUVNK2ZheZRipzWXEzUdHw6C1Mh
         Q6LtazU6szF5z2yfvJAM1qxvl5Rm27p5vIkrwtxMyuGvaM7SumHqUiLG3To7i/5q52KV
         2wa02HXLz3SUDdG5hBtlWrVsBg1/2RMC/7RttqLhdLMK7pu49lhtjfyJ1qzGoXsTkPCx
         N35yQOwoq7L71bajX/kh8ienu/KhAXZEpdaErnEfE4J7jSnu/jOMPyvsimjIz9nsFQEU
         kw1BWh4uzvSWBEq/EHvxoUFdz62cP5BHISPSJ5u62lKwO69Gssx4HbHeL+9NUozLGeTb
         ejnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784086707; x=1784691507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImXKgbl3lS6qZxDXyQxtMh8z7XxH+IHMoyh8vOWuhow=;
        b=PC0BbKAd6J7hb8ZR+1SJsLeZj3PChUeiSlkRVhMbyvu8xNvxWxsFLgerYJys9N562w
         hVXilOVH8O/F2QvjUbiAah66hbzcfvwHOIjskDW7wQEkO5lcPEuoYPMj49pj2k4KEdXU
         6uxjUh6JuMpyLG3WEC3PgxTotamtE/KlOC9eJc7mazzz2fI6t5f/5hRpHWJ3bee/ZmD9
         zsYfX/3Xay/fgxx+MXfREJG/hEYCYiX/AYNHCKmoKbVSw6btg92bPnFVh5fguFew3RrF
         GkpIetO2HxbhsJhzxjgIennxB3EeCa0gAaznHQ7pK5RrvDy/ptdNULlo4r6oX2jVVbJ7
         Kugw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4V3HyNPwGv7a4sPJESj7wwAdmFd68PAibN0oK5Qj+pewNk1ExyTuMhfky2CVePaUoVag/XT/B4i4Inw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1rvPO7cDHFs3qFnpWnFb3vRmGIcQGnKiAOkSe+nT6X3RfWsgi
	c4yhHiQeOLuuaMWMhgc900fBLAbge1iN92cg/xgLB7ZOIf9Lb3Ds2vLR
X-Gm-Gg: AfdE7ckXAKbsglR76WJ3TonUZO8SaSnMGiKvXOKVJmZ5y+W9Vhjsj+zBKXnfhU1pFgP
	+lAZsvZioOTAVV6GtL5Liqr6vXnEcS2Ay+EIsdZfoPcoa5uacRFzoUn7+OsIzrlkmdfEAN5ieCz
	lThydAY5FfdmMMyOq878k+6B6Ep+xwvmPHzRGKYvBh0EEdwXcLWe7FHpmnweSz7S+nXTlWS5G96
	d2lCxaeJz/ro9rQiCNHZpgiBxThqfJ3PhhfdCqvozZKKNXIbibllEQXbKkDOKu3RCqDGovf9et2
	OclO0WrjdQatC1DJafZ2YqmSQzLbeoQINuVIwmIMGC4WGeaARCvMXNnWxHALu6gLsQw1sTEXkJf
	9jQN3Wk0HTgz8IvhKqb2FGh4+6ya9c53Khl1sgxTfLCamweKHUCbIq1YxtuKI2TmCPXg6kKtv6a
	blRnSdMPsGNKGRXuZeIkzq85H9V79rEqcS1KDP08rUgfU=
X-Received: by 2002:a05:6a20:7344:b0:3bf:6c08:fb9d with SMTP id adf61e73a8af0-3c357553e15mr5402945637.49.1784086706836;
        Tue, 14 Jul 2026 20:38:26 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm91977889eec.19.2026.07.14.20.38.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jul 2026 20:38:26 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: mchehab@kernel.org,
	jacopo+renesas@jmondi.org,
	kieran.bingham+renesas@ideasonboard.com,
	laurent.pinchart+renesas@ideasonboard.com,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2 0/5] media: i2c: Add missing media_entity_cleanup()
Date: Wed, 15 Jul 2026 09:08:19 +0530
Message-ID: <20260715033818.10967-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


This series adds missing media_entity_cleanup() calls to the remove
functions of several media I2C drivers that initialize media entity pads
in their probe functions.

This is part of a larger effort to fix missing media_entity_cleanup()
calls across the media subsystem. Previously sent as a monolithic
tree-wide patch, this has been split into directory-scoped series
to keep review manageable.

Changes in v2:
- Dropped "prevent memory leaks" from commit messages since
  media_entity_cleanup() is currently a no-op. (Jacopo)
- Added missing cleanup to the probe error path in msp3400-driver. (Jacopo)
- Added Reviewed-by tag to max9286 patch.

Biren Pandya (5):
  media: i2c: cx25840-core: Add missing media_entity_cleanup()
  media: i2c: max9286: Add missing media_entity_cleanup()
  media: i2c: msp3400-driver: Add missing media_entity_cleanup()
  media: i2c: mt9v011: Add missing media_entity_cleanup()
  media: i2c: saa7115: Add missing media_entity_cleanup()

 drivers/media/i2c/cx25840/cx25840-core.c | 2 ++
 drivers/media/i2c/max9286.c              | 5 ++++-
 drivers/media/i2c/msp3400-driver.c       | 3 +++
 drivers/media/i2c/mt9v011.c              | 3 +++
 drivers/media/i2c/saa7115.c              | 2 ++
 5 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.50.1 (Apple Git-155)
