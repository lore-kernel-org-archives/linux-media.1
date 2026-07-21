Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC303B8412
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 21:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784670176; cv=none; b=XKEVL/eNUdYxS/L8nn49Iw8SsJRn+mJ2L33pjBhsWInQqzogYO2kGZARhC6DlbzLJYQfKj5BiecWcTwpI9MoyShGvoewNw9gYuZfheDnlm5mOVMjKwRmNt8gDLtgsDc7rQgapnXp6zlXwzUaduiv76XS6m8Fq54WfHxwD5tQZ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784670176; c=relaxed/simple;
	bh=nSby10eixiNXpEVM4IRFe/OWoXHBpKDZpWGj3xtjijw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y+i7xn+UksUbBmLqMbjL+HW1apU+yqnuhpxXBx+6tgdVo7mggPzfvz/V6Ae/NRqDP1bqtD0CPjtKbi5x36dmyMeyWBnGZZlwDR7eLQ0s2CsHrFJheLs0UvS2pY4o1teBMQyl7VQCOI1CXIrDbK88xIDkH0RTBNlvRUcH7gB8PEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NH/xengl; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH/xengl"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so9705755e87.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784670172; x=1785274972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cYs1gyhVAxRTo9qDMZGfTtIgo7wOc8NJz2ZLJ7Uus+g=;
        b=NH/xenglL0yKVjiLDfeD+FLHB84ozdgMDLJ8d6riuzJb+tKNcybRln2YLG8XF0IWaG
         VGGsc0wUHhNAdMPlE+DPHMIpmX1tRN6b/YDvw0ZFvjM8p7UQBbv6IGZCWaE0oiW10fbh
         gUmc7FogW5tszIJgWhiB9o3YizxmRwfQJv7+v+6V9x73S8o71LJyzpiy4KjbngXhWZvo
         L7adH0UfxNxQpprYM+LtiYmr8bPdhzYj0Ee06QGTmlqAY7ZDKvYPWIK9EN2E/8vA2QXL
         hIGhLP8128sSo2g9qWgG5APeCsFFK+BvF1wrgqaIMHGARZuuYjRJ/IjnfJvZzlNBaG58
         i8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670172; x=1785274972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cYs1gyhVAxRTo9qDMZGfTtIgo7wOc8NJz2ZLJ7Uus+g=;
        b=WT9WI0q75g025un/zPjObsGXFKk3V/3K9cnm8bzsYMQ4qt3L+kgi/V3Fy79JyQ/j8f
         vQ6PEBrC+KIR1mBlhse8f90YwtNNeNo8kicFQuop46K9+Xvg4eQcPXwFVea+mLcYGmR/
         o5onNwikeCgGGQbOS6yUEifST8IIHBFfDYCDHd+OAIRk+eBUp+yqSG6uNJXn1SSf4Kmh
         as3c3dNioEMTFRfxVTuxWl9TKpjHy6mK7ASevXlRSP3MF0paWoiCHyN76n2R3K/MTtnb
         R+/8pbjlzXjZw0Rpst8TdKP2ODHWv/rd1ZO0cAck+K/mnkiwR3kHJCx2zoVCEPuj7jYW
         Oh9g==
X-Gm-Message-State: AOJu0YybJI05l7OxNoT2d4TvtjU5VBMBo+1JquW6yE1vZhF7iGOzwBqP
	BCC+WsCBGFJfYdM0pO8TXJmXWvTcmHkl1RN7ZRpgoGZ62CquejpBxEfB
X-Gm-Gg: AR+sD13Hv97Px2QHavoVE0ps7q1Gyk6jEFxhzHrlp852E5reoOfXEbt6ZuMK2/qA/Pq
	T9Pnp2HqpsmdXLn1YiOHEQdtNAeZXu0ZT9gzocBvzkRLfmQj1B2pjYw4QzUCdgmY4V6xEyh87Wb
	gZbUQY8nKcmJ9Ms52rmH3Tph9aMrD8Khrm4DaLjkQPbO6M8aYKW5yFiuS2GJLFz3hqaB6omRD3D
	u/noCAuA4mffLlF1ykyfkRm6Kt/ClbvIburhi387maJhSypjVqlC4JNjt49qhPxVEUB9b+lBTTZ
	N14/P03wKcbpHLXR87F5eWoJC6X/0HAzrcAEe+mEVmC0/GAMBTG3gzoOaJ3ohJW6YDvICvhOeKN
	5VvA0Ebd/zDAsguSWZyXx4qGI3xkd6oT5mrrFnEknfrlMnAIlO2X8puJesr1IewkQhsOOavijK1
	M=
X-Received: by 2002:a05:6512:2315:b0:5b2:9dcc:8e26 with SMTP id 2adb3069b0e04-5b29dcc8f34mr2348492e87.60.1784670172296;
        Tue, 21 Jul 2026 14:42:52 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9bada25sm131509e87.30.2026.07.21.14.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:42:52 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/2] staging: media: atomisp: remove unused functions
Date: Wed, 22 Jul 2026 00:42:31 +0300
Message-ID: <20260721214238.840406-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes functions in pci/hmm/ that are declared and defined
but never called.

Nikolay Kulikov (2):
  staging: media: atomisp: remove unused functions from hmm.c
  staging: media: atomisp: remove unused functions from hmm_bo.c

 .../staging/media/atomisp/include/hmm/hmm.h   | 16 ---
 .../media/atomisp/include/hmm/hmm_bo.h        | 19 ----
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 41 --------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 97 -------------------
 4 files changed, 173 deletions(-)


base-commit: cb08dcd0a896c3ac8073a57296f2377b106c35b4
-- 
2.55.0

