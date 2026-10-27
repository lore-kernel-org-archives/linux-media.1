Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142511;
	b=gR8CHB4Ohnjq/pW8PubHhD/UHZFyrhjuJKplrdGem4k/wZv6/7uZNzkDGzepEy30wDXo
	 A0g06C0P1Gpgz7nXITz3K63r0ty359y/oIju76204kMLuMNpmbuPaHaXGA1KNOuaZRafh
	 atzjzKPxN/yG3wb/5euIwspHS7xv7NJF13ho9Oy7Df2XGQxqb2vYWgff+Dpp2wqhrErNY
	 Ovh9VVr9Y7CbM3jIMZBzrg257/X3a9KfkOCx8lbx3FekS0M9npSMnWRXYNvyFQQV16DU1
	 hrlf00EE7Bxd/4MWhEwGkeiiMkChAnHyDEYsPIx0SmdZJjD+xw8pFiZUIrB0nQmlF1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MMuIgB64ADt+cztY16YzQdSqp2JNpxBylsF2Y/Dr7t0=;
	b=28ZulO2SJIV8FjEnp+XHHGJHukfjokx9gGxWzWK07tSU3tCmMCIEX8C2xr9zxTsJrKG0
	 ye1EC4wMTCBbfQqvu8C/zhJX3B6SVbIW7q9ImZUCZwduXkeZe5KvjxXEzM6Blyro93J79
	 tZo8E0GfYcCyMnLZLC3JRWrpWP0VWEzfRhiAbRw8nyOdlu/OLSV6XcsI8Oypm9rwZF/f8
	 sk39XgJdbN7kXTEz863q9ITSGGFLhWJFz5TlffgsvIYAk057v/Pv2yQ4Ke+Rrxy+x/9v0
	 fgm3CojvJLD9xp9Vl/e5X6nah6N7imApvvlqayhz8bzFsjJXM3R064TFTIXaZwp8Vbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nSqmKpgj;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCF3606A31F
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 23:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCCF3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nSqmKpgj
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so3515805e9.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142509; x=1793747309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MMuIgB64ADt+cztY16YzQdSqp2JNpxBylsF2Y/Dr7t0=;
        b=nSqmKpgjCru0xafx7MWoUDOYrNhffOLw87Ahi1ZIyjDVo6mPrEROQZo1FOObX2eCVy
         BHvB2X7NBoSSxFURZD2UEVZix2Nh+N/bs7qbwq1Lj6eLDfwY9fCDFA+mkaNmB/mzbXEM
         CY4foFhHwmGg5KXmXDmtYYl1M97aJSTJfUsCdip94S094nzU40uR+WGxVZPAngYwSyD3
         lKST+rZAnV2fObdTIZQ8iJhjCyNx+d3s9QH5/aoT7ijhE4i4Kr8MmGr+yfQTeSGp0PvD
         Kq42P+m0CL/Bvyu4vk7c+jIgwYOe9IPBmfPrGzN4wBWhlLi94hHSPAy0M/oIXLyNPjpW
         HPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142509; x=1793747309;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MMuIgB64ADt+cztY16YzQdSqp2JNpxBylsF2Y/Dr7t0=;
        b=n4npEjod15lByGoB8z4jsSsH0bRY3dXOOnDWqHkiaAp1RcqY4AyituIV55l7j429tO
         5751FTSQuYyYCmf5j0dIhJqkj2w9iQXhfrB3lvAAXR4Y+U4ccvAtSQ/eq3virHAM6ofS
         s5em5UC9zO+mKb/4k8anrAwQBvcxoj2DBla5E+gzM0Jrvsm5acQogagOpmdX0pibhrEW
         el59y4uLCsx5YwlSzDmgGvgge5W1xsCr8m5w7SWUG/e9vGD5GCh+bJwg65A15ZvIrIY7
         JMb/FTxrQRW7KcmcKhWaHGhV/Nw9I28v6tBWXDc3Fu36u1yOPpTIdmCOXWL3PjmpMaPb
         gNyA==
X-Forwarded-Encrypted: i=1; AKwUvBxX1Phk6w63sX1NWpG8J2CU1ymhjUMZoYEQEZnFKpeP2gHncwspSOUlnXEXAXr43p/TYi/2lgca9gDUdw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHuVGPIKRW5n3Rgg0Hw9MS5rseMBE+dpKWkoOahOq8yYcfym/N
	hWTPhylV3WgWHlwFb5NzMl2aUoidXmWlyONL4D8wWg0tW1QZN1OrEjzv
X-Gm-Gg: AYBFou3bfaMFvEQls6jlPdZlmztiVbA6sjxN0X6KjiU2ObYCS30padHVqHZva51o2YI
	5JSST9sE8714w6mc0fxvWXUO838UZdKVv2q8CHzDpS+PWKA6BTwbYgLmNhMwZXSNLjOk//T2oGK
	PLg5NzBpkiKTAJxJ++vxfZ+f+KQRCNIbQBKiyu/NdGBA+dTi/LWMVGePv6+8UR0W23N3HrUa2vU
	SxCBIGLpN4312uZ7RhQu9EVWmQLjSPLeYfcZoxxaifsvCMo7pIbIFjHpmWZ1xiFJOGO8ZJDHsq1
	ShOFGVZo0DKmMVJfENvQRyV1e3O0GFYkqfiMpVmxWo6cu6LmhGxdDxfEoYtfm0PMSLJ5fNf5SAk
	G63aRShj/FZVwgueFM4lSdGgd1SJAyYItfbVqCrcdfMzMmw9RJKwYFxSmMR1VGbyiOM49eWXtwK
	vrmAAzqB44VYCoXUBS/34QKZtfMqIx35D1pf74Fv+s86wo75oMvplZ/Fpny3BXYPf/DARguaTBc
	B62UNL+drPREYFfbKLIUu2d5Ir+xj/JsYf6XhtaS2nGrBUYI5D3VR6xF2ncWYh170XRKP+/x1Xn
	eoc=
X-Received: by 2002:a05:600c:19c6:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4a96845e569mr7992445e9.33.1793142509007;
        Tue, 27 Oct 2026 16:08:29 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:08:28 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH v4 0/5] media: atomisp: remove the circbuf library
Date: Tue, 27 Oct 2026 23:08:02 +0000
Message-ID: <20261027230807.2407261-1-vladurares@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks to Andy for suggesting, in review of my earlier typedef
patch [1], that I look at converting the custom circbuf code to
circ_buf or kfifo, and for reviewing the previous versions.

While looking into it, I found that the circbuf API is only used by
the local queue path, and ia_css_queue_local_init() has no callers,
so as far as I can tell that path is unused. The remote queues only
need the descriptor and element layout shared with the SP firmware
and a few small helpers.

So this series first moves the remote queue handling into helpers,
then removes the unused local path together with the queue type that
no longer seems to serve a purpose, moves the few remaining pieces
into ia_css_queue_comm.h and drops base/circbuf/.

checkpatch warns about new typedefs in patch 4 and about MAINTAINERS
in patch 5. The typedefs are only moved from ia_css_circbuf_comm.h,
which patch 5 deletes, and MAINTAINERS has no entries for the removed
files.

Compile-tested only.

This supersedes the typedef patch [1].

Changes in v4:
- Patch 2: tidy up the moved code: drop redundant parentheses and
  '!= 0' comparisons, use !ptr instead of comparing to NULL, and
  return the final ia_css_queue_store() call directly, as Andy
  suggested
- Add Andy's Reviewed-by to patches 2-4, thanks!

Changes in v3:
- New patch 2: move the remote branches into helpers first, so that
  patch 3 mostly removes code, as Andy suggested
- Generate the patches with --histogram, as Andy suggested
- Patch 1: add Andy's Reviewed-by

Changes in v2 (patch numbers as in v2):
- Patch 1: keep the includes ordered by name, as Andy suggested
- Patch 2: also remove IA_CSS_QUEUE_TYPE_REMOTE, the type field and
  the type checks, as Andy suggested, and describe in the commit
  message how the queue handles are initialized and why the
  struct ia_css_queue size change on 64-bit should not matter
- Patch 3: use u8/u32 and the usual function declaration style in
  the moved code, as Andy suggested
- Patch 4: add Andy's Reviewed-by

v3: https://lore.kernel.org/all/20261027120341.2305533-1-vladurares@gmail.com/
v2: https://lore.kernel.org/all/20261014111213.1967452-1-vladurares@gmail.com/
v1: https://lore.kernel.org/all/20261012230754.1914517-1-vladurares@gmail.com/

[1] https://lore.kernel.org/all/20260918214132.1135549-1-vladurares@gmail.com/

Rareș-Mihai Vladu (5):
  media: atomisp: sh_css_mipi: include assert_support.h directly
  media: atomisp: queue: move remote queue handling into helpers
  media: atomisp: queue: remove unused local queue support
  media: atomisp: queue: move circbuf types and helpers to queue_comm.h
  media: atomisp: remove unused circbuf library

 drivers/staging/media/atomisp/Makefile        |   2 -
 .../base/circbuf/interface/ia_css_circbuf.h   | 363 -----------------
 .../circbuf/interface/ia_css_circbuf_comm.h   |  56 ---
 .../circbuf/interface/ia_css_circbuf_desc.h   | 160 --------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 312 --------------
 .../runtime/queue/interface/ia_css_queue.h    |  29 --
 .../queue/interface/ia_css_queue_comm.h       | 135 ++++++-
 .../atomisp/pci/runtime/queue/src/queue.c     | 382 ++++++------------
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   3 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   1 +
 12 files changed, 251 insertions(+), 1195 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c

-- 
2.43.0

