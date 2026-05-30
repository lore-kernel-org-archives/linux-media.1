Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BE939E9CF
	for <linux-media@vger.kernel.org>; Sat, 30 May 2026 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780134317; cv=none; b=Z1hyD8YutzswMFNakd/ul4VzAlrG/B4JuVEI8jLO651E5Sy4uUfVCiCXPfqeSbDIo3W5OM9c72o+AR7DYGcujwnFRbTsvFF104rdazHiaxR99FahN933SuLLCI3GogaAGNeeUSQ3kW1GijL8lKKlXDt7cb39wV9tXVhb0++CORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780134317; c=relaxed/simple;
	bh=r/mFmOM61+eHlTftM3kVYPBjuVOCnP0h2xGjOd4i4LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L10obzGRmt2lIchGTrgguAp4MAY7HYJ0zRLciBWylhekqgbQq3y1eJ+3mzanX8PRHRXq4ljwQhk5dDIWzdHWPl1FdGTbrsDWhETNm68T2uuvZmljdedodZz9rq5yXmPdHbRFPDqtkUl1IYvAInZfrCNO4UMZtvVf1cSzZd4ig1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRoI6cYh; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRoI6cYh"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf3781ca51so5988535ad.0
        for <linux-media@vger.kernel.org>; Sat, 30 May 2026 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134316; x=1780739116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5aJiRofz4S8JTYcjNZpyXHhE2VKKeRqZ24DGJJ/QHU=;
        b=mRoI6cYh1nYepdomEUbkhUKdWtYRW35pzYomgvroHNJRcHm18tkXdikGLAp7IwaDIr
         QE3EuaQW0T9o9ub6RHcyeGcaOj2YMX6vgVgzJkINfj5vGdjtndSPqPcor4ztzIWJjhGq
         4qUHQo01094PlL+LaUClL+MMwcGgOn8jWM8MvIbjOcEkesg7OY3ln/T8WPKpVtGEA9pf
         catjIA4a0b1HwUSuNHLAM3nDvxt+ENSrJ5d1WBnGQRo1J/cbdGJp3tN6ByOVh0UCOrGx
         ucuuFOrBFjNcldaPfpOTl8FavWrctXl5yyIwdUagoSKvKiREqApgs5gP8crsz84dXASE
         lpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134316; x=1780739116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N5aJiRofz4S8JTYcjNZpyXHhE2VKKeRqZ24DGJJ/QHU=;
        b=j3JSsWU/i+gyJNY1XzPAQsv359LiB1XZtZ7Uj4nFfZ3feY2OAZ9Hu5drkYWf0MMK4E
         qy5ek350QYtD9jBAK3kCgh8Xpn4fEHMDb4t03BYgIWrGy3k2769ZDlJbwXMZPJ1ivgz/
         CdQLAjauDh5ECq1ba222ajgyr/KI0X+yJCdF9dEd2Y9cB15QzNpYgtE6928g+MPfd7/U
         j7Obv+1jeXZFCW6UwdbM2ppYg8LcTZZ3jjb7XcI3MT7Cq6AkNrprzWxGYqt/1vnQcNDC
         ZEOchN1rHplP42GmdStXKjny1SGKZsNNx/xrSwINPZQQ+w19QMSM2kCtGySTh05MOE51
         xm8g==
X-Forwarded-Encrypted: i=1; AFNElJ/uY7AOEIZbJ0mtETqmGUXxNLaerylUj6FGCIfTcOaXYMVDQWMiHWVTzRDN594lmgoBRlFkWzmgjjrLjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+iWltx0enFmp231sH60e86g0hd9T/KOlWfGlBjNWqknhxBJRO
	al00zM4aUDoEmswhQjcCP8xbKlhHl0YZkFlH4ajtilYo4yC0KLJviKgr
X-Gm-Gg: Acq92OGECvCxhQV0Fxb5rwzMdpOTtZvA3G7hFY0d5KwV60RDMit6VNeP70h9pGDoUX8
	t1hlljBJH47ehFm4Ss9ctDuGxE3t7nIbWNq4IO7SfnPrYTBz1A9uOcL7GVf6Kx8zXJujI837NSc
	+M2dnMHrkBscQHSabk958cSIqXMu8uFh3GBRxUHP7xKcm4zwB/MxhKWqNwkuCX6Pd/4qnDFHsoe
	GuXMPdI6TEP9EoyucWGQnbS8DeqmGelwAecMPQGTsdEiKBhmYyg7d6jKvOZtiwV3xbEu9dIS5oL
	axgWdloiYi0ss647Wk+30YFKDY3tIj6mixlDDKj5ReuCNYdljSYPhFOX7d7125cYr76scT+N3Ns
	WQz0NFnkfB3IShYSDXYf3nt2ZH2sdMZxGGM7qCkjQF1zg41CdWYlJ2MNIW43PXbFQoUzc1oLIxO
	WDGt89PVMCtelMVhHRDfHWwKT/OMmxJNw=
X-Received: by 2002:a17:902:e88e:b0:2c0:a3dd:4e6c with SMTP id d9443c01a7336-2c0a3dd4f17mr23090205ad.38.1780134315999;
        Sat, 30 May 2026 02:45:15 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:45:15 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v6 7/8] media: meson: vdec: Fix NULL pointer dereference in ISR handlers
Date: Sat, 30 May 2026 15:12:53 +0530
Message-ID: <20260530094326.11892-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hard interrupt handler (vdec_isr) and the threaded interrupt handler
(vdec_threaded_isr) directly read core->cur_sess without synchronization
or validation. If a streaming teardown concurrently clears core->cur_sess
to NULL while an interrupt is being processed, a NULL pointer dereference
occurs when accessing the session fields or codec operations.

Fix this race condition by using READ_ONCE() to obtain a stable, atomic
snapshot of core->cur_sess. Check if the returned session pointer is NULL,
and return IRQ_NONE immediately if the session has already been torn down.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index f99335effe17..3897c75b19c8 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -996,17 +996,36 @@ static const struct v4l2_file_operations vdec_fops = {
 static irqreturn_t vdec_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+	irqreturn_t ret = IRQ_HANDLED;
+
+	/*
+	 * Use READ_ONCE to secure an atomic snapshot of the pointer,
+	 * protecting against concurrent clearing during streaming
+	 * teardowns.
+	 */
+	sess = READ_ONCE(core->cur_sess);
+	if (!sess)
+		return IRQ_NONE;
 
 	sess->last_irq_jiffies = get_jiffies_64();
+	ret = sess->fmt_out->codec_ops->isr(sess);
 
-	return sess->fmt_out->codec_ops->isr(sess);
+	return ret;
 }
 
 static irqreturn_t vdec_threaded_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+
+	/*
+	 * Prevent late-stage threaded interrupts from dereferencing a NULL
+	 * session.
+	 */
+	sess = READ_ONCE(core->cur_sess);
+	if (!sess)
+		return IRQ_NONE;
 
 	return sess->fmt_out->codec_ops->threaded_isr(sess);
 }
-- 
2.50.1

