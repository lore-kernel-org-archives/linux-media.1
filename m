Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514794;
	b=I4vmB5e/uruKTluBp97GOMqrcLAyLOh+8duxvthj/N4Btg7FGotA2yF1uNqZSOx2bXbZ
	 YNmqwUmKlIAOiaJn3C4zUYgTbsrmMbOFsmYYHpK5+vAhDHn4KEO/Kn/CxI8N4SSLw/vY6
	 Vu8je7ac2LovpDnulh8ttjDgEg3bSXDasQAwHD955tEnc5TAwhROgHfWMhuCkEJXLyBGm
	 dLLYoxyL9+BQ22smLvprXGUzdq/Xe8dLeCPEP88pnxjRhCMZxi750PQbhGVm9TCSiLMUU
	 38xayav8AaZVd+7SoItITP+6rkpwxZGxtbEX6E+eF5kHqmAfby8hdt7/5Yl9oThr0wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xCV3uHv6UUGCtV+qOA/N0OQ1sLrfBWMg/N6VVd28diA=;
	b=Pr7jVuSrGB271qVRzIJYX7PKXdxZxWH+PgV/P2AkGhXzfcmXRhmfl7yut8Gis9TKFTb6
	 f9jKm5G9dx4IJ2F0Shn/IA3lKG1GESfmOiAMwtudGpCRSpSOWvVLRz9ZNZxwJVgPtXfiT
	 xXpVa9vY4SlbTmUyH1Dj70DIgN7EU/WKauQQ0/2FyjthX8XG280uUEG1AJqSMPH1PgjYC
	 xWwIhciIwHCYBBRpHC6Y4kD4I8I4cOa99NTiAijwp1D+m8g00794LqC87oJ2lhasDyTTF
	 MUwdIXF0kl9Ir9MkaLwOBlTfVgXOY363s/Hs2JHQ0C46yYn8QothfKg4UsqkWCG2OGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b="JD/QvWSY";
	arc=none smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C52606A322
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41C52606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=JD/QvWSY
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 24FF73FBAE
	for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795514786;
	bh=xCV3uHv6UUGCtV+qOA/N0OQ1sLrfBWMg/N6VVd28diA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=JD/QvWSYpBpe+tu1dO/I3xnCXP8flTGMvmH8QaDTLuk06IWZdJJK58a8ErFf6MWJm
	 WubsxHb3z7w9Xuu/t+ZMBZWyQbVHGOz+SzMaKebvpPJAh1gUfq1dItq81XOiXC0Fc+
	 1+YZep+e60cvk6t74/e7l/XmRX5enZ+9PqRZJXrPpZwcdX4xwrl/NDt4a6epgaz4K+
	 lZOFPZ4IE+zjYyAhpm29Fz18TMVbf8E/ocs5axNhheOsdNnGJoIZRiKd76uOnmoROM
	 THzdhzs5nn9nk0SlSo6/mMqtV2dNZxpre7UVdXvDH5fA3E9jFaRh5u+Ljk7zliN7Jf
	 PylG/H516pupDQYPFY0VvE3PXXQjJh0CVUy04YK3kBgB8Rbr4D/f7Sg+aKYPEw9p6t
	 TF2GoW+vLNW6I1FNS1vcaL8UoCawyKVI1/XrbRNV6Oe3D7envZeekIz9lcJ5WP/W6v
	 7nERnJTTi/R1HxdOCM9/7V2xoYoP2JnHZYIQGDw0k244HF0mFN2qS5g25IqOXMvnTQ
	 hVCS3/yFb1YK0pBWim+NS2yFLdulNMzTe2U1jrgul0wQG2kpD0M0Ej+UeqI9DuBDDm
	 dJFtbsJT5hHLt41VUEzj3VTl4L2NO2/1darqY8LY6GNenUOEStXV90r5W+AM+ZlKtt
	 yaAkmWnujmETZBKnvNS3HTaM=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4b764ffc014so34941505e9.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 02:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514786; x=1796119586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xCV3uHv6UUGCtV+qOA/N0OQ1sLrfBWMg/N6VVd28diA=;
        b=qnqBuWIeRvIIcO1IOIi2dYH5ayn5jfrhRpEz6AuTbQ6f53tp6OgICUxxEnKMqPmTsq
         abGRtVwdtwMRfEsW1SmiCIlCzABoEh2flXvRzvMchnfulJNSABRET7KY1HuasZIoU+oQ
         WL9I3fZzk45K4Z6sx/WFi2IeFdWkOuWAYjuAXEicecKhwfAUaRfZ3UlrhdzYLci7ZtL6
         dEDSYbkX4zmtJ0DbZYtTZQy5lZoF91Dh+avkFPtzrYQnfTa5cPYjKiirqolM+0O8Dl4c
         PZeyEAILtD/NlWfT42fSWqd1+Y8H/1VeRwF6aJhKt4HqQAsLlb+rOguCiLxugVBGgHZR
         w4pw==
X-Gm-Message-State: APuU4Z8RVtIHGez5GgofxtFQiY9sytnjXkq9YgvQ6K4o/OF6U9By4znU
	WGlOtiDPM1cXBf3OqO9YMl47AABMTaWUA04t1iUuXNclgL32h3ayY01qCwMtxwV8Ha9zGUrIIve
	6NGbOpx5T9edL0NtGv0kQMy2rFywTU8TTnIcOxIxnX+Ve2HRlF2FRm7ApfXJP5XvVlGNMEYnBir
	sHvutGXeoLdUAd
X-Gm-Gg: AZFdTZfIj0sE2wvWJwGPLtIdzZgIJoisM/U67+s3/ABP2CDBy2IRCIey24uANEaHf9L
	XKr3ylvh5VepWkCWFYrxrMRySjzzU+aYvhE3NYMQtu57ggsloVEZSQs1bPW6XUqW3si0Ukr7yZU
	+uBmB1nCgVDh0euqJPq6p/m5BYJUM612k+x4xvdN2BqBQkj61XkVBQGzutGMIqdYmbfx7JybL1J
	8SUkxmuVuiedAvAlsg6zApK7VsaPj3+W70k7xE0ZbobeFWPPQ3NvXnlhM7zbwt/WZXn3mlRSHp9
	KLwOH2+qlMjcbWxV0yB0J5AIDa+zvs/a1kbi3wKiiKA+onJ81K7XF7uigRVkVZf2C8JAcsvntqC
	buz/Ts3kq8yRV/44jGBbjVQlu9VRUrzRlvsn9BKJOwcOX8o7q5jeT8ND3pGUx+4M=
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr287877185e9.18.1795514785699;
        Tue, 24 Nov 2026 02:06:25 -0800 (PST)
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr287876405e9.18.1795514785213;
        Tue, 24 Nov 2026 02:06:25 -0800 (PST)
Received: from px13.Home ([2a06:5902:822:4600:d3c1:2e3f:2545:da9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm27831841f8f.48.2026.11.24.02.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:24 -0800 (PST)
From: Chris Bainbridge <chris.bainbridge@canonical.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org
Subject: [PATCH 0/3] media: uvcvideo: fix control restore on reset_resume
Date: Tue, 24 Nov 2026 10:06:20 +0000
Message-ID: <20261124100623.2227323-1-chris.bainbridge@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uvc_ctrl_restore_values() restores each entity's modified controls in
index order via the transactional commit machinery
(uvc_ctrl_commit_entity()). On devices where SET_CUR on a manual control
STALLs while its master auto control is enabled, the commit switches to
rollback on the first failure: the remaining controls of the entity are
skipped, later entities are not restored, and the rollback copies
UVC_CTRL_DATA_BACKUP over UVC_CTRL_DATA_CURRENT for every dirty control
in the entity - but BACKUP is never populated on the restore path, so
the cached values are corrupted with stale data. __uvc_resume() then
returns early and uvc_status_resume() never runs, leaving the status
(interrupt) endpoint dead after resume. Observed on a Logitech C270
(046d:0825, USB_QUIRK_RESET_RESUME): SET_CUR on WHITE_BALANCE_TEMPERATURE
(selector 10 on unit 2) gets UVC error code 7 (Invalid Request) while
auto WB is enabled. The only userspace-visible effect is
"reset_resume error -5"; on such devices, every resume of a camera whose
controls have been written fails the restore. Kernel log:

  restoring control 00000000-...-000000000101/6/10
  restoring control 00000000-...-000000000101/12/11
  Control error 7 (Invalid request) for (SET_CUR) control 10 on unit 2
  UVC non compliance: Error -5 restoring control White Balance Temperature
  (selector 10 on unit 2)
  reset_resume error -5

patch 1/3 reports the failing control (V4L2 name, entity id, selector,
errno) when the restore fails; diagnostics only, and independently
useful.
patch 2/3 restores the auto (master) controls first and skips inactive
manual controls, so SET_CUR is not sent for a slave while its master is
on. Because the restore does not populate the cache, a master whose
state is unknown (not restored in the first pass and not cached) is
queried with GET_CUR rather than assumed; slaves skipped as inactive
have their cached state invalidated.
patch 3/3 stops using the transactional commit machinery for the
restore: each control is restored individually, failures are recorded
and the remaining controls and entities are still restored, the cached
state is not corrupted by rollback, and __uvc_resume() returns the first
restore error while always resuming the status endpoint - a status URB
submission failure takes priority over the already-logged best-effort
restore error.

Verified on the C270: with auto WB on, the WB temperature restore is
skipped as inactive and no error occurs; with manual WB active, WB auto
is restored first and then WB temperature; PLF and gain are restored
correctly. A 120-trial census across repeated
suspend/reset_resume/capture cycles (three control sequences x two
formats x 20 trials, camera autosuspended before every open so every
open runs the full reset_resume restore) completed with 0 wedged images,
0 restore errors and 0 recovery interventions. Returning the error is
safe: the USB core treats a reset_resume error as informational
(usb_resume_interface()).

Unrelated: the same camera also has a firmware-level race around AWB
mode writes near stream start (userspace-visible; in our testing it
fires only when stream start does not follow a reset_resume). May be
addressed by a quirk series later.

Chris
-- 
2.53.0

