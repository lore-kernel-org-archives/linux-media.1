Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F80A3B3C0A
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 18:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784831127; cv=pass; b=gFiFxkUX2CjJu3b0NAZkM3UMFGJUNsZNHWKz5Sz1/G8n4MLWzXgPozOaIDmtljQ6Jm5qmrgNKmewRdt/F+MtOhmAHZ+YQSsSaEnJfA6SqWdKr9vQjts7/p+mSpFQ/xfHiAZbVUWtPlZ8U/grZ+oUMoruvnlRHR1hSgqw5z5bT+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784831127; c=relaxed/simple;
	bh=M0OeIddVehiOV+pnT2aZ3aPVkCIK6OpPyAEzZLeua+0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OuQT/aOcPiZQ0TUTyFFA5UQMWJENzOt7MlQFLXySxoXW5UXdJL5Opa6DMfwwmNjGUy8RHEshAFdUMWs1QuHT3gba/RR/KE1UhPrMoUpmq4cZ8FZ9Rug7yTLcUCAV8Q1JEhgr4sCSK3yS9yMmImW1KMvLuGxJKwYP5wvQ/PWrhok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1Bp0Gee; arc=pass smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1Bp0Gee"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92e622cc874so80617785a.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:25:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784831110; cv=none;
        d=google.com; s=arc-20260327;
        b=SnUONxSALDteZRUHCH9jEwiA+5ONam6/U0/1SuC1A3VY1KTrOy+bTwBpP5v53W3pWp
         f1bJwT5/WSZRAuZfVYoyxofuhio3rXmAYK7Fxiq3SAeEpCw4S6TqBBwIBPf7+58KN+PW
         0iUn9DiTT4vuNyOJv4c0+wcd0qzT6RTrg/Hvqk4By6NJdfLsDrNzvVHnumeAq/TXPC2x
         U5oROJaQ9Oltu7x4Ia5SEU0uLYpjEhr0wrjl9KVf1BR+NRAD6WA+LFvuj83e+FojyFYd
         d5OoU9TtEgA6yWBpFateJBWe8FDdC2H7G7axLXRxRIGlKfQGDVDQXISvhTndNcvhSsal
         Hhyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+JzLWUSlpoleCzGJ/2tKR9IravA4Gi2Ibzg7ZJgATXo=;
        fh=q7bF30nMSi3QKNt/fXEF/qQXJJ7VJDRe/tPVycNbHjw=;
        b=bncYQ7GPQyKuLIRNmWwk1wZycxmPBWUh+cHy2eapb/yKGdwItMCmN/UD1DnNhn8mvf
         z3yCp1gOKGtj0sZL/fnY3FSCk6OPDUzUGY3Scyaog8eMkF2Iemxr8FT1UFAoCvTt21Ez
         XL+OUf2GkXH9/ViXsO/1h5CcyhnSFJ/j4vq33+JrWCJTsEuIWzmxrkEyMZTInHF/L/D1
         29ZA0k1FRljfx+E1XmvfWylS3BPyCJMLvp0ARx5e07ZQpqChzpFnmg0zNoKx7ZpXSb29
         CGqPwkDAxVOXrz1RhA+sYyWx/0F7aUXpaRSaiMLRJ84ivTzgAUYRwpe7XMJqfPrU8QGG
         SPgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784831110; x=1785435910; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+JzLWUSlpoleCzGJ/2tKR9IravA4Gi2Ibzg7ZJgATXo=;
        b=k1Bp0GeeGJ3/B0m6i9422gFJQQJsJdAQwFZGL9CCWw4jVhhTM53EItF2Wbkbhyuki8
         zNsxABsSNtPeMMGJVJU9FPNXfloIw/cudeYJ4EbzUzyIPiFNK5b0eRoiHxVxhqKHdCko
         izjXkeVa4ki15wiypCuhYhgb6ft34V1kXNu5Xsex1UdF4glaaRs4Esmly5+fKRTWbn6Z
         IMSJ2e7tcYK2EpwMqmWH6xjiXr5wvfM5AjI27o3KxZa+A9HfS66Ek7vAbnC5aN5MAuc0
         G/OaNqeKyoJytdqLMY4oV4Ns3ImrrGHuum3hjgpu6fdUCs8JOitpT18KdDNB/fee23mz
         EzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784831110; x=1785435910;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+JzLWUSlpoleCzGJ/2tKR9IravA4Gi2Ibzg7ZJgATXo=;
        b=dqyq3yX3MApP4umy+mpq1V4N1ckE9jSInmnG2rNhXkbkImcEccEtYd6sbkmEFMWAIE
         A4Kw2bC2DTl8Lk/Le2L42+LbYQHMtczVjeHyKaQmCZ6BTfnL5nZVNrDl9Ky6NSYqjsr+
         +zSQTU1Ok3BZLkY0g7fePPdzm1X4y9P15vIyMDHrDSac93e/HxXUb6Fn4Fb+lKqy9ukC
         ePNc2ONtHeWSqS4tD3sKkscxomxCCKNS+u/f5AZTL3ikkssV8tfM1bxrSWP6AjDJzfK1
         3fx2xxQlkUiSL/cacnbcHJIQdiD14lSYaDjY+i1zWBcjemFM8yvPj9iYtXviqO8vP2ud
         n/Mg==
X-Gm-Message-State: AOJu0YypMpt+d//BAMtlDb7DK9RRa+Y9lR1/wmf8WuJIk685OBBecDlg
	M++R/5MdZ/3cfuW9zt/ANotuOxUjlYZWI+RKJBZ25jeynQcPQqaSAL+yaSsbksfaPrUbqbuiS0F
	na4qnWeC17KK6ErhzLF9oi1V3XuLQG10XGQ==
X-Gm-Gg: AR+sD10hBbw/TYG9tBNq12jZvz0R/QxNMfI4xKgCCSWav9G/SGuliYNImPIbQuS7TnO
	w5iz/qVi6q2sfCdF2/I1KeMqBbZ4VZKAubc/AaR8bWOehdPkEc/a0UUjT7mx6v+sOff7zarV7bT
	hBDn9IV3O15wvS7H+lVfKR1Apo3zgR6jfCNaDLG3LXtkcJQ4pRFOtfc0WOAAZEGn3f0iwuPWfIA
	cnWq6ccLBFJ3Tt4s/xjI0mlCf9aDvEjzilV6ymA8bKnsDfVOqWz+UPnwLylwTByRDAyNJNnH6mv
	jAWKCMS13xtfhSc17CSjjipHUkVC5Q==
X-Received: by 2002:a05:620a:3197:b0:92e:d7a2:df95 with SMTP id
 af79cd13be357-9310379456amr478327985a.85.1784831110022; Thu, 23 Jul 2026
 11:25:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Date: Thu, 23 Jul 2026 12:24:59 -0600
X-Gm-Features: AUfX_mw2tOdZv7WsE6S8pCzt--iBJmVgvIhff4jQPZl2zBwwHzIkq_0k72fwRQg
Message-ID: <CALruWrUk18j-7JO3gKwTB1+gKypGFGuq+RgyHbcBbH+-GVEBHA@mail.gmail.com>
Subject: [PATCH] media: em28xx: defer audio-only extension registration
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	syzbot+a11c46f37ee083a73deb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

From 146a68462c738e75727601e56ee35c4792b4baeb Mon Sep 17 00:00:00 2001
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Date: Thu, 23 Jul 2026 12:22:42 -0600
Subject: [PATCH] media: em28xx: defer audio-only extension registration

The audio-only path registers extensions while probing the primary device.
For a dual-TS board, this happens before dev_next is created. The duplicate
device inherits is_audio_only and is then independently inserted into
em28xx_devlist.

The list is intended to contain only primary devices: extension operations
reach the secondary device through dev_next. The independently linked
secondary can be freed during disconnect while its list node remains
reachable, resulting in a use-after-free.

Defer audio-only extension registration to the module-request work item. It
runs only after probing has completed construction of the optional secondary
device, so only the primary is registered and extension callbacks reach the
secondary through dev_next.

Fixes: 4a089668ef22 ("media: em28xx-cards: rework the em28xx probing code")
Reported-by: syzbot+a11c46f37ee083a73deb@syzkaller.appspotmail.com
Suggested-by: Fedor Pchelkin <pchelkin@ispras.ru>
Link: https://groups.google.com/g/syzkaller-bugs/c/dBYVYfLw_Y0/m/CX-W6h1qAQAJ
Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c
b/drivers/media/usb/em28xx/em28xx-cards.c
index fbfb74eab475..a6881f7f8e1b 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -3651,6 +3651,7 @@ static void request_module_async(struct work_struct *work)
  * intf. Don't register extensions twice on those devices.
  */
  if (dev->is_audio_only) {
+ em28xx_init_extension(dev);
 #if defined(CONFIG_MODULES) && defined(MODULE)
  request_module("em28xx-alsa");
 #endif
@@ -3884,8 +3885,6 @@ static int em28xx_init_dev(struct em28xx *dev,
struct usb_device *udev,
  retval = -ENODEV;
  goto err_deinit_media;
  }
- em28xx_init_extension(dev);
-
  return 0;
  }

-- 
2.54.0.windows.1
