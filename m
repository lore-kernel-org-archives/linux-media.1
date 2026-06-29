Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD46D3B9DA5
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732652; cv=none; b=RK1tZcxspK7S/RIqD5VKW0prZN1645vB1ByQ5FvMKDs8bjhMJqxacPXFjPYZLuXEcNj7j00Ogf6IOEgONS8pothAdE7R8wlu0j2LQy0WPRtXOZhUu+96f2lW6mpLLwbx00cbCPHOjED3kDTNCNoJJiqjurU6NOxehhmW1oZMFBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732652; c=relaxed/simple;
	bh=QSUEAP+Nd4pVoltuzLogp/stpR4Z7CG0NdMEnz186bQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kLSiXwn9x/h88sTVN5vVo8qX4eiza9um4T8df8s+Gzx4fDdtd5Rb0g11Z+2GDOkNnrcq68syC6BtyD65cAukVmNLJr9h5yXtchSaKWq4M2+kqmZNwDIvfLPYBvdGxK79T1g67QHGy1CWaDGDd7pKJ9UNyN48UK4fI+PxzllZvtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hcfVZ8MU; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hcfVZ8MU"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aeba1a36dfso576452e87.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 04:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732649; x=1783337449; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EOxj6jhWQaC4bW6qpCLMl5ChGw244cUlmVoMPEl8HCI=;
        b=hcfVZ8MUninAnlFVPrjo0AcaKWagp+SjW0Jw/gOs6nfTWgOMw2M2KldkQeaeYqXoP9
         d1oaUZn3pHfDIdm0NxTQbo+n03Lv3FNLeVXcoTyV6NIwW3uA0d3bMi2TQjiFeKSeukRg
         RwTftMntGEBTdJLiTgdgDHKcoFt4fCmoZsDkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732649; x=1783337449;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOxj6jhWQaC4bW6qpCLMl5ChGw244cUlmVoMPEl8HCI=;
        b=EN4GCVYjJe3O94AVllYMNwHxE0Ufyv1hEUEIflps4JJdtMGbaBgBIxjx+ScvJp5oeI
         BcwksT6BCFVpnOwAGBXM08bVq1m/Fz5xUoU977LoKFfU2I0qjlT2mlbS+Ikq1rW7NYUo
         4XUAegSXOuCnfWH3ZVxt4I6DF/IFhD9QRvWHl5lt4HF1qIet1Wo+hjmwDhOXODk+XIOp
         rVpdVh5nqrzH4NrLX2cVY+HhbbUxT/SHczic5C24oRvxzatoGgvw3rQUuf21T2CUhAEx
         QvWd1vWiWSfRuDnUPzE/YH9Opqi2QufNYJboMkSQhie29ZstQqzBX3GhS0YO2vu6PzFG
         LvYA==
X-Gm-Message-State: AOJu0Yw1g9g0UxbklyOeO6EgB6qPtu2eHO8gfgwNIfd34QdlZbqsjXvL
	lCC8BOvx5m90G+CniDVSjZw1Zb2PZo2buWwD99GseQq+gwy/b73CFmqbswGdnLAHJg==
X-Gm-Gg: AfdE7clpu9+7Vvlir2YjuErgXpig9NzDk9HpnfSNIMtrEQKhilI4ndhcYaFepluOrNH
	1qF6ZcGo85tGfzTFD4hOQNotbYKCvRULnaAL25EZmUNSLLwNvC4URRcH8Z97lS2mInb1artgkx/
	GJIQaR/pRqotUaY+q8otM8IW7th2B9sUyVCclMcZPpCF8Arxbq2cNmXZgUNqKdGuJymlYKb5bf4
	XNFz0sNWMGJQuFV5+wRxGX/ocC1s9SYAXwvM5P5Wg02eDsfXJ/MZXoVxwh+iY3qrkfgbyfeSnJ2
	n7AHV7noCpU1JPwyLIAhhd794k358XBP8vTDwWHx800AqZtr/0XxwpatX9zHuUpUHNmf9nDn3wF
	Kinyb3JMHJvmg7KIJDcWlk8ygFwvO5NakYRkuNl8RRKqtOt0xYpxy2N7AkmoWXXHyV5Zqz2+57a
	unHXtEBmuIyD+dFlPA8ItztmwAfm7CUZfztDHPwYWZKVeFzsDdKGG1dXz4i0cfqS7SsxeDHrfX0
	QSI7kA=
X-Received: by 2002:a05:6512:a35a:b0:5ad:55f6:1ec3 with SMTP id 2adb3069b0e04-5aea944f191mr1546849e87.5.1782732648947;
        Mon, 29 Jun 2026 04:30:48 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:45 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/9] media: Fix all missing cocci warnings
Date: Mon, 29 Jun 2026 11:30:41 +0000
Message-Id: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGFXQmoC/x3MQQqAIBBA0avIrBvQiZS6SrQInWo2GgoRiHdPW
 j74/AqFs3CBRVXI/EiRFDvMoMBfezwZJXQDabLa0ow+eS/okNCFUZNxbCey0Ps78yHv/1q31j7
 Q8KBlWwAAAA==
X-Change-ID: 20260629-cocci-7-2-7d30217e6526
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
 Nirujogi Pratap <pratap.nirujogi@amd.com>, 
 Sultan Alsawaf <sultan@kerneltoast.com>, 
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bin Du <Bin.Du@amd.com>, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3

With the introduction of 7.2, cocci is triggering some new warnings in
our codebase. This series takes care of the new warnings and refloats an
old fix for dvb_frontend.

./platform/amd/isp4/isp4_subdev.c:394:6-25: WARNING: atomic_dec_and_test variation before object free at line 395.
./dvb-frontends/helene.c:1049:2-7: WARNING: invalid free of devm_ allocated data
./dvb-frontends/helene.c:1013:2-7: WARNING: invalid free of devm_ allocated data
./dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2776
./dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2786
./dvb-core/dvb_frontend.c:2897:1-7: preceding lock on line 2809
./test-drivers/vimc/vimc-sensor.c:107:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
./platform/qcom/iris/iris_vpu_buffer.c:703:13-15: WARNING opportunity for max()
./platform/qcom/iris/iris_vpu_buffer.c:583:23-25: WARNING opportunity for max()
./usb/em28xx/em28xx-cards.c:4085:2-3: Unneeded semicolon
./usb/em28xx/em28xx-core.c:635:2-3: Unneeded semicolon

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (9):
      media: em28xx-video: Remove unneeded semicolons
      media: iris: Replace ternary conditionals with max()
      media: vimc: Fix prototype of vimc_sensor_update_frame_timing
      media: vimc: Ensure that pixel_rate fits in 32 bits
      media: platform: amd: use refcount_t instead of atomic_t
      media: dvb-frontends/helene: Rename priv variable
      media: drivers/media/dvb-core: Split dvb_frontend_open()
      media: drivers/media/dvb-core: Refactor dvb_frontend_open locking
      media: drivers/media/dvb-core: CodeStyle for dvb_frontend_open()

 drivers/media/dvb-core/dvb_frontend.c              | 159 ++++++++++++---------
 drivers/media/dvb-frontends/helene.c               |  56 ++++----
 drivers/media/platform/amd/isp4/isp4_interface.c   |   4 +-
 drivers/media/platform/amd/isp4/isp4_interface.h   |   2 +-
 drivers/media/platform/amd/isp4/isp4_subdev.c      |   2 +-
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |   4 +-
 drivers/media/test-drivers/vimc/vimc-sensor.c      |  12 +-
 drivers/media/usb/em28xx/em28xx-cards.c            |   2 +-
 drivers/media/usb/em28xx/em28xx-core.c             |   2 +-
 9 files changed, 134 insertions(+), 109 deletions(-)
---
base-commit: 253355887a1ab0ac8f33b356c7c1140eee554d18
change-id: 20260629-cocci-7-2-7d30217e6526

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

