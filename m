Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6631B3C2BAF
	for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 22:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782252642; cv=none; b=j9pdK54lqZ6PTaidUhoQrxpkRiXvL/p0H/a6ytgO8Qqgwz9HVJpypkwBgnfCS9ISVt4189U/hM7TUOXufV5lw0Fu8zgjcI9vgjPIZewSJPzCeGzExQulKxaK/F+o15JnpTsVuEs7IxmoX3YPM88OmHrK0ny/7O+0NtocTAvi3yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782252642; c=relaxed/simple;
	bh=eAQ4oMX0/Xkapoymki25CS2DNK7+/uNx6TNxx66H3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ag/I+I8Go7VR5m+pVmWOdD9INw5HB36x06czJxInHgKrRHp9z7iUoNZldO3OmD6iyVgywK+N76WWsQxvoFyZ4M18wNTfbTRMArX0sysmBu0KNGTQBO0chfgQCIg6tXIfbXG0AVBE85Z3mRWD3d8x53acGJGni2fUK1GZ0Y/h4tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0VmmeGW; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0VmmeGW"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1397e093f90so967425c88.1
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2026 15:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782252640; x=1782857440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=j0VmmeGWmoP7uZAmoxOGa1eS+pR+wQqx/9ZpuFQ3A2/9EnU9vh7OT4oYHGVuw7bwoF
         qtWQRqTIgp0q7JygLfqaTTZkaP1nUd++XZMy5zQdBDyoPaeKUj5b8IskQSQKpPuiPKHb
         Q2+LWX5BDC6dwpAJ+MOfZULyyCktd3DAoOMnZVfjCkbb+g6QMUfaMh98Lo5WT3Uf3Cxl
         yOiUBeU8IEQbljzD9cfiQheYl+o0X8PqepcBDq0oYcIpz2wVYv61U1pmtR5cLMHDrs0a
         S73+qKPPr80se7WEWVUS87eGzjGbinq8lHSDTjkd0h92lWNhG2fKkWpCmVzFPVvAbWfe
         3bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782252640; x=1782857440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=f2Dj32IQtkXeixVv0bcWyVB4D/pJuAQzcYeUO3BetZCyQXPKZOvA6uHmEqNfs0Q7JE
         c7duNyAvzlLEipa5CJMdP2GKocO0t+W0haTy3eDavlMC3KVbYWaAGnBYystfRb3/SrwF
         z29uGhaatzINTRk7kgfGQqqgOsaUxNRbqO6MzQG6DkvzkXEfgdyDevuIKDgDzQaYx+aR
         jqkB1Vh/j10f3E17TFpc4s7ZPkmZmcN0edbBFw8iwUqy8k8qy7Z74sqgfseplTd1Wo8J
         6Lwr1h5mT1U7lVCvDOCerXir+j0wDwyOGmDWC5pOeoaLh4gjzRcvEGI3OvVN1xBdAwIU
         rywQ==
X-Forwarded-Encrypted: i=1; AHgh+RqW1xUOnfUCZnnUpgZ2i+1lNIGByeoTw/H7mGONsdtBn3Udie/a/09+UvG93EcrHl25zQdbaWPYqBY77A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5IA/sNXOag5uLh/vk+7rfBAd5uGsMz0++NDleCswfLV+t++WA
	qjKbzxniwUPe2VsAusHGXXyHh7isnkXdwhXq3XDp5Y2/7rc7RYk51/2W
X-Gm-Gg: AfdE7clStOR0jXcTffNAjMFlFwSkRHVr1Low7827wlRC319N5hbpkwb0Ej/T6iTPy4m
	zLp2qGVmMKnMLTcQPyHOPPUQGMUXVyr+MeiHeKhU0ppu2ehEzj4Kfz1JCprz1omxYrKjdkgGplN
	8fjuR5V3uo0QBThISK6rpbVkRq1uA1piM1A8kF7U0XPPr6D0oetP9jQ3yNeACo7Mpa6Kt4OB1gl
	qYtWwLjYBeTTMvObxvDjk4nQx93Yjwhf/a3W1QbGdCRpLVc/44S0YbtDguO5tjfAcpB9TM5zjlI
	bpkTsR+o9FS5XeozgcC0ap2bzlZNluU95+hOygT6e6ZNpOAuesVUzPbvZYctmL/CXijrEZDzUtY
	CCRue17v15dKKJk31J0Ev62eukyBXeD0c2oAsXq4/d/uAYJ+lsWvYtlsRxtcREuNoEEW8qaMH/N
	sCqxfHjlCtiETBkWo+bOfNkvOCb9n10VkgmwhAxka2/1x5wWDVcprtb75Dx++6By0HD8MsNcBWh
	PWBdA==
X-Received: by 2002:a05:7300:f191:b0:30c:5a7b:ae2a with SMTP id 5a478bee46e88-30c69343b90mr948131eec.24.1782252640508;
        Tue, 23 Jun 2026 15:10:40 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:c10d:2699:12a0:58d6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c5178a68dsm9059903eec.22.2026.06.23.15.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:10:40 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 1/3] staging: media: atomisp: use kvmalloc_objs() in make_histogram()
Date: Tue, 23 Jun 2026 19:09:26 -0300
Message-ID: <20260623221028.40238-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
References: <20260623221028.40238-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kvmalloc() with multiply with kvmalloc_objs(), which handles
the size multiplication internally with overflow checking, silenting
checkpatch warn.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_metrics.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_metrics.c b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
index edf473dd86ca..90d92ab8d52b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_metrics.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_metrics.c
@@ -4,6 +4,8 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include <linux/slab.h>
+
 #include "assert_support.h"
 #include "sh_css_metrics.h"
 
@@ -59,16 +61,13 @@ make_histogram(struct sh_css_pc_histogram *histogram, unsigned int length)
 		return;
 	if (histogram->run)
 		return;
-	histogram->run = kvmalloc(length * sizeof(*histogram->run),
-				  GFP_KERNEL);
+	histogram->run = kvmalloc_objs(*histogram->run, length);
 	if (!histogram->run)
 		return;
-	histogram->stall = kvmalloc(length * sizeof(*histogram->stall),
-				    GFP_KERNEL);
+	histogram->stall = kvmalloc_objs(*histogram->stall, length);
 	if (!histogram->stall)
 		return;
-	histogram->msink = kvmalloc(length * sizeof(*histogram->msink),
-				    GFP_KERNEL);
+	histogram->msink = kvmalloc_objs(*histogram->msink, length);
 	if (!histogram->msink)
 		return;
 
-- 
2.48.1

