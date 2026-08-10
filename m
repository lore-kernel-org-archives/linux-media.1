Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A211337FF40
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 06:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343132; cv=none; b=VaRbCEtSeO50+SOSuuz9sediNnQdgVtbIaFM1C0zx5TQWnss+z51iTzuVvUOapOdBjaP7kPQpsI4ITbrwNsEwsJU+bV8OBNG48Vkoq/swEamGYWRdCST8P31eOW9PvR5bGBC53GcSinjlHv45KdXwbEJKWUTDDzBfcPLmGJlm7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343132; c=relaxed/simple;
	bh=YZGbKK2rGSRDQ6ux+FyBu3gAjT4XP4xn4CtrnPoTi+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=omtJcwwpjLvQRcSuQ30bfkn5q1kKE0Sqe8yEnh49yYEHg7a5asEyYAYtR03Y7R9btOUVQHoYdlrAi9nwRNzqVRPHQHhc2wmV1Kqj2en4IWBsib9/n09jSL6iZe/mY8WsHnngVfMaunIQhUszeiKQWs/UytlEuIxrlHePip5sfTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfxJr8Qx; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfxJr8Qx"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cbb973e6749so1786915a12.1
        for <linux-media@vger.kernel.org>; Sun, 09 Aug 2026 23:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343130; x=1786947930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6BK2MYpOQJK3BRwNVpIqWGv8AEdh5yV7abDFfZh0qM=;
        b=YfxJr8QxbStObfSUCVMl1hf1QejlEOS+L7u73FRIgEd7Hrm9ddOUD9LdPDBxRlytAA
         QfLiccz+/afCdkcp17ewYOyC7JyQFVGLwSo5GQAbS3+pFWBUa/UCLiOEHUZEy3sx8xRy
         t4NDw/NVwSP/qh8k6sm9qABWg4rTPY0hPvQGOqnULr19O7P4xb7JGnV1kYWebWkMo/hn
         +JsBsbGVHM2FtAqbF7+3MROlY7AuzwQQTUYGuCwA6twDSUK5ogI31xVeGoIC8HPdXvY3
         rXoexdBQRgyLCcr1Px/nhrKshwdFHw7Ga5I/OxYAN/rHr3W3Vjj1ModtqoNLrBa85rdx
         PIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343130; x=1786947930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6BK2MYpOQJK3BRwNVpIqWGv8AEdh5yV7abDFfZh0qM=;
        b=EpGw+Exul+2eaSgj6XoYtULNYItbJFWfVXeovIT544QG19gBbjESA8BOvbbqhbbzR0
         gqJwixlMLMfej81WVwzXE9J6Iq5z05Todt1zwoAqoJCtos0adLr/oxvu8a0ptCAjFLRg
         amgA5fLdr42ys3usQ1lxywiM1srLgOI/15e1wjxNDbItx7Qoe16lbeBg3vb9JfHHpHJA
         76jkgnu1obPz/UTNYS6JOpHdMwnEFfXUvx4FLpkz+5BKYRAGrDtcoCdnXkC7r1YY/hr5
         nboLWM9AnCxFVOt4FI5X/I3aqnwlShsHlmVlXqDgqOBYwGRwhft7u01ZEIWL2xb6mFbP
         SyjA==
X-Forwarded-Encrypted: i=1; AHgh+Rqg7LHEb3xZ+wKz56Scb7PJ161/SYPRUp/aV9EUqwAx50CLWZ0tcA6D7pQAovFUN0QXYQnhrU2gqMfOPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yys7SfoMzMwTHq5uxtI65tGjns4uEJogm+Rjmznz6QyjXQuVuzv
	Gj89rr2+19EDYkQk0hgI/3iFL2c6JEqXu9ogeoNXEVzuiGK+7CXrkEIzZ9jsXw==
X-Gm-Gg: AR+sD10GGIOwZRCIlKGwnIgNNCA9bDuPej7ASAYO0O+heGNVz+PgmH+GA6RQzMkwyD7
	auByFZ97Rb+rH23l60OCXxWo4oesw1kgqVABIsPg3SZcpsQ2lFnoq7v1gAuBzoTwF4Cbcbs+FNM
	9/e1JIqweeWDtT5LfL8Z9RxNbuAzjqVjwyk2buZgCwJx8z2y8ccm0lP9o8FNkrSfIT+DWeliTzO
	fBZKADwZEgRADLUGbvRifB93p6vH0pMqMx1jw1xJx/LWhU8pfibYplVn6NYxm6hR2z6QrIAFTHq
	JEiw6+KjhfzFUfwb1YiDxpcvGpMXO1WgeYtUhKuyUXKSp9w5b1Sqn4uEgdxhQnnop0oU/0W0Pbn
	foV8sYvwWml/Bfotf+THcBqpGVZ+lASEaGM53lQWShrcz3Fd7hzmNb6NlvI9J1niITd48efQWdZ
	/BWwsMre7VoZ/5JEdP2rnnpVM0ccbwhD5ovPRIusTwIg078R11qVI+nQTohQfqvp0V31NVCOOLM
	2CD1Q==
X-Received: by 2002:a05:6a21:50e:b0:3c3:8ead:6df0 with SMTP id adf61e73a8af0-3cbc0431dd0mr25765056637.28.1786343129913;
        Sun, 09 Aug 2026 23:25:29 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm40642912eec.16.2026.08.09.23.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:25:29 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] media: sun4i-csi: fix probe/streaming lifecycle bugs
Date: Mon, 10 Aug 2026 13:25:18 +0700
Message-Id: <20260810062521.1709379-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1786184456.git.congnt264@gmail.com>
References: <cover.1786184456.git.congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes three independent, pre-existing lifecycle bugs in the
sun4i-csi driver, all present since the driver was added (577bbf23b758):

  1/3 - notify_complete() left the video device and bridge subdev
        registered if a later step failed, so /dev/videoX stayed live over
        the freed devm context.
  2/3 - the frame-done interrupt was never disabled on the stop path, so a
        late IRQ could touch a gated block after runtime suspend.
  3/3 - the async notifier had no .unbind, so the cached source subdev
        pointer dangled after the sensor unbound.

Changes in v2:
  - 2/3: read CSI_INT_EN_REG back after disabling it to flush the posted
    write before synchronize_irq() (Sashiko AI review).
  - 2/3: apply the same interrupt teardown to the start_streaming() error
    path (err_disable_device), which had the identical defect - the IRQ is
    enabled and capture started before the s_stream call that can fail.
    Both paths now share a new sun4i_csi_disable_irq() helper.
  - 3/3: only clear csi->src_subdev in .unbind; drop the
    vb2_video_unregister_device() call. Since notify_complete() registers
    the video device, unregistering it on unbind would make it re-register
    an already-unregistered embedded video_device on a subsequent re-bind.
    Clearing the cached pointer alone prevents the use-after-free.
  - No functional changes to 1/3.

Two further pre-existing issues raised in review are not addressed here, as
they are out of scope for these fixes: the embedded video_device using
video_device_release_empty in a devm-allocated struct (a broader lifetime
rework), and notify_complete() not being re-bind safe (it re-registers the
bridge subdev, which needs a larger restructuring of the notifier flow).

Cong Nguyen (3):
  media: sun4i-csi: fix video device and subdev leak in
    notify_complete()
  media: sun4i-csi: disable interrupts when stopping streaming
  media: sun4i-csi: add notifier unbind callback to drop the source
    subdev

 .../platform/sunxi/sun4i-csi/sun4i_csi.c      | 25 +++++++++++++++++--
 .../platform/sunxi/sun4i-csi/sun4i_csi.h      |  1 +
 .../platform/sunxi/sun4i-csi/sun4i_dma.c      | 20 +++++++++++++++
 3 files changed, 44 insertions(+), 2 deletions(-)

-- 
2.25.1

