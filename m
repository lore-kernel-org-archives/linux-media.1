Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BF13AD531
	for <linux-media@vger.kernel.org>; Mon,  7 Sep 2026 06:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762518; cv=none; b=sPvXvRRQLF/A2sVDcI+MO+zlGIfFYgKXilrHrXHt1d+6jh67ZsDWj5dg9eJonqyvD0zQsWgiqx2PsoBU9zITSMZy9VAybEUsfApC6xzQ/7CaUuEEuBw8852GqbeG0B5sgVVgtJAmJuxE81cx2FKMgtgye5+/Z69jPEBdeuoXyGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762518; c=relaxed/simple;
	bh=wxSQkLXWCWxEaJjBH3HhApPLUhg00iXXhz/BrXspzl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=feL4dKVJvThmFpjN7coOknzE+4iPtbAuYss40Xcf2DHfobSEwUjUsXhWS9yeA0WwUEFqzEH2wgvcuJxAwShZoqxAau59UsBAgBcszzeqJP+lKBfXE7InUEoWrP5Bf+NTwe9iquddDVYTidZvImq0zRIIbZ3KM5QIbotk13qKuII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFAa3T0R; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFAa3T0R"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1cc1b42b5so3281768a12.2
        for <linux-media@vger.kernel.org>; Sun, 06 Sep 2026 23:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762515; x=1789367315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sHzKvLnlyGdxYzhKnuxr5occ0k1Zs9EilK19Jh2gzJc=;
        b=lFAa3T0RNosWdYgoWiUqanm3eqKHXhSAXi3+/UmXFqPsANDhYaeMb8L5rK3zkGSV4z
         msvvuO+BGeHHFRp4BmMKNk/bWq+aGvk8Zwd2xPqDwcz2aXzD7aUBAAUU2Il/ochtMNlm
         GsK8MMA0KHHAngIwA4zESCT3ISQbVc+muWp/E5Qe7ksTGW4x6guCtisWEnNTl8vlkfcY
         Q9kTMrhmLp5cQzJE51IAvoe20As1DyOK4H+Uy9Go297/Aa1C+1xgrkBhWM9cz2KG4J+E
         +8Pg8WXNze5pIziHl05s1u1x0BSittGzUtpOGiwQqs/bH+BXU4bqkXWiJNWACpHXHBpn
         7lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762515; x=1789367315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sHzKvLnlyGdxYzhKnuxr5occ0k1Zs9EilK19Jh2gzJc=;
        b=OZuG83M+vRvmtSZHmz2LqoQBQCCR+CEp4wb2mmEv0aBaX6Qh6Ziy3+oww4ezE2ZNqb
         DB1uk9dKGwsmmQObtfBwzl2IiOZBdXFDQ1PaUDymXK2hkLEnaBjPzNH4PJ9rzooS5DyW
         abM2aX5rU6PDsgDYURAxmPVAPGKFnkPXZDUnrWqJ3tYCfg0+I3HuVmhVGuo5PfOA+90k
         BEb+CFOhhBTS2sGRjn0BQCTK5uNbD9m+iKp4bDlkl8+8wqFZPmKXj7HXZ9UUAqe6QjrG
         3dzeLfKqKXf2/mw/oPCO8Kyt7msO3p4E3vSuu7OO93lYeMRmQoeX6vLIX33KFsww/bqS
         JH4w==
X-Forwarded-Encrypted: i=1; AKwUvByuKGQdwCzAnW+AdSnc1A5V9aNZUI5vmLbW73At9/xXxB7tV+44OEby7U2vqgAfU22RQMY7Y5ILktMaoA==@vger.kernel.org
X-Gm-Message-State: AFuF++kLsMeaDQsLFZWAtCfnsNcwzNzXU4nE8KJU2s3pWNh9CfnK3snB
	057CJVME9c1s6CjkHD+hTZAQz6NXhMx7V3clWtLaKnUdbowpyBqAqf+/
X-Gm-Gg: AYBFou20zk19ito86oy9Beg9hW/VyQvdYTPBVohwLZvWl1rsYlrrV18t5COjDkUqA3V
	U1r7VUPEWbn3dHxGbFr8hyS2V5BB9MkdxguQhBgTOJi1z5XepWPs2PhHGW2euMV1lMZafyflchS
	ynqZ2B73oE8ppfarU8jpsZ+w8HR62xXmP4JNpB0RRK5KBxPhdj3Qe+fg/TTYap3IKKLnkKKzsE/
	Tc3HV4ltpVaWCGICBrimJ/q/1U6SLy8E0ug5/JkzGSLnAMcQ7Kt0DsIipeXaAxx8gQNI2IDeyPY
	Fegc+cqcrRm6S4wuGw/EsnYncaKegjiIVqTwm90ZL+QS6rbHM0cFFWAPrPhCTgIvZqzQvVTeqog
	MsXSIAf+uXEs0znP/+q0DuJHqgUiSQz8UpDpP4vWrzTPsQpFhzj1JmJoymGGQkm67dOwDXHayL/
	4SHDP/J5aSIS3BJ3BldQiO3xzrxaKewfNfUr5K7lHOrm/DmRYmyjqi6yxtH74Ky0UNiVEJfe3Qr
	WiWXRt+G8+X9RUPvjEDGHmp0b6y50skpLRFY8NLNSn23Nm4IBQLRbUFNX4S77qg6rst9yrOr/5w
	pfvaVAQ=
X-Received: by 2002:a17:90b:17cf:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39b26216cf7mr31265813a91.23.1788762514754;
        Sun, 06 Sep 2026 23:28:34 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25c974cfsm18978042a91.0.2026.09.06.23.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:28:34 -0700 (PDT)
From: Wei Jie Law <98lawweijie@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] media: uvcvideo: Fix two bugs on the control change event path
Date: Mon,  7 Sep 2026 14:28:16 +0800
Message-ID: <20260907062819.2519878-1-98lawweijie@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two bugs on the UVC control change event path, both from e5225c820c05,
both in mainline and 6.12.y.

1/2 oopses on an event for an uninitialized XU control.  2/2 leaks heap
past the status buffer to userspace.  They are independent.

2/2 reports zero for a mapping that does not fit, as the compound case
already does.  Staging bValue into a zeroed buffer would give a truthful
value instead, if you prefer that.  6.12.y needs the same guard around
mapping->get().

Wei Jie Law (2):
  media: uvcvideo: Fix NULL deref on events for uninitialized controls
  media: uvcvideo: Fix out-of-bounds read in uvc_ctrl_status_event()

 drivers/media/usb/uvc/uvc_ctrl.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)


base-commit: a500db7819c50db59e55f1b4fa1c3baa5a2616f3
-- 
2.43.0

