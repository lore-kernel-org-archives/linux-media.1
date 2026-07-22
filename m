Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D63B1C01
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 05:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784699195; cv=none; b=LqKyoSUe/9huShENDGqocF8SCihJj2jtQlcgtqQu4NxEWNRTiuytQ8RKP+Pe8MwY8if3P4aaIID+kOmrbTk/Y7jj0ZV/LspMUKlZb/4vkUT+XdM/4S7C2ViUg+XKID9RCQKXpbsuj+ak0axEESKxRaEj3MtN0sXNhNe/gnSWZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784699195; c=relaxed/simple;
	bh=vtiefrhNBNtUAfqHANiubzLnu7PvlIe4DkrWoSGglUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WdCuYzAGb8VtMOWelP19cI9TCyGvJbVArK1efO68BfM+nQ+JcUOkAex3nI2kVlTXxAJY5Av1+JqQrufvqPE8vVkYsB99FswrX1gEZ2ou6ZnCRAZHqFesIxLUBycvbOm5xv1gDMjgMf3ODkOSEjJLNdZ/xVC9grZ1W2HXHLcEl94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKZIIU7k; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKZIIU7k"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84864086bfeso12821767b3a.1
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 22:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784699194; x=1785303994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CI7TlF0b01ltz9AdVM8XyZdeWjq4/wESWt/dIuhHhd8=;
        b=ZKZIIU7kfMrsukAtdrBEIBLOvnyVH8BUOC2XlG987otUfH3qcBfvQcSW6kap22l82p
         r8NQ5Zl0eoVrxfG3SFO1zzbin2i3Hv9f0xknHww2ipRvUc6totAkAx+yk60Ngyyo3dHi
         pxRlnICKz2AWs0TWpBiCF5v0HcfvFTv5kK++amvIPbdbDhDWiwiSb0CRQlONy9H62+Nm
         7qSHnsCBkZpyYZvZWZBd3JyfWsERAPfz318TKss+su5/pMTJM+RaVStRj9UJxfO7sK+9
         2b01gQorAjfVRD/20zEiYC0CZRuuqthvPsaFdmasWNZgZyxIn867wU0hb5FLXKgpaPRH
         C6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784699194; x=1785303994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CI7TlF0b01ltz9AdVM8XyZdeWjq4/wESWt/dIuhHhd8=;
        b=p22xR0r7bO2oWiWPDXdABGsO5k51OGyDhcooeT0LHaDqM3xjUsYT5ELKYVPnEIz7E8
         rPLrgeCXK+GvGfPTaVpWqFEtRJ/JsDBjTan2Yc6SIE2hBeDVh6rVbKaqsA6xXO8ODFch
         li1gl1GclsQCUkun7r2/fE9NziXXeXyRFBcraLhTuAz9fxrCuF+qmnVTpNS7gjEMr25w
         FWMCPXDr55qZ32+qfCMxgiNutFK2FXABgZoq2MbCveexl3bXlg1cavMy2Hp/PGjnrYre
         Eujg8YYnfb1yN3dhSEyy5R/ewUd7kUxnuiVowM1VxVYnc1KpA0emW2xryeQJQuOObdLc
         /Ycg==
X-Forwarded-Encrypted: i=1; AHgh+RoS42wK+YHS2WDGo3ksUV5aqtMEsQuPQf1NNnEMy1TZf+E/UclJslvxv3uC0p9qe/FEl7NUVhoRZCOllQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqj/oR+6phr1+64y40y//AQ8BrzZDSuol7+EQG9xEZ/xSlS1n5
	qG7TS3Kjpr4lADR8wNArezNgUN1nMcbOBDNdSFHz/mS8hDTH9JRuxdRl
X-Gm-Gg: AR+sD130cRAOU+6g0UQdwi55oLBD9/ZzEx2wDSYppCzFurXEu06YhW8fmsTg9j4AiyA
	/DQF23FDKu0h0mQZTL9A53eZ+ycViBeHE1suxTuf88AMMlk3HbF42vKyKAPSPLhuF9tuGomNyNQ
	6RGhDDc9RP64vk8/E8mYSGSkB30iX9KC4cIsc0Lhl1L6CqHEDAB45telEJMGhydszHHMz3K8jmn
	xBt7WLxrRyyXI7kL9N7NxslURMQ+2ngI4rd4LDfyk7Ao79hPERGieOYdis8R+YI1yFsJ7kCvRkk
	MhcSs+06KupV9iaYP7yjbMATvYlcUPd+yoLfSHBlWRGGTz0de77UQ7eYoR8Nrxj6vmC4XUbqnio
	4+Dzpc0p61ZahyqBGzwjuaR/PTkHxKAiC0BWTQkCey73+/c18q8Td3IdnsSdH6YrRjsxAUEFZ3J
	ACPkVW4vjUsy24tSQ/
X-Received: by 2002:a05:6300:2289:b0:3c0:9c19:6590 with SMTP id adf61e73a8af0-3c3ada1f55cmr22670920637.74.1784699193452;
        Tue, 21 Jul 2026 22:46:33 -0700 (PDT)
Received: from UbuntuOS.. ([2409:4080:9090:9e2f:1d63:54d5:537b:d849])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm2501696c88.10.2026.07.21.22.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 22:46:32 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: andriy.shevchenko@intel.com
Cc: hverkuil-cisco@xs4all.nl,
	mchehab@kernel.org,
	sakari.ailios@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH v5 0/2] This series cleans up unused module parameters from the atomisp driver.
Date: Wed, 22 Jul 2026 11:16:13 +0530
Message-Id: <20260722054615.21492-1-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <YOUR_ANDY_EMAIL_MESSAGE_ID_HERE>
References: <YOUR_ANDY_EMAIL_MESSAGE_ID_HERE>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 converts 'pad_w' and 'pad_h' module parameters into internal
driver defines (ATOMISP_PAD_W and ATOMISP_PAD_H).
Patch 2 removes 'dbg_level' and 'dbg_func' module parameters and updates
ia_css_debug_vdtrace() to filter trace logging to IA_CSS_DEBUG_WARNING
level or below to avoid potential dmesg log flooding.

Output Behavior Difference:
- Before: Trace logging depended on setting dbg_level via module
  parameters. Higher values flooded dmesg with verbose low-level trace
  messages.
- After: Trace logging is filtered at IA_CSS_DEBUG_WARNING via standard
  vprintk facilities, avoiding dmesg flooding while maintaining
  critical warnings.

Changes in v5:
 - Converted pad_w/pad_h to ATOMISP_PAD_* macro defines instead of global
   variables.
 - Preserved blank line in ia_css_debug.h and sorted <linux/printk.h>
   header inclusion.
 - Added explanation of default levels and parameter options in commit
   messages and cover letter.

Changes in v4:
 - Fixed macro constant name in ia_css_debug_vdtrace() to
   IA_CSS_DEBUG_WARNING.
 - Guarded vprintk() with level check to prevent log flooding.

Prajval Chaudhary (2):
  staging: media: atomisp: Remove pad_w and pad_h module parameters
  staging: media: atomisp: Remove dbg_level and dbg_func module
    parameters

 drivers/staging/media/atomisp/pci/atomisp_cmd.c    |  8 ++++----
 drivers/staging/media/atomisp/pci/atomisp_common.h |  6 ++----
 .../media/atomisp/pci/atomisp_compat_css20.c       | 12 +++---------
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c  |  4 ++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 14 --------------
 .../pci/runtime/debug/interface/ia_css_debug.h     | 10 +++++-----
 .../atomisp/pci/runtime/debug/src/ia_css_debug.c   |  4 ++--
 7 files changed, 18 insertions(+), 40 deletions(-)

-- 
2.34.1

