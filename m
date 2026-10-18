Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483BF35AC00
	for <linux-media@vger.kernel.org>; Sun, 18 Oct 2026 02:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291622; cv=none; b=ODmVAYYkxE9CEvQ07az8oNF7xv6JyXKZ5kmnEfXgTCQFI381/MCwnnNvdB3qSQtCuEhqslaFYT6SwS9dZWpqNvBEv1B8DzACNa/XeiSHrRCrvZAHUD4iS7cxzxoPHHmgjhqDKQdarK2Q4RxOqPwieYOBHeEx9X83aGeyfnsLzLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291622; c=relaxed/simple;
	bh=m2mukGgWpT8Az5wlIU2EvwStqt6PAPojcdqQXE9F66Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uTc74QXmTwjiE29X7l+OjgqGPe2ouJT5WthgX6VrzjPeqeHAiJ1ebpWsZm/p/3QRXi+ycA447MQGNwD6BGNexthhxoIvQ78dYQR+8Hly9mcjQ5rw4F8HlNKWETkKlpU+YDRiF/Xa4O3u83S/I46EOCx7CwT7fwLWaCQdw6QZ8ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKeJxvJX; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKeJxvJX"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53391022dc0so12664361cf.2
        for <linux-media@vger.kernel.org>; Sat, 17 Oct 2026 19:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792291619; x=1792896419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gvBoQ0rQ41gn7VwVg0MB+Jrp9Py8V8GgFAA5woLhjm4=;
        b=IKeJxvJXciYl4WpdLh0KQivoujSDXKVKZzQl8xnw8gQUeZI/eEnSF2RGgI7foTJ1Wi
         L8/bXgiLWKDNhiuS+ZkeymIgZbIGtxuzgc4QCiSEfo184f5jv5ZW6WL5dnJU7GeFgjL0
         kxpy/B93oDHQ+AHBjdtO9oLajO153ZxicHsna8Lo3qYRpsRS1ALRvnAWo8q55NI/2suR
         Q856DWDAsykhoGVzK2bNvi424PjSiHn7b5jqkigmfsIFZLUgwlNOQKXGSHkz7rvf3vds
         Sq29kbGFEnqaffs75g/wQijdZmF3RY4VE1cAMxhwf2p2MxStoJXjFTpqjtnC76Tn5SqN
         CMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792291619; x=1792896419;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gvBoQ0rQ41gn7VwVg0MB+Jrp9Py8V8GgFAA5woLhjm4=;
        b=iB1oXoP9MKd6OGrAkr7kmu8vnafYEoDMHKzQA0wN74f7CRSUAc5XcWSSkEOISrBLNA
         30cjnPmNmh+uuht4tIeZWVBbyGOfq1uU6OdzH6kobZxp638EFBgd+sbexQfLwaAMxLqM
         /dd6FDsK8UBMG7npTnAd/mcjNbsmPiq5RJjcxgIKZGiAL/3cJY5DG0JMiRXQz4ShDb+H
         XG3iDT9OjuTSBxLkhEV/zQ8i2kZsBykbghCClLmXfKGVBewg3cnEAn3S0W7xZD2zb3Vr
         H17p6L0lELA/Nj04lLi6rOfxN7YD7PVU965kr8zuxhH5ZIZJmjvR5nrctXVVy5wDqupE
         OjMQ==
X-Gm-Message-State: AFq9FYIyDFT7Vnnx6XX+Q4PJpIaliqSAwWX3WZkPNRgQGoMWHGE42Y30
	j+2tKAeC1IRhEllQIKwP/umKGKoSUTTHXvGfr1paQ/nYt3Tt+xl8U2Y=
X-Gm-Gg: AYBFou09R5EtKD9yfKxG8r7MTzaHsoOo30mk8HLxTP4Xp+ZR8pgI7Cmc6ZgxzdtR5N9
	2cczA4FhbPpEWSqRJA0S+n1KbAPUhRU2q+VmVGYr+thsd11M4rreyn4V7JPe7+Y5skPekVGLxhi
	Z9T1aKkT/tNlqjfk0KnYOCyeT/FcsBKFW1GgsPhTLMemqAgZJl4fo3rgv686Mr5q/EHUo+rbaok
	lE4DwUzPVS/j2lp20HeQfU+Wgj8qhT+Wlg9tUll8+czwHdj32ZuqdIKk+IppQeZvx9JSKqHZXDC
	0KvGUozlgHsFoeSABCTVSgpz0E3qGDKgwbCo8w/l4acQXgfJsXxIOuTxZttbUd8F1HNP/DKKFpU
	SP78hPJDGcCqFDjSg50FqQHaiQKXHWCQDEN8XIEnmhP5J1aI9X0g71A/lbjpIEtETdwHDRMrmTP
	1AHCJrubYt09vHo5FsRIdgWbvoFOHQF2nFEtLcUkNFDXHI3NMijB4OB9Im89cwOIsQ6wgNVzq+N
	Rm6ZLWM1SwSSk46PkOr0WxUfwfKjyicdc9Xb1v3ZhtxXWbKYlftESEtuiUWUj609Jhdaah2Tz33
	1I7EM209yxt7y1G7KI+WgIfUsXM4
X-Received: by 2002:a05:622a:1346:b0:536:352d:65f6 with SMTP id d75a77b69052e-536460a977cmr63623051cf.64.1792291619067;
        Sat, 17 Oct 2026 19:46:59 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcba4b9f0sm62019456d6.10.2026.10.17.19.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:46:58 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Niklas =?UTF-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 1/2] media: rcar-isp: distinguish absent cores from registration failures
Date: Sat, 17 Oct 2026 22:46:53 -0400
Message-ID: <20261018024654.3913088-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018024654.3913088-1-mhun512@gmail.com>
References: <20261018024654.3913088-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

risp_probe() interprets -ENODEV from risp_core_probe() as an absent
optional core and continues with the channel selector. Keep that result
for the existing resource-setup fallback, but distinguish it from a
failure after core resources have been initialized.

The following patch moves the core IRQ request after RPPX1 and the
registration state have been initialized. If that request returns
-ENODEV, its error path releases RPPX1 and the VSPX device reference.
Passing -ENODEV back unchanged would make the parent continue probing,
although core->base still indicates a core whose resources have already
been released.

Translate -ENODEV to -ENXIO at the registration error exit, after the
existing cleanup. The parent can then handle the failure using only the
return value, without inspecting core->base. Leave all resource-setup
results unchanged, including the existing fallback when VSPX information
is absent.

This prepares the error handling for the IRQ lifetime fix in the next
patch; it does not depend on an existing -ENODEV return from the V4L2
registration helpers.

This issue was identified during our ongoing research while reviewing
kernel code.

Suggested-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Express the distinction in the return value, as suggested by Niklas,
  instead of checking core->base in the caller.
- Translate -ENODEV only after resource setup has succeeded, keeping
  existing resource-setup and channel-selector fallback behavior.
- Describe this patch as a prerequisite for the IRQ registration move.

Changes in v2:
- Split the error-handling change out of the IRQ lifetime fix.

v2: https://lore.kernel.org/r/20261015004159.2202899-1-mhun512@gmail.com
v1: https://lore.kernel.org/r/20261011214448.2043581-1-mhun512@gmail.com

Compile-tested with Clang 22.1.2, W=1 (arm64). No runtime testing.

 drivers/media/platform/renesas/rcar-isp/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5adbedfa8..373d9ca9374fe 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -894,7 +894,8 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 err_destroy_rpp:
 	rppx1_destroy(core->rpp);
 	put_device(core->vspx.dev);
-	return ret;
+	/* Do not report a registration failure as an absent core. */
+	return ret == -ENODEV ? -ENXIO : ret;
 }
 
 void risp_core_remove(struct rcar_isp_core *core)
