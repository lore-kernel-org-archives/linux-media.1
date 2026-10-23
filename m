Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758739;
	b=b1WcLgPk2uXU18cDhoRVI/sVvDKBgTmHmrwIXRD1Rgfiu+XVcGSkHRUcF03rrYQ1gxE3
	 y6m4Ld8H7PA9IlQJOptW9tnJtV0SARUa+723EoMVuHNnn3WlMswZLGSiCL1BbPJtiOuys
	 dS4rJM5MSA781DuhP7NDpXPiKcygjFqBLHPmfRAOX7YSzlq9KXGa2OxJxFJlKSzinPbYb
	 qpijdM2OanMThMUS8B0BNywgj5ZijIwjdEQVli1bc1VXwgC1qKr75HIQBsu4gEOUZrwAb
	 VQg7PFXGckbB5BPWvWC97Ip19kHmAPqkW1aJmJEsUM1c4bRi+lCZ5h4fon+XnYJv8NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=scUqe+m2AaEqm0y3/EgjFb3VXYqdf50pvfoJjsmh5EY=;
	b=mYLUMeR+9I/6zKDzytVElTpj8Cvi+aU/xQyr8cH7lUoASs+JPNkOO+txcWcTzoUUYBez
	 RBvpOpm4BIo7uHZ7goLbpfz06+MLAYGNBeaMyBTMvEd8QLSXp1PMODfGKjc/7FfqXX9vE
	 QexeTNT1gps0r/3cy00M1cqECBp/DfHPutDtOMFBAX9JXB1N1vIbBG3LRWftYrMtps7yt
	 guVRykydfAjRaYB7N9b9AjzFveF+WbXfVnAyebsKlqqbhR37exgEp35FqYAkOgviYt4ej
	 +QMwwfXin/eLhfDSYardsa/L0iHOa1DUzznL1HRhErWbzp3PvDwhmKsTZvQceZF3blg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GPh22pHN;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F00606A31B
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 12:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68F00606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GPh22pHN
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso7698335e9.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758738; x=1793363538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=scUqe+m2AaEqm0y3/EgjFb3VXYqdf50pvfoJjsmh5EY=;
        b=GPh22pHNy6oEy80Pd6NlwxS2/yjBHv9mEZo3KflXm6BlueOS9REwdzfSO57rDEfS3T
         i9l2bBuN0sIoJKTxT/aALyY4jPWc6SkigtG6wkTUQXhJNWAopFPlvBWKH9Um7CnB5cvf
         sghFWk+AmH6JiGVVyZjzrkjiZ81Pq5/KGylY6NJovcI2adf9Ycs2MTIVRfvGboHhJ2sv
         FjnPF5km8dk0vUlqMdHsK6GeMcxv4uZv1w1rjy3tCYJjUO8ec9F6yT3461g8F9YPhzTN
         37FRTu+Ubxox9E7GeI4ppKjCbB8iVnFayhXJuISAn5bOMKZsVhoYAKIzrV0Ym1b7XINa
         vHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758738; x=1793363538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scUqe+m2AaEqm0y3/EgjFb3VXYqdf50pvfoJjsmh5EY=;
        b=tHIfizwyumK8ZfTjzi6oNnIYEBCNxv0h5wjufizd/BY0ckk/XPijfJRoE3aVO+7vOy
         1knB9PtbTV8+FZkrrEpVy8t+7CgTDzQHcLA45EwpEQbBA8HaVsApE5QrN6Fu26eZPrI6
         8apfRBaG9xLjIbDdbBQ9HIIitzUMdOiYQZcokZfE12ay8t8dMm2o5fJWAlnMDJj4l+l4
         FFvC60/AYpScq6UZdociRsuYstaPh6MPDGkgiyj2u7d2R9EHeqI2i0laMCwjqeGb7+ma
         OqOTbx5AdjIT3v4F7O+/XVziJfFjRv5FLHk3CG7edv1aftLXkp00kJQsCvyjjOL6Ol5y
         0AbQ==
X-Forwarded-Encrypted: i=1; AKwUvBx87AcwBPcHrVmWOfi4dX20a09aESkpMFzQbjfepyoNaRMSoAiQO36YwuVW1jFtLgu2U8KFMWnyZwBq3A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJx76LQm+prpBSPBRHEN1gY1Fptqcfvn2eSn6VwBLR3olX/hZ0/
	QKmO6dDG45K0MTIiioHCIgkkbGQLEf/zxZT4obTdRxgSjaiBaL/l1pZv
X-Gm-Gg: AYBFou1LCiyDVrwz8kryxM5aU/4YVxe4FY07AppQbZ/SlTVeZOSyFlhFJYKMufPbmI7
	gG/z0Yff/F7JXufnusMEQ3Fz9fJbpA6n0j9o7h8GPLjThaJRbzWgBiLZH+xx1OkMIcLy2wCjcYS
	4JHXiLv5WuxIzQq+jOi2091O/yRa7J0uzzb+tLoIuPdYaxHu/FW48opjtMviHxa7WrunO6e+m4X
	gQV3WfLp1/iHPquWCQUkz6CHKgYluotja6OA00G4ZQ6cTpzF/3gbph15qwk9jB7f2ew3bdb1RIF
	gkwI3kyLKFZ3u8Df5g87o2TjK5Isw6KUg9pIKtsD2QRKuqDvnihNLFQ3eiHsGq6vri7hncjY004
	5gE0nBVeO2hL1ePv9qEJDGELgzk9A0YgQjhbQvmb7CoKXwDJAgUEBXMwW07Ohko5y/NFVywqjSA
	nMofrMB1JTFfCc6Utkpvbe0eoaorXKMd9ANw/ggJ5km3HDP23l1ThmOFt1U3DmYbg89qcAM1aIn
	Nai+kmG+b/U+ZvlWx0phHvfiHbON/FD6+aFgsiFn4Hz+ZpezYRsyLI=
X-Received: by 2002:a05:600c:1911:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4a211c9de53mr35206875e9.8.1792758737396;
        Fri, 23 Oct 2026 05:32:17 -0700 (PDT)
Received: from salem.. ([141.85.144.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2b064084esm646595e9.9.2026.10.23.05.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:32:13 -0700 (PDT)
From: Lorena Tanase <tanaselorena3@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Lorena Tanase <tanaselorena3@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH] staging: media: atomisp: Fix double blank line
Date: Fri, 23 Oct 2026 15:31:58 +0300
Message-ID: <20261023123158.6176-1-tanaselorena3@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Removed blank line to ensure linux kernel coding style. Found using
checkpatch.pl script.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Lorena Tanase <tanaselorena3@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 68b0ad27615d..66311ab4880a 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -6,7 +6,6 @@
 
 #include "system_global.h"
 
-
 #include "input_system.h"
 #include <type_support.h>
 #include "gp_device.h"
-- 
2.43.0

