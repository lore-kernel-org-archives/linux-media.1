Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862525;
	b=uIkHj2swxc6P7z5k98jnYbvEuAApfWzUjZrmy70t14Mz0leRDzGbHFixCWvq4/7QTWk5
	 Y2p1rK1dCgtyMgxmkIfRmY8VZZmvGiRKTNU47pEmQqir7FB+e4fTVKQlfxq47alldpsva
	 cSlSR+y51wMtHrjjfU79StPNwKwCa77H594h9pztEYm6MqwJ0dyynGwtyQfCoyb/4DxYb
	 PXy5lW+EeZ9sd5x9E2LWtdlRmF6G9JkNHTG6c6t3WwHyn9+SavIIsI0TdurEwDQo82pnd
	 4vEHqzbhswbUrKV9gQqAoG15ZrHUX6+SXEioT/5n9epF1uxv/giGLN6i9DFfW3AGCvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=wS7NPyyHVOmXQuTlG7y7+HuqLRti0ISrh6Jo5BYNAx4=;
	b=XsKJLgpSnDi6SHEre6mgIlUBQwWEqqmTiJJmrxo6ENjCTVVNWV07m7z/pTxMlBEQW3cw
	 rUkjzlvK1sG5hPGM3iHPL3ka0Nrb0bPbFPcAC+mCTfQy5doQfE2OQlSXXdlHa7v73dFr3
	 +rf+FXCTl4jZTGYwVK8acDciRc0KqxvXOaxHCHDWNm8K+ohT/BP+9XqLQrJaDQXwle6id
	 cRXzfgJt/I+nWIypViSCEN5TiQrV1ApNKIe1+nA7O1zK2PGwzu/wbp2MGqOQ+EHlSiCx0
	 awvUKY/8f7i1liV6527qB3jIKKehxE5xxMfuD0XilvX884K+PFfQcRg/pe4tvTdIVRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QhkwdHBU;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F2606A31B
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 07:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575F2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=QhkwdHBU
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36d6765756fso1666417eec.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 23:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793862524; x=1794467324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wS7NPyyHVOmXQuTlG7y7+HuqLRti0ISrh6Jo5BYNAx4=;
        b=QhkwdHBUmS5nl1dT9PPvptTAGiNlZtYsksCHjzbMXtF7BltLhskfhnsFQw2cjZ+pSr
         Ec8VScPTpIu9FK4tPMA7l4DRmc4VCIlB6SCwJDYg3mG5nKjwQdsGeI9KzXKWV1dVEDvt
         lwlDvvJ/m0jWu/zxjls+csQH+sRPMLKHOgaqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862524; x=1794467324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wS7NPyyHVOmXQuTlG7y7+HuqLRti0ISrh6Jo5BYNAx4=;
        b=LsN1/nI3uIIYn6hZLxuKwZEuiKLLaRk4/GTIFaeC2Z6YKXBlSZeGj8XzBvDDanIqis
         lxqmauxj91gkrcylnysG2PM8CtSsbFcqyBspahtDrwCONbLYNXfeE3jTz0lj7yULKZGY
         88dJNPogfXCqFhA1irr+j0VHjYoRW7NJbQ66VMuPkm65ex8DGdu0iewcerBO/KojUgFs
         Z961kQhQtEnSeYN6j9zUqEv3kYjYX11OrYpa/KCAQ2+6paFnx/27kZ6Abw3iUIziLsVf
         u1n7zvAHVZIwxjI8neMqdpeW5oRhPpbJxaHq4stNczDatSSD05kJUPTVvGUhr237mfsd
         TC3Q==
X-Gm-Message-State: APuU4Z+b985GOQ16HgspIr6vmUwBbmCsLnGnuOxvTv8Mv8qpYcnzxDPI
	FFi4TrYy0ERCXvcrJ2ak2OAHb828bHpq39Tyh1av1QAmn9sBObOHLFvRUL3LWIMW1mj7zKDtck3
	m7EVAMQ==
X-Gm-Gg: AYBFou1NqcedMl+75lrVsLzzg9n4PfNMmupBIHz/3joF4/yGjO6m1LUMf2O7V0R2GC8
	Q19RTgw4/tCdy0wJX0ZC9sKLE1MwgjhDTc7sjlsk4n7oRxGAGTQvF+msusLHYjVNVMI+xjdycxx
	OIro2GqbG1KRhjWD60kNZVrZE9N6Tb7nUERDTx0HbPevdPbj7LKrE/C7CsetS6+PM7YJI5A1He6
	27wgzUYzaUk88XfGaWpltgbjlAH9sL8oVnu0PZyUhRa97WzwowzCF6fmEC2F66GkiDVjsupbyfU
	R3PL3Zj8LQPGH7lHFByJQAzGpmRAwBOJA7GXK32W67l/KbOsVA3W+74s68dkAsRwmlWF6Fil/t+
	MFrtWXVU5ETQ6bwltSXVPBun5T116Nbof5xXB5/cBsXFOavl7Yi+kHZBCoVbUDey19yg7MGN6Om
	mCiNc1y2396C+le2e+9cg13k/PNKn1YDede+UL+Kr/mfKQSxEtlzE7qxzWWJlsL1PrV5pb3tJ0V
	MjW2M6ka+H5Ibk47T3dzaoURq2dLrfkO0NcMhX+4hI+zE1NpQ7UFJGkblYiiPrWNnbkJ6SaTCru
	nqlepTnhF4zsbk2HYRJEpvp7P+sXif011fn74aYuIc2YjCrtjNXO0Q739OmeSbv30wDVRPWHjT0
	EtMlUWQ6big==
X-Received: by 2002:a05:7300:aca8:b0:35d:28aa:3ae6 with SMTP id 5a478bee46e88-36a4244e81amr36995719eec.32.1793862524055;
        Wed, 04 Nov 2026 23:08:44 -0800 (PST)
Received: from piwnica.c.googlers.com.com (13.53.146.34.bc.googleusercontent.com. [34.146.53.13])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3785430sm19703210eec.3.2026.11.04.23.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 23:08:43 -0800 (PST)
From: Tomasz Figa <tfiga@chromium.org>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] MAINTAINERS: Remove Tomasz from VIDEOBUF-2
Date: Thu,  5 Nov 2026 16:08:28 +0900
Message-ID: <20261105070828.1992653-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
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

I've been working on other parts of the kernel for quite some time and
haven't had enough time to follow the development of the Media
Subsystem, including the videobuf2 framework.

Please accept my apologies and let me step away from the maintainer
role, so that someone with more time available for it can take care.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..af302622c849 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29512,7 +29512,6 @@ S:	Maintained
 F:	drivers/media/platform/video-mux.c
 
 VIDEOBUF2 FRAMEWORK
-M:	Tomasz Figa <tfiga@chromium.org>
 M:	Marek Szyprowski <m.szyprowski@samsung.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-- 
2.56.0.398.g882cbad275-goog

