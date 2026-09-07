Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E836F43B6CB
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 08:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768753; cv=none; b=BLmepgGOLcr04odpI1kja376ymuo2DKus3CCKiTRD/SOtN/N/zwdCQpvGCcNgDcFYVhhLN6P13FGpA9aySssN04ucJID6Lql5SKX/Vlm8DEn44vRPYr+Cg0UUD8YGFs9yJ33wfU16uzlKOh+7azLWh5lE43z0MC/G1TC86hFuWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768753; c=relaxed/simple;
	bh=3DpXbIfal60znQihoTzW2Tp3q9D9M0PZ3qy0geTQM0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxkVKDQo+GC1NAneA64lTBvKsbgEePh4rQ4bAare4OxRXOZMaIlupSPyZN9HPT1SkoMaoeOjIEdUYo59Ki3HYdo6gCESYoyQ2XdubRcGFgK7Xp058UbBlM5rkPgatgl0tEu69LM0DKCwpgS3BbV38yaiyujB/GSWbBNEC/oHLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnQZUClD; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnQZUClD"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso2453195a12.1
        for <linux-media@vger.kernel.org>; Mon, 07 Sep 2026 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788768751; x=1789373551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=971x3L1jLFO50aCCes3jvxmvwdkEiKwHi793ZZpvAwA=;
        b=DnQZUClDG+STAKi2HTSLrDEXSMtoZjFRetEAcCyXgKgIgAJQP0J/xE0re155nXd9XV
         7CFpmyqtOBHHtSIB+zCTPxzrgqPLQV+4ziGrlje+73VfQarvb1m2KJMeaeEx4+KSrJJs
         o0yhQOR0tiW8gVef+uCwa0VrdzZHAnzQgChMbF9cAc/sDQlKpg0K4e/qZrpqFn8hG/5A
         2rf6RI0szykyjTw0iWW1S6WOvKbszG1OmXQERezXuf5dFlFt/SHv/pZLvOyp7jdOpPuh
         BraBWPqceHYoOqQDhuZZ3p1J6a2e/HAjCFhOW+zR679uVZxBTxNq24d/1357kOUBua83
         a53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768751; x=1789373551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=971x3L1jLFO50aCCes3jvxmvwdkEiKwHi793ZZpvAwA=;
        b=PIhA9g750Fg3XqGYPgrKMWdR95B0EaiCnZIwplBdC7RGjhLo12EyRu9c6pwEDKwcPA
         Ehi5jYJL2SNkfITkVYHcRY8vK+F9qVoViT61+lVMkgx80dAGKv1FQ5/4nromt5hXLgZw
         o7+yKEMTG2ovaAPt194DidGcSenWD7Gl88bd0hviuAyiCL2EUOQr4/SZzDkt1gRdg/Xl
         zAyl/WqQL4CXKwCK+qjcL7bCTyHlyjZjlLn+S03GstP1ZZChA0q6BUr04wA07NVKwTs+
         hsEqolCS2RUdbFDQwENC+qJ5/EHoHRxol+z2HiFqMDUo8GBvz6WzZYcjMu7eKoBcsizR
         sbPg==
X-Forwarded-Encrypted: i=1; AKwUvBwdY1UqRAe2ebFMRF4aZANi3bYpUvkFYhP6hz0Bi+kueHJLTRILfTokBJg9u4g042ss/vqugKme1/9f9w==@vger.kernel.org
X-Gm-Message-State: AFuF++lHP6G6xCfDJw98J/Zxu3lqzNKz8U4/o1gMV6f2mMFeeBCgPlHP
	nhb0UYKfWWw1ZOah2wnkVXGYEcvqxapLR2CnBVQMXrkxF/1Pio/VVIRD
X-Gm-Gg: AYBFou3xQcFJk7BjDMBm1ReoaXqM/m2par2ijgagQjUo/2ahFA0Xrq2jYKDaVOzWXp3
	Ye7DaISAJ90yH5nAG/rjoeu3PgJHPGtMgQ9Uwtt3iQX48Ixxv2yga/ib2UjLc9OPaf9ix0SvG/k
	mX4Jt3g0aJiQPXLYZLKgbD0n5Zk+sfqbfHTdVm9eKml/w4CS681GXsaBdQB5VP71Uzj3SZm/Fi3
	bzwKdGkfgSAghXpb0CxlyncsYK7wUHhJia5ZUx7kHObY6KRyi76UpubJM2U5YWs2MkEf1XAEiHb
	2kUXJ9hZtxPIfP3REATaLcvhPmFjI18k5XJsBxkYciwiHQ2592+EkVkELzSty/cbQYtgRwXg52T
	yJuFZNtkqONd/hsYyHgZr4uQNsQnDPxrIwXbityToxn5o5FjGr9Uav102i9NkDW6PkyL7jgXe5l
	D0AUQ58iG4YJZZ12QIEXounIYby/CQSeB1B8ZnZnn1Xlu3HGAt05TLuh6cIIJCNaWsyFzBMwY3s
	xhPg+7rf7g8S2xHQ9EGxdpkabbhZ7Qx7DXtg1pvHosri7eL9ofl6HTla2DJ9RIVKeigYe7d9Ckm
	ziIk37E=
X-Received: by 2002:a05:6a20:e607:b0:3d3:adbf:777f with SMTP id adf61e73a8af0-3da3a16a54cmr35721717637.20.1788768750876;
        Mon, 07 Sep 2026 01:12:30 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45a6abb12sm3535544a12.16.2026.09.07.01.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:12:30 -0700 (PDT)
From: Wei Jie LAW <98lawweijie@gmail.com>
To: ribalda@chromium.org
Cc: 98lawweijie@gmail.com,
	guennadi.liakhovetski@linux.intel.com,
	hansg@kernel.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] media: uvcvideo: Fix NULL deref on events for uninitialized controls
Date: Mon,  7 Sep 2026 16:12:22 +0800
Message-ID: <20260907081222.2541314-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANiDSCtypCfEoZbRvdT7EoJdd2G8yOVcvxBoS5LcE60UjFQx2g@mail.gmail.com>
References: <CANiDSCtypCfEoZbRvdT7EoJdd2G8yOVcvxBoS5LcE60UjFQx2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 7 Sept 2026 at 09:00:35, Ricardo Ribalda <ribalda@chromium.org> wrote:
> 
> Could you provide more info on how you reproduced the error?

The device I used is a Facedancer UVC gadget in a QEMU VM running
v6.12.105 + KASAN. It has:

  - a Video Control interface with an Extension Unit: id 3, one control
    declared in bmControls, GUID not matching any known mapping,
  - a status interrupt IN endpoint.

The crash is fully device-driven; from the host side the only
thing needed is a process that keeps the video device open -- any
camera application will do (no ioctl, and no privileges beyond normal
camera access: the opener can be any active desktop user).

Userspace never sends UVCIOC_CTRL_MAP / UVCIOC_CTRL_QUERY for that GUID,
so the XU control stays exactly as uvc_ctrl_init_chain() kzalloc'ed it
(XUs are initialized lazily by uvc_ctrl_init_ctrl(), which skips them).
Something then opens /dev/videoN, which arms the status URB, and the
device sends this 16-byte control change event:

  bStatusType  = 1 (control)
  bOriginator  = 3 (the XU)
  bEvent       = 0
  bSelector    = 0
  bAttribute   = 0 (VALUE_CHANGE)
  bValue[11]

The worker dies before it can resubmit the status URB, so one open()
gives one oops and the endpoint goes quiet; closing and reopening the
node repeats it. The oops does not depend on KASAN -- it is a plain NULL
walk on any kernel.

> nit: I would not add the comment.

Sure! Will remove the comments in a V2 patch, which I will submit later
along with the [2/2] patch request since it's a duplicate of yours.

Regards,
Wei Jie
