Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102642;
	b=dCELCoahkoLWIh9bKWANgolmu2GeiBtYKBHnlAQpWi4Ju60d/55LWzBbHuTWr77280CS
	 /CHsnTw03Fk+FSQYr/BXVav46Y8UJxIK9OvP+or/vvZoprfv7a+ufnzz+ctRgh2ESBmKR
	 yxQmTG9ba035aHKrKeE0blZP8cvMEB4H4NsJaacLbeRY/U1LLDRuDt2uiPtu9TD7lV5Y3
	 ErF2u8bUl+zPP6ycakaqtqo1vZ/PPxzJsAyaIDNGXY0211ZEzKw+3S0dMbM3wBx8u69sF
	 EtB6qP5I1cn8QwLZaPlNFepnUeGQi+ikOKlQfb+RpZINxTgFzxFNWSGm0mzH4hJ77jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
	b=cNeVodjTbDzscQwP82AYcb+T8MKKtYF2RSAwxhp/XBzbi0DJwmsJqrGAvHvtkb2pI026
	 fu5Wj8LpAT5OcXX254qfKryV+4a7JxUj5nXh7rZoRtbWn1uUtJG62vMk05zK7MXdZA0Q1
	 M0CQWl/FfADU8efNLmces8qjuNuIVsbh9oIHuHdoV9cXxIg6hxlkpASVMw/aENIG0T7sM
	 SmosyB2TIeOPpuZa79JWJEM/ZdB7riBJ30uF5ui/Y8LnCwEIV95Ann9hM3LNxjL7ewTSo
	 qhivMVMO8CsMZ75mFFy+6EEE6bI26HSXP7+V9O0TdFMOafdGNw4SMe4sR7BttGdf59A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="au/YN+L4";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42F8606A321
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 12:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C42F8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=au/YN+L4
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d1da913so853757f8f.1
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102640; x=1793707440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=au/YN+L4CFecuROR0YI82Tvz2pkZylIrDL8YwW9NtU4+3jsh4QWyv8z6uqc1EUzfzE
         iG/ZH2W7aufP/NMaNuXgRltWRVvjQ0DvBqiUkGqfNla61HyCTRhFftAsNYkhq/D8MTC5
         DTswsMkQ7LrO/wRtYInO3f5ZJIeTG/b6BCihNpv44OEJT+dLRveCzYHfjPtOkHh1Ajhz
         cupyIl+JfJljMriZFpul2Kn6pOuj724gNVfLzYz0QGRFeiByhTWgpXnEZno4zV/1VlS5
         GUMH9aUX/q7Ceu/2zsAmTgB6OS0Xmogkp47dK10YWxZxPy8fKQYqfwJKCC07qDO3YYgV
         psQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102640; x=1793707440;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=qASDJmDAzY/IZDMFV78sFii34iUvqdf2vyRfYD9NdQwO8OL0XO4IVa0wSGPg9lBTBQ
         vLldMpzBIUTB8jjcwCShqhItqlVIChcxzCZC81pwSIdhqwp7fzafX4nYjpr5bq/oaKHR
         UCKYfYlpBp3dfiMho++A2wTx3GvUmgE1DfpofVtWgS77dYWojWr0JSDkxcyf9IEG2aBX
         Qpu/APVIf/NPuEIJjYVhe6AyRto49+AO5pcPHbCO+Z4wR7y7PfeU4p1GD1wArjuxC/1r
         2NYZganxQpeFhrGPSS2NhGQBsiLk02YW/38LCM8KvzNNeBd0V6GC1EQPjW7LvLFJgcGU
         PaEA==
X-Forwarded-Encrypted: i=1; AKwUvBxCeIgASGL/lyRewYFaDQ5wGhKG3K0xwoj9LTY0tCCLoKtJfhVBctChkh5Rmd+Xx8MBy9hSLGC9h1tJxw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVCGAFte1lLuSbm4fUfNJp0yEYyqcBywVA0XaqO0GvMnWtN0Lm
	Dmha9dVq6rS1m9OjD8dtZbdWVI52ZFJkdgwGQog2wp9PwQo03ZILtri7nC35zi4MLbE=
X-Gm-Gg: AYBFou2D0Hnyy+h9z0sWVbkptWghhliAZxct42hRj014Ul204pJWuBZrZHbzmygFNbr
	N2PWxETeHWvhzO4LDw+cnJcNzE/ktVuELupUteHlWE6JvLESWwP4diQCb68ryXeM7FB0jqP4XFa
	Loc0n10U2bEtLksuA0RWalnz4Y4iunh5cQp6TfVYL4gQmOpS8GromxiVEd1JxniTP3cm1rFX6/A
	DUpR5Y/eMBVk4eVbCNNxXYiZTWHMp7Nt39G9nGrV0/dVj8q4yteppB0qYuMGjFF4GY6Yqiw+8nm
	ZWiVxI3JjPp4aWqETQ4WTn3hATTCNcar6dWzvTU20uCdJe7NRb3eu/coTstkr4qOClHaKOat734
	jhKZls4JZygTOLTpG5lAcsni7OgjmdfMufHlsW/zPAnCn7hsQdfppZ0ArPbL7pHU6SrLO0qHZVh
	PADVJX0OqrDSKxvrtYmH1PtVheH1DQD/pvS7W6Ut7t+0za0/ZKVDFIG35SEjWB+Dk4sTX4rrPT0
	dayWFEaIqdn5DsEkw5ZOqu3vHmh2xnlyAdYddPa+5GYhSI3Lc0Kj+QTKbw/xUx2+VhPXjUb7A/g
	rKqm
X-Received: by 2002:a5d:6d05:0:b0:48b:226:839 with SMTP id ffacd0b85a97d-48e55a150f9mr4623479f8f.14.1793102639863;
        Tue, 27 Oct 2026 05:03:59 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22977554f8f.46.2026.10.27.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:03:59 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v3 1/5] media: atomisp: sh_css_mipi: include assert_support.h directly
Date: Tue, 27 Oct 2026 12:03:36 +0000
Message-ID: <20261027120341.2305533-2-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027120341.2305533-1-vladurares@gmail.com>
References: <20261027120341.2305533-1-vladurares@gmail.com>
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

sh_css_mipi.c uses assert() but only gets its definition indirectly
through the circbuf headers. Include assert_support.h directly so the
file does not depend on that include chain.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cdb58b..83424b6ce1713 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include "assert_support.h"
 #include "ia_css_mipi.h"
 #include "sh_css_mipi.h"
 #include <type_support.h>
-- 
2.43.0

