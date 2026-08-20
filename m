Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAD03921F6
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 18:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787250136; cv=none; b=ErdkgZzQ+iR+EkZ7rq4jih+0yHV3blAu15xVc1dNDb/7uKANzqQHePAPFsvJqb307T7G61eGq2O3BDITpR41S9H/Q1+GsGQadS1RcsPVRI9E+vSFBIj6YHxGfHPXuOChcZpw5s7qh+0pUa/noYFRoSP/3zBiFuzgMjlWNnidV1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787250136; c=relaxed/simple;
	bh=/Vosjh7J54NGVazTGGa/Txp+MQ2qfbIZSR9iZOPYyFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Td8ccOqM1FiGIqlKiDQmoGcYepQ3GP3EaFGKljqXRsQQogiAZgSMGni/G28ke+qSkgJyVEoOB3c9AMFyl/GOJhAMSuQLz94ypnpYRDbvD2P7kVPbspxqvKeD5tDzdbASDgnvCaBy/r20KgSl2OhbMltiJls9V08y+qo86KfyHWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ox/5/tSd; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ox/5/tSd"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84874b52eabso181562b3a.0
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 11:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787250134; x=1787854934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5imqyFJhnygYk4HSMbWp/AoAsATKDJSePVqUZgPoY+Q=;
        b=ox/5/tSdWq30xyi3F5cYJQqAPVA5jUhmKnuv24PchCynNCoINEHfPHU4TM25ru5+Ms
         Ylgr7CvM1uzZ2nsO5dq5Gurp/3otBEReAXc4oPTGuIS3b/sfu4ONtlimoEH3+2g7HoBz
         i4dJJhvpXYKpC+TaLHFGhFxZyGiLKAXF//NBDUISVWMTE//+bsCBjjnhemisdumA3Qz2
         ONUBcEidgTsafl+yVQptEbk1UsqNXpiaGgR1R2JGKpRTQtYA6Fgv122IVDoC5FNLGcyD
         cqDmuTQVHN2dDeiumQXpCojJ9IVZdjmfdf3Hjt5/58LVbhL/tEZFTBpeGw7EsFsz2842
         SSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787250134; x=1787854934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5imqyFJhnygYk4HSMbWp/AoAsATKDJSePVqUZgPoY+Q=;
        b=NMxQkuEzn3cgi11FJVKDvzvGve2NkP9DuMEtLg9jj90fwfTBHssKDJFXwtVDwL9sU+
         w6A8WFmB6KC+ty5CyoplmSFTLnJH8rbluPCGk4fUATnpslfE1tpASVNsXctzyMNt9aiz
         r7jxgclBe0W+WI0CPpkAYGt90WkGT+hOH3VhTNUMcTg14J4QP9PWT591LpSShcLPZJgg
         e+hDoPSi/LooLTKNznB0ZL53GYlOgDj1jTKT1xPMpqKYhpMKNsnYCkZfDKWCZ4RlwXqL
         lzXLY1dVP1viysccGHd+LFae9KmGgo9WHXzIJwIqSjFdkjJHRO00mqLbaNsR2+CRpDDU
         uMqw==
X-Gm-Message-State: AOJu0YxkFOCXvjyuc98mI1wQOfddRQhEAvwG/A2Zzg2JRlGN1H8v2f7y
	A8XpwvKeD2KQhZPJ3HxtO306d8vOQ5XRvSFu35IcApT/5gEz0t30G3VqoT8nGMZ86m0=
X-Gm-Gg: AR+sD11Z5uuS6hffLGXGyWv2MJQny1K8HtydbaA3lfDepWLsoN8/Lcp1QiEc5nTfRWq
	CsZ8cDfwiHPyqLqHG7RUnPMyeHMauQzqCFc3pUL9yLYc4iClvWU5Iv/unv0zCN7L5xwYklPa0NW
	XrSl0lpJ4GNXsWUx2rVnr81Fmy+Hsb4qE7St/RK5/3MqniP/9UqCzyPg5Mq/YJAnVOJYCQQDI6b
	MIHKAm+bdQBBChR2M+hS0ENQ9x7alpXYB5jRGmfQ84Wez1tujRPk1liaNeO0/hvoog2BC1Gh4Dp
	EXI0QyNeczOe/nwSjLpEOd7A4mD3p37d9AY1DAbmWSBcnS2IaoJ4L2gNcD8TPmhiTZd+ihZL9wN
	r9g41tTnOWdHVaaaYk62e6V0Ez2AY3LOU42BWREiPzHupBI4ndhF1H+cIYySTDNhPLC7UUK9TO2
	+ZIUxziyPGdKp9Y7tEL8NpfrOIcU48Qo6njTtbZy41CRGmJY6X2KblipUJhwxker05Zu2hgK7Xg
	IWdnoeJP8jjOLFCDqrmv4k7/GXYu1ePoA4AmM6bPyCX5+uLTFJjWg==
X-Received: by 2002:a05:6a00:2291:b0:847:893f:2d0c with SMTP id d2e1a72fcca58-851d385f151mr22376341b3a.5.1787250133981;
        Thu, 20 Aug 2026 11:22:13 -0700 (PDT)
Received: from desktop.local (97-115-106-59.ptld.qwest.net. [97.115.106.59])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d369a487sm2037829b3a.59.2026.08.20.11.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 11:22:13 -0700 (PDT)
From: Jack Flusche <jackflusche@gmail.com>
To: linux-media@vger.kernel.org
Cc: Jack Flusche <jackflusche@gmail.com>,
	patrik.r.jakobsson@gmail.com,
	sakari.ailus@linux.intel.com,
	hverkuil@kernel.org
Subject: [RESEND PATCH 5/5] facetimehd: add entry to MAINTAINERS
Date: Thu, 20 Aug 2026 11:21:54 -0700
Message-ID: <20260820182156.18078-6-jackflusche@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820182156.18078-1-jackflusche@gmail.com>
References: <20260820182156.18078-1-jackflusche@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entry for the FacetimeHD driver

Signed-off-by: Jack Flusche <jackflusche@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8014b9f8253e..ba9661d4945a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5396,6 +5396,13 @@ F:	drivers/net/phy/bcm*.[ch]
 F:	drivers/net/phy/broadcom.c
 F:	include/linux/brcmphy.h
 
+BROADCOM FACETIMEHD CAMERA DRIVER
+M:	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
+M:	Jack Flusche <jackflusche@gmail.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	drivers/media/pci/facetimehd/
+
 BROADCOM GENET ETHERNET DRIVER
 M:	Doug Berger <opendmb@gmail.com>
 M:	Florian Fainelli <florian.fainelli@broadcom.com>
-- 
2.55.0

