Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E817F39DBF5
	for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554487; cv=none; b=TMG7lJM/keYuernvcZI0d6sJypVSlcGuPHeKHn9tYtOL49nDU4OPpdp8HbFgetV9NMt9CQWQ52blZgEx00Jjea7eP6wyZitMEsbwi1sxzLC3RRrsE/lPptuWttL+N0URHHPt8dtXiB0Nw74956FHtZkMpALQ8NeEy+CpHt/XKrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554487; c=relaxed/simple;
	bh=LfbBcOkgclaJzGAlsyhBMLCYtMUkrCClYpL9RNeMdwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiWI9ZykbuS6dUZ9fStNgWTsIzsqba9K0CE+hGNs1BPIe9TWxeLmVXQs9uhUW5LnwPj2lK0D9W6TEF9XqZeUqo4XTNLCOpz//qoM6sA75GEYy/NK221veNMV7dXaCbZA5R2P/J35TGyJXEDc9tkWSelMyAkf6w78jevswL7vVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=i+HI9myY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="i+HI9myY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4924593f45dso22080035e9.1
        for <linux-media@vger.kernel.org>; Sat, 27 Jun 2026 03:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782554484; x=1783159284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bw0B482fnjgsRq3zHufnszUQfIBwVQW6z7YiwuK+gVM=;
        b=i+HI9myYP/tcF/MqJLv8sEIykO+x8dTl0bhYVAsmk745dv+i8pw0JNV9+gDO8P5A2a
         7BOUiEKANq2vUixxXt9u64V8giMcmTVkeYEu2seONq28+y3t/Wynx/y8N1jNvTz5OhN8
         LW9h7e2oQv69UPKW9uHbCbeLGUhz/Xw2UtD8CI7RHL/m/fIHLg79Pcb13m4uenYiFSxq
         n8N4igC8bEG7kL526vu+SYsPfiGij8dv8FN7U4wVD3y4hDe3caCJ0i/mKb/uN3tPCwyp
         z5eoVAvMyWbrWbtQqtGH9pwDQ3Xx8QGz+CNnPmdgdNJbaCZTANWZdnqgfBXRattJV+yG
         hKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554484; x=1783159284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bw0B482fnjgsRq3zHufnszUQfIBwVQW6z7YiwuK+gVM=;
        b=SreF1mO5PQBrThXCm8ndQ1Iq/5oKAeL8BSqYJ65eIPiUM6beqMD0gRpOw9JcLYwCB+
         aY+SiTqzi+WZqBHSLyht0Du1gnhuF25fqUujGiyB9WSOjxYfFtgMdjU9JXzfumquWk9r
         sPbqN+xXWBgQvoNtd2+VWPYq5TsjGT/dBVcp2wmunRt+XN5l2p34UG09ppuDE+nagHN0
         kSk8o8bGGE+qhYBIzXa/QnuI1Qj8m2yaimDv0tc7BCVILKII023Sbk0IG482oy6LmQF6
         Kkcj/JoFaCp4vl1rLUb3neSoJb28CF0yNA+21ZbzTjxGNfWFVVH6yoJYpk+ab35HRg5f
         xvgA==
X-Forwarded-Encrypted: i=1; AFNElJ+et/m0KfkXt6mEE65t2ipgk9Rr3eltGxuRrTZexntmBRfU7UvXJDAn6sjrdeVaTQvS7qA9XzU/gH2maQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1bvUfp2+iFSpVHQG/q3dgU7Gk0lhLrp3Jxg1BFB/NY1z+5pYd
	5HXVdiz+Mccs3zrnq+VPOtFdE08ZIIZTtLJnmNWb+zxnWdpSI4rGgnf6vMQX0KT0es4D
X-Gm-Gg: AfdE7cksLM+LrjodW54/wR0Eh3JFpG8Ci2DmJEKHvvfvYl1ZZzGzzLa8AHUt7cJEiTb
	gNiWDzQU4im1m2I1XTNyFb+x++T+6Fr+uAxyVZ9yQnlQxtXXSBZluBC1Z/g+bAT7/gHB8oU9BN5
	MmgMMzgVzKjPXCR0fUcQ4hgmBuoDsMMGKSMF/6v8phea+mkxeXgYsxAGpZW8EFTw+ydoSwjXi+f
	aeXlzcm+vr37LU3mBDNiqbkbc5lu+/6NW7VUU/aYoL68+FgDXUwcxYkfbJeJZ4n/obiEWjEQUuV
	5a+JtpmESISe0bnJTZoSORW7YEsjmdutqmDfynn0mrSE7z0Q0jQzC9Z37HWsGWcaPZMkllRkkNe
	yOv8HoZE4wNccl70yyNQA3Ys8gRLfjKJIGYzjzMoWT3Mmj6ClC7GJzTz6L+XGn3dvcnRovMssg5
	+GfRyDmKAhKOocu/2vUxXHs4DXEp8mxJyKRHJw30XU2acu3TS2xIWk/i+cYwPmYAxDYI92O+G7j
	Hvnp5KA6MZTXBVQBDiJ8hiL5ThpoNtusDM=
X-Received: by 2002:a05:600d:8445:10b0:492:710c:925e with SMTP id 5b1f17b1804b1-492710c93fbmr28918935e9.19.1782554484366;
        Sat, 27 Jun 2026 03:01:24 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49271465f35sm69047735e9.9.2026.06.27.03.01.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 03:01:24 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: hansg@kernel.org,
	andy@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v3 2/2] media: atomisp: bound DVS 6-axis table dimensions to the allocated config
Date: Sat, 27 Jun 2026 12:01:19 +0200
Message-ID: <20260627100119.97650-3-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627100119.97650-1-doruk@0sec.ai>
References: <20260627100119.97650-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_cp_dvs_6axis_config() allocates the DVS 6-axis coordinate arrays
from the stream grid via ia_css_dvs2_6axis_config_allocate(), but then
uses the user-supplied width_y/height_y/width_uv/height_uv as the
copy_from_compatible() length. The reallocate-on-mismatch path also
re-allocates from the stream grid, so the destination is always
stream-sized while the copy length is user-sized. User dimensions larger
than the allocated grid produce a heap out-of-bounds write with
attacker-controlled length and contents.

Reject user dimensions that exceed the allocated config in both the
ISP2401 (t_6axis_config) and ISP2400/else (source_6axis_config) branches
before the first copy.

Note this ioctl path (S_DIS_VECTOR) is currently gated off by
2b7eb2c5dc72 ("staging: media: atomisp: Disallow all private IOCTLs"),
so it is not reachable from userspace today; this hardens the
disabled-but-revivable path.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel
Baytrail/Cherrytrail ISP hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Assisted-by: 0sec:claude-opus-4.8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 04e7b2e03f34..ea543025fd9c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2630,6 +2630,14 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
 		dvs_6axis_config->exp_id = t_6axis_config.exp_id;
 
+		if (t_6axis_config.width_y > dvs_6axis_config->width_y ||
+		    t_6axis_config.height_y > dvs_6axis_config->height_y ||
+		    t_6axis_config.width_uv > dvs_6axis_config->width_uv ||
+		    t_6axis_config.height_uv > dvs_6axis_config->height_uv) {
+			ret = -EINVAL;
+			goto error;
+		}
+
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					t_6axis_config.xcoords_y,
 					t_6axis_config.width_y *
@@ -2682,6 +2690,14 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
 		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
 
+		if (source_6axis_config->width_y > dvs_6axis_config->width_y ||
+		    source_6axis_config->height_y > dvs_6axis_config->height_y ||
+		    source_6axis_config->width_uv > dvs_6axis_config->width_uv ||
+		    source_6axis_config->height_uv > dvs_6axis_config->height_uv) {
+			ret = -EINVAL;
+			goto error;
+		}
+
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					source_6axis_config->xcoords_y,
 					source_6axis_config->width_y *
-- 
2.53.0

