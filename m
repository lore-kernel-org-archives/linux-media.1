Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C693F46D08D
	for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925588; cv=none; b=CYwwughPYuceI1I1KTTPtOue/VQDf3fFzoLkuZ/cXG9dMfxDQK2OjWC1u3lk0kluJwwh4fJKE8VVUSeQtZjCxL4WUp0Ggi5+kWGeeeRMeoA1UCqsceEcLLt6h8q8Ig42ELgBbCf7O+O3mWaiBPC5nMLZIn9zV+BHTaElHM3IVWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925588; c=relaxed/simple;
	bh=y6KuGFmXIEB/zhRMWuseJanpRZIxUWUxZTjuXV40lYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQYkPkUoEtcO+5UGc6K7iTH9FucWcmWrl2i2l/N56MfKCYUGNVDjUDedGXyX8EhWjzE1lUStoveNII+oH993am01hH+jKCNiWs6xWj3mlHUnTj5IA4mxRVauHDPh5tkmC9LhOzf7V54KV6ZZQwtiAkWE9R+TyKIrCLRqgXiGNAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rRZHBrqy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rRZHBrqy"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482e067e908so626066f8f.2
        for <linux-media@vger.kernel.org>; Fri, 28 Aug 2026 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787925585; x=1788530385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqZUeZ9L8VF1vTIFkMSmSiqi6T/ciO8jy2NnvOaW+Gs=;
        b=rRZHBrqy06/FSihAk8fQW+ZuR6N/kVB7UlDLwIOUQmZeN3vo2zI0TQQ1Sho4WZBXDk
         MlOLzOmsFlm+abqx6R7cdkbM/CwFQ7fHggQ2JlJeXoS9EHjYPkE6G29vwweatIssaJrV
         4HNneAY0C8v7+/7EMRAJl6kqEyZvA4zzhZY97XS1xHdV5+wPZ8nEl/OoLSAeV+rWqlVg
         AoGAGJv3lcBXU/mfZW+fmtx8M6MyVAUsfQNTSdRCn4SvfoYxCM5NX1Krz1tFE1qAt+XA
         sEpvjEJAQ5L+c8xazXUEr1IQ9pFXnJhKGsUyuBTUuTmz5faTAeynvTn2RhDo7edVIoaB
         sLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925585; x=1788530385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NqZUeZ9L8VF1vTIFkMSmSiqi6T/ciO8jy2NnvOaW+Gs=;
        b=ewpgj1JL8FVpWZe9rOo4jiJG56SS+g1vSAmpzLQrU/qw1eRinacQvXJSO4VDfT00QA
         iuqoW+lGE1fQK3tM8uCiKu6dDn5N6csMXdgamzwmuznCPUsU3QttoJ0DriiwPPQaLWaU
         pGSuVUhHtGuOSjcP1orktbyQk2Yicp/TZbxo03f4c5zrjIjdqps+vV7StNz55awhDekW
         fQRtR5vUB6wWAK35z9Cf7ve5T/YXL05DR90w7ygQ6t3kIxJWe1j/kvA/3eGhU3UCaqhv
         47EiIJ7oSZmo5qkawwv15metJAaSlJTyQfIkXScwO3tuDaH8HVCYEQxouxjnL3TXPNJr
         ykKw==
X-Gm-Message-State: AFuF++lBqfER4gyOp+M1JRMi9KADFOCe5iH0sU5mGr/jbafvIjxK6f9K
	QY+MvSGwhZiYWrV8cL3tGAfVQWaihDTylX0sqhzFr5PLXXOGo1vNZsflbXWkkguTwKc=
X-Gm-Gg: AR+sD10XYJYghcT2TraEf6pyirOd2itGhVbKrRjNBKVfD4XFXDHatW9uL0/3sXXbggy
	7bx+UckplCCMPNet7yGmzTkat3nJmSge8OMo5E/W86V4nzboZoX9j10aVe21Zwo0F72ZeM678fs
	XZrmGxZjd+ml1wqRn2oaNMcJZTIwkmdF9trhRX3C9lc+NqH168KnSBXAaM6NgbR1LkOML0YOOcT
	iTC6ax2jG+ZBGHAO9coQJE8mbQ1tohUTnLNNuHZjlG3xpq5gVsPilYxerRo9koFJrvJIEQB/DLW
	ScpBAroZrPgP5esNKgLsltnANI5pcSAvll1n+1urRs+zdd4JdsbTmjB62924JWTW9Mgr6R3PEd1
	0XFYHjfg5LaN2gfGV1u7yFXH0oQ4prvlSucbTq2I+x1MmXS5lKk5VO5NGEY0VdubzzwRJMLmbEz
	LX8wCJbWF4X7ldMFIppVRQy4uJDtYErwGjGMeCAGXumZ68rzglP04iVRX/RA2QcyjqyCCxwfUi5
	Skys4lBkzkhgA/tLMuBYzm0O+idssd09eUaJQ/yshLckOAdDldM+ObNjM2ZVvI8riaZdUYPo9Rt
	GNqUmR2FlO7iLlc=
X-Received: by 2002:a05:6000:2388:b0:47f:9283:1fb3 with SMTP id ffacd0b85a97d-482f7828315mr10404375f8f.0.1787925584957;
        Fri, 28 Aug 2026 06:59:44 -0700 (PDT)
Received: from robert-83cx (static-dsl-191.87-197-115.telecom.sk. [87.197.115.191])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbad08d2sm5220828f8f.16.2026.08.28.06.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 06:59:44 -0700 (PDT)
From: Robert Bozik <robertbozik@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	media-ci@linuxtv.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 2/3] media: i2c: Add driver for OmniVision OV32C4
Date: Fri, 28 Aug 2026 15:59:41 +0200
Message-ID: <20260828135941.23605-1-robertbozik@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828133537.C61EC1F00A3A@smtp.kernel.org>
References: <20260828132104.21473-1-robertbozik@gmail.com> <20260828132104.21473-3-robertbozik@gmail.com> <20260828133537.C61EC1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Aug 28, 2026, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Potential NULL pointer dereference in ov32c4_set_format() when
> sd_state is NULL.

I checked this and I do not believe it is a defect here, so I have not
changed the code. Please tell me if you disagree.

The mechanism is described accurately as far as it goes: check_state()
only rejects a NULL state for V4L2_SUBDEV_FORMAT_TRY, so an ACTIVE call
passes the guard, and __v4l2_subdev_state_get_format() does return NULL
for a NULL state.

But that function opens with

	if (WARN_ON_ONCE(!state))
		return NULL;

so a NULL state there is treated as a bug to be reported, not as an
input to be handled. And 37 drivers under drivers/media/i2c/ assign
through it exactly the way this one does, none of them checking the
result; the line here is identical to ov02c10.c:712, which is the
driver this one was modelled on.

So if that path is reachable, it is a core problem affecting all of
them and the fix belongs in the core rather than in a new sensor
driver - adding a check only here would make this the one driver in
the subsystem that does it. I am happy to add it if you would prefer.

Thanks,
Robert
