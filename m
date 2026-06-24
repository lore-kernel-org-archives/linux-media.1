Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65633388E7A
	for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782287302; cv=none; b=MCf8dwE4qU9XDBlUW6Brh8lPWsRBfS5wpBzZheFgKFzYhv3hU9y+vSHNponxwcCrpvOnSOmkCXNdtZI3q/4Me4KGCVSBOQOIT5aPfctxgmHfdPmRCIU2o5gkuNuvplH03+iIWoz7P6s70IBsuosLOxc2JeCoM4GMOJ+/mxNHwsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782287302; c=relaxed/simple;
	bh=VuSzdW2MJov1ocYqkr6jypibzL/jxZdpgTXoZ4Ka2DA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oxxGVkQF1pY40lMJKdMuYXNFb5BZkW5RiqLBQ/LO7mfpcruAGn/pgA/e1XAYX8nFVu6Ox/8vq72Ovkhlk3XIAxokeM3K1Ms4U2Xo3y+vE4GipdySoj44wJF+fybWJJe4SmTBSA8f0g7N+aza3dt1uzoW88HxoW11GMzSwxsCbzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=En5hZ41Z; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="En5hZ41Z"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso16892475e9.0
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2026 00:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782287300; x=1782892100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VuSzdW2MJov1ocYqkr6jypibzL/jxZdpgTXoZ4Ka2DA=;
        b=En5hZ41ZGhItN1TuR67OKNhE0HnhU1A2Yah9Vl6WqtgpaJyNJ1KdqKZqjWQy2F8Wal
         3Lsk6yGDqzLuBIwuFiUqivQPA1RkuVVyxMJqaQNZcXbjhSYttijlzQZibXc1ik2VmN5u
         ytnl5Ffvy7OffEB7QwdrI8pK9wsyAgyIlZwt5LGEKQ+lNUmUr7NGPKnPLnTMf559V18z
         Uy76MUH7DIenKK+fyz6RfanENCj3kls9lO309U2Z7nSWC5pE17jm4U4BW7wX1qx7oyRR
         XT1/G3saKkmPwR0Q6Q6C+kifYcKmBz+eo5q7AjYGXlCOZZkRB45GVxFKqgNrWa5MYNSx
         QKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782287300; x=1782892100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VuSzdW2MJov1ocYqkr6jypibzL/jxZdpgTXoZ4Ka2DA=;
        b=H6L6DGTkrd2gV89gxaopWVjg664+Xetu393OHATRXoHU3KtyYqWEfSdSfbfQLTQAeP
         oTONGPsovUKwVXbE5FwDrsnMlQsFgeUcCbEoY79VHI5UoT1mnCeqzRyfKVL7Hr3iNGxo
         waTRzkL4W2IWwoGX1EtIBzawtT5q7H7FDKISXWyZiu0S4W74ynX0urxB5Qr7tc5vk2Aj
         exKwypkQ38cM12bzkuVEJDJ7HDawd8uvDHkt5rMnqFGgKlKhZlBbS4G9cAjAD39JJJHk
         3JbHnt7bL/CU6gqdUcbGgyXGH1Y5xgE6x3Gp3GfhEMPgUKZwe31kSkD10RQHOGu5/bRO
         QsoA==
X-Forwarded-Encrypted: i=1; AHgh+Rqwri25uTaric5Qao2Up6Fuq2e2KeU2KYV5DPHin0l2tecpHolQnt67XPqSxIWrjx08edioj9o2E3tkdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzfWqoBiaSIavFh7Rw2lqADrDvAjM8faqnw0oZK569wYQJBBsJ
	qT/y8r1HYadVrgswxsEtdn0VcUkJ8IOYXVFJHnaZoHCU2xVdMl+iiojckw97VAqXD5h3
X-Gm-Gg: AfdE7cl1r9EgWudehPBnG/dZrJloSxbdZCY+VbbIZUvgf92e031fk2g/0FuU4FvBLBE
	NLEaCI1ihkLJ6MioLnGSx0vkX55mtON1FTnlh//WfL1+pM+QtoScOuO9/BUtNJAcjBXEJTU1OKL
	UzTI7llABYf5U2hnVM/UqHoV8Vhzukx9n02HKmiURodefLAInEOxkolw1adEWk52A5lgZCebj9c
	oJWwMPPtOh/OEhmjcMDF6AaYFKq60wW/mfdGhz3Cb83KDKnG+OtVx/cUV7t8p2xZ7MQFDm74Big
	uFlpSGpq9ecDjCFnBUvfj8AmpazWPsoxbco/yLGCFXljJY4j27iCxoTWHs/yjt2wmg8xT2Ks1sC
	AnF4O35bJarqEXnRa7RRBnfJHQVCv3UVajr87LrNxh+ECYMFh5/CLh+KWEnaJCAPRNFwL2KKra4
	03qFFzdsLupxoC1HFuK3qqEk39ZKqI8nsmmcej4QAIs630WvxdP3c1zQITd5FEf0P0ci7Mu4KQi
	3M8g/jeeckuVcAeTQTYpG8tZj4CZ+qyOpM=
X-Received: by 2002:a05:6000:46cf:b0:461:a15f:7aa5 with SMTP id ffacd0b85a97d-46a806bd4e0mr6838960f8f.21.1782287299681;
        Wed, 24 Jun 2026 00:48:19 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c6csm4737620f8f.14.2026.06.24.00.48.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 24 Jun 2026 00:48:19 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: linux.amoon@gmail.com,
	neil.armstrong@linaro.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Wed, 24 Jun 2026 09:48:17 +0200
Message-ID: <20260624074817.27801-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Anand,

Sounds great -- please carry it in your series. Glad it helps, and happy
to review when you post it.

Cheers,
Doruk
