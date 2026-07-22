Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A673624AB
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 22:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757816; cv=pass; b=kKFGA+eW2xKk/gyJFp5Uikgip8aCoaSTNkHDMFFXcUgj+NgQe9GI0hybKdeTnPpF386Ijc9GcQxW8JtnENTgVgi9uA68UImbCrj1qaLetgEATCqZMbZgf4fqN0ZhyMvGQp06+5e2gB+VHPYDiKYOHoz9NxsSvSgE2uXzI+4wqN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757816; c=relaxed/simple;
	bh=nsRU1Gu+XGhBydVcwwxOTsh+6FvoRS0dlKUQknheAUU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Kf8560+kQKlu9EyPfNsrHQ1TXEw61rk1LKcg1DPTn8ZB7rHd7QmBQ5OjHH4iZiOhAvxo2FsjO/9euHkfXHAJ8S268L2lP8OoI2vMZ6djK1ljKmoS5P3hnsa/cpyR0B2kQ08ii5ZFMtfEWvGmDyAyleUzSm3GKJ00pZf+Mvew4Lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbX+3TPp; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbX+3TPp"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso104807565ad.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 15:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784757814; cv=none;
        d=google.com; s=arc-20260327;
        b=PzdHz00Q+hAnzFw4h9yEhBiNlQ3rnIYtBcKaK1wkfHpswADhM/NFVrWSP9yU/Z5mi4
         Vyz0Tj+rekatNhMObOl66ZPxwzLj36Locz6MWGkwNFX0m/4Djm/SZQ8ibjxLvy4l1Xrd
         ghxxkZdzKs2R2nNKlgbMtUya4o5HZNKaH7vgw1Swt89Ltkpy8NirQ7ExYn9LqSeS8qnG
         EHgCDguoyspd7+B72kXN7xbwn5MKTAOREMmvhq322wDanGEVgZFeQVrbncXhVHjjmA0/
         hGxsl3x6jKCmJNz8uRrGfzV51afwAHkB+vEP3ttS+w6PqcI3erFyxrNXImLYLjVx/ans
         VW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Arzg6VKXzHdZLo4PxEfQobRLDWRSk+Y65lybWp5rUag=;
        fh=WMG8nm8L2fLR2SXg/yt1N0S80P9HqDn2UMsy4+5xDks=;
        b=lX4V7rn4mZ3Dwp75uZgW+Y2Jzs5FoY1YAYQosD7jfktKZ1itEi6o3SG7trAXQ+V1Gu
         xNb4LAHGzbXIc5l5+Bw46Qx4q6oE8wGm6oyEiecerLsnJJ0+kPM4qGwqjwu541cX8QwO
         UiD9s+Rfm/vDEF6z3bdiv7h+i4ziLJEY63Ib/+gE9kOceguHrNFLVDPnN2nUtXQ/hEGN
         bXq2l2dEOUJTE8CiXZRUfe5+HCmNL+pu3HtQ9eN4T8X4KwioBcaW5u/nbayXjFWRKFis
         YMDSaQe+9ic/PLpWVEm+YrFb2pEHPke1Fxs0DjIe5gQ9HmJ6G8zXksZUuZ2Gi4ozAW7J
         IvJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784757814; x=1785362614; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Arzg6VKXzHdZLo4PxEfQobRLDWRSk+Y65lybWp5rUag=;
        b=WbX+3TPp44/PRUv1XsPU+G4L+vWcO0kuZcxd3erafyU/Oeytk8vc7h4EXeNTKUz7xq
         A9YCR7SGD53IQ/U0sVgSZZSXLLvItBQ68j8A/V48yFrXPL0NP3iT+zrbq1w3+ux42RnV
         RxxXUVpRcSpJRaNxr80/n5TQN79X1ofGODTxPj6J08GF3QLFpHb+hysGEU/jxYz4xbt3
         AKXG5C+iPIiFmXbJ9WGDDI8PffAQNy/TET2zdEYyAieY9iGZeWhz4AxAGuBS/2tgr6lT
         bQGGnL/BBCC2Fc8S9DZ1fnDzdsV/+7VbGt6lHzTLg5krX1HnPaYOaelawncNnHGErrUl
         XwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757814; x=1785362614;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Arzg6VKXzHdZLo4PxEfQobRLDWRSk+Y65lybWp5rUag=;
        b=U8levf+iX/5TcmqUiUSIRFNOkeJxauyZXOa26y9jY3dVHZVFLNcYZNWMaueEjzS7Y+
         kizCwC5xDXKBTEW1w6vQ/l3RM9f62TwuLKrpJhuX2rQMYEYr5HUaow3Xtyih0DJhFEjm
         pKQjD0Ny/J/5N62mEDuay6kGt3VA7FTLBFV3X/F/z1BGqmZjbMDJ2Dn4xxHSrrZ7oYot
         JE5z+uAOruzdFqOIJU2l73kuEV+0nib9nd1VgTiDLeAIZIm13TBxfv064ulyJBR3eiLk
         HKNUi/ETIFS3ODiM+fCStF07QAXz7rT7n+wGFszmSx+1gCYMrGEmICRK9YYC4dvA8+dS
         X5aQ==
X-Gm-Message-State: AOJu0YxN/xVB9h7l9RCWgJnh+Dm6EkfqXsluNjkoni9tVENk/gV6kQA2
	hpsgx4MhYj+fJTaPwBv3d94//1b3KrIscqhOGCmtSxrjOQuZXCJd8F3ipSPmUQuLLBJ2Bd/1BeX
	+fDh4MkmiFLoGdeI2EQAOK/owxccro4nbpAix
X-Gm-Gg: AR+sD12BBztjnV4oUr0ef1l6jPfG60eqzQuM6PcjE8QE5k0T7Tia2BSGdwYVoJxvLw/
	owBJQ4vY/LsYvg+PnuJ7K7wrz6pip2N42iAjY1A5riuOdgn9E1Y4bdSnkHEYc3sqpNCMXedmpob
	RwyRfSRMHyhPUjJA9r7pIrQOeR2/o1upR9RVJovKWnwh9QgU8j9avxN73Qkx/ubVKjScoJxKjcJ
	9aECzu9RzcdBK7OS8MJy1/jDzkdmGdnimBzT9FYjJ+yShm15OSEpoaRrJ3FU9E=
X-Received: by 2002:a17:90b:314e:b0:381:5a08:6291 with SMTP id
 98e67ed59e1d1-38ec658fc68mr388862a91.20.1784757813942; Wed, 22 Jul 2026
 15:03:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Colin Steinmann <colin.steinmann@gmail.com>
Date: Wed, 22 Jul 2026 17:03:22 -0500
X-Gm-Features: AUfX_mz_O7HQoeWNx_OicEZR3lUZ5m2qjczmyvwdu_xXAAISmKMsEo2P6dTySOQ
Message-ID: <CANupWgLN1J5U0_je_a+gS8-hBCjZRFVRAnAPYedfUvQY9EhOrg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Add support for Geniatech/MyGica A681B and PT682C
 USB ATSC/QAM TV tuners
To: cyrozap@gmail.com
Cc: linux-media@vger.kernel.org, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Forest,

I tested this series on a PT682C (1f4d:e691) and it works! Thanks for
doing this! Details and one issue found below.

Environment: patches applied onto the v6.8 mxl692/dvbsky sources and built
out-of-tree against Ubuntu 24.04's 6.8.0-134-generic (arm64), device passed
through to a QEMU VM from a macOS host. Firmware extracted from Geniatech's
Windows driver (cyDtv.Sys), sha256 8f77d5cb...9c4e600d.

Working as posted (cold device):
- Probe, mxl692 attach, adapter registration all fine.
- Firmware upload by the driver: "MxL692_DEMOD Chip ID: 691",
  "FW Version: 1.1.1.3_RC6".
- dvbv5-zap on a local ATSC station (599 MHz, 8VSB): Lock (0x1f), UCB=0,
  ~19.4 Mbps captured from dvr0 for 15 s without errors, stream plays fine.

Issue: warm restart fails on the PT682C. If the MxL692 is already running
firmware (driver reload, or a previous session without a power cycle), init
fails and the frontend never locks. With mxl692 dynamic debug enabled the
Eagle response mailbox is visibly desynchronized, each command reads the
previous command's response:

    mxl692 0-0060: Something failed seq=X  opcode=X  pSize=X
    mxl692 0-0060: rx_header->payloadSize=11   rx_payload_expected=4
    mxl692 0-0060: err -121

The cause seems to be that dvbsky_identify_state() gives the A681B the
0x80 GPIO toggle but lets the PT682C fall through to the generic
gpio(0x04, 1) path, which doesn't reset an already-running chip. Extending
the A681B sequence to the PT682C fixes warm restart for me and cold boot
still works:

} else if (le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_A681B ||
   le16_to_cpu(d->udev->descriptor.idProduct) == USB_PID_MYGICA_PT682C) {
dvbsky_gpio_ctrl(d, 0x80, 0);
msleep(100);
dvbsky_gpio_ctrl(d, 0x80, 1);
msleep(100);

(I independently hit the same behavior writing a userspace libusb driver
for this device: cold init succeeds after gpio(0x04, 1), but recovering a
warm chip requires the 0x80 toggle.)

With that change, for the whole series:

Tested-by: Colin Steinmann <colin.steinmann@gmail.com>

I'd be happy to re-test a v2 on real hardware. I have the PT682C on hand.

Best,
Colin Steinmann
