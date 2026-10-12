Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3A43CB54E
	for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 23:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846558; cv=none; b=SUnSSPm8py9AicMFHFC9y7B1Oa31EWubvPdDjXsNO+4CRlxOeQdB2ptfASKM8vyGe5umLVwJJrhS+Mj65YKFApj8EntcTZNZZnEWdT4K+fPZ8kK37Tdpbql4gbocM/UprRkGa0r63BCGqHZYWaFv8Zy2wVkMU0UoYE7z3P4CyVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846558; c=relaxed/simple;
	bh=8UK9GqHDqDypVasEQe8OawvFsFRei6vvOg0OYcMF/J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNbpQTDRGdtA+csuE6CQagqFQYWjTwlY87CVNMgEM0+gvWq5SNOem47jkZnCw/MmPeOR41rKLG72/BWNqR2/fZicLl4QLE0ymwRolBolsZvFZafa98GJWIIHgcSL1RJROBaBsY+9HFqo10Wvx+D5bsv+44hzXvrWxy0rf7ibkIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5JM54GE; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5JM54GE"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dd33a7bd4so424674f8f.3
        for <linux-media@vger.kernel.org>; Mon, 12 Oct 2026 16:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791846555; x=1792451355; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DgOVtzQ28pkuwhaN83pO7knMz5YeYec6Njm6mUZKc+A=;
        b=F5JM54GE5TVsXqmIs8nisRmuN3rg7CDF9h/cpdsZ0cxCi+EIO+DjmEmD/rOyhNgC4z
         bRFt/yRSGb2RqblO3TMeGHMtzqWOd+IMx1LknidcbYzbWCsrQm6Q7v6llP4btMrBIiyo
         pcR9rZ2s6cq09FNQ4vbbKVx4F9ZXM9aXnQOwGzIKInfQfJQKlADsSncjFyMHIzgN0U0l
         RBuBfPxwCbec7eJOoFcI10jlWW65paux3jko2g6zYl5hubRKsnxUwpyh3erPnMfOXIBo
         CBNXgJmqkPIlbDnH7wFPyreVSQkaKERFLkHO7CAnwoTLa7yjm0UzHlE9EE92V30xwajO
         4bBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791846555; x=1792451355;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DgOVtzQ28pkuwhaN83pO7knMz5YeYec6Njm6mUZKc+A=;
        b=dM+RbDS8PXFxYiwpp0GYvGcOQ6dP+yjpyBUHNTFYW8V4Pv0RKMdBxbBvbciE8e7wSP
         6inD972zYHUtt+YWLDBAi82bQ9lDHBuDD86JfgKijMaZ6WjWIDv6ScxDKJP6fVYkS52g
         ixW1/MwBo8tD+KuFNjHcYSN95lWSBG/6VbWLIQfNpgDPl89vVYfdXeAsQVFpjOOU//Af
         dnNNJqNeDFKyisit1fqF8N0ytQku1nTqLz5gdSPI+12sZEwQnx8iH369VMf9YX73xT6c
         83rIB4E5rnxhBI0g9Z38OhcH6i57YhwhqggFcjUICidcddORaT3xvGRqVwbpuJDOfeU/
         PFXA==
X-Forwarded-Encrypted: i=1; AKwUvBx+bOf6icNazSnxIXaTVYtXpgacDRA9y5aMnqK6LKKVfZth2g5W6vkcK2hMPhwkm4R19PiTWUPkI1EqsQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLO2qJndLlRU2E6lU01aKanL/kd2VOsSGuRFa8rV9t78ZnVNhcZ
	yM85ddQ/Q3isKne/8Pn/FLFTR+YAggpWa4cB6tmRBls+f0REPDcrlywx
X-Gm-Gg: AYBFou1KIK6JsRqJOEv/xe9sFywP+ywxLBTyCNzlUZTPy4rKh644J8cMqWQh8pz9vwJ
	XJl2vcV+QJ9FhMAOMudr++2ze4azjOFQcg3xT8e7+gfXk1qmizZng/3m8X1wYnq2dJa/zDw7NUe
	3GqHI49uFbC+Yi7XeS5mWbLDauNIoS76praRbWGOtf3KihSPo+uy0DpQTxhZzfE0OGkzXvdx7PB
	OG5wdWFTXU0Frdx9I6JgFULg+F5AToWEhhunq/0L0i8auDgDDVagL0NJN/2kh23F3rFlstwDJN3
	VcykUa/tS15J4FKdvc9hbwccCmAlQd5/qFLT/eQsuIsSOsqC91Nu4fQ+zX7HcpxVFTfMHr+tNRY
	mD1XA2soLQNZEXBZ8qQ9ICBDowGB7g3QtHNq7bIq/aqGaOYBDb9X3N5sdEumS+mRA96zb4KLx7Q
	rcEN/LLTivRTYqirfN34zY7xGubMx209BQSYmrqxJullBZBQ64lq64HdrDYcdg+aSGzhs9FrFU5
	aJ/jkwDfajcdG0NqfLDUw==
X-Received: by 2002:a05:6000:4917:b0:48c:7302:96ea with SMTP id ffacd0b85a97d-48dbace4edemr20633411f8f.51.1791846555281;
        Mon, 12 Oct 2026 16:09:15 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm1873928f8f.19.2026.10.12.16.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:09:14 -0700 (PDT)
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
Subject: [PATCH 1/4] media: atomisp: sh_css_mipi: include assert_support.h directly
Date: Mon, 12 Oct 2026 23:07:50 +0000
Message-ID: <20261012230754.1914517-2-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012230754.1914517-1-vladurares@gmail.com>
References: <20261012230754.1914517-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sh_css_mipi.c uses assert() but only gets its definition indirectly
through the circbuf headers. Include assert_support.h directly so the
file does not depend on that include chain.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cdb58b..d73edd2c7c5e4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -20,6 +20,7 @@
 #include "sh_css_defs.h"
 #include "sh_css_sp.h" /* sh_css_update_host2sp_mipi_frame sh_css_update_host2sp_num_mipi_frames ... */
 #include "sw_event_global.h" /* IA_CSS_PSYS_SW_EVENT_MIPI_BUFFERS_READY */
+#include "assert_support.h"
 
 static u32
 ref_count_mipi_allocation[N_CSI_PORTS]; /* Initialized in mipi_init */
-- 
2.43.0

