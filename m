Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F75369D4F
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303118; cv=none; b=V3kJJI4zXPBQQgKUMz8KXpZUjMpKnfsIE69wdGfdDX+d+4fdBqBbv6jIUCJipIYm2Lo01M3P59dA2xSk2eZt8CMQzYgJYeYOGzDXDQuZSXBYACcHQzndGh0v7l2kCq4DsGU9ZuwRbAlVS3aaz+pr77zYB81lBCLXHrO1yfGPEho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303118; c=relaxed/simple;
	bh=bLwkSaMM2QyNilXq0RTf9i0nymRBPAHMhYEXy94WATU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E0l2wfQmENpOOEnteKyvo6eZIA4ibbYU1OvcxL79D+2gs0/gWx1WIOsfflYjmjK6TVw8YoygZeTaTTSRJOx+EwhrtTyz53KfTwaPR4sTS0wT4vL9qzSK5bfE5vsYWzJjRsqukBfIayYoRSb58xhYlnWIyScnOHlnj1C2bcl/I2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/P4Qp0q; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/P4Qp0q"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4720f3bf164so936758f8f.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784303115; x=1784907915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tk8lVGnRUzd3xxkm+i4v8VOVuBwgnyAk7LAw5MNlK7s=;
        b=X/P4Qp0qPHvF9Vds5cS9twvS+wd7H/9POFJAFgxnEi/lOy7atj7Y57GerSoax5x/+P
         hLxhGrDBOk4Fb0KXfavqq/Ixx4oFkceilAcctFvGnzyTpQTrNgx/n63ficVGJ4ox+AHH
         icF0Xuwdzdbon+30H1sYuA2QfGLb4nlpM33fAOrsQbddN62WTkb3QtiQjvOh32DBkduE
         gSpkeZSlX2wM+KejNgKIkPALzezjCrV18TgiVb3cVWll9YtLau7COpqlVVLZbvLGR/hz
         Gawkp6KyvqPNcvtSljWNNugL37eaqd/XdaoWwP3JaHydgh0p//hyOQ8d1LGsSud5aq2/
         KkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784303115; x=1784907915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tk8lVGnRUzd3xxkm+i4v8VOVuBwgnyAk7LAw5MNlK7s=;
        b=X7i93fMeZq2JRr1pS5aIXtitZowVxC46KIZMig+Oo+u3kzE/NiLwG+O3QbDrRBxuPM
         5wZvD0eZS/mj9+B0rz3AsjhFaDFzBPjo8N49CB8PdFeGF7ADCUU/x8SgqL3JoMCALB1m
         txL4rhXFJkANQLfzsnoIJg6DhlkwK6V6jMdjlQ7aFlu8CrI+eevybDKBQyydOWTQ03wR
         DC+bStSG4NRUwezEh7gTC0UZhdTcMF0523u/6KjAVUmeGDweN00Jwf5F5DsLeu5mp834
         IdA0zZfyn9bfFEraLq/TEx7xtwTq4HmQxN68kKfbZiTcjjPnH/wAVqKS3khumvz8e32y
         xfSg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9Sl6d/2ehyUr1AAy2S5egPC+MNGKVxT7muOgymJ7+7/VJa7LxECkW08dYcthrM5xaFEcf5K68ww0ARg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvTTRvjSjw0PgwhA1OoNCuDxOWnzc8LYAnrywZRJwNx/b+XydO
	/6CzJLOAU0gMHtATagAJFg+QzC0qJNM6PUf6KXf+sPxqLDCLN2tsLww=
X-Gm-Gg: AfdE7clKeL4PcD8NB0QRrliExW9xLrvR5A1+eEKXT1e4Zgb173rq18GWVKt1f6xanMH
	wLIfdFCwJp9MY4ttDcuq3ImN4SX0wllghMMOEmUCJGSIYXJ0vJkX9MHgPSuaFrCFWHd3vnp3f4J
	N4Od9dgtYDfTY8tSFDbaHifBkeEfvj4Cb+OguNzw/LT0m2Im3rwsaMEULzRwcYsoMQpDjhxTy/V
	xOXisPs7KMFiw/K3fpXQwJ6AcSJpE7JIRRQg1fOWz7LzY+22ld9ruhxzrxV0cPOgzAkRxcNNcx1
	y1llzBai0P1PgsXZGIe1XqSUvAy8m0NX0veykJ6dofTLmbztYnwXso/q5I/NDd/dJmEvnAE0N0H
	4xaLBVwJOLrsuwr9wHTq70E9DciPAYVN+6uPccpe1eHGyJ1+89dB3ffsqt5QXrELh+ENp4iGR+t
	IrzKItJc5n0e0x6Z7TFEWpqKh+7gT2q+jA1Nk8Ia9yOf2MhRPuOk+A9VM/enC71W8=
X-Received: by 2002:a05:6000:250e:b0:47f:4834:99cd with SMTP id ffacd0b85a97d-47f5a66292bmr10529100f8f.26.1784303115040;
        Fri, 17 Jul 2026 08:45:15 -0700 (PDT)
Received: from localhost.localdomain ([151.43.147.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49500sm4629130f8f.2.2026.07.17.08.45.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 17 Jul 2026 08:45:14 -0700 (PDT)
From: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
To: jonas@kwiboo.se,
	detlev.casanova@collabora.com,
	nicolas.dufresne@collabora.com,
	hverkuil@kernel.org,
	mchehab@kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: rkvdec: fix clk reference leak on unbind
Date: Fri, 17 Jul 2026 17:45:05 +0200
Message-ID: <20260717154505.83935-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonas Karlman <jonas@kwiboo.se>

remove() calls pm_runtime_disable() before
pm_runtime_dont_use_autosuspend(), so the second call can never suspend
the device: it reaches rpm_idle(), which returns -EACCES once PM runtime
is disabled. The probe error path has had the two the other way round
since the driver was merged.

This shows up when the device is unbound while the 100ms autosuspend
window is still open, which is what an rmmod right after a decode does.
device_release_driver() calls pm_runtime_put_sync() before .remove(),
and rpm_idle() adds RPM_AUTO on its own, so that put only arms the
autosuspend timer. pm_runtime_disable() then cancels the timer, and
pm_runtime_reinit() relabels the device suspended without calling the
driver back. The clk_bulk reference taken by rkvdec_runtime_resume() is
never dropped, and a later probe does not reclaim it, so every such
unbind leaks one enable count.

Drop autosuspend first, so the callback still runs and releases the
clocks.

The PM calls also have to move ahead of rkvdec_v4l2_cleanup() rather
than just swap with each other. rkvdec_runtime_suspend() looks its state
up with dev_get_drvdata(), and v4l2_device_unregister() clears it:
struct rkvdec_dev has v4l2_device as its first member, so
&rkvdec->v4l2_dev and rkvdec are the same address and the check in
v4l2_device_disconnect() matches. That is harmless today because
pm_runtime_disable() suppresses the callback, but once the callback can
run, a suspend after the V4L2 teardown dereferences NULL. Swapping only
the two PM calls oopses on every unbind.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
[fsp: wrote the commit message; the diff is unchanged]
Tested-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Francesco Saverio Pavone <pavone.lawyer@gmail.com>
---
Changes in v4:
 - No functional change. Resent as its own thread (no In-Reply-To on v2),
   per Nicolas's note that a new version should be its own thread for
   patchwork tracking. Same diff and same commit message as v3.

Changes in v3:
 - Rewrote the commit message, and dropped the VP9 claim from v1 and v2.
   Those said this fixed a VP9 inter-prediction bug on RK3588, green chroma
   from the second ALTREF frame onward. The bug is real, but this is not
   what fixes it, and I should have established that before sending v1.

   What happened: I took this patch out of chewitt's tree along with two
   others and tested the three as a batch. The green is fixed by "media:
   rkvdec: implement reset controls" from Alex Bee, which adds the
   reset_control handling that recovers the VDPU381 after a transient error
   (COLMV_REF_ERR_STA and friends) instead of leaving it dirty for the next
   inter frame. Randy Li's PMU idle export goes with it. This patch was the
   third one in that batch and got the credit.

   Retested this week on the same Rock 5B+ with an unpatched driver: a VP9
   Profile 0 1080p clip with alt-ref frames decodes byte-identical to the
   libvpx reference, across five rmmod/insmod cycles and after an unbind
   inside the autosuspend window. The green does not come back, because the
   reset_control work is in the tree I test on. Sorry for the review and the
   testing you spent on that basis.

 - Worth flagging separately: mainline rkvdec has no reset_control support
   at all, so the VDPU381 is never recovered after a transient error. That
   is a real gap, it is just not this patch. I can write it up properly if
   that is useful.

 - The diff is unchanged from v1 and v2. It is Jonas's 2020 commit verbatim,
   and his original one-line subject already described exactly what it does.
   The wrong story was mine, not his.

 - The subject changed with the message: "media: rkvdec: fix PM runtime
   teardown ordering in remove" in v1 and v2, "media: rkvdec: fix clk
   reference leak on unbind" here, since that is what it actually fixes.

 - What is left is measured. With a dev_info() at the top of
   rkvdec_runtime_suspend(), autosuspend_delay raised to 60s to take the
   timer out of the race, and unbind driven through sysfs:
       unpatched: 0 suspend callbacks, aclk_rkvdec0 enable_count 1 -> 2
       patched:   1 suspend callback,  enable_count 1 -> 1
   The leak survives rmmod and accumulates one per unbind. With
   autosuspend_delay=0 both orders suspend once, which is the control: the
   difference only exists inside the window.

 - Fixes: was wrong in v1 and v2. ff8c5622f9f7 has the two pm_runtime calls
   as context and only added iommu_domain_free(). cd33c830448b added remove()
   with the reversed order, and the probe error path with the right one, so
   the tag points there now.

 - Dropped Cc: stable. A clk reference leaked on unbind is not backport
   material, and the tag was only there for the VP9 claim.

 - Dropped your Reviewed-by and Tested-by from v2: they were given for a fix
   to something else.

 - Not included, happy to send as follow-ups: clearing empty_domain after
   iommu_domain_free(), and hoisting the unregisters to the top of remove()
   as you suggested on v2.

Tested on a Radxa Rock 5B+ (RK3588) on a 7.1 tree where the six calls in
rkvdec_v4l2_cleanup() are open-coded; the executed sequence is the one this
patch produces. VP9 decode stays byte-identical to libvpx, and five
rmmod/insmod cycles leave dmesg clean.

Link to v1: https://lore.kernel.org/all/20260518105413.42147-1-pavone.lawyer@gmail.com/
Link to v2: https://lore.kernel.org/all/20260518145414.64514-1-pavone.lawyer@gmail.com/
Link to v3: https://lore.kernel.org/all/20260717150440.77079-1-pavone.lawyer@gmail.com/
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..0ec3fca9cccc 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1869,12 +1869,13 @@ static void rkvdec_remove(struct platform_device *pdev)
 
 	cancel_delayed_work_sync(&rkvdec->watchdog_work);
 
-	rkvdec_v4l2_cleanup(rkvdec);
-	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	if (rkvdec->empty_domain)
 		iommu_domain_free(rkvdec->empty_domain);
+
+	pm_runtime_disable(&pdev->dev);
+	rkvdec_v4l2_cleanup(rkvdec);
 }
 
 #ifdef CONFIG_PM
-- 
2.54.0

