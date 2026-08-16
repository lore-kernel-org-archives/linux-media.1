Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C402367CF
	for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 07:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786865490; cv=none; b=XcHThJIkOUh06s5qnH0H53BYHgG1CWVX3NmZ+gxyUgDJHHJ5BceHJUo/jJiYHHBEMIStDEkokYpWr+21E0Png+bfDsAs0hmecttamnth0u0ghKIWgDY9jWD4zqo0KKtc+ZuveUlWHtuprQ3QY0IT2I3+7vAZqGwqaYamHgpV+jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786865490; c=relaxed/simple;
	bh=oYThrWrlMApvNemYpDm7viSxzDtXO2t2S1TKxh6bAoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Po9tXmFi2F0WxkC5RM3UIPkKHkK3Xg6t1sLVL5Wzl3Tn95VzVIH05ok9FFaQhT4iMxi90rxZjqD5Xo5dm2S5mruvGhIWZHImdssWs83PKQCSzmOqJcuHF3jv35SK7uoIC842b5H9ng1N0KzQNcxzqL0opb/NQFOEauzXXcPe4As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8zIxOt5; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8zIxOt5"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbee846deecso2620016a12.1
        for <linux-media@vger.kernel.org>; Sun, 16 Aug 2026 00:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786865489; x=1787470289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4P3CyT2RbhzC4c3Src/O5pTXeOswME0FKR0fKXnpdGA=;
        b=Y8zIxOt5rZbiYu8kycbRSrJBmEEttYu71ctzGTngqoClXc5uPcTRjWlzDHZ3h3D5sF
         W4uHNIGKoQJrxyCW1fEyPwkZVhnemoctlZHQpacFBzHK6FfqaTWaY1gFjGPxaAMjttuV
         wyJCglL6mZUgEJJ9fQkO7RqVOIVKjJ8WJpvtYKOAkBCc4HZeVp0hPFsGQtK8k/Jk1s+J
         BuRhWUiV5ufoD3OY/ZYFoUY1ouDYUpfrpdsN8cE+LswVF9/bM0xhf0v1lbt1MpargC8h
         asZXTH3Lg6wBl50iPHJy40UB2iKZENIQLBRv0x6/OSqtrcnOyb49nopSldFUdKY5srrk
         dL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786865489; x=1787470289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4P3CyT2RbhzC4c3Src/O5pTXeOswME0FKR0fKXnpdGA=;
        b=Ixy+Mia8O+YeXlDn01WwQ1Ccy6xDQEv8DruGQUeicmtnrr0p79i7U6Pg1szDBkoEEl
         Nu5WcYJzT5GgjW7m6yDXJoW2E9MxTNhTgl74xm1tsYuonUkxK0GH0geCT0k9GUzPwdyL
         hHfbKK2SYYqHPo+EcyLHHyi74yOVwmMg2zTUvo/ztRPMuwvF/RDCkCCD959mq6XJXLK9
         7IQ3a+8FaTmkUAoQ0ZNKDaEmmKj4iBcJQ4mse5u5SFCPWTe6M21NOqOKPEEy1cyWc1zT
         09OTIILPM/aaiXiHxZlRHSC+oOKp0ADCK4FcsMy+hKDtIWQZHR/R1nhmQ164+f/RXbof
         3Hzg==
X-Forwarded-Encrypted: i=1; AHgh+RqPZAGIK7yaH3lqFRWBWIGVKPLdIK4R486C2N4WHfjqBVcvCRntzHMuk3LWSlJrYh5NoAo4QrQoFk7cXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJTW1i4+4qrXyq3JBHTUnYbAxM9FtjoFjdy6GndANYNn1fobtA
	apY4yfuH3uTFjjvyYb4LGDFmQjZSeBBDDSBvYM3pY4Av/FVjd/eN5CQ3RZJWdz93
X-Gm-Gg: AR+sD12nZPnVLKwyJp3i/fPGjO4B73g+wfcMYWt54ptn4BZeWyZDlzd6WQGnW9Lic9d
	NXESVY228b1Fzs8JqXWyxMzY3bbhORmJG5k8xqGlJb8t1avOL2ThCQ4JfX6dJScmw/anChGEp28
	s1+53BqYzel5U9v3xdE07Uz6puuwMpd1sXTe1lHU5zzsS6NWaLe0MiJhHFlcGowRiODMTrOk7fp
	Uk9IXy2SpEvNTmb8x2UCeqAaYJxyCpCR995MT6nSyvo18lcDqYWR/VjrjjxZLuhzJwVOPKjkHaV
	oTe8jVL5QEnP9zpgMtij1EYXEymOmHiXZRfeMEt7Zqocz8T9/3/VZnJNyV3AzenawgCSbq7ciN7
	cS781K1VIUsXrRjYsZH2WwMzQWIcnskD1DGLWTIfDiRiSzR1Ja3Oc55EgWOl8hI8Y1Zscp/yDJ4
	7P5bACdhH0nr+feOrxUlfCthq5RiUZNOcPzgQ+hU1A2cfB84nCvnIi6PUAczYBWAoWwpyPaGqDF
	eA854wM3xz77TxMX47ld5Zz
X-Received: by 2002:a05:6a20:b598:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cc719c7b62mr20849714637.2.1786865489020;
        Sun, 16 Aug 2026 00:31:29 -0700 (PDT)
Received: from OMEN ([103.148.21.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd9fe0sm37320355eec.1.2026.08.16.00.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 00:31:28 -0700 (PDT)
From: George Emmanuel Thomas <georgeemmanuelthomas@gmail.com>
To: mchehab@kernel.org
Cc: kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	George Emmanuel Thomas <georgeemmanuelthomas@gmail.com>
Subject: Re: [PATCH] media: ttusb-dec: validate command response length
Date: Sun, 16 Aug 2026 13:01:12 +0530
Message-ID: <20260816073112.255993-1-georgeemmanuelthomas@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260816070844.252438-1-georgeemmanuelthomas@gmail.com>
References: <20260816070844.252438-1-georgeemmanuelthomas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please disregard this patch.

Pengpeng Hou's earlier v2 addresses the same issue more comprehensively,
including request-side validation:

  [PATCH v2] media: ttusb-dec: validate command request and response lengths

I have tested Pengpeng's v2 with the malformed USB response that
triggered the KASAN slab-out-of-bounds and sent a Tested-by for that
patch.

Thanks,
George
