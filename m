Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1672F25392A
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651756; cv=none; b=QfmtJqZgAsOA/DpxpUpG1I/tCNw9h8nJEDbg1FYOYo28UrqV79wRaewK6NgMXlubX218zq76lr6LIcHh65FBemp8aZH3LvU5tNlJlU+2W6HZdin4mo3wgyn9ZWOy239mcCiR3oWMjYYX5wsR/sORV3Pu2665wXi/vJW/NaAP+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651756; c=relaxed/simple;
	bh=LUkRNKzepSaZx852sFTD7IAADviE3NHX3PZR7fWHOQc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MCZX+wXa2Nla3Ier453K9gc2rtZVWp7azWh4uA/Pcn3eQ744+uih0iz5JJ5yEvlctJSBqoTUr/SoRlkJ0rZ2T9nbmQXn2Jhkvkx07pNwWkn/F5R8Sxc/bcsedpJdd8Vwvk4/w27iq5TUE5n11Kkr4D059wvmpXiJrUN6m7tkaTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRKjW706; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRKjW706"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso5070186a12.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 09:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784651754; x=1785256554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MlzGXQvHorwQ6k/VUetDD3RH9v8/Ym8L+R4VPXISEI=;
        b=dRKjW7069MAzLgDxp20gfmStnCjBi+kfK0I2T7SMCCPiMo7VlcLy6fxhQsat44tfjm
         ely7dLZLISTdQhTxWMUGxji5yiIS01OIZLtnBPidep/sXGVHywaC5TCIkkbWPRVSGeki
         BKyX8Ldt6p6fOcCQ5iBxo/Iuam+zpcybxq7mSyIs2gXkJqA2H6seHm+iOdlSNcvwEABC
         YeDtjgSzr5reMDjok6tyY2X9nXqzIdV+w1aBV2IKpkRq2LvZt18KxVlERYjg3L9ngGBs
         cACimB2wbfVgtr9kAk5D4rM9jrjeTSXwfdW4KuyrinMcvpEFxdUIGYILMvs+6OUektHc
         Qx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651754; x=1785256554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MlzGXQvHorwQ6k/VUetDD3RH9v8/Ym8L+R4VPXISEI=;
        b=JWfizcRVqbxZtxvHjjf0P/Cc6oJfQs3+ZFIpU5f6Gmb7qY3t4NlYp55Q7AuBlIZc72
         HLcw32/dACeO9K2DVs2NEH4w6RaWhEs9qxdbpysSNbwXtYQo4D7JMBFv9wq3cBp7LfuD
         XVkHGCejHGfb5aXU33j3Hq5xNOwa7PZhQa12JuFdKkMLZmL0DFPvN8uZfOBo7iDfr7Ap
         7AYV2U6mp3fHX8iQTgQt20WZAZjtyAFbTv1o8DBOHSIxWnjOPQYUpdaNHfH7KE6Y4Str
         KNa7aak4Z93M902gl8qzyi/beY/P6AdVoOccqutzxK59Rre38GBy6JY3GM5ZMbx38cgL
         tcSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpI2gNL8SLI3tpPknPZuTpmgsSVtsLS933ZssU2xzGoTlUdrmUJQP+x/4SCVBAYtwTb+efWeGpynN0JWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9i2YagtphlR1OZIDVQbgijOJVw8uxNhoK5dF6rYX8hNF5W3EV
	NADCr8Il+WStiPw3zClihXuHkecv+WrZK2g7QcldPtUn1456QBuXDWlb
X-Gm-Gg: AfdE7clnITniXJybw6OOPpv4IvJRJBsJMSLMwptNVM1X6+FWzoGLxW+wu1zkxCMBpHf
	wvsgGlQvekBS63PlYiCxf8ZPCaNPcGdeCg84HHFgL5WVEkrwdxC+KDq4SSb66ANd1J8ZAo8JHLm
	HxCwtPysIP1gQIhb3KS3IYgpC59zat1O5dvrMzK6nKAqPIvMWZO9sC9+3SfeLIQ327rRyrTnfCY
	y3f6HDXWu3B052ACo43R9fxeNgoaDG8YaKoKGAsXRiQuMzqtV0bJIOwgaDh+WAvJNGSwvjVQldG
	HjGIMY4+GEwKG83ERFaWp50VMw/A4RfqcRnv1Z5wRH9+ER4sx6NToxNDaioG09R1pUg8LfF7LXh
	WQFHUY0IheeBmm6iwzT1WPhM+HDF8Hr63duqXn2vRMJ4+zO+PMyHFoNPuJV70FP5iM9hACIxE7S
	WkWo17Tuds47rel2CyFpC4kKcS
X-Received: by 2002:a05:6a20:4388:b0:3b3:fc6:622d with SMTP id adf61e73a8af0-3c3ada195d5mr21213199637.38.1784651754293;
        Tue, 21 Jul 2026 09:35:54 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.103.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e0818e4sm482146eec.22.2026.07.21.09.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:35:53 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH v4 0/2] staging: media: atomisp: Cleanup unused module parameters
Date: Tue, 21 Jul 2026 22:05:30 +0530
Message-Id: <20260721163533.15888-1-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up unused module parameters from the atomisp driver.

Patch 1 removes unused 'pad_w' and 'pad_h' module parameters.
Patch 2 removes unused 'dbg_level' and 'dbg_func' module parameters, 
and updates ia_css_debug_vdtrace() to filter trace logging to WARNING 
level or below to avoid potential kernel log flooding.

Changes in v4:
 - Fix macro constant name in ia_css_debug_vdtrace()
   to IA_CSS_DEBUG_WARNING.
 - Guard vprintk() with level check to prevent log flooding.

Changes in v3:
 - [Add brief note if applicable]

Changes in v2:
 - [Add brief note if applicable]

Prajval Chaudhary (2):
  staging: media: atomisp: Remove pad_w and pad_h module parameters
  staging: media: atomisp: Remove dbg_level and dbg_func module
    parameters

 .../staging/media/atomisp/pci/atomisp_common.h    |  6 ++----
 .../media/atomisp/pci/atomisp_compat_css20.c      | 12 +++---------
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c  | 15 ++-------------
 .../pci/runtime/debug/interface/ia_css_debug.h    |  7 +++----
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c  |  4 ++--
 5 files changed, 12 insertions(+), 32 deletions(-)

-- 
2.34.1

