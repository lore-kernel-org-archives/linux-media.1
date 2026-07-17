Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A5E3CAE69
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300702; cv=none; b=rOpZ+Lmd1Jv49ld2HBb+utyX/USZtCYC+235J1hFb2VgBZRK6SFi+c5Xb9ArIixfFbPQSemP4Y2RaHHslKS2EMKeqEf50zIfhHHUAQIAl7azJ/qsHrrIRSmrgHkJVSjbFgZBZviiyGDc+p3n8kaQqfp4sb3JhXu47K5yWL5cf7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300702; c=relaxed/simple;
	bh=rR8N1Zbpm2ePEoBmHspb8UE2w5AmMCZGSQUdoY8nvK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdvSEECMaM+YS5DlvXbQ2TnVa1xdWO8W5ffS/Ss2PDiokJiloPR8HDn25jC+GLnjWdgzGIo5hcSybo7QSe8wk24nGdaf/X+2iJI9n8q61WkfzjHHdO4nkrM/dM4kjtH/df7czXt6JeeSKMG5tQqekceo6bA9lV3qzEjr8ndxSm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcDUCSIL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcDUCSIL"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so6958893f8f.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784300695; x=1784905495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=upJ/Sz4s90QYZsqxnOwkFAGLL7mfnLMLMnUCKkDp/Xo=;
        b=YcDUCSILVdcpaoCF1c3e2noCNR3XOtS1iPmWjp97dDBo2Ys2sbD4U3JjZ3xlB0oVh6
         0sFXkTQb+kq9mjJU1yqRK5zIQH2cr7hNmj4xdXOqcD9x0lemu2aHbiTeqDV/Ugb8nE9k
         CJkWzZnWsE2r8Jj60keDIYiGKV30vKVtxx3Yy4WDYwzVbxQ7C7hsh8cZJ0nbfG9Wy+7Z
         hff+xq6mQKsHf0B9cpFYmDPCIVgNQ/FLnFqhJOG4qvTsMB6z+HKgp18Acj/7VQLpZU/b
         zjaFhw+Wd95ht5+hO7XZLQ4WkjAWib8N4n2/HoucKqkLeYYdnU4mDmRUdm08qyowJbaB
         sraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300695; x=1784905495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=upJ/Sz4s90QYZsqxnOwkFAGLL7mfnLMLMnUCKkDp/Xo=;
        b=Y/S8fi12aqKIH3eIfng4Qy+Pj28cENI8wNxf9l8daccC9MQA1CwU8XMevAb93jpHnL
         BD7vu3CoGEB56be8mfOE1veQOTSSMPig+tLn+XHv0linHQaHyAqL63B8WosU6ID0icD1
         CWWwzlxu0cljoz7U+bSS9mY/LwvfrxBCKCUsu8iw1x+lCEqh218S8IUwWcaUJWQYLLD7
         o6Pl3vrNhYeRycqHiaZ0ZhD+nBLBczF5lYjvsgSW8mvxjHJLSZNqj4WWMkC0rrXKj1/h
         fmnHzZUEw64gRcJfqStIAActPgIKSvRwqgpU5/gGOtuwroIhrLHBy9pnQzuvjEWcpYsR
         XGFA==
X-Forwarded-Encrypted: i=1; AHgh+RrO2w/WIMOTCNBOPJWPOQI5MIU0utLFVVLECTJC6BQe71m3PhD6U6HrYBJ8dzYFIqNzltWqwb3anIhslw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyL1R1fkIEQCnhcbl0hyF8f5lA4wt5E3u2nUBNXXZWa4cRZrAu
	KLSCIg2ozOUrsUsMcJPQeJ1e43PT7jh8p1zbTN6822GKwhfipEBg20c=
X-Gm-Gg: AfdE7cnqQQQJ504IuhhzeCVasla5Yq8NHO/qcGc5a05pJ3AfpmjtFxL4GsqQoMzsQs0
	0OtL6I9wozCc7eEkWfO831PRDEy4TDhLPadcMd7Jr9gCNCiNNSzmWJMBSoYgQUQOsbDlADH/VnO
	yc2JAP9IDJmbda7HtVywK0sJ6xDdFOTtBZ6yUMdx1E5T2fSnYmdgFGpIrRjvGPFHaKGfVaTtP4u
	0wFTFFWxNo4FUsnx2KErK0MQilU5V6ZSYBz5I2nhrFTdbY05OxjkVGKy22puIIOetc7mWpp/RaU
	HXSIyAxFWhVWLk5LE2sQI6uU/rf8zj0P4lWnTCvT5nlPBicCpQ823P/c+s9Qt6+9F+AI6IujJBW
	NKEPAPbIgy+ZMY5AWRaAjVO1xxWg+4CXWlNX8eO+k5ZmCqT4PNadjR3Olppd+peQVGRjYbNaQaB
	appZ6qmy6yXNJNzekpYFaEHdy7fMUJphegkBOJqu8wDCdR1iDBVgsApL3rJTIVnLD6wgIaRDO5E
	g==
X-Received: by 2002:adf:e19a:0:b0:474:5a38:f650 with SMTP id ffacd0b85a97d-47f622fce0emr4011373f8f.3.1784300694425;
        Fri, 17 Jul 2026 08:04:54 -0700 (PDT)
Received: from localhost.localdomain ([151.43.147.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm1735813f8f.21.2026.07.17.08.04.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 17 Jul 2026 08:04:53 -0700 (PDT)
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
Subject: [PATCH v3] media: rkvdec: fix clk reference leak on unbind
Date: Fri, 17 Jul 2026 17:04:40 +0200
Message-ID: <20260717150440.77079-1-pavone.lawyer@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260518145414.64514-1-pavone.lawyer@gmail.com>
References: <20260518145414.64514-1-pavone.lawyer@gmail.com>
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

