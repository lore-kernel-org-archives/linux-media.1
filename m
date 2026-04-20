Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E73859C1
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776670972; cv=none; b=TZ3NaV9hgLeleRy2t2o4gtgkJf1d3IoLRLByFk+6ZJNgXgMr07RoKiRBbIWXQkEhQmyJ/duTXxLjXsiAEN3IvEmRt6YggunreFLBOpQ5W5rgPqeazkAdbg6tk3IJ/nIZGa6ty70GZapuTcx38wao6lH/lpeYDFqdVdCNa6ujp48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776670972; c=relaxed/simple;
	bh=V8o6tIOPJB70Q+H7F0EhswID0SRlwm59Gc3fNDk0zuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXbBz7A1Qhu6fALGvpQJumod8bAeSqbNq8hU4tfmRujkbzfo+5Mb5457NhbjNg/cWAnfneTJiRcZv0yIWjDTnqlO0lqswwihlCYnjkdkxx/0CywHOvuAMxcsmV6rMB4iacgo9KeExJzi/D1d5hBA70pgGg8rryWuE5TOOPH0VlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+0MObtx; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+0MObtx"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-82f1bfc9b8fso1117866b3a.1
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 00:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776670970; x=1777275770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8o6tIOPJB70Q+H7F0EhswID0SRlwm59Gc3fNDk0zuo=;
        b=b+0MObtx8J5wSIyZU9Nrl93RZFAKq65FsOiFgrzNdW6fBPTTuDmp4fJkS6ZKv2frZq
         qy6+fihBROeuoeoRm5V35noTikmLf2cxnM2SUydxwbqy8RW1O95pUTM4jRsPz+wK32VO
         oV801+hIpnbGRRZMLWc1uYW0IsMh3qrstzwQR36wsmfVkkYkgzN8ARMK3PpMhDuXFr4o
         bwbApKns9AyJ3z6sfmRKnM5H1RkCjX3FeFcl2UdiNqakLysXv3PhEggdKakRuFKM0S3p
         nQK5I2M6y73PjAa1n8cRxyIHrxV97ei9XD9L6r7E0HhXix5ehxLJQOTJPiwbMmMKioyB
         aZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776670970; x=1777275770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8o6tIOPJB70Q+H7F0EhswID0SRlwm59Gc3fNDk0zuo=;
        b=BXIqp5b9xEJ4uEPpF4SsBZLGJ/KwUvRRURIC8YsHbqqGUH7omciAqtRnrAQmWGbbdf
         eSSofJg4Lied5rcP5Ky/36L6cH5V2x3MlmS45+7mGvHUVefv1GjGroiFAg1c8VkyamDy
         CmAdphRgMB+YZOBUIOGE4LyGdgvPZJzvj/KF9IP62KIPzHnXgvL9DkL/TaPP3CirIv7U
         eRQQqi/mPWyvmh/0pc7DIxopMXwj17ZbnykaxoKiO/jTOVpuGKg1dkgS1dFlBHIdPfn7
         U/TfjuCgChVxdf0ODYY4YGnc52lqvZZF3FMedouzoOsgUprmG1f+lBiaralQreWt6hd/
         kuzA==
X-Forwarded-Encrypted: i=1; AFNElJ8A31K9/pv/MsiHz4wzTeEkgweDam3aj6EeVOFmtclFbTGPlYgBFjFliUoHteOcQJURGhRQTOckdlbHdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGEP+MgFzHb736zKNgayVqE/V0YIcxmd8rWiGuuogFwZjUenPR
	8BW7ENNUdzTkqp5JrN4ujvy/Lz1dMk4fhDmZkPLN1MkZ1HFZrGp5NLO8
X-Gm-Gg: AeBDiesnXjM+2L/XUJr+O/i/7wBQVB5dqGei2RK0Aw2+8CfHxspz/qmviQCeeLKk9hN
	lANAUN1eTBg0sH9JGkoOyXgIvw1EvCAZLH/NhqMRJ6TFoMEALRzdJAU8prkLYBluTlWU1+I9ulh
	M2pVjcj5l2mB7awwdUIDC/oJ6VU0rjMCiuxYhNfM9YM2C5wCe9urC+YwxiHzS3DvtzMZXHL5gkE
	iKxOygLIB2A9eMNaRcUTr7vD9q2lBbmYIB3ZB4tLjluURAQcr3Ss4Sfd0w5xuVbFoqxzP4IJf5t
	iFUFGhNaPOsJ6m7Zku8RqPUiAIjhgFQYVkSF+9d786TQzN8uIoMjAWcrc3hbZPCYhmZqpeXDa0B
	8vY2Dokxpf6plJjo6WMzIVLE2wYiu8MmEbIFeyQ/ofaG3WWDR8vHSKBmVzvW9yW7FBQ0ofY3Ytj
	8k4phFmDd3cr155CNXJHOAVswNb7hmCIS8QyjXxMVbcqStlNYEohz9xmjgbPQhqUk=
X-Received: by 2002:a05:6a00:1f09:b0:82f:5576:2860 with SMTP id d2e1a72fcca58-82f8c7ded1dmr12538412b3a.9.1776670969763;
        Mon, 20 Apr 2026 00:42:49 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819e5sm10137292b3a.2.2026.04.20.00.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 00:42:49 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: andy.shevchenko@gmail.com
Cc: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: csi2: Fix DPCM decompression for source pad format
Date: Mon, 20 Apr 2026 13:12:35 +0530
Message-ID: <20260420074235.106713-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAHp75VfxwFW3nWLjKS6TXPHYJsqPJWB6G_M08t6eTkcodOj7zA@mail.gmail.com>
References: <CAHp75VfxwFW3nWLjKS6TXPHYJsqPJWB6G_M08t6eTkcodOj7zA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Apr 20, 2026 at 09:46:39AM +0300, Andy Shevchenko wrote:
> No, please spend your time first on learning the process. When sending
> patches like this, do not rush with the new versions, keep at least
> 24h distance between them.

Thank you for the guidance. I will follow the 24h interval before sending the next version.

> Also, drop the "staging:" prefix from the Subject.

Understood, I will remove the "staging:" prefix in v3.

Regards,
Debjeet Banerjee
