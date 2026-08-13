Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461F739182A
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 17:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642609; cv=none; b=beX45UR/bWDG8wqdcpr4omjxY99/9H6APZowAj8HLIaxeS0bLdrMKFPB1U/uWcDIyEBzAuaeNl92UgrNlyc4gDNFpPQWkgd8HhU4yI+9d5h3u+K1dr6fVrlXV4p+uqxwlCHZAqg4zPyXVC6onBdY6JYcr/GPRmyjh+xuf2bjorQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642609; c=relaxed/simple;
	bh=/Vosjh7J54NGVazTGGa/Txp+MQ2qfbIZSR9iZOPYyFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzkL3rj9iijPi8r7/mdNPoZ5JVJHpjimTUsujtCQ3903GXtdC7JEZ+ztyerd4pACaNOQP2Z7+6haKVhMXH3wWG87++eziMP5cQzgIsxdtvBDKX1arPmjM3vuzjWHfKv+2zDQMtoswE8G0PYa/XnEoGImyH6rT1Sd7z356cB4pAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RptHBWli; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RptHBWli"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8487214ad2bso726b3a.1
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 10:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786642607; x=1787247407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5imqyFJhnygYk4HSMbWp/AoAsATKDJSePVqUZgPoY+Q=;
        b=RptHBWliIdvDmh1jfc2ocNnv9Vkdj6v0W/KLq9EuBV+DbL1NxOK8Q8nEXlt/1nbHU2
         uhDQSb5nT+u4jWIoPVUAJygidEa8uLpj1SZDkDPq69KQ9Dt8/qt6vz/8DPnTAqoi2Zr1
         yYBF+5rjQlcYYdpSghHvZhxqpzaXjUvXEES1+bI8rhqI94C/QXHsp7hadM02BjTbuoPz
         MlOuiJEOwpi8XUwtDEJqthxwpR2xA3dyCi/0VFMiZAFEb/pTktk9RtzSv+qs+Z0FHf3g
         O80eQXgVpETLzlGRcICB1fMkN1jMFOHs9XK8L1INi+vnlRWypK4JS3i/Hg9mQrmI4IPh
         /gLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642607; x=1787247407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5imqyFJhnygYk4HSMbWp/AoAsATKDJSePVqUZgPoY+Q=;
        b=gvBFPGcRzmVA+oTCf3xw/O7QRGNTf7heeWdpBv32CK/Q8v9Bk0oYhBvzmbg3pjWMnu
         SGRv7djRfH6oSwat6j23NSVeUU/l5C8wnn9v4lOjVZtDB3fD8InTijcK1jcpc+CdVfXT
         KDOccImgDdRBHcbMtpzK7NW3BmZVskAKFkjGO8QzyArXHGkHVTXdAGkwPmDRKdtgjjVx
         FrnbvQAghUXsiucZRJ06oTlqRnmvI05cS6KBgek50a8q6r2z2/G066C7DDemu83ELe6z
         A2Z9t7sxjYUy6RZOVXcY76X6Sl8fAu1hx7XcmSZIZpm3v1KNwdAFpcxabIeNsRrM3K9a
         Jfqw==
X-Gm-Message-State: AOJu0YwgEjuHbtWmFXLL1G7syy3G2uZxF95ur9OgXNAUpjoSoIGidmXX
	+LLBaW+xQ16z9HYfW2rX6RsgRlLqKEVjE7v9I5T1dt1D9aJ8koTcKaQZi/OPpng3Eas=
X-Gm-Gg: AR+sD12EUvDyswFXA1NCPG7jnqerRGOjgGruo8DVvtlI/6a94CHeZr5K+FkZquS49BM
	n7XK3KIG7gs193jRrxXF5vCNVuaobwOs7FePuTtW3dLX7MYEnqj23yr3O3V+gaEJlulDBmiGf/9
	pEC0EJ7vCyKO6S001V2mAedEe1SceIrzMnElXb/gWLQksTvobIDdRspwszcMde0LJRKd3BTyjq1
	0CbrDcQQwC6uSzOCBw/Y/1X3tFxSt3gjjXIUH1DVd0+3v3mogotaXOkEmQOTySVPCJvLUx49WfY
	oSCz2RDXdoADlsq2QsTj8s5K4i0wK8SdZik28V9CTMaoRaBb5F5NvroyL59uy/7NJBU/mecuOts
	CtskF/VVPgktx39FQQdZUvMkjq3kid1stgNSnut9hmtkUuH4TN9IbK6ZMQx8d90wmy1lMkKoXOY
	4YthlINrGPqGdegjP3cd5h7wojgskVpUMHVVpvIrcIpuCOB5KVGWBHzYn0UbcPzpIM32cvvlAoe
	uWTT0HDVE5c1HN2w+8CYR0MSy9gJHcLh0oAAd6cPHs6gzgtWhAA/1a5
X-Received: by 2002:a05:6a00:4c15:b0:845:eadb:821 with SMTP id d2e1a72fcca58-84fc6d01387mr9325857b3a.14.1786642607585;
        Thu, 13 Aug 2026 10:36:47 -0700 (PDT)
Received: from desktop.local (97-115-114-204.ptld.qwest.net. [97.115.114.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4565c86sm1269994b3a.12.2026.08.13.10.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:36:47 -0700 (PDT)
From: Jack Flusche <jackflusche@gmail.com>
To: linux-media@vger.kernel.org
Cc: Jack Flusche <jackflusche@gmail.com>,
	patrik.r.jakobsson@gmail.com,
	sakari.ailus@linux.intel.com,
	hverkuil@kernel.org
Subject: [PATCH 5/5] facetimehd: add entry to MAINTAINERS
Date: Thu, 13 Aug 2026 10:35:13 -0700
Message-ID: <20260813173516.29293-6-jackflusche@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813173516.29293-1-jackflusche@gmail.com>
References: <20260813173516.29293-1-jackflusche@gmail.com>
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

