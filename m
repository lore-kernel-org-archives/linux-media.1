Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592EF3B27E1
	for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 08:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521853; cv=none; b=TUR8GStpmJz2YAQeQk0fCl9U0w1890LAxlHXhxEpZsn1Rn35zmBCHN8RMh9Jfir4TW6OUJxB5IDzxwgBAceOJ46V+2lllfcpMK6LGaJu1y6WxuNwhshOl00klXnkwDzq42wagLaijnVY/NrCBIZf9jVYlvLtng5e792EVfsn8LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521853; c=relaxed/simple;
	bh=khQFn/M+XgS9a8N1qSY1pJGuy+IdF5OHeG2gMwqhlxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UdolPVbjreSEFeYXwccjFtjtzf+UkE3QBavOa0e+eByyfFtTb/xvkTl2Bj4AttCh8dQMSb8d8WmEmx/q1SNKO6TIQk/RIZo+qQd8A4osvl2NrX7RqB3yYKpOAy2lQnHK/E4R9Tob8RvBYIXTfNkk3HN/xBvY7wTOmCmrjCL90Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrHftSZn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrHftSZn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc61541f8cso25005285ad.0
        for <linux-media@vger.kernel.org>; Wed, 12 Aug 2026 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786521850; x=1787126650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4iSsiifabx+BVDymHMj6dCPD6stegn8pqeMhOORHYas=;
        b=LrHftSZnxRtPZayahmbuhIS/UQZxakMi9T9hPkjf37avgLqmyrx6MaFwmAhAZJTBOO
         aNPCPQ9ud/3tHRC/G8m6XE3Un0F2NSzgDqzZ3rl0jrFSQvm86MD2ya5+Y6Frulk6PTJm
         f2Z67PLSFC0FY5T/JoWcrwjHaqSonS+ZyUBOLeo1czRyHoyVX2/MNVEJPETrMdFFSuhZ
         r8L3rR5i3uxwfVEgiBNK+fb8RIEIcTJ+J9xWFPJ60nQRoxkRpz/aZwAsoTe7A7luoWKp
         2ZEvQTfFp2+BSpGdadKXYqWS6CIYfAVEKNid7fjD3vjmZcnPcJfvqaEPh2Zx8dk+ap9E
         CL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786521850; x=1787126650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4iSsiifabx+BVDymHMj6dCPD6stegn8pqeMhOORHYas=;
        b=YersTP6ckVSvfAubKZdMaR0AI88Ik2+DXh7U7bLM7kDwvTye9cHHt5qfl/Bg9nLl+P
         vue6ox2ICBSdWVB8ipwD1GtWFR2ZC34o6iG6XqzhEl9q+E0jAydmJ6KrE/n0L5fmroHR
         R9LG+rP21N8EK+5X3W2foqyDy3Hdgu+CtpuKRbiunw33f252vbqWVJEvG75q+3BlNQnM
         XnlG6DGcRKk5qKbZp9GAaAn3MLrpOaCDHYXL0pBzL0iq8TiQ8dLX/lAD07NvusCsxRnF
         67uqWz5UGCXc3u4xg2rn2ivPm1axNLUCytXim+UC0ojBqLSmuJF/rPlQFUNe/jjBWuil
         UEEg==
X-Forwarded-Encrypted: i=1; AHgh+Rr9BDEaGuDEUZKebyBR+3yT3QWSN0gyJZJiSmga6O6HsHXJ2yJd+HKpOLj//V4fN/PECz/d89IbyXRJAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YygGfu1CoYVty1kPTLPKi+VmOUrTcAbSsD3PAecG/q3dEiZpT71
	gU9mkEcOEBGMeBWJ8hJNg9UP8UBTfeZS8pa8wcrb9j1Fg9AlopwEITjh
X-Gm-Gg: AR+sD10wZnIcmi8g0GN3qhTcQABMSl/UdqD7S1qg9vT5YWGgR1zN7x1q/VaOb6ADNKr
	6EV6sFLU5gx9WTElocL7XKYftzNvbX60uEz+1MF9CRex/zqrMHgTDg6DS1S2BODNtppmQBNIkSU
	KvwDON4QT7gisNU5kV4kaulty5sUvigmbjpRjIfjeLANNX9tQXCkIu+9RgPR8Q2o4q/dND8HYKc
	Af8cz7n9MdKvU+ovMmbzzkq9dSsdzWxV4l8kYS+Cg7MFFupyxKxoL+sUWZcWY1cHWoZbyZNS07o
	2RPbdphq+y0jmcviiQfd2cll9vBhSDsQbLt6Gd2mcjRsOdvmTuV8PFdkyC8F24M+35MQoLWW4EZ
	1RhfhJlVxPOZ7aA9JpM8vSzO2meq0FvspjKJEvCaBEgF96So+dw22eRYod/1Bqsr3KIzK8FL3IM
	TTbp0diCThWdz2969zVmO7tWdDD0ThP++7oKIxf0ynTyNIsy/xX0kJqN1dylC6ceWhJlU=
X-Received: by 2002:a17:90b:58e8:b0:38e:7e9b:5fbc with SMTP id 98e67ed59e1d1-392f3f529e8mr3913753a91.7.1786521849448;
        Wed, 12 Aug 2026 01:04:09 -0700 (PDT)
Received: from localhost ([2401:4900:83a9:ec61:7129:9a57:4b26:1066])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d79bd6sm8803496eec.28.2026.08.12.01.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:04:08 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH] staging: media: atomisp: make pmic_name array const
Date: Wed, 12 Aug 2026 13:33:29 +0530
Message-ID: <20260812080329.87668-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pmic_name is a fixed lookup table that is only ever read, never
reassigned. Mark it as an array of const pointers so the compiler
enforces this and the array can be placed in read-only memory,
as flagged by checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index a1d3a16921ea..d628fe4dca6d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -109,7 +109,7 @@ static enum {
 	PMIC_CRYSTALCOVE
 } pmic_id;
 
-static const char *pmic_name[] = {
+static const char * const pmic_name[] = {
 	[PMIC_UNSET]		= "ACPI device PM",
 	[PMIC_REGULATOR]	= "regulator driver",
 	[PMIC_AXP]		= "XPower AXP288 PMIC",
-- 
2.55.0

