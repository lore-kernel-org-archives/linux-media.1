Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F1338D407
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 09:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787737305; cv=none; b=qyojhJ+vIWf+ZpUfXVGeQ9+i9wk9F0RgA1Csp3ulXYMF4OJt0bcWWdKFOSytBhYKhGewuGDYjxxuIbQesNnUxNOnNAWLFbPzx1yVLrA3vDGnUh0h2VEfMurs+6azaYeh545O8SYBY6T34m17lqnc5HGmFsbi8MNLuJ5tOJRqYS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787737305; c=relaxed/simple;
	bh=1MQKGPEupLGEXQLRZIQsQoH9n1gagid94EDLGf7Q11Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rFJjFCBKvh4w6ZgS0n8XztHrRNtzNAnYU3FPEP8dtU4D9SEDqfwuXBz7h+EJTWQJvmisptzNWffKqw+gWDp0Ult3TDKFD4F2LIaXBqMq+KnVQIQQkwEEXi4MBfP4hiccv+O/HO3ovr+LCUNZwFERRI3m6zzb4o0fBrz/aQspKU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYBzw+94; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYBzw+94"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso6101615e9.3
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787737302; x=1788342102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r2y+hW3b6NNunH1hQAnDVIKoeAWRqUr6dJUyIs4zS6M=;
        b=rYBzw+948HevlcCe5Th3Fh8HOqLHlDAWixIRNJ8DOWJWhrhMjruDITU86KuqGv7i8h
         uiVhyTSXd53VAk3LIvdhCwm2rDeg437ztf1/WwzkZ7V1vnZH9wWvHnEAtXS3eyPHqY9w
         uha4LDIh1qXxzuEwXIJgqBdJ3oz+dHUfGrh38lOmWmIpRIPxw4NNoRcZujjClwG4hI26
         eJWbP0zn1im5Gfi3o/WNZcjHM9nvbFSN08zgmqKAoJyA2fGPkMKudrqCPKKJtQS/Yz2w
         yPhecKsisY7HRPgITkHP/koMHL4IZQYVP5gM5ihfHBU3dNSjSj4x8FcQX1auB98lHFSy
         Ad1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737302; x=1788342102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2y+hW3b6NNunH1hQAnDVIKoeAWRqUr6dJUyIs4zS6M=;
        b=r9c7codYLPBR9XCAWfIkOP6O4okFQoMr8vojLA0x7ApJJIyItxu8AU/0RG/m/rIOPR
         EYtI0hBDOCpGq0qySsNmXi+mwxq1O+nThToUy0TZ03lHtMZLtS8pNze3Xzq63Pdyxwpu
         53YpPccZMg1wprYfpn2sEf4XSvEbqT5DOZWs+d95ttKjziBdqNx+0u0b1tdLiGcCQOuU
         9jEg9tOy0/FITDphc3DG/MhLoMeaGFZG1ZK91Sld6Ihtfya1xj/tE4/fW3R2WyZuxCI3
         W3cnKkS50PFLz9ZbFNrBVjEUhnB22rN3Q7IyaiuLdlc0Z1vRjdnw78G9oUTGuQpVqdxf
         U5qQ==
X-Gm-Message-State: AFuF++l+fqmvkuZABdxabszpW2imO4963WOmIZGl8fUafv+VvYCQvUTs
	g6zLnnclRfzOuT30uPIfJFNrZePPLR4MCuLGR0zqqgHE9HD3NhWI1JQK
X-Gm-Gg: AR+sD13DjOo2xsChVqzSAlzIr718tqmjojEuPQO4meUC3EEt2cjYZdkxAj1f18554QY
	3m5NbuQP2rwtNqXZo0Qer+7G1HCxfwSl9VmsFmAmGkEeCJspSGZl7bghuukDmC6scc8pAc40THa
	7X5uxX2BUcg6GWFIkFqLPKa+WdFdZaxXMpxY0Xbjduvz+SBCFlIvF7YgDmS7KiQu78Yhb4l2V4r
	qNEMjW7GbwOvcdNBuJbXkUBddeThAPDXz7YMdyILLnGgJKSflVP2Ovc0m+8ng9ydgjwn0WeAgIi
	kIvrhVoVt+D6/6T8nK3cE4rLH3ejj+yS0DJ5Icll1g1KVMyD8tcP4QY0bVkoVEW/zcGYskfswk5
	FoxMtkmruY1NKzmcAeehu7UzOXOqV6vUJV9NqAwgMhobrHTYFAqHigR4KIKvkiUaTGbz4t7JbYu
	3eKsrql/qa3G86F3jLl0Cy/fC+AjvIAgym+w+yOO14WGQ3LBdE3Hxj47J7frE9kRx8poC2qqmPr
	7eBZl2xmQEICIyvf/pR/mPLDrnnnA==
X-Received: by 2002:a05:600c:3f0e:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-499dc825cfamr56046845e9.14.1787737301425;
        Wed, 26 Aug 2026 02:41:41 -0700 (PDT)
Received: from MacBookPro.lan ([2001:861:3dd1:ccb0:7ca4:98b:a443:98d8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca98095sm20388135e9.5.2026.08.26.02.41.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 02:41:40 -0700 (PDT)
From: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
Subject: [PATCH] Signed-off-by: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
Date: Wed, 26 Aug 2026 11:41:37 +0200
Message-ID: <20260826094137.3018-1-elouandacostapeixoto@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all unused headers in the ngene-i2c.c files.
Check all headers individualy to see if the driver compiled.
Check if some symbols from those headers where used directly by the file
using grep.
Use the script scripts/checkincludes.pl
---
 drivers/media/pci/ngene/ngene-i2c.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/media/pci/ngene/ngene-i2c.c b/drivers/media/pci/ngene/ngene-i2c.c
index 2e9e9774dc6f..038bab38db36 100644
--- a/drivers/media/pci/ngene/ngene-i2c.c
+++ b/drivers/media/pci/ngene/ngene-i2c.c
@@ -10,21 +10,6 @@
  *                         support for new dual DVB-S2 card prototype
  */
 
-/* FIXME - some of these can probably be removed */
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/slab.h>
-#include <linux/poll.h>
-#include <linux/io.h>
-#include <asm/div64.h>
-#include <linux/pci.h>
-#include <linux/pci_ids.h>
-#include <linux/timer.h>
-#include <linux/byteorder/generic.h>
-#include <linux/firmware.h>
-#include <linux/vmalloc.h>
-
 #include "ngene.h"
 
 /* Firmware command for i2c operations */
-- 
2.55.0

Signed-off-by: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com> 
