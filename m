Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979528;
	b=1Vvv1SjOtj5buTBC2RKw+Rid0+y2DMLoi3YlxN42No94g3wgC+agFkyu/Nk5VYy87tql
	 jzeAE4pOjsJOnVOqChHgySC2ZmrOFimXpXKvM/TLNO1t7LLdsl2T6W0aLR7FrgT++lwId
	 i/oKL+bLfSICfVxEljSvKRgBWpxJ4uVQ6hWzf9tRKWN7sBQtZA1701oGCMGQrFJLDmqB1
	 vlrkc0uKlTQq4hKCizouJpezLoWhorMftOjX7qSlLHvVRrg7ODMVVuKuby/Ts7RCjw849
	 qtrZ/MN0Ueb16fG0TeZEJGcv+5CVUWL6dKndN0tJVZh9hGt5UPGlYhpRR1HgDeEexlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qAsxFteOOkjn85+iiSYU4HCwymsUrf5TgwAhY4i0RPc=;
	b=QqE8uHqy+YdgblwCMH53jAT5fYleNF90yewA8wFGBxLcjHQdX48JmV14aPu41SukKMSx
	 oqA4bVyPs6ZyKAznD6dV9Q6VmR4uvvgoiKpHbEGA04v0eCMJR1nt2XdtsIOocJYMF6bOr
	 la+rNidsM/4IPgKTyBIjmeEmFk2oBREj7e71uQxtI9m1ytt2jzoKCvsrF7YhOMtUcrjtg
	 ktENKZNLMM6Y0BFaggG7oDLkdnt/ftb/H17gHIt4/66gPkU8QSFgq/OBmbLKMvD/30c1y
	 yckhaiiH2dAqzOmgBfgHRBrRgxLOz1fO1xpI8Lj934Iq1ZVHufex6ppWyCltksdmQ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJAJQYE1;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E197606A32D
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 15:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E197606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dJAJQYE1
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso358673a91.3
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 07:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793979528; x=1794584328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAsxFteOOkjn85+iiSYU4HCwymsUrf5TgwAhY4i0RPc=;
        b=dJAJQYE1w/j77c18sxLOlo+mr1HuEXlS37uqbWjJ4X/5lm97x75Vp+apbxqyhKE+Fn
         HWTJcV1wWbDg5zUaT5jhN8RLS3k6SY9lJX5jXuG9wWu+dB9lWbchMLk6X6vnoBTqWw3s
         pV1RRNRbPPvXt40PH1AIzIM8v4w5Me3sSeOn3O6aAE1+sP7AnnZam8Vyuj0MZ1TKiWij
         pFwvVGrnmK/BCISZfmfpAa/tKPjMkdNwTZ0V9h0795WuYHlTlfZ1/VmoW2x83SisKvVT
         LACJSAj484px3o9i8slantTN37v6/QJsYLYkZAwN/uv/GL41bimO30PxYXrM91Vr43Pf
         HjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979528; x=1794584328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAsxFteOOkjn85+iiSYU4HCwymsUrf5TgwAhY4i0RPc=;
        b=pz58EZbL4CFT2OqfkdWc2/CYPmyphVCwvYad8Y5y7BesLK1ufIYDJ5ooBXYHHD2qwm
         nAQI9zuMxGaSrMoyLQ4xKWjzJuUJT4YyDGwXDwKrNbNmn72r0eVcelDkaDZKl51NBzjE
         I+wlF/uCLqSEMdJ24H5/UlzowGcGVJ4099glbEHuH/RzivOI9kXzdk5coX0qZHvpreRe
         8Q9iK14Nw1oe9/esQQAXGtM2agxX9qA8ICjIoUrjhh+/dVgjJ6c60FPodOjear5sn3pk
         lDH9lw1LP9zi5JKZ7ayW0k060Xq6W/ksJru7pFtpHOQeI16cT3K0Tq0dXusMamJfoMy5
         530A==
X-Forwarded-Encrypted: i=1; AL+hErH9b2miysg7ND9XuF5TgGIiIp7S1wMXNzaPbWaaf02S6u0t/LEeqDLJwaut86x61izHrz9JeTDW9c99ug==@vger.kernel.org
X-Gm-Message-State: APuU4Z8IMZmrVe4p9XojCEmsAPxdHxVcI39XSIB3CyRusNKK8mZGSc4Q
	JzigY/YZwt1cLxl97gxuRcgRjdHPpnJ/rOvuIau93hB1huAQbDK+Q8f9
X-Gm-Gg: AYBFou2Gv1g4Rv4j4ip39XPEmXJ69lL1uND8HYASlJdZTUbaII0IL12OlpVL2VVQZYg
	yg/FqOT96hjprd4/Y34YV2n34pQgZR7x5BVWVxhwS3ecrCY9+YfnhZfvUgEDrJ8X3Eb3kzSULWB
	PQ4/4ScgT8YEYPMt9AH68iP+aRSp9TT2d5NgTlnRhiEIOOVWH5c2MJ32WLc9ZYiUWiI3sXEcLlY
	cZw3dtMQNmmkX2P43GUxe2c985QvFhqdEDxQsjDrbKrKQzLhw9zLUGpGEduXbpNtdkX7IAZzjyI
	Te7/6EYm/bKnQqDqNdfCRf7hCtG9qFGdo61jsdrucXAAAGsM35237y4F9oMG9LnycXoz37ANax4
	L9PBStXdyqP1xLDuUFQk9U/JzhAriyn/BCtmUdbk3ChgHZIxVsvnkO3sBoIoxF7hfTOgvgGNAZY
	O40aRGBMGAsoAspMvOFgebRMLYf3Fdn/DBaEeD+pyki4w79sk5YBH9yV+LVYtalQSHFP6UcJU/Z
	vjSIp5p4KAN3nEVLQmOi4r/hg4f40Y8UTncStFfHq2v1cC6XhqhlXe7QwPG+3dWPdRxxSIQ2Chy
	DlcGHfVn6GQENmL+DPnKGYtooVXXZ1DTZUfXxwV4tmj1GFmJ
X-Received: by 2002:a17:90b:388d:b0:3a7:9adb:2a0d with SMTP id 98e67ed59e1d1-3b0db13e119mr2605368a91.0.1793979527519;
        Fri, 06 Nov 2026 07:38:47 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32b2b57sm9067695a91.15.2026.11.06.07.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:38:47 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: cx23885: altera-ci: drain CI status work before free
Date: Sat,  7 Nov 2026 00:38:31 +0900
Message-ID: <20261106153831.2736659-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

altera_ci_irq() schedules inter->work (netup_read_ci_status) from the
cx23885 interrupt path, but nothing cancels it on teardown. The worker
netup_read_ci_status() obtains the fpga_internal via container_of() and
takes inter->fpga_mutex, so it must not outlive that structure.

On device removal cx23885_finidev() calls free_irq() and then drains only
its own works (cx25840_work, ir_rx_work, ir_tx_work) before unregistering
the device, which reaches altera_ci_release(). free_irq() waits for the
interrupt handler to finish but does not cancel a work the handler has
already scheduled, and inter->work is not among the drained works.
altera_ci_release() then frees the fpga_internal via
kfree(state->internal).

If the CI interrupt fires shortly before free_irq(), inter->work is left
queued on the system workqueue and runs after the fpga_internal has been
freed, so netup_read_ci_status() dereferences freed memory and operates on
inter->fpga_mutex in a freed structure (use-after-free).

Drain the work with cancel_work_sync() before freeing the fpga_internal, in
the final-release branch where it is about to be freed. altera_ci_release()
does not hold inter->fpga_mutex, so the drain cannot deadlock against the
handler.

The sibling NetUP CI driver cimax2.c has an identically-named
netup_read_ci_status() work and had the same use-after-free fixed in commit
4e143d662ca9 ("media: cx23885: cancel NetUP CI work before teardown");
altera-ci.c has the same pattern but was not covered by that change.

Found by static analysis and code review; not runtime-reproduced (needs a
NetUP CI card on cx23885 hardware and an interrupt racing device removal).

Fixes: 349bcf02e361 ("[media] Altera FPGA based CI driver module")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/pci/cx23885/altera-ci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/cx23885/altera-ci.c b/drivers/media/pci/cx23885/altera-ci.c
index 20a3b6c..94930e2 100644
--- a/drivers/media/pci/cx23885/altera-ci.c
+++ b/drivers/media/pci/cx23885/altera-ci.c
@@ -496,6 +496,7 @@ void altera_ci_release(void *dev, int ci_nr)
 
 			ci_dbg_print("%s: Actually removing\n", __func__);
 
+			cancel_work_sync(&temp_int->internal->work);
 			remove_inode(temp_int->internal);
 			kfree(state->internal);
 		}
-- 
2.43.0

