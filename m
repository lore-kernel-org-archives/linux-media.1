Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0BF286A4
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301014; cv=none; b=VbUe2lQpZM+4upFT/XEEjMvpwDOrG2xGrGUHFdbwzerZ8w8ey+qfb8HcliEVUTVAK3yzi67qcK9Nm0U0FemIGVhWKOMXuKrwwVNljtL3oVEVvdVE50GUw78DmxHba9JVcQ4gokfSbdGBNOEkmcoXL48mZ/bFHxZd/aE69fSU/W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301014; c=relaxed/simple;
	bh=YgIV9R8R7lN3e7PO5eiRn5CtkNayP6wx8pWhx3zR4kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bL+ubfTMOdXCsAorMZ7n1O3j1ZGxSr87spuIY2NO02BHAnoz5SizTxgDdGvc3YlsJ8+Sot8Hwj8S2c86jR5ITnsfNVkbVrqY3eyUGGiWOlC6kC4/3AORl7KIQ9l54qH9srL/M9VI3D/WO25ZsajyiB0FQYJgINxuMrFw2A05Bq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYniTAiR; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYniTAiR"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1776231f8f.1
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 08:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791301012; x=1791905812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qaQeSjk9Sbx45aXo0TjHg6DDwFZBLFYkE2gFb53/iBY=;
        b=NYniTAiR2p7NHJBHUsxorj0S5Y5st5qHbhqAr6RI7+29bsn22YS23GFj97zlorO/bA
         OxY5cuXERqdkB11KikqXjAYPTqtZO827pBoNe4TJAGth4lJPBLSfyzhRtXyngyD6XAwC
         znqFfHLuufEYoUmYPc4To5YRZhUu39Uk1/45vuugNK20fiPmG70UuwL/j4IPZIWFsTdL
         K8zPeTyYX4UWy7xSFrMkt/yOzBSc7yurYYQf7nwsStFFV5sxH8k8Kv5nqfkYWeMV19QE
         /X/GpLNBAtRC2bdTFmiqzd9KiGsw57JAFZIPhlf7TcnNwUP8XhQogQzDEtmgi6J0gqyC
         a/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301012; x=1791905812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qaQeSjk9Sbx45aXo0TjHg6DDwFZBLFYkE2gFb53/iBY=;
        b=pRxUcM8/Wp/KgUpMRFZ5Qv+7DKl31adZ+gCZTdbnrocDvB34ytx05uJWKKBTRFx6Yy
         fVfKADCKvGMny/SeSRQbdFV92B8KHu99tuJossaXmQdZYTWm3wUcLCYoq8K39isJuI2A
         Y09/jk0//YpAErXUVKYNfqZqS7eqz03vf9YyczXg8EB3ijjxB/ssLn2Gzh7oj0FUx0u+
         D8z2U5NmUlXmYxv9oei3Jbkyk0VjKeLFRxTy7Fw4uPvk74S6hdKkBbUBOc6PZRJ1KoX5
         OIFHDHPVoOg3gi1x5bdUulQbAXkAAF+GAGJKVlJIB6geAxj7/it53LuVypnQYRLPK/KH
         RTvw==
X-Gm-Message-State: AFq9FYLzO0xEJ2/1tCLqV8RebpmRbqRy0aJwh8bEbyo9bwvU+m2ablwP
	Mx09Eaga1UVcLwWTsoZG8giBbofyrhIvc0Ty+7yhPfgIeZRZrK3dXkYM
X-Gm-Gg: AYBFou1F3PgsPYaCnczaO6JmSzNNWNgEhCuUU1+0WR+vunXwnUcTHGo7/1LzCNyUG6L
	ReIzeV1FA4I4z1Vc/Jes7YW9tbAXL+H6YUGQH/dY91l//ETt9kF5r6HvnhBtgFyrCo8HG0LtZq0
	nl9XjAxSjbpNYa5/KyCIelCiGRrfGtyNodsltH3/qAs4ZBMeFJ/Sepgyi6RIveOx+v0HiSTVMH2
	1kXjyWhk4DlYgREz9kaTbjzJrkzcrm/p+Uyg4QuAc4G3IjP0nt2UApSHI+LzFk3/dItbnHLXlDE
	HJe4KtwilMYAW+kr855CwQI0JCxgQWwAi/USwDIQFtP8+sENcGOWHyi+e7CpEtEWgvSfm3Gxr5R
	CJ9QGZrTShRSE4b+DrXFCG7WgOMWVJcMof1OPOnEq/xAN6EAZxDySDpsOojkMgui4RwOTtLTfk2
	s6qbbc6wl1tSy/89NQQNegStvzG04ulxWVvWEfJF3NhYPcfAL1F3LFiPnV4hg/Rv0mzFjne/Ti1
	tCe0IYnD5iZyq8PSAE=
X-Received: by 2002:a05:6000:3c7:b0:488:8a3d:b58a with SMTP id ffacd0b85a97d-48c4801b97bmr19026243f8f.53.1791301011482;
        Tue, 06 Oct 2026 08:36:51 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm243489f8f.52.2026.10.06.08.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:36:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] media: i2c: mt9m114: Add get_fwnode_pad operation for IFP
Date: Tue,  6 Oct 2026 18:36:18 +0300
Message-ID: <20261006153619.304520-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the driver's binding exposes only one endpoint, which maps to
the IFP subdevice's SOURCE pad. This configuration causes failures for
many devices using this camera because both the DT binding and the
one-to-one pad mapping logic map the endpoint to the wrong pad. Fix this
by implementing the get_fwnode_pad operation for the IFP, which correctly
matches the endpoint to the corresponding IFP pad.

---
Changes in v2:
- adjusted coding style as asked by Laurent Pinchart
---

Svyatoslav Ryhel (1):
  media: i2c: mt9m114: Add get_fwnode_pad operation for IFP

 drivers/media/i2c/mt9m114.c | 39 +++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

-- 
2.53.0

