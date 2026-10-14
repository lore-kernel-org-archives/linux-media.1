Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856FF4B0E21
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 11:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976360; cv=none; b=YLZ39Z/I3yXuQfM8PnWBoHxHZhbSqrwAc+eU14Tw3hvZkz11/GfdlpIOGS7bG2TR+5Q+q8Azj44PNRY5G41OwTLgb6aQNQbKXkFF7advfv6UAD3ndqNdbIU0bKnFbSOhnpWrQ/60YoOqBf8+ddt8GyEmT6BLwJH1CvgE+GKhL/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976360; c=relaxed/simple;
	bh=MeI3zB/x7HcysOTsREw/8vgJnOEIiDaS84Ud2PBmxd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PX8PLWfrAxE8/XWz6C8u3idwM7dxMdfHowus3nLz2PTVeJyKgWDiA/t/6u1KkTBCkblbu/zD0Jv1AwSJRQD81kPk8+WdFIhbHSaZiWIw3Kmr0LrE26jtQHySJhAPca2iOXlQU48xuAEwjKYnfY8+EJirIpzzSmGO5llkdvt2fw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kMjT3zc2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMjT3zc2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b060ec084so2602395f8f.0
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 04:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791976354; x=1792581154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bC6aVvICfoTaA3av0KP2hPJj4J889q6ls+h6HZwfSMo=;
        b=kMjT3zc2E6XFIoPyRVegSmeGEEFbYbYI8AOMYuThQul5O7cOrUzzOpTFhvSjQuWktz
         aeVkxzYRVTflBy5vYW9J1GToxrzPBqdVpmEQ3byHEahZpCS9eZ6L4wToVxOR6oEJ4PA1
         smOtMnEl7t4Cp/DO7pid/5jAn/Ixz29oWFluo7mplG3qY+/C1chXAbaTcfwcJxeBR1ai
         vj++bxlgZ1SgGQVb2HJvpLmtyt110Ae3WloL7RtQiDDMSUIdtwg/VuVTMBQ2lQ96l169
         /5miIJOMz6YIaN9aZ040RX5THdUo8t8Jt/WCM73aynaO/ZRX6wgvLSvf3Ojr/QTCUsOW
         QDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976354; x=1792581154;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bC6aVvICfoTaA3av0KP2hPJj4J889q6ls+h6HZwfSMo=;
        b=OW0Xp1R7XgpYSbuH45sC65SIl+Cx+la2uWzuhSMhfuW3a7heugoCrHjOhZBsJ3xd48
         uU+2cLDAfEmVhzysPGIri5wHZUbAFVpQSXtg2SfokURHzP4NS6MIuPchcMuNDdN260aD
         NYKQy/35Ht5/tu8Nnnq0RNAvur0vykGtL9q3ZS1bSe1g41UQu43Sm+IidI0OegnaQZN4
         wPrh0xsFHQfz3Wt4mIXY5SJZBQ4JorNx18cNlsi+RwdVsngHrNafv8B9qe4UeMPyis5/
         fQ80pK3okDY0WGEC2B4M0KxZtR2ZuX8+gjS/LMyb9r3+MsijCj+VFdP740f5zNPTIoYI
         Dppw==
X-Forwarded-Encrypted: i=1; AKwUvBysWT1+oai7tXeDzdZC/5zHSHlLFwxhWxv2DGeV+2NEE1Av3TMUSLlpmYx1tlKUVz/yK6VYzy4Nwdk0JQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJEIjuckHvQsGwLcm6Prdc1wvyPjUGoGcN9CLDPUqtTXcJB6VVw
	FasBuAtkhQXTkQ0YGslsyo0H4nlrNwicxDkSWtw5Prc+wAp4r6gIWhAt
X-Gm-Gg: AYBFou0czHSwACkNM27oTN7codOwY6TQYG+T7HSIYx4Rrhxe2n0oByRGdUDDtjt0wn+
	N4wzJorBA4VWoccb/ly/TaIHEgz/nq+odGSBRoBTKMu9XmOp+JsS+ToOpn9si+tHritUyAzAtVj
	fxF+plg/P1Ry1ByKlBXrePoyYT/qyWl0IorbRRS960PLrA44javM9zvg/o+Fczj9UDjje64+/60
	gC4P1pPza9Lw9nbC5qCyg+3h5y8eqqRSMiCVXSUo9cnR9kzKyorVcyqfxOeUCc2M4o+wCBEWiMi
	IFTGy/VZO9A0AjUDYg8kug0JOgz2zKMhnjLaWw7C7CRG8A+qDwonq4xjCD3LjiJclZ6W8E6fMIv
	rnEjQvOcjcAaz9G1GDobKlyWWi0lTL4OaJEoyOAPPjzagEo8K972cwbyYGDKqPXKMo0OEKKmN33
	6r2XjPyouLkHVy243di7zVqgqDcr7sOGqzge4bPGonsdZY4Ce1nxj8fUbPuqmyERdLAnQacwqdk
	vWCeNok48DDG+IMeClEWg==
X-Received: by 2002:a05:6000:e0e:b0:48b:1ed:db34 with SMTP id ffacd0b85a97d-48dbaceeccfmr22523693f8f.45.1791976354227;
        Wed, 14 Oct 2026 04:12:34 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48deeadc0b5sm1846481f8f.6.2026.10.14.04.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:12:33 -0700 (PDT)
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
Subject: [PATCH v2 1/4] media: atomisp: sh_css_mipi: include assert_support.h directly
Date: Wed, 14 Oct 2026 11:12:10 +0000
Message-ID: <20261014111213.1967452-2-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014111213.1967452-1-vladurares@gmail.com>
References: <20261014111213.1967452-1-vladurares@gmail.com>
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

