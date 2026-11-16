Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848920;
	b=OQVBed0hzakZIUued6LfdJwVsY6XIr6ipxTq9yfhXcaMjZkqA4u6ysAMc63NPTsrPC8D
	 tuP3CH7T2/DZ5YG7UuR3k5B83DI391V1U++KoOEAqfxiT1FQVddztf38MQqJCRazHvYu0
	 Xr8B6NBbBrehdL/1TZ1UmaU0ihDcsDDUtsTRD4AomfLfv/10cMmMtl6skMZioDd89lCzA
	 xHxgXvQbVit2V3vjV/plzOxb3Y6MQ/aAC8wP3cu5YMWAvquPmG7xAfedTVMUjLhX4Iy+z
	 kZB8jQgGQOf37LCmA+XOZFrWKpEu+mIrg2GoQPg/004QC2DdYofrtrCz/0FL7OMRTJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+QWXf0N5dldl5WDjUZ0BGBBHwnWXhzOSQfXsr3MF4VQ=;
	b=Wgt8BID0faqAU1vq8Rv9LOLV6sSJC3EdJB4EgI3yUQ2f62+YXdKbeXBbs33XwhYcf3q8
	 TialH3d0IOqJ/icQQ/jplOY8c1xztNjXVymE0JY4De64EcRgjGips6fYP29YXwm0MLK8v
	 wxfAukAk0wDU3e7SGGk/+HrrblwrYjVbDYJr84CjnIfzzt7YEL1tqzGkRCC4c5xk4o5tY
	 kZ7m+7fPHA6jBS2Rv6jNb7V8UTun7YaLt1nrVlcNlWYzWnzt5OG+3MGwJ0uXsBTjYuycC
	 toikxKDP0JnFD8SYCi7Hxp5jJSPvjcAkml/GbSkO1kMEerVjqbeE4e63le6SJz4gFCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r+z41OKa;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597CA606A885
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 597CA606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r+z41OKa
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b3a5c9130bso289907a91.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794848919; x=1795453719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QWXf0N5dldl5WDjUZ0BGBBHwnWXhzOSQfXsr3MF4VQ=;
        b=r+z41OKa53GIVrOrnWyVqnRw3QU9gJuY2wnkKcCNuN7i4BHr63uyFHl+BSw3lqoxgb
         LsNpvf2sCK4wJkapRXIylMR3g0nAjXBSsoL2YSfYF3/+52mZRLeHV4t0oMzh0ZizOHzl
         AAzslo+x/UHdYn8UIo0BjCJrZzTOks/dT6J7pNc1TuEkMyno5n+UTQLpXbVGZFEUoa4E
         j+JgKSNKYbbl4R2t4wghZsO/tWEiTiaLYZQZ/y92ZU92RKqmtqCAyg4xkxvSkUJ5bnIy
         AzP+OdXPtZJ/aMY8B3AHXdfGH2fQCfM2+A3kUkavGesIHSgE0ycyADpd2ZqM42l3e5eO
         T6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848919; x=1795453719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QWXf0N5dldl5WDjUZ0BGBBHwnWXhzOSQfXsr3MF4VQ=;
        b=psNfqtGxjzRHC//0i//ZWuGU5GJzGs5KdHryGZftM8Ef1FHP690jU39r6RFIScSLrb
         J9iPbiezWz+lfNsrSStIfGfQNKvaWxsw4Qht+u6UBm5UxRFIzuISCJpOCNzlUXhikRQf
         ONk+1moEXUMpB7bTHB/o4nYovAsiVTJOSUCSYyD2Oq5g4JXrvl1Pri/HNCOhQQxlW7rA
         Tvor77Ta5c7406vwWXi+e91FnzFhViVQyc5UCCMkg1Xiayo6HRLGmQR6QbNFNZ+wEfEK
         BCtfpb281fyo8qwKrsJmZszSb1e7g3IzAyr9aU4FTT9VueHq0/YCXcUrhEuWg3Oiqso7
         EzXA==
X-Forwarded-Encrypted: i=1; AL+hErHOMdY40Bc6RWSu+4xC0O/2X5y5gjj/e8sZwtO00IHM4LzZc4rVTGlnbTEYHcG83k7I2+oxBXODSWtplg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9u9m1oQPL96vzu6iYml6abcnYBq6reDjDOI20HGoBA6LTQwUCP
	o6/pqbq3bxAxlWwP+2Lax1QRQYXXKtO2srcnZtcsAgWit8/EjBwwYkAU
X-Gm-Gg: AZFdTZdLpYhL0jL1X3RK4eymNJIa2JfmqaOy6NKXphHq1MWF4kfqiD03BTbx4KABg0P
	yk7m5BhFyCf5Iw8f8oZ2oK3M5hMfjnvVM4HnhAtd+Qa/V16wzbOalJa91SviU+B+opd2bD4Pd87
	CjT020Xy4yxLmNoK+FW74mL7hQ+jRNeQ8Mno/H2QivXHpjP/91q7GrgPivhsYBZ1aawE5FzmjxY
	ikd/m/OEyt1loKLpd0kMhESN5T3QiV2/QlKmHRPq1MdeHd2Jx6EI1dKjlAXA47KJWeRIfcVxyTf
	/h44bDgyy9ZVWCUH+6x4rQtVRcrD6AYHF6B0Bn1ZCna4BcMz4FsML7DPPckFwldGyxVGANZIHXi
	+pES0vA+zQNIuWPKDIekbOVM1VYbS+cC2OF4hfY3d1uBJU2qc4IH5ftdYDmW6OvMkM/UeULAUWU
	+FfTeh1kleJ9kJ2QGTSMx1hhFgswBzegohgtYnXYyCOKGbVTfB1lfD5P7kX8S5iA6LreJhPzvHs
	0+WkajxFIKZTM1wdwSNbjDxQtAgaZQQja9Vikdf9iu01+umd7TQ8vjfxWgM3Tch/6WGvAGpGkOU
	3o5xITsnsdQ4kQ1zcbfMI7r6B7PqWgE1DO4b8ion2LdE3SzZRZQQONyN2NtiiV3LiFu/OtC/9sy
	0+y7Q8nITIQLTFkizod0=
X-Received: by 2002:a17:90a:d2cf:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b1b0b669d6mr10573905a91.10.1794848919484;
        Mon, 16 Nov 2026 09:08:39 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad610sm150901a91.2.2026.11.16.09.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:08:39 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH v2 2/3] media: atomisp: Remove unused get_sp_code_addr()
Date: Mon, 16 Nov 2026 17:08:12 +0000
Message-ID: <8f23e8ab1daadcff28d8b795c895ad3ca955181f.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_sp_code_addr() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h     | 3 ---
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c    | 5 -----
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
index 3cd69284f..f8be93e03 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
@@ -25,9 +25,6 @@ typedef struct {
 	char      *program_name;    /** not used on hardware, only for simulation */
 } ia_css_spctrl_cfg;
 
-/* Get the code addr in DDR of SP */
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id);
-
 /* ! Load firmware on to specfied SP
 */
 int ia_css_spctrl_load_fw(sp_ID_t sp_id,
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 78f00f07b..49b986351 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -104,11 +104,6 @@ void sh_css_spctrl_reload_fw(sp_ID_t sp_id)
 	spctrl_loaded[sp_id] = true;
 }
 
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id)
-{
-	return spctrl_cofig_info[sp_id].code_addr;
-}
-
 int ia_css_spctrl_unload_fw(sp_ID_t sp_id)
 {
 	if ((sp_id >= N_SP_ID) || ((sp_id < N_SP_ID) && (!spctrl_loaded[sp_id])))
-- 
2.43.0

