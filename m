Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432C347C11A
	for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040975; cv=none; b=F8Ots0F3y6wl3fZtvii6HAkBzAFV8YCbL4LR0l6yxqQe75C7MFm43n4ICL7BUVo3hqKkRsW2OsTCOxU/pGIbAYZrP5o6jspV2XrRCK5sV4ynin3AXFmHPjtHkBdtATXoMabBi0pfH9RjpsnE1jRhy9alRI5nUKZ75jJZS0Yrhus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040975; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eJ96MVvT/P7KivyKlVbNfLTzjZxAAxFJ2Fz5+9Nf5v3SgTKyZnh9ZfvODOw2dBume22ZK/mTVXrwB/02Vq81JNwyc++BSkL9yiOmmIjlzakuDQtQDNNR3htC81iBwU92YJjegUgVSH5oCQBHSt3lA6PWhes2XBKZeETmQp7tz0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMpqcJka; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMpqcJka"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso66771315e9.1
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2026 04:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040971; x=1789645771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=TMpqcJka2KQuxG0qAKpWZfFv6ebd8fY5pG3h1BfeZxsqpWA09BOTuZ9QqLWHJtB9ar
         Ofig8B2TD+K261SrOlYCOxrvNakZ/CAdtHnvDxasg5dLDK8SpbW14k5zLNvBg2VnG2aE
         on/ChJwLTJWY6b2vQTV6Dcovrs12jQrvpING+6JJui29QgRVLsLxxzoqtDCwDEHhlifo
         Q1MEIj5BEi2U4rD2jm6THKkk/J/1I2ATerBYPi32GcenhymmCXp3ufjCdRiENxsU7eP0
         ELaqtaIOV55+s07GeHRMxvHTBmFAQHqXXsDsgZG53ZoF/p/mTycqhGsdC8DvIF3Et0Iv
         X4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040971; x=1789645771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=dKMhs4Y86CViZIGmgRePgkc1yf8iPuq9stMtGeEmrZ9jbFtRqQCEopIYbgivzyZTPU
         CE53CvZu55RnlGz/csEpdF/UvYsa0qpGQaDnV2EJu7QDqgQ8Gm1Bc5pgQruzaWGAupJZ
         z7Zsr9sYMcNkqYdbndrddnIvTuk0CHevFuO7r6MyneESy6iUuvcFbBuRMkUV9VI2Ccda
         lXPG3OPYcblRZIutu1Z2rj84XccRb7wkaLQT+60dbKHQel+KOCv62gdTX6Q4Qnn7sWxc
         Q8jV7njpJjrIBbcs5KBT/g8Q7ld5xDURDZDgZ8PnxK+CxsGSeX8Sw95sRwIOT5UG8vjK
         uNhw==
X-Forwarded-Encrypted: i=1; AKwUvBwUuSugsWV9mnKrwU8pBV6XxghCBXK3WFxCbfstGuGrtv3Qtrtop0lTVVXPZzooIbLZd3Wk4UB74kanRg==@vger.kernel.org
X-Gm-Message-State: AFuF++lDlOzyiWkbZg3nvvLimrHRhVywSDq188HwmQKx8APsBCE7uJQD
	PwF7ndgQKP9D8xOWqc5x2xTICPReUC0dUuisvYjCwt062cwARIkkitLX
X-Gm-Gg: AYBFou3ZRqfX8l8X8JBDalYJIpksYq4CoaLAbH8yXpl7rvUhRgLVyeyCbRxpvToHpnP
	zgACBnP3Kdeu6T9um60qUjeVRqMeAynAnzCkGwx22dVMMNs+6ZXegrmL96529wPqybN6lRb38i4
	zQVxr54fHpwFoQ5h923MfJ2x3IiyMpCB2qzRGtkhFT8RcK7LG3e1V8G32UP4iaulo3P5iJFdbFY
	EwsOlha3P1LLVqml88SQim+o92PS6QHFA+HhPHKFAehXIyHa8gvG9jKuD0GpRGBlgX38Y7oVWgn
	ucYFiRzd4qNmYaJLWfwBasZ+8pVOewMdL7aujL588lWsPRNQcW2TkHKAM56HW9Yj2Leu4Rsz8Do
	bT6G/Dg5/PV0i1W0SM/r/5sHENnfF6s1miUMwqI2S8kzkgtrX140fllgQL8IQ+0JzDEbPRcnLZE
	tifSEN9+HwoT0MyvS9ZWXfpe2tcHZnl0Mt2nxm5D1gLhwk2gfoDiD/ZRuW6DHD4Uq5yXFss3/eg
	Ibv0SMrZrfxutTMtceQCw8Bd+nscbKxusDbG5RN1Sdz7oCcm2SIBA==
X-Received: by 2002:a05:600c:8b05:b0:49c:edd2:855 with SMTP id 5b1f17b1804b1-49cf823c411mr438196315e9.6.1789040971053;
        Thu, 10 Sep 2026 04:49:31 -0700 (PDT)
Received: from cachyos-x8664 (159.red-83-38-226.dynamicip.rima-tde.net. [83.38.226.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb058c8sm62353075e9.0.2026.09.10.04.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:49:30 -0700 (PDT)
From: German <germanpapulindez@gmail.com>
To: lsa.uz@pm.me
Cc: andre.gilerson@gmail.com,
	conor+dt@kernel.org,
	dan.scally@ideasonboard.com,
	devicetree@vger.kernel.org,
	germanpapulindez@gmail.com,
	hansg@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	robh@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Test on another machine and userspace for [PATCH v3 0/3] media: Add support for the Sony IMX681 Thanks for clarifying the origin of the errors I am more than happy to provide the tag Tested-by: German <germanpapulindez@gmail.com>
Date: Thu, 10 Sep 2026 13:48:33 +0200
Message-ID: <20260910114833.4801-1-germanpapulindez@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910112210.44432-1-lsa.uz@pm.me>
References: <20260910112210.44432-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

