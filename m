Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AFB3D45E6
	for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786720290; cv=none; b=J35ZXjMIyYEMc/8q0pqzg6ziLXw1FC6NWFbOtzMXjwaD26fOCgoxjr8wUkClQC2N2UtgvwLSLnf0WjU5den5aVhrchOeOyh9j0UU4sXdxKtndWGGRvgraHT/9J3bQrqnOh2dSj4ujyKXFwHIhbPdHNTSUJbGEuE2BgZBD5I/Vlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786720290; c=relaxed/simple;
	bh=RWACD7HX0pPyfHqPyRi31tpb3skyU4r2+xqsU3C6SEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dyoevaI55LZMHDiEr0UUOrSfa/xZP7Wz2wsAkCRezJLJR3J6qQ8zSR6ZZAp9cmjnRGn99CsvFwo6Tu7QssUO6df4h9j6MluF6vyRGpGHEfjLFKEVjJhAsKDZUGUodOWpIbrJDWt+5fHL4APTKX3Y9iGBEUe6byrK+WUqCyrqW9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF37W+zY; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF37W+zY"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39f1ac13687so7185961fa.0
        for <linux-media@vger.kernel.org>; Fri, 14 Aug 2026 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786720283; x=1787325083; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xVcos67s4ipMAo4BIvxlhJox3zbQvVuKpFk3+ZpQk5U=;
        b=ZF37W+zYDYW04e74+VBDISZFEkPohWROc+gFIP51wK0EcufYNV9iSKQotxWJZdV59d
         F5iZXzIckBE5wNXO1x3mKJw20konEjrb46Z49nf4BtRDZGmJ899mvubqghl0UFVGcOTk
         m2mVMgvpvDHIlt8xQ3eWN9zzV3I2oEL54M18uywfXb1lU0v5RjxTuILXd2NyWSPVkCfc
         EIjVZCXu5qXgFa0O0gQbvuptqLyJz0ydmQfai+eb3q+mXp5VNJIYJaCO5aGDOTiIaWKu
         ufONSO+JEw0QM7iu/HSnL7p2KfLHa9BCtzCDIpVYjUfG3n/wwwe9DqfDn3CQCO1cySEl
         UflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786720283; x=1787325083;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xVcos67s4ipMAo4BIvxlhJox3zbQvVuKpFk3+ZpQk5U=;
        b=qPg3jEpBwzZCJA82OEK3+VL4Q/KXb/KkxOWEIHKjRPkc61OT2fQQSdvcFLFMEn44cP
         dz4syvcv20FAN/Cdarz3FpsZcaRV7S/nKp2KcGdQJJKXSyjQQT/6+kGW42gni4VMREGS
         5K0D5rmOP3I4WBF1Q2Z9tUpWNhkLwPMJmtUHET/XOg/8g9RYEXN8rqYJaJlexbfenObj
         VbEO8zlqdJzD5jcImT+zw+xWQLUnoN4DfPjKZouQA/lwiT2qhk/VL8m45cZimDY5urBL
         B+7t5r7QK+IQ/6TQdqAAHFx73oOPZOJgffqCV+IoO3NVrldUIj/F53g38qUmKqGa3NQ0
         8g5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrRtRwdGYbkmUffTbhJfjBGAuffrZUnygva2LeaHqemx+02jGoPn2dgqtBWHeCrPYHusijJ93M3oaJsRw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz18orKRgM5PbN+uSC13UC3cLxjDzrh2Hiin3GFlIV1kd5F/yuQ
	DcRhNGduxydtDI3jmuXYtFO6dsJjxqQXSMITw73g/myEt9UQYEKIOhI2yyW/bQ==
X-Gm-Gg: AR+sD11Ab7bym90iq2ExF+i9aSugyDe9p1q/M9ItDj/t4BWqh6eQrtE51eG9vKaTjG/
	Xf55QPa+aj1SkNqbZHPPGwgaecoKQLT1/6Jw3E4ML5t7Jdzda3uyv9m4rrVv5GUcccnSUhs7ia3
	g/pKLnbQc/hVpRflvfhuNlu6oKpzEJQPrCtW0berKHDp61RqYp/muIdMamBCmFJVMcknh23zc+R
	iI/WmJ6bhaGv/TujPpL5bzYtb3DHobba6VtZ1HPzJ7LYTuZB7Hq28MfjC2bxAHwaVnD3Sj2MBo4
	JSjzSM7AamiRXqIulnB5b6p6VDs1nyZfCr83j+BrQB8Q91FNN0Gfl8isJebg9tvk1brDo4/s5RB
	w9bsEV3EC4VsWmSugFy76/tL9/liSMTa89PDo6Om8urzVXnwa4YzpbiA7cbA1sG1J9Ce9dMHn7e
	Bq0oojWVio7BfK1rZmAvfhu13pxeUQoO1oml8DYqWGVE0297jf43c+hXqgdp1cG4BEfyZA9g==
X-Received: by 2002:a05:651c:2121:b0:39f:ef56:65dd with SMTP id 38308e7fff4ca-3a1324cbb22mr6213951fa.24.1786720282491;
        Fri, 14 Aug 2026 08:11:22 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130d204b2sm7138251fa.41.2026.08.14.08.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 08:11:22 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v4 0/5] staging: media: atomisp: cleanup pci/hmm/ code
Date: Fri, 14 Aug 2026 18:10:07 +0300
Message-Id: <20260814-atomisp_remove_hmm-v4-0-c3c954a12b51@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrBuIqaTSq0iRqf1TR4iRjJWCe
 Pem7fJbvLeTIguUrtVOGZuopLmgOVU0jDw/YeRRTM46b9v6bHhNUXTpM2La0I8xmsZevHcIHJi
 phEtGkPdv2t3+1td9wrB+T3QcH5ELI7J2AAAA
X-Change-ID: 20260813-atomisp_remove_hmm-407662efafaa
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786720280; l=2237;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=RWACD7HX0pPyfHqPyRi31tpb3skyU4r2+xqsU3C6SEU=;
 b=zKpKwy1VY0Yn/EFGPo0ymRWnSuCLYdTUrp2jiriMZS18dabz6rJgEPaUkqPWGNmGlCgF9e8eK
 xHYnh73NLIsCN2vg/7VuPi8mcchDT5jE6uc6uccbv8RywLOdAXSBcAl
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

This series removes unused functions and replaces obscure
variable-checking macros with clear conditional statements.

Changes in v4:
	- In commit 1, include the removal of the static 'hmm_bo_vm_ops'
	  structure and the hmm_bo_vm_open() and hmm_bo_vm_close()
	  functions (whose addresses are stored in that structure), as
	  they have also become unused and are triggering compiler
	  warinigs (I removed Andy Shevchenko's Rb tag because of this
	  change).
	- Add the Rb tag (commit 3).
	- Add the base commit hash.
	- Add links to v1/v2/v3.
Changes in v3:
	- Split the last patch into two (inlining macros and removing
	  the file).
	- Replace variable initialization with assignment, followed
	  immediately by a check.
Changes in v2:
	- Squashed the function removals in pci/hmm/hmm.c and
	  pci/hmm/hmm_bo.c into a single commit.
	- Add commits to cleanup macros from include/hmm/hmm_common.h,
	  as suggested by Andy Shevchenko.

v3: https://lore.kernel.org/linux-staging/20260812205429.39181-1-nikolayof23@gmail.com/
v2: https://lore.kernel.org/linux-staging/20260723185217.317981-1-nikolayof23@gmail.com/
v1: https://lore.kernel.org/linux-staging/20260721214238.840406-1-nikolayof23@gmail.com/

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
Nikolay Kulikov (5):
      staging: media: atomisp: remove unused functions from pci/hmm/
      staging: media: atomisp: inline macros for checking the bo/bodev pointer
      staging: media: atomisp: inline the check_bo_status_*() macros
      staging: media: atomisp: inline the var_equal_return*() macros
      staging: media: atomisp: remove hmm/hmm_common.h file

 drivers/staging/media/atomisp/include/hmm/hmm.h    |  17 --
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h |  46 ----
 .../staging/media/atomisp/include/hmm/hmm_common.h |  60 -----
 drivers/staging/media/atomisp/pci/hmm/hmm.c        |  41 ----
 drivers/staging/media/atomisp/pci/hmm/hmm_bo.c     | 272 ++++++++-------------
 5 files changed, 100 insertions(+), 336 deletions(-)
---
base-commit: cb08dcd0a896c3ac8073a57296f2377b106c35b4
change-id: 20260813-atomisp_remove_hmm-407662efafaa

Best regards,
--  
Nikolay Kulikov <nikolayof23@gmail.com>

