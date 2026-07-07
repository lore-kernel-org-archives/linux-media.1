Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BF6379981
	for <linux-media@vger.kernel.org>; Tue,  7 Jul 2026 15:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436792; cv=none; b=BGiqc4Auk3bg3SxtubRV5dUdKIpLkkm/a+KhCxKaLY4WMHODLrtYevQ1xs7PrFhX+pS7Uyqk169zlsuD/uSMgnvCIshPQRcBDGZerBXh6B5ndpuBCsAyaBZ8fyCWn7oWc//RsP6lPQy3GHrOklYcGnJEdXan+x+FUFIHzRRp/so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436792; c=relaxed/simple;
	bh=mF1Q8h8f8ja7oxsETzW0K9C2viuSjP/6sJUlaEJEzUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W9SF44b+98GzjZkwRo6q6CLSwXlF5zfeT/+TWlfzc9J7EXnnp2N5P/xsdweXksv9TYuREMEXxyPfXRhPvEjK8WOk6aBC3xwQjnVimZUJ8acF/ual6suB6qfWgCbmrjYsHex77JiXZYKl09intrrmGffjTOs7qgWceHSDnzjR1zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGbdwmO1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGbdwmO1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8478fe07f65so4419230b3a.0
        for <linux-media@vger.kernel.org>; Tue, 07 Jul 2026 08:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436791; x=1784041591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ClN3kpbhRJMWpIGpPfBJEIxCJ6EOBpj1rMef7MXHqEc=;
        b=mGbdwmO1bdXLYYXnL4qBM+muPQcImeAv1gohVnwA5EFvxt2Oh/ctYNko3ekxY9USLd
         5gU0E9LuA0E9e+eQ2Ga4c8oA8fDKekY/hpwdBB+EG5NkoHuFA0zGy68ON+im/Gj7cHGD
         YDvO1z++YMrVx0QdTB7MDMFN94mmrexVLhTua4+QNffybElGBDQ+uypxEd3fdDnI4IfE
         f2WScnddD0pMyf3Ufrw72qh8IMDK6WwR1LTMGJGrUQShHiACs6hlxzoXY8/78xOcPKp0
         Wb63BAhMkVgtSpF8vOlTQ8ySaSY44r4TiEItqvba1p4uYIEhoWzoXX+nveywViC8zLdN
         DDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436791; x=1784041591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClN3kpbhRJMWpIGpPfBJEIxCJ6EOBpj1rMef7MXHqEc=;
        b=gkTsWchhG/cPioOJYfd40wg9mX6WO3TlIVPwp2TSiIGRJ1hSdHAQtrQgkjd+tBakHy
         HY0F6vM+c8y+gNd/dmczFA7H7x/95jGUOEACjCGZyWwWP2OXMpwnjhY49KidLI9yn/CS
         vnaOUzcukY31cNQKIyPUNqaR9kntAZyPhWGignCwBWq9NxhJf82UoNOBz2eWDD5BJb1A
         rZ1QqjrCKNn+eTX8uuTs5sgrsNv257T8rQ04oGBCQ1XkbicmiDvR3xZQYHUsTlMbfzvs
         weJVokLXaGk8yVwdbYr+zFoUnI8TQTIjLJTULe+/dfpL43I/QDSJ1GHvGGspok2FKyF2
         tYmg==
X-Forwarded-Encrypted: i=1; AHgh+RqzqXw35eB9h1GR3IjUfgHTL/5agmsZkM/wnGGMNg01Ma/Hj/RH1tvURzZTYPQNhOYZux7equvVNJ/q2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywisx+tAHIZZg2myGTtNSz91CdBma3WruEBmoQMNG6G5pg559w7
	VGthg9Ev3bOm7usRt35TpGEBejbkfHXSMm3ZdzW5d3GGioZ3sKxdKV/1
X-Gm-Gg: AfdE7clhfufNGcB8Si+I5RTR3ApsWvIVMH1f650QbzovME7guV2kigpByc3UUQFQVtN
	ugK0YrXjEvoAGA3xav/18+MNz+inuTIooyKdAQ+dSBQ6G1cdOMCN6dU8+jXD+yp61G1Rz+OkTMJ
	V2lXLF5I2gZMS1LlFqRBVnJ9rJeiKVd8ZNmDFYNYSFEnDkKJ0XCSK8T6WZGagOFJ+mNV66CL8oT
	yZr7lPtcLhr3lAdp8t3+tSQd8p1ymf2KYhhom2WSnF0RmjN/T8mE6KJ4MlofUeG1Rabp9UQES1N
	pNM20vVAB86DRGw1kimrnokQIoHkRZSCdnHfpACKg7ULFheI0On/80IcOadlQ2FxkCJjX2zKZO8
	+w2LpiZKI33MiOXP6kwxe0LF2IAeWeHJW5a6uxAthfo3JC0HGlCB5PkeFXd61DwcaHJ4IWfVEoz
	P0FUUC8BSZSNXjmqOm7jGZNya1qyYzDJ6J
X-Received: by 2002:a05:6a00:138c:b0:847:888f:9b16 with SMTP id d2e1a72fcca58-84826c25b6dmr5534631b3a.18.1783436791037;
        Tue, 07 Jul 2026 08:06:31 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:239e:a31b:1d0d:374f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d76106sm5618994b3a.40.2026.07.07.08.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:06:30 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com,
	bod@kernel.org,
	mchehab@kernel.org
Cc: stanimir.varbanov@linaro.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] media: venus: Drop session events without an instance
Date: Tue,  7 Jul 2026 23:06:24 +0800
Message-ID: <20260707150624.2278561-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfi_process_msg_packet() intentionally allows HFI_MSG_EVENT_NOTIFY
packets without a matching session instance because HFI_EVENT_SYS_ERROR
is a system event and has no session attached.

That exception currently applies to every event-notify packet. If the
firmware reports a late or otherwise invalid session event after
to_instance() fails, hfi_event_notify() can dispatch it to session-only
handlers such as event_seq_changed() or event_release_buffer_ref(), which
dereference inst.

Only system errors are valid without a session instance. Drop other
event notifications before the session event handlers can dereference a
NULL inst.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware Interface (HFI)")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_msgs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 47b99d5b5af73..3135c1024fb1f 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -230,6 +230,9 @@ static void hfi_event_notify(struct venus_core *core, struct venus_inst *inst,
 	if (!packet)
 		return;
 
+	if (!inst && pkt->event_id != HFI_EVENT_SYS_ERROR)
+		return;
+
 	switch (pkt->event_id) {
 	case HFI_EVENT_SYS_ERROR:
 		event_sys_error(core, EVT_SYS_ERROR, pkt);
-- 
2.51.0

