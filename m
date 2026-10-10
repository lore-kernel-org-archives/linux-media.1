Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FF0364949
	for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791618961; cv=none; b=ftlPflfYtQuiYXZwuBhL4A3eWFmBGVXX4HRKHZTq+ekoVcOqo9WhJap6vztfE9j+KVszKe2uz+yTyPLA8gyVQG3qfgJ7nOzJGkySqtn+/VXrffIA7mFgZO6p9QmQfYr6o7mhWQL5qIbr15JarF6upuwcDDs8qWoOu7sNs4rgW98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791618961; c=relaxed/simple;
	bh=Cafm1R3+L2oUTrGOudgtt9cCYD/nT/nJTwjhiLYVvUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JryEXHNHPd+fQDEVuEL6UMb5YAwisictu7T5dmSwtIpAs/5dh0l6BBsJCHHWXkOw8qVcJ2dlKnQqTdJz54/xCziiAHdUwwxOEufk3nTXyI5R5qj3EOMl1TlVBXfb3fuLNNxRjdLM23nEEjJ2OOeeSlBIDJoWjA6ETofkfoBZN2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nI8HnDbj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nI8HnDbj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a168355946so452295e9.0
        for <linux-media@vger.kernel.org>; Sat, 10 Oct 2026 00:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791618956; x=1792223756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cafm1R3+L2oUTrGOudgtt9cCYD/nT/nJTwjhiLYVvUc=;
        b=nI8HnDbjXlXdKPTrYt5khjXRtFYSuj5TWMI9CIkHUt6XIkrwNsWVamA1z4BoIJmYCC
         zdd1zhA8Ka/pT+Gx4/9F2ve+kYPlMU0q34oHuohP9mGLgHLgNfeMl4iU+hqiTWIsvjwt
         4YnIS6IGDvKq8Z+CNPXRqkMGHARFq+PFJnPORvPvhwxSmhjAfiKqFu26jv75MviRAmAf
         xDaHQKALT2PhUwN1SX6wmbCBSTqADTIHOT6oy23fLPoAXTODBsoJUpI1FAtnqmR8nesX
         d/gLVTh1WkOuOM2lYIHpDoRuIlALg47QI2ZAJH+hZkDj24iHImbjExQNbEyIJuR/IKUV
         j6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791618956; x=1792223756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cafm1R3+L2oUTrGOudgtt9cCYD/nT/nJTwjhiLYVvUc=;
        b=Zu4SOAfqujz5LPDkY5YUYriOsAsDh/H5WUy4vasuxKk9S7DywmgLZrbTWreM+6TKGE
         UE2432F38nP4aU1GbCgfUkZxfor3oJU80cQfen9wcEna1nGY+nrGF6APiFy8sigChUZz
         92EKxOZULGfhgD3V5bGrDFwLkuJRj28oZUg8o20WC4HbexNwTJMW6BETkZ+XhxFJLzqw
         yXzPNCITlL0I+PdufdkJtjTq+IUMiXOoWnG2ZP6VPihv+8SjmgC5y1oaTYut7EW7nrkU
         5O324Zt/vGo5fF8RiYQVAN9YG/xm2ZM8EZhiVJzPtzJcAcXh3VxW0KzIcjbiase8l11D
         Liig==
X-Forwarded-Encrypted: i=1; AKwUvBzF63J0K4JvEtzC+j3/b6AE7BXaFjZUl7LYidwHuSk+JgByVu1m7x6jiaxfoK9nTJhcV+KklJbZ7hJlNQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKuDU8uxLfQBcbiBhXAk/0Lw/xY+eB96ch6hD/Xy84ohADDkXE9
	5ikUxPjToymw7Q20JuEEjt8wVEcaVuQrmyqofRymL1EM58XuIahRkPCs
X-Gm-Gg: AYBFou2UM8V54HPS+pcBxYWfUR7AcRyRgOQhF/RvJkKAI2MkuoNoplIzl8yQcS6QLAx
	ZF5CkMBdciVyoWkstODrSRvJpIL0Ej4iLT7LqUZ76yPW9UZL52V4F1gG8eD3zVtJt9uz74pifUs
	h9529hqT1OTO+QzY8IX68hDHeuD0KQZA1DRqHMltGBbN7fYYXY6V0ibjbEjhZSPu9K6I8bpa9ID
	6i/pWF1IHZSyFu8qV0OrowqMEJSWpdwIWQ37JOOWSqsZW0tNxNQq13XH0rDI7X3hFSzb4x8SMGq
	jeM7C9x/uyPcpuKJrguIim/dnb2INTKr0YkcLpkbARf8jo9GqmOB/FoSFSAR9bDUgayo0kE4TAV
	+KYGbw/sqX+ccbHQ+yU/w0qxQ2PGCdoPKyPbMN/IIdtfAGsasRp5VkNjkgJVyeN7QCv+e1g9Bqh
	iBUL2+8zbrZ6nN0/jav/RSVUm0s68HoTw2yV6Pk1LUCgQKaARaOrpzFfl3rK9QSfmIyudO7c8fA
	tbDlgmUf4WnjYEzKPi3v9joHJdYciYs0MN9E4YiNvLspwY=
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a18e4f56bcmr86747895e9.33.1791618956290;
        Sat, 10 Oct 2026 00:55:56 -0700 (PDT)
Received: from Cachy-OS (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e48db03sm159234285e9.3.2026.10.10.00.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 00:55:56 -0700 (PDT)
From: German Pablo Lindo <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: antti.laakso@linux.intel.com,
	bingbu.cao@amd.com,
	germanpapulindez@gmail.com,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test for [PATCH] media: staging/ipu7: snoop ISYS writes to capture buffers
Date: Sat, 10 Oct 2026 09:55:07 +0200
Message-ID: <20261010075507.19629-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007183311.24637-1-lsa.uz@pm.me>
References: <20261007183311.24637-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As Sergey Lebedev, i experienced the same error in the same hardware regarding the IR camera, for some reason, the image displayed had horizontal lines from the previous frame, ruining the image

I have tested this patch and i havent seen the error again in qcam, i have also tested the patch on howdy (wich after the needed configuration and tweaking, now seems more precise or at least more responsive in detecting the user even in positions different from the original one configured) and if it had affected the other IPU7 cameras of the device (The other two cameras stayed as previous versions without the patch)

Reported-by: German Pablo Lindo <germanpapulindez@gmail.com>
Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>

