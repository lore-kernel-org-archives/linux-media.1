Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D9E44237D
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152671; cv=none; b=vCV86VXrcAv9Z2V/97DwVDJiaOUw5ROg+WED9YQwul3hYD8gzlLKAs7umtU+B0OO0McKtYBnUz0wU3dSpvKCnyXAe7CoUiLaXzRSLGNKotGrekzFDCAJ+PoNwJ7buWi8I+E6miH+6QtKSoVXAJEaraUd9rdme5qA2sH8R6JwV2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152671; c=relaxed/simple;
	bh=qSILxap1uKVhTX57p7J/ogsFNjwWmTdF6dSR+ZntbEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqRj7VIiKe7+X21Wj59xgTrlpk0zy51vLlQz2zIb40vwOK2veocYQN4YeXOKUTHQMbQzOE9rCsZh/q0JVO/tImqx8QrNy8HBWixBJv2rZemY0cRCTqBTdy/74Tcz5dKZ1eg0esvEEj6zQPVZjLnJuMNYNBxvzbrVn2KHgt9FRoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNjB6zx0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNjB6zx0"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so466485a91.2
        for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 01:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152658; x=1790757458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+bqb+VtEm4AKhCFkz+jnSq4qU2iI/9v5eFR8nmksBac=;
        b=bNjB6zx0VsxUK8cW7lnz2tkr2AVo8fhSJU3+OczMf+S2+GDnNqwIjY+hO94u9EJxM7
         PS9Y+2gRtXLFOebu2ClQwHiK2AlUGMZQ0uvpj8HOM/eK0bZXH1cPFUmESUZYgGnl4Y0i
         ZNw7nL8CiRAs0f6sVHBnfDSkHMg45ad2oFJ9vxiUdffQiPbzAZANU+f5BXZM6UKM+BB3
         M58cVsHNJk0XWY3IKQcSW95cQAeG085dPtdLak8nx21g1lUC8QVjhuqQM9eky6zo1C+K
         PnF/aRVqfDE+BflpXJGI6ykex51RC+QcffHvALlX8QkBEOpxXQpXC5+CV/M/GRtUXVq3
         vnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152658; x=1790757458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+bqb+VtEm4AKhCFkz+jnSq4qU2iI/9v5eFR8nmksBac=;
        b=KFr4w4WLXnlLF+DH/syubssH/lQXLAql9/kZCdEuqpXzPqYEW5nI1rtpZkuucG0cs/
         3b7PVQm2Suf7bJl1uYskJ4PBAKYg8C46PN+ZZngF9uJs5K2tJFPpUiVmCDYbgSBuY5AD
         X4BFjd5G50M4PmzGucuy+9DSX/mK9Lw6yCNGlOtyu9+X6fuwyQCqZuimc+VwxmL/iwEN
         q4A/XO/TQfL7kv08OFcC7Br/4hatIlGDFVG9kSOmZJ06Hn6YXXedz3OphqCPyBq1thsd
         Gpl1xEn8D9GExvUGbn7ykQoKMJX1MDuEX3Ksx+AQaQiXnfOittHJixZ7EqkoPs1pQWEF
         dRJA==
X-Gm-Message-State: AFuF++ny45En34yeIVtbMI3Fbdz8hrQ07lQWw3IH29CSYmLaIUIUqzVq
	0ODKnpBCwUab/5xrda5RQCWZrws4b79Z+jxb6tCol1jl6zjzBMSAGjE7
X-Gm-Gg: AYBFou202FNVrgjPTs7xQ5JOfuXbD+t96m4XyRFCeuB3Py4VQl8B8NoKD6BaJlBI/he
	aYZG8t/n0oXLbHbp3OAmKKFoNOCj3PMM7EJboIgOlSbEUr1J0359F8/Oz+MwRL0IExeBcfX6Sh3
	6CAp23G5St1w0R+z+DvZZYtEvRWSZ2ZftANUpeLAZcoPILo3mDse3RbW26dueJhgoJ9ZArWNEDF
	Hf6oiPQEFiKTO1X6OlZfIkbMTcb3PRRu9DU5A6/S4f0kL0odGXEeU7TTBJcb7biZqNKVouyHeHx
	9QBbwuRaztWIZedA3O6cZtanDIOZK/H1KyhzesAChS9ASfKOC/oREE3u2X97OnTUZItmKHnkRC/
	yy6r4vkWRsAMM6zabsvrOj/tndPQruOirVfweSEDfcWPoOnmCLlOi+8ekmV+Lw2u7Fa25G29F7U
	eHqyayQK+ESAi4Odxfz2jJG306NizC96Dh/hjaqqUQFlAFjdnZRENwoKuA0WgEgGMUJvou/8EFm
	vjpyWCh0dKWDO7TdodeTBg8vtsbAldyUEHE9+eRPfq+/xHHWDbwjElTwAeKCWlyaWP3FUsr1RZT
	UVyhlJYKWmhN
X-Received: by 2002:a17:90a:e704:b0:39e:6c6a:6579 with SMTP id 98e67ed59e1d1-3a07e695391mr1778896a91.60.1790152657874;
        Wed, 23 Sep 2026 01:37:37 -0700 (PDT)
Received: from localhost.localdomain (ec2-13-212-242-176.ap-southeast-1.compute.amazonaws.com. [13.212.242.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db883b5sm4314751a91.2.2026.09.23.01.37.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 01:37:37 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: s.nawrocki@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: exynos4-is: Fix a race between s_stream(0) and the interrupt handler
Date: Wed, 23 Sep 2026 16:37:29 +0800
Message-ID: <20260923083729.64831-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fimc_lite_subdev_s_stream(on = 0) sets ST_FLITE_OFF outside of the
fimc->slock protected region and only then stops the capture in the hardware.
flite_irq_handler() runs under fimc->slock and clears ST_FLITE_OFF, so an
interrupt can be handled in between: the handler finds ST_FLITE_OFF already
set, clears it and wakes up fimc->irq_queue before the capture has actually
been stopped.  The wait_event_timeout() right after it then returns
immediately and the driver continues as if the capture had stopped.

Set ST_FLITE_OFF in the same critical section that stops the capture, as
fimc_lite_stop_capture() already does.

Fixes: 6319d6a ("[media] fimc-lite: Add ISP FIFO output support")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1209,9 +1209,8 @@ static int fimc_lite_subdev_s_stream(struct v4l2_subde
 			spin_unlock_irqrestore(&fimc->slock, flags);
 		}
 	} else {
-		set_bit(ST_FLITE_OFF, &fimc->state);
-
 		spin_lock_irqsave(&fimc->slock, flags);
+		set_bit(ST_FLITE_OFF, &fimc->state);
 		flite_hw_capture_stop(fimc);
 		spin_unlock_irqrestore(&fimc->slock, flags);
 
-- 
2.43.0

