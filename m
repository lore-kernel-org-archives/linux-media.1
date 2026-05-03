Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75445372EE4
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 17:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777829952; cv=none; b=GS+EO6tXEQEpXBOj5CFofyZg6ifV5fnVtIZG8rnOSQdersjDpy/VqgGpbxOCMaiTmBu4YUKwKMp51VuvDhZ4ZiwdhU00J9g9d9GBjFtqX2sDX1NFkEDQOxHD6IcnVCMFSTmKRSw8i66R762/3GSPy+EwzqgkeM8nz4f+Eb7oCv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777829952; c=relaxed/simple;
	bh=oq9nC8rlo8au9effKbVLinffYFiNKFEx0Wp0QeVfd7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=md7CNHo6qyBjYjZSHN+t55HyecY46ZotdmkLwC1OuXsv9kt7K6F2U+qGBwvvdPsYdP3xyNjXhgUzjiuEfvJpOBxnufIjjjH3WOTF1zG64WI4xxvgCvL75GhwaItjEaIn681+VtUaF2VhP8vUzLn90vPkwzhO6v2+Ku+N1qIEfOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MsE9fvis; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MsE9fvis"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so1465707b3a.2
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 10:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777829951; x=1778434751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l25cDFU8ziRTFzjYeX3kdOd1cydZ/PwViKSQL2gBKlI=;
        b=MsE9fvisyMKv/InbYRpSXIRjL/8SGJX3+SV6h6FAkkDgQZOmlNy2xXhqRpkOLxJ+V0
         DOdqSM8tyGOuZ2B3L7rkVuMYHQYeT0yrTrbXRQhHZOEaTobsnOhWgrmPtfQnlieYDBfl
         ngTXmnf7JPP2TtmmsIpos9u9vjfydheYZhE1eP9EFuhBhaDL0UqCrDi9ceTWF1V9q1qd
         Tnub4IWW//K+O0Ls2woZ7k4YCM+iQu021lob/chH8w9+qqd/Ado5xBU4flwtsUBroGHv
         DFNaYp4fn3CM9HFJvfb/5cipGLgzJ1m0a/4JZ1idpUfliM8EOwRvl9ZJ8F9BexCVB0Wc
         /JaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777829951; x=1778434751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l25cDFU8ziRTFzjYeX3kdOd1cydZ/PwViKSQL2gBKlI=;
        b=csY7Ob/XG7q6oHAy1VfqmRcFn9+DoTxmOSq+mkRakvSIww/Cs79IYdcinK2GYhucZI
         ZurB1K59z8I/FsPgUrJQB68dXOa6bD0rin5WkJr0gEJenMrYIDtI0edBHH3goHFOVW1n
         3Ic9id8wavpNNXNzUD9pYZvEOurQ+jkMLhy3a9fF2l5vNTyaH0vuOvV0swbzsE2CkCbI
         zt6RzYsRsHkM2GdebcaRxxvabDNe3xZ/H/URiwlstvaI5oIVA++VqZdFiqBKeNHaXiVb
         wpwZeUp+QIiENlrSV4KF4jhVKyvucxkX+zmdWqnH4sGUjlBB+MPfRLP2QWkqtOIbnEn7
         jY/g==
X-Forwarded-Encrypted: i=1; AFNElJ+xmF+n/NafWS4Z2k3pKqymBkFOfNDh84L6SEtQin8tSKxVVaCZMCl96Jo2iW1MFikCDuOEHGGTZVgokQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwQ5IgMO+jgKGXvmc5kKZ9980k2jLR+XIIgo0te4QN+l0BO5bn
	oksF7SvqL+PlTK6esXzh0XJL75S+rFa6vtJb761YkC30erH+ktjcCHoY
X-Gm-Gg: AeBDievE1bJWdIVDRz4BTpNyCJJYaZKq1MytQUMhxUo2z7sSyjAhj9WxmZWK6v4adId
	xhVpcTCbsrteZOGByLJrApTjrcrT5t2ZPQyan7Sna0FseeLY9x3hO7656grffyEYocdwdKVQ+ET
	X7pGg461HRFANH9wOdRLRF44CPx8o48i1PSt7paq0xF3LW/kJ4pN0ZT6XZVe08zjYsP87QlZv9o
	3jqJjBopD+edu3Vo7AlsXX5+/ab6glb6Jpc6JadEyV1s8YpO9LdpQVQwZXvaH9XBD+HaqqhgQdi
	Z8lB7RJMKznkxjuXnMqs2niEdDGqP3KO6+pu904M1EjZ/4WA6Z5c3GHdh6VNKJDZo13hdudMYmI
	piLJ8OSnSjXMyQ4UjXLNt3RTVo/buBqxtX/ONgUijGGmMnCCs0Yz8HPbQXrdD3jz1QLy2GWXJUl
	wbVhFlvy9D9GKcTyQ0JjrjjnLRJT9gbxDNSZB5WYtLUuUzIJ3gXgwWT0gPoxaB+w4kTuF9p7sMc
	u09f1fbL2LNFNe+iD9UxMqxz8whqW0Kxw==
X-Received: by 2002:a05:6a20:e292:b0:39c:12c5:c6f5 with SMTP id adf61e73a8af0-3a7f1a9a7e1mr6823524637.18.1777829950745;
        Sun, 03 May 2026 10:39:10 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c80203b451asm2849785a12.8.2026.05.03.10.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 10:39:10 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: atomisp: consolidate function declarations
Date: Sun,  3 May 2026 23:08:46 +0530
Message-ID: <20260503173846.108790-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Consolidate split function declarations into a single
lines to fix checkpatch.pl warnings and improve code
readability.This change aligns with the kernel coding
style.

No functional changes.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 57f608f9db56..93f8937699ce 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -17,11 +17,9 @@ struct atomisp_video_pipe;
 
 extern const struct atomisp_format_bridge atomisp_output_fmts[];
 
-const struct
-atomisp_format_bridge *atomisp_get_format_bridge(unsigned int pixelformat);
+const struct atomisp_format_bridge *atomisp_get_format_bridge(unsigned int pixelformat);
 
-const struct
-atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(u32 mbus_code);
+const struct atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(u32 mbus_code);
 
 int atomisp_pipe_check(struct atomisp_video_pipe *pipe, bool streaming_ok);
 
-- 
2.43.0

