Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A619737BE60
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168264; cv=none; b=mrfC0lUXgqUKI/eoBev08VCGfaff7G4EhGJ6MEoKco2CoLm+1Y9hB2zZxj+NkpuWLSC6k3PZgbjU+JQA7fWoASuIuPOAm1j0Hkg16Kew6c4QAMl1o4M2IF5Rm1JhJmJTk3pJa9Z8M2pNPS7cDwJ/v9gwOuDnqOhu31PqBanwONM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168264; c=relaxed/simple;
	bh=eAQ4oMX0/Xkapoymki25CS2DNK7+/uNx6TNxx66H3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=frB/rATzWL7Ll+XiV4GqZuNDioqafFkzRT5PK+b0SUA2/1B/Zzcy2VZqyrl5StZV+UIr+SD4dDNJPB2TIHUMLSwhLakK2D1wpXJUHibKKtuV4Zxv+NxIwi0zFyv4vlW0zTmw6sE6a/j6SszN+xn77jhr7u5kEvnYmslHutB/d/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjA7ZjKt; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjA7ZjKt"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bcdf8232fso10435195eec.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 15:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782168262; x=1782773062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=PjA7ZjKt6nT5L4ZKgvZdqynm4oghT/CnWll1nSLiipmVqtH115hr7kpMBadK2bxpL5
         5rfx0cFk9i2p+TjY6FTBb6qqgTS09v7OHxl0vipmN5CYn5vz0yqWUSClP3rGGld+QvKj
         t5F5bmqn/TGp+8vKkidbKf46kYQky4iFkguS1RF8beOmO+pLFPFvLxCKg9QYTRSCP/qS
         Oy3xvymhK1kdgpz/H4sPAHH1TaKceTWhHDzWSzUZBR4zHox4kHv452e2OXE+ogFbyDs2
         aOTAa9dgkG0aYJBL7m5SIa2xOilvjksdviS9Q6PrhpAjRcse6S37JrTFOxfYU1O+l5Ak
         DTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782168262; x=1782773062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z4xS8phRqWxiljJHmmeogtt69A2jDuGD7tOCK9G/dU0=;
        b=sS8YX3tZpqeHamcIzm1O8jgacp7rupaL095LPZ5jjAV7Vrnt4v0/r+TmhXqcE/IlRj
         Yxqm6tXo8HmmBPW4F/sJVddubWTkq98bcuTTbFXD/gvFTgLRliP6tayeD9RCJrCO6kA0
         2U1hTYJSJ8lszkgu8ZulkNjQyCUmAOgWu4EQgHIdNLpUSXuC2v/5qJmk9hLicchAax5m
         tG1xxrUmWDk2RHQwmDSk645oXVBwnZW5MdXAhTN8jNNa8/jH3Xw240LQQortkQSl2Bdz
         bsAK6OcGkD5ATiGyMWCM9Yo0VEsekgt1Y5KQx9TurZQVaY1OsLbtZ+0w6dI0AUCawak8
         Rz4g==
X-Forwarded-Encrypted: i=1; AHgh+Rrc6K8NWd0C4RieP6BHqILkDcF4/rGska8/5hccIhJSgos4zBufXHEwypIgun23jWytj3JsoXALfAxztg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3QGjcJmfOvuAV6B3HUucZniVNrV/Rs5wruWRpqNZfmzSIFtLT
	szUKFLRKs6dCk019O8RkxDDgW0xuD0GWLCr9nbHT8vVjUbG1fScGWgnu
X-Gm-Gg: AfdE7ckFURsLKOrxT5GIFxwpSesn3+Vc6zgJnfImL9Uv98XSkzhtshpUDjYdWJhq4PC
	GNiShygqRFhU11L2Igm8tclexwZ34wHmucd0OWzEiLgMZYKmHjlLriMp/qdqxVMfqM+Pf30no9G
	/SWhGazObpjkVRNzU15KgnlNdk2BbFB7B2AKGx7sSgY1heyeOSMm/P1W47m/5iaURFrHjwCViEb
	C9AvomaswbCD3+u3jxULdupHqBDwk7PUyuHQo6HxwU2scDypfrbZTgIXCRqAiP3nx/WYe3qellc
	eXikRn7vCaPyh57h09dGOu71+xD+StmJOj5Kym9bb3vlnWEZJnCY7HpohZoRu1WfsnAE6JCjOhy
	RpHaCp748MVgyCjzs6mzNiFkN6nEAp3KQswect7GKjDms1nZ3y85fsL/OIRKRVvRfrfXoRg4LH4
	VRmSb52Q9PWilXLgmbtP8/PEcmB4BZxaVXNN3hWP/cAEvr8vn60UCQD7n8olbJVmnheLo=
X-Received: by 2002:a05:7300:80ca:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30c06e3177amr12392623eec.11.1782168261837;
        Mon, 22 Jun 2026 15:44:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:691c:629b:eda4:7c2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1ba1c376sm13087954eec.3.2026.06.22.15.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:44:21 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 1/3] staging: media: atomisp: use kvmalloc_objs() in make_histogram()
Date: Mon, 22 Jun 2026 19:42:42 -0300
Message-ID: <20260622224402.34001-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
References: <20260622224402.34001-1-rodrigo.gobbi.7@gmail.com>
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

