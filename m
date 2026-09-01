Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DB048380E
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 17:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788282543; cv=none; b=i97v+HhHOjpmY+5FD7jWmZDSsHWRM+YnGgU3dQNhzhqdzRLfX+iYK7fqZmlwKHHkCkJtMjCdEQQZUJwWc8Geo4u0QjYwOEd3WCqzRRnxam39dotTOb10V9zxgF0f8+4j2XkQ5TBcalLZB0xpl4U7ye/skXnL3wtwu6oYWB98IVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788282543; c=relaxed/simple;
	bh=Q0EerqSgGvmAb1C2z/3u7uYu/BE74lyAF6uYjKyCP+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dTJT5Af7+hkunIj74Cu8u0WwKo7Mq68ClhOYuYJtYb5irq0i/AczbdB8roCrzEtGAjkWxjdghoQY3QnHOYrqY18hutqByeDnAmO5beGZRmqucBjSnXF6d6V1thG2oybbYfXFiFSq9lV7thgL/3ToMrSzeQK8F6GwV3uKp//95dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=nrEyMyb6; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="nrEyMyb6"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-85aeb506b78so3217247b3.3
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 10:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1788282541; x=1788887341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b1WtM+yGxMA6nGtYPUfHvkwWZoT/FUK2b2ZzSHby/Yo=;
        b=nrEyMyb6yloX77BHAqQ9NIsW3Qi7cS5aNddBQPZqrXW9TCaqr9qxVP83JdONRObk9X
         Y83RoBAaegJJ3Hn3QaJEROuo5kqMdlKp99jD3IQH5Va+HCuUWwBKz4pGl0OEQhunOEqi
         Hgq5i5+7IqfWpdg8ISKaJEXM7y/jwyr7jWURem+6uAyWdJxWFTCWZriZJKPkBajPucqC
         yOuUK15dgoN+vZiMuKq7e8UDnADTcrqjPpHzjR6pZ93GBma1qGGSa0Idd5fNYPzCG0W1
         Q+1tGC9juE4Gt5A+uE+NmhxJ4GZ8/u1NTrzQ/Dwect0EiIKPEQ6T847gboHvLBHcezf9
         IkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788282541; x=1788887341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b1WtM+yGxMA6nGtYPUfHvkwWZoT/FUK2b2ZzSHby/Yo=;
        b=dsA8ipupuIT5mkwBFndoBnzSru3C49s2kyuauwKsW+FoghtY+Oibnr6nLtL7hllyBM
         T27pYeXYZiKrvgN8wzAobN90ujsGBC8leuXHlOhTrG6udDLU1oXcnZvg/Oto5yXH85o9
         DJw1iCXcAi+e/Oejd25l6aaa8+RL2pgxFEg2l1ekQ1N1jELkvxe4QnYyIITjad1h4yPU
         smeSBugB9uaIRhIG9TxwZ9h4WMa/8IBVSmh2KY2rXissGK4TCDtUfDPa1dStXYbd7JC+
         vwMN5mvGJx0QpbRMSv1GxctFQCHtMKjdwG1MAtKNLOgiaozI//YFyMpgSPLeufvjAYeh
         mlRQ==
X-Forwarded-Encrypted: i=1; AKwUvBywhqfD6oydNoKDdf1d4vWiehb137h7GKUjsiH1VgIUvZkqZRV1ArxkLVhUKNYM7bsWDFkCB6K+7wklpQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lHHW7dOulCehak1pVZjsniAYmbnFtl63fsQsUtVsRf2iOYLbfC
	RYJvhpFbBP2edUyboMCoJP1+/Oiaha6ckXj694YbuQwgtwxQlO3VmJ0OE1w8B6UuUo8g
X-Gm-Gg: AYBFou3W91WHvZkQbOY8qGJ7CYzGgts86IcI3vFEyHLlmtou6wOrSzk6CkGSNy2sxvd
	QQKzEmStho+LhGqo+mZMT04IJ7+fr7mdLz9Harec6zKf+qWTsCyiVMIprRMeq5RLeRJGR+9K4S7
	Xevss9E216cgfjDO0ujngJnzESD0b6yO/An7fLWdm9YehqnsXbbKIrSNfny9p2SZdysv2eOIJyh
	HHGNr5Y0QR9BMPM2J8QC/6ui4i315qM40ifu39VhPw8lHEoipzS0wRAxoM4LsZf6zprDRmtEwW9
	cCgUP2H4aEj72PSGS1kK/OwmNdQM70W1nyHiagQ6Shrb9EHfMKVWmCiBKoNVPtYfUOXfwN2RAQk
	tta0++aKGe7mOjeH79EaTU+6wAI/VGgTOLvRRve9yNZ9sZf+XJ2aAOPNTZPrsKUHeawdJtDzt91
	+Jh4z8ygvsfBlJiBzdstKnC1p2mLwFuMWaluL4z8S/nW7q942OcamOFzC13ZADhxl3cuqgSE4ZF
	/mhj0PkvuoJK6ol0yLDcagcztwlzfcdhcshTR+R4P1+Fsyaeub0dht6MHLzCtUbbAcLHKrFIyzM
	gA==
X-Received: by 2002:a05:690c:c3f1:b0:81e:98d3:cac7 with SMTP id 00721157ae682-8686f52fe19mr38821267b3.12.1788282539975;
        Tue, 01 Sep 2026 10:08:59 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (109.243.150.34.bc.googleusercontent.com. [34.150.243.109])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e65f146edsm79761867b3.32.2026.09.01.10.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:08:59 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: alex@shazbot.org,
	ankita@nvidia.com,
	chriscli@google.com,
	david.laight.linux@gmail.com,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	jmoroni@google.com,
	kevin.tian@intel.com,
	kpberry@google.com,
	leon@kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	nicolinc@nvidia.com,
	praan@google.com,
	sashiko-bot@kernel.org,
	stable@vger.kernel.org,
	viursachi@google.com,
	xuehaohu@google.com
Subject: [PATCH v8 0/2] dma-buf: Fix silent overflow and alignment
Date: Tue,  1 Sep 2026 17:08:47 +0000
Message-ID: <20260901170849.4052816-1-dhu@x6u.co>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Hu <xuehaohu@google.com>

This series address two related issues in scatter-gather mapping,
specifically for the MMIO based dma-buf mapping. The fixes ensure
sgt mapping is correct, and proper for large MMIO regions.

Patch 1 fixes a silent integer overflow for mapping length exceeding 4G
(Previously submitted as [PATCH v7] dma-buf: Fix silent overflow for
phys vec to sgt)
https://lore.kernel.org/all/20260609164047.486227-1-xuehaohu@google.com/

Patch 2 Splits sgl by largest page aligned chunk
(Previously submitted as [PATCH v3] dma-buf: Split sgl by largest page-aligned chunk)
https://lore.kernel.org/all/20260722233806.3922093-1-dhu@x6u.co/

Changes in v8:
 - Combined the two patches into one unified series to avoid merge
   conflicts.
 - Collected Reviewed-by tag from Leon Romanovsky for Patch 2.

David Hu (2):
  dma-buf: Fix silent overflow for phys vec to sgt
  dma-buf: Split sgl by largest page-aligned chunk

 drivers/dma-buf/dma-buf-mapping.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

-- 
2.55.0.897.gb25b4bd76c-goog

