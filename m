Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1BD426435
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380004; cv=none; b=mZb25OjsuvvwYuJ8WXr9RLQ0B7zUMhyy23xsuFMQSp0NwCE9XDQz98phBUVFdsqHV5qERb0fSwM5vt3kgc+i1dcQ+a7d2Z8x9hApV1Jbr3wZjX6w3d9EzJMAVMk8IyqiEJP/MHsmF7f1VBKTZfAzrqiBM/752+wYxoQmzZ6v80M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380004; c=relaxed/simple;
	bh=nY+8DjuSFuBpxoEHzHL2AZ4ftLmPBNY9AbWt/IizrHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaqGwjYGAubT7vhfJbpYuaBIrAFVR1NZ7G7Y4Azs60ljr6IkJHZDxsCEjjrSBcQighymBJ2W4KDmNgedvnoP1HRzHEvkU/HRwA5zN6G/I7wKeQEB5rcuekmrllaGxDL4wH/4BpspPg2R7aawZqxyAV+WEzOg9zWZaCRUq0qD2r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=VkdAd4fa; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VkdAd4fa"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so7117675e9.1
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1789380001; x=1789984801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7QNpdgjusqgoiOYsJVTbvzfzST6HhgyXQdP08BJSIM=;
        b=VkdAd4fa8J8PZ+d0l2YjqnzZg7cvCpWKZMQOmaOWFZosZxzYHY+l4YM3hlwQzrGvbF
         7Cp9Fb/1SLgVdrdJbs2PVUXy3MKM5uNij6oEj/iKfu0AGkJdEvcQkc/AUJD3dDbrYDnZ
         FCYx9XgKatm7oIj49GGjUHnBnYz2iiEybxxVLPaVNvWRk6CAlejiCJj71MZg5dr7F/TM
         Vesw4pSjOXOg8C96cLiUAeEqvSzOIDdHXuy2yYOQRcFxEUvpeyZPliTZ9ZLncNLfzczD
         NMC5SL0Bxu1kzv385oNPQ7d4X0Q4JbX7otGtdkKv+g7lOYb1NUE3v3wrNCHpu/XLltaY
         fkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380001; x=1789984801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m7QNpdgjusqgoiOYsJVTbvzfzST6HhgyXQdP08BJSIM=;
        b=iKPVKuLkG6UQAdc7JR4o29kxSTRRkgiAEQOJki3u18tG/xMMXSoSy3LHVGuf/oOg/J
         FT3D6qZivJFtiR1r0X3H+xnSzyPEW23ecMHH/vYRfpmS9/CrQU2ROWCfjV5Bxgzlo4aQ
         NDXNmyHVbAj7a59qA/lNBaA01i1bN8s8OkxEURWD1TM5LHDDOs1hKQX829VXHlYCBdS1
         8rY/pGVjNC1Ux8GuXZBdUnDkzrYZLg4V88y4w/HtQJj+WkS+A0+afVD8uHOKWWpm96BB
         hZtMrN3exD1nKyBuNHReSgq/tNl2LUe4DuNH2xbuwHh9fCBBmikwZgEd9gAOWuzKzP0R
         aVqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL3EBCi/qK9kKSpgudZvgNe21wh/lp5jemYGFKcqihhGYX0bBw5bOBVBgPEQyeXxCXL46XHGT/tHIy4A==@vger.kernel.org
X-Gm-Message-State: AFuF++lEx5ARit2VSglnfqk0wT/RTUreWFPkBmj51T1d+Y3rghaTaU5l
	Dml6+7ykaaBYsv/+DHID+HDi1/hrhh5JxyvgGbjWDzkKvQZ8CSYd5wT3
X-Gm-Gg: AYBFou1fqBxmg0iilkKjByTuKCL6/kWz6+tEjnq9NS0T9hT6iuraJ0KzOCqldB5ZoDa
	EZXM69SUG6+pVASB/6xDfrbwml0E0LAbAp5Qs8Xo7IhUbr0c/D0SbC89evbDkX/TgW2NSQltfZw
	5sKW7v/aU05MHe+MEx4GGu3Ju4/bGRrHBdPxk2zVp3qOuT0tbTh6U18kOUGdL81784nClSQJpg6
	05HaQZuMlhiEIXyZeeykgAm+BBOdJtVqbxlPDm3a/Y2Rby/bcCPV5UiyFkKJcpAxEJMYdCnYamd
	HgKxZE1/yA7NZUizFrjGwPio7IQhoObqEyBk/jybxEOVZuUkmrlYkJYJlCfMr2O1VEXEIrGOKLC
	ZJrtOlhh15qvQ9rytyCQhSBsi1WLAfNmt+4uxFx1FfvR4yn6HpSE3d0To8VOz9zXu8Lo5i9GVEP
	JUIlCA6APG6LRwsGiK0yRVTtnaydqy2x9IohWZ4RsZILM/eu+tZBUQffUR1+ZZLzZ5lvBsNGeBA
	S+QxeBCIVHlRJ8fUAH8Onbl0Z8pLNTdK/MIohXjxZxG57QUQMWc53dqWsochnXWUQpU/SCiwJ0=
X-Received: by 2002:a05:600c:8b2f:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49e7a657446mr17851315e9.5.1789379999209;
        Mon, 14 Sep 2026 02:59:59 -0700 (PDT)
Received: from omarchy.lan (p200300dec74de0474f67e4b61f2de2c6.dip0.t-ipconnect.de. [2003:de:c74d:e047:4f67:e4b6:1f2d:e2c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm439935465e9.1.2026.09.14.02.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:59:58 -0700 (PDT)
From: Manuel Knitza <manuel.knitza@googlemail.com>
To: junjie.cao@intel.com,
	miguel.vadillo@intel.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	regressions@leemhuis.info,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	Manuel Knitza <manuel.knitza@googlemail.com>
Subject: Re: [PATCH] media: i2c: cvs: Do not hide the option in the ancillary menu
Date: Mon, 14 Sep 2026 11:59:57 +0200
Message-ID: <20260914095957.217739-1-manuel.knitza@googlemail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913125345.588586-1-junjie.cao@intel.com>
References: <20260913125345.588586-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested-by: Manuel Knitza <manuel.knitza@googlemail.com>

Confirmed on linux-ptl, as you asked. Config-only test, same scope as
yours - not booted with a kernel built this way.

Starting config: linux-ptl 7.2.3-arch1-1, the Panther Lake kernel Omarchy
ships, taken from /lib/modules/.../build/.config. It has
CONFIG_MEDIA_HIDE_ANCILLARY_SUBDRV=y, no CONFIG_EXPERT, and no
VIDEO_INTEL_CVS line at all.

Run on a vanilla v7.2.4 tree. linux-ptl does not touch the files involved:
drivers/media/{i2c,pci/intel,pci/intel/ipu6}/Kconfig,
drivers/staging/media/ipu7/Kconfig and drivers/media/i2c/cvs/Kconfig are
byte-identical to vanilla, as is every other Kconfig under drivers/media.

  before: make olddefconfig -> no VIDEO_INTEL_CVS line
  after:  make olddefconfig -> CONFIG_VIDEO_INTEL_CVS=m

Diffing the two generated configs shows exactly one changed line, the
added CONFIG_VIDEO_INTEL_CVS=m. Nothing else moves.

Worth noting for the stable case you mention: this is a distro kernel that
already carries IPU_BRIDGE=m and VIDEO_INTEL_IPU7=m, so it is precisely
the configuration whose bridge routes to a driver it cannot currently
build.

Assisted-by: Claude Code:claude-opus-5
