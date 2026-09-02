Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FFF2F39C2
	for <linux-media@vger.kernel.org>; Wed,  2 Sep 2026 00:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788308758; cv=none; b=HkpV/E0tV1z9xMnic+NDPiKeaEwOPcOiLZ7cUxHHI4fH12Z9ORBEPbgDLK93Xbtjapfvjibc0Ma9qbZsMOMJbbaCKMv7Xe6JwM+myyHpBoYXR/oWzb2ULbemcLCaracETflQGb5xfPy+SlSUur4SRyxlispwjADbxHh3b5CyIPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788308758; c=relaxed/simple;
	bh=L2s3gtWMgWKmyKQrcI1dLj/nlR025dNN3Ec95PJVKCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljtklflaKTPlI5fBhG8GXIcnpOSc2np8JpZtdUuEGXiqquDfoN1QL9VCExyOvDNlcYsnF7aUHipGvhfGwBfb4OMnIefxPKFAkF+Xn7YNpIhKOpTWz+Yr0Ke1HH+chS5VUid3zigpOR9Gj34M2amKRKZe8cPId2vGO1v7rLH+kr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fp3LoM1Q; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fp3LoM1Q"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66c7e3a2332so604800d50.2
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 17:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788308755; x=1788913555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0DHJtPlP+gA8L211/yxRDmzQVMs96KUMsp6cHQ0WbFo=;
        b=fp3LoM1QUXcrO8vctyUt6Yan2KD1OzuGJQ5JBIOYEQhxo/PELxtqO00jXRygL/r5q0
         lbqTQ8sb4Ph0O1kjN0uZtR8TQj7jf9xdvbSZvYVXdA0teOwXv5+e0hU7FlU7J3eSBSWz
         95DZFi1y948D1aq85hU+YQDPpKUdiG+3OC2s671NH9upFryT74DHOLvGRD23ahNKK8R0
         lMnflQgXaz3EWurv0jOiTQeCCD47N6IR/yc/ABUYpoSPMp1tzQ3IVFRFY17Quz+wAGrl
         ZsXrbJSxoZZzuUbw5wcI4Q5ubMzKZ2NhczdHjoeST1Bl1bz6SmZpgpwXdu/4GSiDaBJ8
         4eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788308755; x=1788913555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0DHJtPlP+gA8L211/yxRDmzQVMs96KUMsp6cHQ0WbFo=;
        b=kmHp9cfAwBDBRyWl8RkEplzcQtBXCibneXF061WZFkd8ATLOvF6kzo0gDMB+G2A/FP
         CThEo2Iib0TxHqOvNB1rdQY3lS+9pbxprvlo5yUjEqYsXpyhoShqcBxJbDX/NMp/kucy
         3DT2rKymJR4TmQxqWHs+2MyQWR3DmpxfVMGHPdOvUUCOWtFoZzi7VkEb97PoZqHTL3BC
         ZkL2yigbxGRuJQ6rQqlHH5J7cC5IlyLsOUFmaZAYUsoohUuDbEqjq9qd01ZzLWLmRAZq
         lWWgG+B/2KVaXAubxnqkFrJ3uy6MMJ1+8tmMkHyaKpZOL868fof0OtYySiN/O7UQfW0r
         cPyw==
X-Forwarded-Encrypted: i=1; AKwUvBxa6DmPwjK6/+QRUFK4gehziioF9zpHlGIsj3PRSHVmV9/xzIyPSQwCn0fZinJoEg+BYx4ZvqYrsrH9kg==@vger.kernel.org
X-Gm-Message-State: AFuF++myRNjEREPkF35nyoYr6wtTnNV6iULE55nB8cvzPuq2SQsB3sCV
	C8PF55mb2xFRsG3H+7RCgq+1fauBBbfBVGPEyWiGziaUT293ZjaIWIES
X-Gm-Gg: AYBFou3fmW719nEB6UcYQx+7KnNW1alxODPDlKk4fA+Ldby+/97tfmAnjYDGXPpMbGw
	6OkoyskxBWvNDUEVOL3qakyXJOuxn7iYKV1LluDD4As5A85zyBjmPkmmym2ydBSYKTEcsLQMeqq
	AneANOMO6RUzghU800qD1UL9QmLRr6rPAx8ty/4b3T5dADzUpVhw8kTEiWntRhXvAsnPoxmWP/Y
	nMweEoMZlKNdHxGL9BQWbQlHNkRkbigRQ3HfhbU+r4SgefmsqJOOpfhgt1NJulW5kaPuUHDg0Ry
	DKQS9RF1JOdRv3OWTa8Ll2zVbrP6d5Vzh8aQAWgAATQTnNFU1Gvr5xSCKskURB/1rHj4/rg8TZ8
	R2t9nNPmN8qlbcfSTKJkvkUbmARKkE4aVp4mqE/cOFkd4ZYZKtu2EDtDCVs3HAKo3Zp33w+4F8w
	sWC78JfEsSLdrAIyt8Xe0zNEClM/X15EbKMX2+G49dEes6zPtJfr90ykpJO7tn2mQFRvpFxLUiA
	kkKeafPqcfManYEL4+RBxxCm5zw3LeinBU0AKYQ+sE=
X-Received: by 2002:a53:e884:0:b0:66e:5fdb:98d with SMTP id 956f58d0204a3-66f9bf82ac2mr208560d50.50.1788308755057;
        Tue, 01 Sep 2026 17:25:55 -0700 (PDT)
Received: from llmbox.. ([38.81.85.65])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f98656c1esm755344d50.11.2026.09.01.17.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 17:25:54 -0700 (PDT)
From: Michael Jordan <jordan.mymail@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Jordan <jordan.mymail@gmail.com>
Subject: [PATCH v2 0/3] media: uvcvideo: live pan/tilt/zoom readback on the OBSBOT Tiny 2
Date: Tue,  1 Sep 2026 20:25:50 -0400
Message-ID: <20260902002553.34839-1-jordan.mymail@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OBSBOT Tiny 2's GET_INFO strips the AUTOUPDATE bit from its pan,
tilt and zoom controls, so uvcvideo caches them and userspace can never
observe the actuator's live state. This series reports AUTO_UPDATE
controls as volatile to userspace, generalises the existing XU flags
fixup table to all controls, and adds entries for the three affected
controls on this camera.

Changes in v2 (following Ricardo's review of v1 [1]):

- Patch 1: unchanged; picked up Ricardo's Reviewed-by.
- Patch 2: uvc_ctrl_fixup_flags() now returns bool and runs at the
  start of uvc_ctrl_get_flags(), before the allocation, skipping the
  GET_INFO query entirely for controls the table covers (Ricardo).
- Patch 3: as asked, I checked whether the camera's other
  AUTO_UPDATE-flagged controls suffer the same bug. Two more do:
  CT_PANTILT_RELATIVE and CT_ZOOM_ABSOLUTE, both verified on hardware
  to change autonomously and report live values on GET_CUR; entries
  added for both. Exposure, white balance and focus turned out to be
  write-only on this firmware (their autos work, but GET_CUR echoes the
  last SET_CUR), so they gain nothing from AUTO_UPDATE and were left
  alone; details in the commit message. The commit message also no
  longer claims the capability byte is the same for every control --
  probing every control showed it is computed per control, just wrong
  for the PTZ ones. Dropped Ricardo's Reviewed-by since the patch
  changed materially.

The full lsusb -v output was posted in reply to v1's patch 3, in the
thread at [1].

[1] https://lore.kernel.org/linux-media/20260828152557.653475-1-jordan.mymail@gmail.com/

Michael Jordan (3):
  media: uvcvideo: report AUTO_UPDATE controls as volatile
  media: uvcvideo: generalise the XU flags fixup to all controls
  media: uvcvideo: fix up missing AUTO_UPDATE on the OBSBOT Tiny 2

 drivers/media/usb/uvc/uvc_ctrl.c | 122 ++++++++++++++++++++-----------
 1 file changed, 81 insertions(+), 41 deletions(-)

-- 
2.43.0

