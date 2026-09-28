Received: from mail-yx2-f39.google.com (mail-yx2-f39.google.com [74.125.224.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3963F397E73
	for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 21:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632225; cv=none; b=Hk6sVpDUaLuoLaUD2/8gASCwFm5ob+9jv1pmQ8OSD/ruyuG9fcKYEgfm4E7lbQN9VWcPG9kd/ZSCnlAKv5MaJCXHLjZDnXZOEUWU/P5fkMK0eEWHPJxWr4HGbTBOqkpoze2T3Aiin2wXAm6bUm1hwKZt0owaQoYbNXFubGLBxVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632225; c=relaxed/simple;
	bh=Z3pSnbFRdpYgVgDelEoK69oaCCB2XC4FufzHN2BmXHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QQ1fGxAw5ZXUURVHyE9lvoVMUlA9n2kyb2TZQqzRDCHGmtB/pS/qAylYTYQlyv/YaQ/hA72533vydq6yocZeXD3ZY7SX8GAGAQyR/034hoq0ny8byQxUf4mECdIAZVU5nOM2dx7PQg3QlAHoDLgbDb9aU7sT0dU+Z350aUGaWUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyCvMsul; arc=none smtp.client-ip=74.125.224.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyCvMsul"
Received: by mail-yx2-f39.google.com with SMTP id 00721157ae682-8a8f3f7ff7cso27288467b3.3
        for <linux-media@vger.kernel.org>; Mon, 28 Sep 2026 14:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790632223; x=1791237023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=blPdWqjXZLfoA1+E6rg9xXLBNaq8pEshwmFOonEUnxA=;
        b=IyCvMsulVQ/T3V7wroloNh9JcJ48v2rHPpADL0dLjtoXl5fFylB5cARTyxiYVY1ldH
         zPKXLD7CvBQ+T9tZCYJrWIp6PlJuqs4A3jsSQsI43QalspoQEXsvYwIPFw8wcaTl/gHc
         rKDIl9XsK9KHGQznJY+K28x7kfudmMe8isx+DXui4IRNxZvUeJh3Rv+18JrG90vm5kM4
         FMR2sqMd96AjTOdrUATy5pwZvo9Rndsgfgp67XrxTCA7GIpnlvWPsu8eP77FvJ0IBcOg
         dyEmCRSR/IXTPaarPQvVTdNzq6Xa1EHa0PYmNjDc0aYkiYuNAhC7hZO/AAHh/FIVgKnh
         9Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790632223; x=1791237023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blPdWqjXZLfoA1+E6rg9xXLBNaq8pEshwmFOonEUnxA=;
        b=a0w6S40zXa6cC+W7oENoQSPjAlOXyQAiYzEDBAxghp5V1TsYM/1bL9Tg0ZFuI8R64a
         kGOqGZqjuuYmuSnq8U+kH0sWgL5JVJSU1XVAXqoWRDJETNPH4MzICCacN4WfIqUGWH8G
         ZoGnBgis01jQCeDj0+Gi8OSdIPWjpoFYonVs/YWYwxxmR+4ffE2+awFLJ64AyhkrEInb
         kLgsaPS2z2pkk6TULB226khOyVa3SBDIYTcHHfS/5sMN/irkrkNKwnKYrkBwLXlR0FrC
         fSLU/EQQQtOK6LcYB5IZ6BGZoRx2DATEpNplVyhZQH0mmgWOBnUlC4CdV/nQLo0RyCKC
         HITQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzWQeGdS67lpOPfhi4LP2rXTJ+Q4n9rpIp3zmwqkuXn7jgYM1/W+JTQkkIqLI1WcHQIIiCWivYJUho7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJnS9Zg+q9IHkk1AlW6G29loyAEmc4CE24wV+Z2b4XmRr2OHQAf
	DWnT9lfjdMVhR+4vedK25O/M6FfG9nraRYmzlEC/Bl7eMHd7txFLsWhjo53GD2mPflY=
X-Gm-Gg: AYBFou28KAQYWBCv/XLtkchgaxKFDmO3TpLb7Au92bxosZ34KhvbBBj/M6bqqKbveb+
	pdts69ezpdLZG2awE3HVRq3Ag1e2SpET63u5UfwgXre/tHg6RpW8EEMybib4fdV/cME/Xsi/D/v
	VsHDQ8KwmaaDlPb8/qw6eOMRy32A1Zl3BI6c55Ze5InbIzae4IDBnNPkugIHghBEFaJMWAhwERb
	ZNGGaCHfv8ym62GEJZlU8uZS0NRDxba4Pzzu866R86/GR4PdrA42tMZ/O36wAuIkUKP6Dj3f5ge
	eZQI3e4BrrrMGEDu213SEUD7jlr2Aw3972IltFbDAhPf+P+D9ftMuk2iduug8rg9OifxypgbVEv
	5PAHvGo86XaeoB78dMIemjJ75vgErMB33QFBF3HiHTsmpTxx2O09kWRZ35eIGjf03m2QzKPvXqe
	Z8XTn7o+MXuo+RRaLSSvivz+6+oapQlNKrs3pyh1cz04lA+m5oLatkixKOkjOf1RM+bzJXBTMzD
	d09e9PvSJtN7x07cCpFnPwzvRhdaKLETtNy3TkyHg6hnnLQSTZQOQ==
X-Received: by 2002:a05:690c:dc8:b0:871:bc3:9844 with SMTP id 00721157ae682-8a6461b9be1mr78062277b3.7.1790632223183;
        Mon, 28 Sep 2026 14:50:23 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a861012f4dsm50897647b3.37.2026.09.28.14.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 14:50:22 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v4 0/4] media: uvcvideo: live pan/tilt/zoom readback on OBSBOT Tiny 2 and Tail 2
Date: Mon, 28 Sep 2026 17:50:17 -0400
Message-ID: <20260928215021.819064-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OBSBOT Tiny 2 and Tail 2 do not set AUTOUPDATE in GET_INFO for their
pan/tilt and zoom controls, so uvcvideo returns cached values for them.
This series marks AUTO_UPDATE controls as volatile, applies the flags
fixup table to all controls, and adds entries for the two cameras.

Changes in v4:
- Shorten the commit messages (Laurent).
- Use "Assisted-by: LLM" (Ricardo).
- No code changes.

v3: https://lore.kernel.org/linux-media/20260928152416.766957-1-jordan.mymail@gmail.com/

Michael Jordan (4):
  media: uvcvideo: report AUTO_UPDATE controls as volatile
  media: uvcvideo: generalise the XU flags fixup to all controls
  media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2
  media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tail 2

 drivers/media/usb/uvc/uvc_ctrl.c | 126 +++++++++++++++++++++----------
 1 file changed, 85 insertions(+), 41 deletions(-)

-- 
2.43.0

